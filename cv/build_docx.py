#!/usr/bin/env python3
"""Generate an ATS-friendly .docx CV from structured content.
Stdlib only (no pandoc / python-docx). Mirrors the matching .typ source.

Why .docx and not the Typst PDF: Typst always embeds Identity-H CID subset
fonts, which some resume parsers (e.g. work.turing.com) can't extract text
from — they fall back to OCR and hit a 30s timeout. A Word document sidesteps
PDF text-extraction entirely.

Usage:
  python build_docx.py [cv-key]

  cv-key is one of the keys in CONTENT below (default: ops-rq11154).

Inline markup in content strings:
  **bold**            -> bold run
  [label](url)        -> clickable hyperlink
  `code`              -> monospace run
"""
import re, sys, zipfile, os

ACCENT = "1F4E79"
MUTED = "555555"
LINKCLR = "1F4E79"

# half-point sizes
SZ_BODY = 19      # 9.5pt
SZ_NAME = 44      # 22pt
SZ_LOC = 22       # 11pt
SZ_TAG = 20       # 10pt
SZ_CONTACT = 18   # 9pt
SZ_SECTION = 26   # 13pt
SZ_ORG = 21       # 10.5pt
SZ_TITLE = 20     # 10pt
SZ_DATES = 18     # 9pt

RIGHT_TAB = 10368  # twips: 8.5in - 2*0.65in margins

rels = []  # list of (rId, url) — reset per build()

def esc(s):
    return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")

TOKEN_RE = re.compile(
    r"\*\*(?P<bold>.+?)\*\*"
    r"|\[(?P<ltext>[^\]]+)\]\((?P<lurl>[^)]+)\)"
    r"|`(?P<code>[^`]+)`"
)

def run(text, *, size=SZ_BODY, bold=False, italic=False, color=None, mono=False):
    rpr = []
    if mono:
        rpr.append('<w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>')
    if bold:
        rpr.append("<w:b/>")
    if italic:
        rpr.append("<w:i/>")
    if color:
        rpr.append(f'<w:color w:val="{color}"/>')
    rpr.append(f'<w:sz w:val="{size}"/><w:szCs w:val="{size}"/>')
    return (
        f"<w:r><w:rPr>{''.join(rpr)}</w:rPr>"
        f'<w:t xml:space="preserve">{esc(text)}</w:t></w:r>'
    )

def hyperlink(label, url, *, size=SZ_BODY, bold=False):
    rid = f"rIdL{len(rels)+1}"
    rels.append((rid, url))
    rpr = []
    if bold:
        rpr.append("<w:b/>")
    # canonical rPr order: color, sz, szCs, u
    rpr.append(f'<w:color w:val="{LINKCLR}"/>')
    rpr.append(f'<w:sz w:val="{size}"/><w:szCs w:val="{size}"/>')
    rpr.append('<w:u w:val="single"/>')
    return (
        f'<w:hyperlink r:id="{rid}"><w:r><w:rPr>{"".join(rpr)}</w:rPr>'
        f'<w:t xml:space="preserve">{esc(label)}</w:t></w:r></w:hyperlink>'
    )

def inline(text, *, size=SZ_BODY, base_bold=False, color=None):
    """Convert a markup string into a sequence of run XML."""
    out = []
    pos = 0
    for m in TOKEN_RE.finditer(text):
        if m.start() > pos:
            out.append(run(text[pos:m.start()], size=size, bold=base_bold, color=color))
        if m.group("bold") is not None:
            out.append(run(m.group("bold"), size=size, bold=True, color=color))
        elif m.group("ltext") is not None:
            out.append(hyperlink(m.group("ltext"), m.group("lurl"), size=size))
        elif m.group("code") is not None:
            out.append(run(m.group("code"), size=size, bold=base_bold, color=color, mono=True))
        pos = m.end()
    if pos < len(text):
        out.append(run(text[pos:], size=size, bold=base_bold, color=color))
    return "".join(out)

def para(inner, *, ppr=""):
    return f"<w:p>{ppr}{inner}</w:p>"

def spacing(before=0, after=80, line=None):
    attrs = f'w:before="{before}" w:after="{after}"'
    if line:
        attrs += f' w:line="{line}" w:lineRule="auto"'
    return f"<w:spacing {attrs}/>"

def section_heading(title):
    # canonical pPr order: pBdr, then spacing
    ppr = (
        "<w:pPr>"
        + '<w:pBdr><w:bottom w:val="single" w:sz="6" w:space="2" '
        f'w:color="{ACCENT}"/></w:pBdr>'
        + spacing(before=200, after=20)
        + "</w:pPr>"
    )
    return para(run(title, size=SZ_SECTION, bold=True, color=ACCENT), ppr=ppr)

def two_col(left_xml, right_xml, *, before=120, after=20):
    # canonical pPr order: tabs, then spacing
    ppr = (
        "<w:pPr>"
        + f'<w:tabs><w:tab w:val="right" w:pos="{RIGHT_TAB}"/></w:tabs>'
        + spacing(before=before, after=after)
        + "</w:pPr>"
    )
    tab = '<w:r><w:tab/></w:r>'
    return para(left_xml + tab + right_xml, ppr=ppr)

def bullet(text):
    ppr = (
        "<w:pPr>"
        '<w:numPr><w:ilvl w:val="0"/><w:numId w:val="1"/></w:numPr>'
        + spacing(before=0, after=60)
        + "</w:pPr>"
    )
    return para(inline(text), ppr=ppr)

def body_para(text, *, before=0, after=100):
    ppr = "<w:pPr>" + spacing(before=before, after=after) + "</w:pPr>"
    return para(inline(text), ppr=ppr)

# ----------------------------------------------------------------------------
# Content sets — each mirrors a matching .typ source
# ----------------------------------------------------------------------------
CONTACT = [
    ("(819) 921-7192", None),
    ("j.paul.abrams@protonmail.com", "mailto:j.paul.abrams@protonmail.com"),
    ("linkedin.com/in/paulabrams200", "https://linkedin.com/in/paulabrams200"),
    ("github.com/pabrams", "https://github.com/pabrams"),
    ("paulabrams.ca", "https://paulabrams.ca"),
]

CONTENT = {}

# --- ops-rq11154 (cv-2026-06-19-ops-rq11154-senior-dev.typ) -----------------
CONTENT["ops-rq11154"] = {
    "out": "cv-2026-06-19-ops-rq11154-senior-dev.docx",
    "name": "Paul Abrams",
    "location": "Toronto, Ontario",
    "tagline": ("Senior Software Developer · .NET Core / C# · Node.js / NestJS · "
                "Cloud-Native Microservices & REST APIs · Docker / Kubernetes · "
                "Azure & CI/CD · 15+ Years High-Availability Distributed Government Systems"),
    "contact": CONTACT,
    "summary": (
        "**Senior software developer with 15+ years building, scaling, and operating high-availability, "
        "distributed enterprise systems** across the Government of Canada — from a "
        "**load-balanced, geographically distributed** legal case-management platform serving "
        "**5,000+ concurrent users nationally** to a **cloud-native microservices** application on "
        "Microsoft Azure. Deep **backend** expertise in **.NET Core / C#** and **Node.js / NestJS** "
        "(a TypeScript decorator framework analogous to **Spring Boot** / ASP.NET Core), designing and "
        "consuming **REST APIs between services** and publishing/governing them through an "
        "**API gateway (Azure API Management)** with authentication, throttling, and transformation. "
        "Hands-on with **Docker and Kubernetes** containerized deployment, **CI/CD pipelines** "
        "(Azure DevOps, GitHub Actions), **serverless / event-driven workflows** (Azure Functions, "
        "queue- and storage-triggered handoffs), and **load balancing** across cloud and on-prem tiers. "
        "Strong relational-database engineering (**MS SQL Server, Azure SQL, PostgreSQL**) with working "
        "**NoSQL (MongoDB)** exposure, and a track record of **optimizing high-traffic backends** "
        "(e.g. a ~50× report speedup via execution-plan analysis). **Security-minded by default:** "
        "OAuth 2.0 / OpenID Connect / Entra IAM, migration to **Managed Identities**, **Key Vault** "
        "secret hygiene, TLS / certificate management, and **ITSG-33 / PBMM** controls. "
        "**Recurring pattern**: self-initiated automation frameworks that pay back substantial labour "
        "cost. **Professional Scrum Master I**; **AODA / WCAG**-aware. Active open-source contributor "
        "— **60+ public PRs** including Microsoft's `vsts-team-calendar`, `tfs-cli`, and the "
        "**Microsoft Authentication Library .NET** docs."
    ),
    "experience": [
        {
            "org": "Abrams Software", "loc": "Toronto, Ontario (Remote)",
            "dates": "August 2025 – Present",
            "title": "Full-Stack Developer · Independent",
            "bullets": [
                "**TWNR** — **architected and shipped a public-facing multiplayer game as a "
                "full-stack web application, solo.** Dockerized **TypeScript** monorepo: "
                "**Node.js (Express) + WebSocket** backend backed by **PostgreSQL**, per-player "
                "**JWT auth**, and a **JSON-Schema-generated REST API contract** that doubles as live "
                "documentation. Concurrency-correct state via PostgreSQL transactions "
                "(`SELECT … FOR UPDATE`). Live at [twnr.paulabrams.ca](https://twnr.paulabrams.ca).",
                "**Chess Attack Visualization** — **React 19 + TypeScript** app consuming the "
                "**Lichess.org REST API**, with a **NestJS** (Spring Boot–style decorator framework) "
                "auth proxy implementing the **OAuth2 PKCE** flow. Diagnosed a missing feature in "
                "`chess.js`, opened [upstream PR #572](https://github.com/jhlywa/chess.js/pull/572), and "
                "published a fork on npm. **Portfolio site** operated as **Astro on GitHub Pages with "
                "GitHub Actions** CI/CD.",
                "**LLM code evaluation** for [DataAnnotation.tech](https://www.dataannotation.tech) and "
                "Stellar.ai — prompt fixtures and grading rubrics across **.NET / C#, TypeScript, "
                "React, Node / NestJS, Python, Go, Rust, SQL, and MongoDB**, including **security audits "
                "with CWE / CVSS-graded inventories**. **60+ public PRs** to outside repos including the "
                "**Microsoft Authentication Library .NET** docs and `canada-ca/platform-security`.",
            ],
        },
        {
            "org": "Employment and Social Development, Canada", "loc": "Gatineau, QC",
            "dates": "December 2021 – July 2025",
            "title": "Senior Software Developer — Cloud-Native Microservices (Benefits Delivery Modernization)",
            "bullets": [
                "Enhanced and maintained a **cloud-native microservices** enterprise onboarding "
                "application — **.NET Core / C# back end, Blazor front end, Azure SQL, Azure "
                "Functions, GraphQL** — serving procurement, HR, and IT-ops personnel. **Designed "
                "and consumed REST APIs between services** and **published and governed them through "
                "Azure API Management (API gateway)** with authentication, throttling, and transformation "
                "policies; integrated enterprise IAM via **Azure AD / Entra (OAuth 2.0, OpenID Connect)**.",
                "**Serverless, event-driven workflows:** Blazor submissions kicked off **Azure Functions** "
                "triggered through **queue- and storage-based handoffs**, which created/updated Azure "
                "DevOps work items, ran pipelines, and provisioned users in on-prem Active Directory "
                "(via AAD Connect) by personnel profile — **bulk submissions fanning out "
                "asynchronously across the microservices**. Built a scheduled weekly work-item digest "
                "emailer driven by pipelines.",
                "**Containerized delivery and CI/CD:** operated end-to-end **Azure DevOps pipelines** for "
                "build, **Docker** containerization, **Kubernetes** deployment, and **Azure Data Factory** "
                "(ETL) orchestration. For the **AWS-hosted EI application**, deployed a **self-hosted "
                "pipeline agent into AWS** to run CI/CD there (completed AWS foundational training). "
                "Administered Azure DevOps for all BDM teams; advised on branching "
                "strategies and PR workflows; connected **Power BI to ADO Analytics**; ensured "
                "**WCAG / AODA** accessibility compliance.",
                "**Cloud security best practices:** migrated the application's downstream identity from "
                "rotating secrets (Key Vault + ADO PATs on 90-day rotation) to **Azure Managed "
                "Identities** — eliminating the secret-rotation incident class and properly "
                "attributing automated activity. Implemented **ITSG-33 (NIST-based) controls** — "
                "TLS / certificate management and **Key Vault** secret hygiene — for SA&A submissions "
                "against a **PBMM** profile.",
                "Designed and shipped **custom web extensions in React, TypeScript, and Node.js** — a "
                "build/deploy analytics widget rendering success-rate charts via the ADO Builds REST API, "
                "and a people-by-project reporter that replaced an unusably slow query with an in-memory "
                "hashmap. Ran weekly **demos and design walkthroughs**, mentoring junior developers.",
            ],
        },
        {
            "org": "Employment and Social Development, Canada", "loc": "Gatineau, QC",
            "dates": "August 2019 – November 2021",
            "title": "Senior Software Developer — Internal Web Application & CI/CD Automation",
            "bullets": [
                "Co-architected and developed an **internal C# / .NET web application** — web UI for "
                "authoring structured automation scenarios, **SQL Server** schema design, and a "
                "**co-designed REST API** providing bidirectional integration with **Azure DevOps "
                "pipelines** (versioned script-fetch endpoints and structured results-push endpoints).",
                "**Developed automated execution frameworks driven through CI/CD pipelines:** engineered "
                "Azure DevOps pipelines that provisioned Windows build agents to run **parallelized "
                "automated runs** against deployed applications and fed structured results back into work "
                "items. Performed **code review and standards enforcement** for the team.",
                "Drove a tooling consolidation that **cut software licensing costs** while preserving "
                "capability, and contributed to performance-optimization analysis of high-traffic "
                "deployed applications.",
            ],
        },
        {
            "org": "Department of Immigration, Refugees, and Citizenship, Canada", "loc": "Ottawa, ON",
            "dates": "August 2017 – August 2019",
            "title": "Team Lead / Technical Lead — Platform & Tooling",
            "bullets": [
                "**Technical leadership of a cross-functional team** — led **Agile / Scrum** sprint "
                "planning, review, retrospective, daily stand-up, and backlog refinement; introduced "
                "poker-planning estimation and capacity forecasting; set engineering standards and drove "
                "delivery cadence.",
                "Implemented and deployed **custom web extensions in React / TypeScript / Node.js** with "
                "responsive, accessibility-aligned UIs — leading the work hands-on while guiding the "
                "team.",
                "**Mentored developers in SQL Server query optimization** — query tuning, indexing "
                "strategy, partitioned tables, and execution-plan analysis against large databases and "
                "warehouses; coached on C# / .NET and SSRS.",
                "Administered departmental **Azure DevOps Server / TFS** instances and heavily customized "
                "process templates; managed user/group security and source-control access across multiple "
                "project collections.",
            ],
        },
        {
            "org": "Department of Justice, Canada", "loc": "Ottawa, ON",
            "dates": "December 2015 – August 2017",
            "title": "Acting Lead Developer — iCase / Microsoft Dynamics CRM Modernization",
            "bullets": [
                "**Lead developer** on the live **Legal Case Management System (iCase)** — a large "
                "**n-tier ASP.NET / C# / ADO.NET** enterprise web application used by **5,000+ lawyers** "
                "— while concurrently building its **Microsoft Dynamics CRM** successor. Modified "
                "schema and **front-end UI to surface data-migration status in real time**, and adjusted "
                "integration stored procedures consumed by the department's SAP-based financial system.",
                "Engineered **Dynamics CRM plug-ins, custom actions, and workflows in C#** (rewriting "
                "legacy stored procedures as C# / LINQ); used **SSIS** for ETL between iCase and Dynamics; "
                "produced **entity-relationship diagrams** and **multi-month effort-estimation "
                "breakdowns** (FDD / TDD) and applied design patterns (Repository, Strategy, Mediator).",
                "**Established code-review processes gated on work items** — enforcing "
                "maintainability, security, and performance standards — and **mentored junior "
                "developers**.",
            ],
        },
        {
            "org": "Department of Citizenship and Immigration, Canada", "loc": "Ottawa, ON",
            "dates": "April 2014 – December 2015",
            "title": "Senior Software Engineer · Release Engineering Lead",
            "bullets": [
                "Hired alongside one other engineer to take over a release-management environment from a "
                "contractor team. **Decommissioned over-engineered legacy C# desktop apps** and replaced "
                "them with lightweight **PowerShell calling REST APIs** — most contractor tooling was "
                "simply deleted and **everything ended up in source control**. **Bias for action and "
                "ownership.**",
                "Implemented and deployed **web extensions in React / TypeScript / Node.js**; maintained a "
                "fork of Microsoft's `vsts-team-calendar` extension and contributed back upstream. Used "
                "**XSLT-via-PowerShell** to transform work-item-template XML for **automated deployment of "
                "custom process templates** — early build/deploy pipeline automation.",
                "**Installed, configured, customized, and upgraded** the Azure DevOps Server / TFS "
                "platform across dev / UAT / production — complex multi-step upgrades, **Kerberos / "
                "SPN configuration** on application tiers (coordinated with AD and DC admins without "
                "direct access), and database-tier migration.",
            ],
        },
        {
            "org": "Department of Justice, Canada", "loc": "Ottawa, ON",
            "dates": "October 2008 – April 2014",
            "title": "Full-Stack Developer — Legal Case Management System (iCase)",
            "intro": (
                "Core developer on the department's flagship **Legal Case Management System (iCase)** "
                "— a **distributed, multi-tier ASP.NET / C# enterprise web platform** used by "
                "**5,000+ government lawyers and contracted agent firms across Canada**. "
                "**High-availability and load-balanced:** deployed across **5 load-balanced web servers** "
                "and **11 regionally distributed document servers** nationwide, with role- and "
                "object-based security and integration to records-management, financial, and email "
                "systems, running **24/7**."
            ),
            "bullets": [
                "Led design and largely solo implementation of the **“My iCase” personalization "
                "portal** — the new, **customizable widget-based entry point** to iCase. Ran JAD "
                "sessions, produced prototypes, authored BDD / TDD documentation, then built it on "
                "**ASP.NET Web Parts with a custom SQL personalization provider**, **Knockout.js MVVM** "
                "component binding (a direct ancestor of the **React** patterns I use today), and async "
                "AJAX web-service calls.",
                "**Optimized a high-traffic backend:** diagnosed a homepage report taking ~10 s uncached "
                "— profiled with SQL Profiler, Report Execution logs, and execution plans, then "
                "replaced live joins with a nightly-populated flat table for a **~50× speedup "
                "uncached (3–4× cached)**. Built a **self-initiated availability-monitoring "
                "suite** across the distributed web and document servers, and diagnosed and resolved a "
                "**COM Interop memory leak** affecting the document tier.",
                "**Early automation-framework development:** architected a **Java-based framework "
                "(IBM Rational Functional Tester)** that **parsed English-language scenario documents into "
                "executable scripts with round-trip code generation**, plus a companion manager in "
                "**C# / SQL Server**. Replaced a labour-intensive **two-week, ~20–25-person manual "
                "pre-release validation cycle** with automated execution reviewed by one person in five "
                "days — **~98% reduction in effort, ~$160K saved per release cycle**, eliminating the "
                "standing code freeze.",
            ],
        },
    ],
    "education": [
        ("Bachelor of Computer Science (Honours)", "Carleton University",
         "September 1999 – May 2003"),
    ],
    "certs": (
        "[Professional Scrum Master I](https://www.scrum.org/user/2230283) (Scrum.org)  ·  "
        "ITIL v3 Foundation (Loyalist Certification Services)  ·  "
        "DOJ Team Merit Award 2012; Team Merit Award 2011; Team Spirit Award 2009"
    ),
    "skills": [
        ("Backend Frameworks:", "**.NET Core / .NET 6 / 8, C#, ASP.NET Core, ADO.NET, Entity Framework, "
         "LINQ** · **Node.js, Express, NestJS** · Spring Boot (familiarity)"),
        ("Microservices & APIs:", "**cloud-native microservices architecture**, **REST API design "
         "between services**, GraphQL, WebSocket · **API gateway / management (Azure API "
         "Management)** — auth, throttling, transformation · event-driven & async messaging "
         "(queue- / storage-triggered) · load balancing across cloud & on-prem tiers"),
        ("Containers & CI/CD:", "**Docker, Kubernetes** · **Azure DevOps Pipelines (YAML), GitHub "
         "Actions**, Jenkins (exposure) — build, automated test, containerized deploy · Azure Data "
         "Factory (ETL)"),
        ("Cloud:", "**Microsoft Azure** — **Azure Functions (serverless)**, App Service, Azure SQL, "
         "**API Management, Key Vault, Managed Identities, Entra / AAD**, Storage, Data Factory · "
         "**AWS** — self-hosted pipeline-agent deployment for the BDM EI application + foundational "
         "training · **GCP** — TWNR production hosting"),
        ("Databases:", "**SQL — MS SQL Server 2005 → 2019** (T-SQL, stored procedures, "
         "indexing, partitioning, execution-plan tuning), **Azure SQL, PostgreSQL** · **NoSQL "
         "— MongoDB** (working familiarity)"),
        ("Security:", "**OAuth 2.0 / OpenID Connect / PKCE, Entra / AAD IAM**, **Managed Identities**, "
         "TLS / certificate management, **Key Vault** secret hygiene, **ITSG-33 / PBMM controls**, "
         "CWE / CVSS-graded security audits"),
        ("Version Control:", "**Git, GitHub**, Azure DevOps Repos / TFVC · feature branches, "
         "PR-gated CI"),
        ("Languages & Front-End:", "**TypeScript, JavaScript, C#, SQL (T-SQL)**, PowerShell, Python, "
         "XML / XSLT, Go (light) · **React 19, Blazor**, Knockout.js, HTML / CSS, **responsive "
         "design, WCAG / AODA accessibility** · unit testing (xUnit / NUnit, Jest / Vitest)"),
        ("Process / SDLC:", "**Agile / Scrum (PSM I)** — sprint planning, review, daily stand-up, "
         "backlog refinement · code review, mentoring, technical documentation, design "
         "walkthroughs · ITIL v3 Foundation"),
    ],
}

# --- fullstack-general (cv-2026-06-19-fullstack-general.typ) ----------------
CONTENT["fullstack-general"] = {
    "out": "cv-2026-06-19-fullstack-general.docx",
    "name": "Paul Abrams",
    "location": "Toronto, Ontario",
    "tagline": ("Senior Full-Stack Developer · TypeScript / React · Node.js / NestJS · "
                ".NET / C# · PostgreSQL & SQL · Cloud, Docker & CI/CD · "
                "15+ Years Shipping Web Applications"),
    "contact": CONTACT,
    "summary": (
        "Senior full-stack developer with **15+ years across the full SDLC**, shipping "
        "**web-based B2B and B2C applications** from front-end UI through service back ends and "
        "databases. Front end in **React + TypeScript** (also Next.js, Blazor, Knockout.js MVVM); "
        "back end in **.NET / C# and Node.js / NestJS / Express**, designing **REST APIs**, "
        "data-access layers, and **n-tier and cloud-native microservices** architectures. I've "
        "shipped products **solo** (a Dockerized multiplayer game on Node + PostgreSQL; a React "
        "training app on a public REST API) and delivered **at enterprise scale** (an n-tier "
        "ASP.NET platform serving **5,000+ users** with 24/7 high availability across "
        "load-balanced, geographically distributed servers). Strong **SQL** engineering across "
        "**SQL Server, Azure SQL, and PostgreSQL** — schema design, stored procedures, and "
        "execution-plan tuning — with working **MongoDB** exposure. Comfortable across **cloud and "
        "DevOps**: **Microsoft Azure** (Functions, App Service, API Management, Key Vault, Entra), "
        "**Docker / Kubernetes**, and **CI/CD** (Azure DevOps, GitHub Actions). **Recurring "
        "pattern:** self-initiated automation that pays back substantial labour cost, and "
        "**modernization by deletion** — replacing over-engineered systems with simpler, "
        "well-tested ones. **Professional Scrum Master I.** Active open-source contributor — "
        "**60+ public PRs** to outside repos including Microsoft's `vsts-team-calendar`, `tfs-cli`, "
        "the TypeScript Website, and the **Microsoft Authentication Library .NET** docs."
    ),
    "experience": [
        {
            "org": "Abrams Software", "loc": "Toronto, Ontario (Remote)",
            "dates": "August 2025 – Present",
            "title": "Full-Stack Developer · Independent",
            "bullets": [
                "**TWNR** — **architected and shipped a public-facing B2C multiplayer game as a "
                "full-stack web application, solo.** Dockerized **TypeScript** pnpm monorepo: "
                "**Node.js (Express) + WebSocket** server backed by **PostgreSQL**, terminal-style "
                "xterm.js client served by Vite, per-player sign-up with **JWT auth**, and a "
                "**JSON-Schema-generated REST API contract** that doubles as live documentation. "
                "Concurrency-correct game state via PostgreSQL transactions (`SELECT … FOR UPDATE`). "
                "Live at [twnr.paulabrams.ca](https://twnr.paulabrams.ca).",
                "**Chess Attack Visualization** — **React 19 + TypeScript** training app (Vite, "
                "React Testing Library + Vitest / Jest) consuming the **Lichess.org REST API**, with "
                "a **NestJS** (TypeScript decorator framework analogous to **Spring Boot**) auth "
                "proxy implementing the **OAuth2 PKCE** flow. Diagnosed a missing feature in "
                "`chess.js`, opened [upstream PR #572](https://github.com/jhlywa/chess.js/pull/572), "
                "and published a fork on npm. **Portfolio site** runs as **Astro on GitHub Pages "
                "with GitHub Actions** CI/CD.",
                "**Next.js + React 19 + TypeScript** open-source contributions to "
                "[physicshub.github.io](https://github.com/physicshub/physicshub.github.io), a "
                "public physics-simulation site — led a **JavaScript → TypeScript migration** of "
                "the core engine, introduced **branded nominal types** with TDD coverage, and fixed "
                "latent energy-conservation and boundary-collision bugs.",
                "**LLM code evaluation** for [DataAnnotation.tech](https://www.dataannotation.tech) "
                "and Stellar.ai — prompt fixtures and grading rubrics across **TypeScript, React, "
                "Node / NestJS, .NET / C#, Python, Go, Rust, SQL, and MongoDB**, including "
                "**security audits with CWE / CVSS-graded inventories**. **60+ public PRs** to "
                "outside repos including the **Microsoft Authentication Library .NET** docs and "
                "`canada-ca/platform-security`.",
            ],
        },
        {
            "org": "Employment and Social Development, Canada", "loc": "Gatineau, QC",
            "dates": "December 2021 – July 2025",
            "title": "Senior Software Engineer — Cloud-Native Microservices (BDM Project)",
            "bullets": [
                "Enhanced and maintained a **cloud-native microservices** enterprise onboarding "
                "application — **.NET / C# back end, Blazor front end, Azure SQL, Azure Functions, "
                "GraphQL**. **Designed and consumed REST APIs between services**; integrated "
                "enterprise IAM via **Azure AD / Entra (OAuth 2.0, OpenID Connect)**; published and "
                "governed APIs through **Azure API Management** with authentication, throttling, and "
                "transformation policies.",
                "Designed and shipped **custom web extensions in React, TypeScript, and Node.js** — "
                "a build/deploy analytics widget rendering success-rate charts via the ADO Builds "
                "REST API, and a people-by-project reporter that replaced an unusably slow query "
                "with an in-memory hashmap. Responsive UI, custom styling, **WCAG / AODA**-aligned "
                "interactions.",
                "Migrated the application's downstream identity from rotating secrets (Key Vault + "
                "ADO PATs) to **Azure Managed Identities** — eliminating the secret-rotation "
                "incident class. Operated **CI/CD pipelines** in Azure DevOps for build, test, "
                "**Docker** containerization, **Kubernetes** deployment, and **Azure Data Factory** "
                "(ETL) orchestration; daily Git workflow with feature branches and PR-gated CI.",
                "Ran weekly **demos and design walkthroughs**, mentoring junior developers on "
                "microservice integration, app registration, and custom extensions.",
            ],
        },
        {
            "org": "Employment and Social Development, Canada", "loc": "Gatineau, QC",
            "dates": "August 2019 – November 2021",
            "title": "Development Lead — Internal Web Application & CI/CD Automation",
            "bullets": [
                "Co-architected and developed an **internal C# / .NET web application** with a web "
                "UI for authoring structured scenarios; designed the **SQL Server** schema and "
                "**co-designed the REST API** for bidirectional integration with **Azure DevOps "
                "pipelines** (versioned script-fetch and structured results-push endpoints). "
                "Integrated with the departmental headless CMS.",
                "Engineered **Azure DevOps CI/CD pipelines** that provisioned Windows agents to run "
                "parallel automated **Selenium** runs against deployed applications and fed "
                "structured results back into work items. Drove a tooling consolidation "
                "(**LoadRunner → JMeter**) that cut licensing costs while preserving capability. "
                "Code review and standards enforcement for the team.",
            ],
        },
        {
            "org": "Department of Immigration, Refugees, and Citizenship, Canada", "loc": "Ottawa, ON",
            "dates": "August 2017 – August 2019",
            "title": "Team Lead / Technical Lead",
            "bullets": [
                "Led full **Agile / Scrum** delivery — sprint planning, review, retrospective, "
                "daily stand-up, backlog refinement, iteration demos, and design walkthroughs; "
                "introduced poker-planning estimation and capacity forecasting. **Translated "
                "business requirements into working software** through close BA partnership.",
                "Implemented and deployed **custom web extensions in React / TypeScript / Node.js** "
                "with responsive, accessibility-aligned UIs — hands-on while guiding the team. "
                "**Mentored developers in SQL Server query optimization** — query tuning, indexing "
                "strategy, partitioned tables, and execution-plan analysis against large databases "
                "and warehouses.",
                "Administered departmental **Azure DevOps Server / TFS** instances — installation, "
                "configuration, multi-environment upgrades, Kerberos re-configuration — and "
                "maintained heavily customized process templates; managed user/group security "
                "across multiple project collections.",
            ],
        },
        {
            "org": "Department of Justice, Canada", "loc": "Ottawa, ON",
            "dates": "December 2015 – August 2017",
            "title": "Development Lead — iCase / Microsoft Dynamics CRM Modernization",
            "bullets": [
                "Dev lead on the live **Legal Case Management System (iCase)** — a large **n-tier "
                "ASP.NET / C# / ADO.NET** enterprise web application used by **5,000+ lawyers and "
                "contracted agents** — while concurrently building its **Microsoft Dynamics CRM** "
                "successor. Modified schema and **front-end UI to surface migration status in real "
                "time**, and adjusted the integration stored procedures consumed by the "
                "department's SAP-based financial system.",
                "Engineered **Dynamics CRM plug-ins, custom actions, and workflows in C#** "
                "(rewriting legacy stored procedures as C# / LINQ); used **SSIS** for ETL between "
                "systems; produced **entity-relationship diagrams** and **detailed "
                "effort-estimation breakdowns** (FDD / TDD), and applied design patterns "
                "(Repository, Strategy, Mediator). **Established code-review processes gated on work "
                "items** and mentored junior developers.",
            ],
        },
        {
            "org": "Department of Citizenship and Immigration, Canada", "loc": "Ottawa, ON",
            "dates": "April 2014 – December 2015",
            "title": "Senior Software Engineer · Release Engineering Lead",
            "bullets": [
                "Hired alongside one other engineer to take over a release-management environment "
                "from a contractor team. **Decommissioned over-engineered legacy C# desktop apps** "
                "and replaced them with lightweight **PowerShell calling REST APIs** — most "
                "contractor tooling was simply deleted and **everything ended up in source "
                "control**. **Modernization by deletion.**",
                "Implemented and deployed **web extensions in React / TypeScript / Node.js**; "
                "maintained a fork of Microsoft's `vsts-team-calendar` extension with configurable "
                "colours and Outlook integration, contributed back upstream. **Installed, "
                "configured, customized, and upgraded** the Azure DevOps Server / TFS platform "
                "across dev / UAT / production — multi-step upgrades, **Kerberos / SPN "
                "configuration**, and database-tier migration.",
            ],
        },
        {
            "org": "Department of Justice, Canada", "loc": "Ottawa, ON",
            "dates": "October 2008 – April 2014",
            "title": "Full-Stack Developer (2009–2014) · Test-Automation Framework Developer (2008–2009)",
            "intro": (
                "Core developer on the department's flagship **Legal Case Management System "
                "(iCase)** — a **distributed, multi-tier ASP.NET / C#** enterprise web platform "
                "used by **5,000+ government lawyers and contracted agent firms across Canada**, "
                "deployed across **load-balanced web servers and regionally distributed document "
                "servers** with role- and object-based security, integration to records-management, "
                "financial, and email systems, and **24/7 high availability**. **B2B and B2C** "
                "flows: internal lawyers, external agent firms tracking their own billing/timekeeping "
                "in iCase, and downstream financial reconciliation."
            ),
            "bullets": [
                "Led design and largely solo implementation of the **“My iCase” personalization "
                "portal** — the new, customizable widget-based entry point to iCase. Ran JAD "
                "sessions, produced prototypes, authored **FDD / TDD documentation**, then built it "
                "on **ASP.NET Web Parts with a custom SQL personalization provider**, **Knockout.js "
                "MVVM** (a direct ancestor of modern React patterns), and async AJAX web-service "
                "calls. **Evaluated Entity Framework** against the existing "
                "Repository-pattern-over-stored-procedures and recommended against adoption on the "
                "merits — ORM judgment as much as ORM use.",
                "**Performance and reliability engineering:** diagnosed a homepage report taking "
                "~10 s uncached — profiled with SQL Profiler, Report Execution logs, and execution "
                "plans, then replaced live joins with a nightly-populated flat table (**~50× faster "
                "uncached, 3–4× cached**). Built a **self-initiated availability-monitoring suite** "
                "across the distributed servers, and diagnosed and resolved a **COM Interop memory "
                "leak** on the document tier. Co-led the **SQL Server 2005 → 2012** and **.NET "
                "Framework 2.0 → 4.0** upgrades.",
                "Architected a **Java-based automation framework (IBM Rational Functional Tester)** "
                "that **parsed English-language scenario documents into executable scripts with "
                "round-trip code generation**, plus a companion manager in **C# / SQL Server** — "
                "replacing a labour-intensive **two-week, ~20–25-person manual pre-release "
                "validation cycle** with automated execution reviewed by one person in five days "
                "(**~98% reduction in effort, ~$160K saved per release cycle**).",
            ],
        },
    ],
    "education": [
        ("Bachelor of Computer Science (Honours)", "Carleton University",
         "September 1999 – May 2003"),
    ],
    "certs": (
        "[Professional Scrum Master I](https://www.scrum.org/user/2230283) (Scrum.org)  ·  "
        "ITIL v3 Foundation (Loyalist Certification Services)  ·  "
        "DOJ Team Merit Award 2012; Team Merit Award 2011; Team Spirit Award 2009"
    ),
    "skills": [
        ("Languages:", "**TypeScript, JavaScript, C#, SQL (T-SQL)**, PowerShell, Python, "
         "HTML / CSS, XML / XSLT, Go (light)"),
        ("Front-End / UI:", "**React 19, Next.js, TypeScript**, Blazor, Knockout.js MVVM, Vite, "
         "JSON, AJAX, jQuery · **responsive design, WCAG / AODA accessibility**"),
        ("Back-End / APIs:", "**.NET 6 / 8 / .NET Core, ASP.NET / ASP.NET MVC, ADO.NET, Entity "
         "Framework, LINQ** · **Node.js, Express, NestJS** · **REST API design**, GraphQL, "
         "WebSocket · Spring Boot (familiarity)"),
        ("Architecture:", "n-tier client/server, **cloud-native microservices**, event-driven "
         "workflows, API gateway / management (Azure APIM), design patterns, entity-relationship "
         "modelling"),
        ("Databases:", "**MS SQL Server (2005 → 2019), Azure SQL, PostgreSQL** — stored "
         "procedures, indexing, partitioning, execution-plan tuning · **MongoDB** (working "
         "familiarity)"),
        ("Cloud / DevOps:", "**Microsoft Azure** (App Service, Functions, SQL, API Management, Key "
         "Vault, Storage, Managed Identities, Entra / AAD, Data Factory) · **AWS / GCP** (working "
         "exposure) · **Docker, Kubernetes**"),
        ("Source Control / CI/CD:", "**Git, GitHub, GitHub Actions, Azure DevOps Pipelines "
         "(YAML)** · feature branches, PR-gated CI"),
        ("Testing:", "**Jest, Vitest, React Testing Library**, xUnit / NUnit, Playwright, Selenium"),
        ("Also experienced with (Microsoft legacy):", "Visual Studio 2005 → 2022, .NET Framework "
         "2.0 → 4.8, IIS, WCF / WPF, SSRS / SSIS, Crystal Reports, Azure DevOps Server (TFS) "
         "administration & upgrades"),
        ("Process / SDLC:", "**Agile / Scrum (PSM I)**, Kanban, FDD / TDD with effort estimation, "
         "code review, mentoring · Waterfall (regulated environments) · ITIL v3 Foundation"),
    ],
}

# ----------------------------------------------------------------------------
# Build document body from a content set
# ----------------------------------------------------------------------------
def build_body(C):
    body = []

    # Header: name (left) + location (right)
    name_run = run(C["name"], size=SZ_NAME, bold=True)
    loc_run = run(C["location"], size=SZ_LOC, color=MUTED)
    body.append(two_col(name_run, loc_run, before=0, after=20))

    # Tagline
    body.append(para(run(C["tagline"], size=SZ_TAG, color=MUTED),
                     ppr="<w:pPr>" + spacing(before=0, after=60) + "</w:pPr>"))

    # Rule under header (canonical pPr order: pBdr, then spacing)
    body.append(para("", ppr="<w:pPr>"
                     + f'<w:pBdr><w:bottom w:val="single" w:sz="8" w:space="1" w:color="{ACCENT}"/></w:pBdr>'
                     + spacing(before=0, after=40)
                     + "</w:pPr>"))

    # Contact line
    contact_runs = []
    sep = run("   |   ", size=SZ_CONTACT, color=MUTED)
    for i, (label, url) in enumerate(C["contact"]):
        if i:
            contact_runs.append(sep)
        if url:
            contact_runs.append(hyperlink(label, url, size=SZ_CONTACT))
        else:
            contact_runs.append(run(label, size=SZ_CONTACT))
    body.append(para("".join(contact_runs),
                     ppr="<w:pPr>" + spacing(before=0, after=120) + "</w:pPr>"))

    # Summary
    body.append(section_heading("Professional Summary"))
    body.append(body_para(C["summary"], before=20, after=120))

    # Experience
    body.append(section_heading("Professional Experience"))
    for e in C["experience"]:
        left = run(e["org"], size=SZ_ORG, bold=True)
        if e["loc"]:
            left += run("   " + e["loc"], size=SZ_DATES, color=MUTED)
        right = run(e["dates"], size=SZ_DATES, color=MUTED)
        body.append(two_col(left, right, before=160, after=0))
        body.append(para(run(e["title"], size=SZ_TITLE, italic=True),
                         ppr="<w:pPr>" + spacing(before=20, after=40) + "</w:pPr>"))
        if e.get("intro"):
            body.append(body_para(e["intro"], before=0, after=60))
        for b in e["bullets"]:
            body.append(bullet(b))

    # Education
    body.append(section_heading("Education"))
    for degree, school, dates in C["education"]:
        left = run(degree, size=SZ_BODY, bold=True) + run(" — " + school, size=SZ_BODY)
        right = run(dates, size=SZ_DATES, color=MUTED)
        body.append(two_col(left, right, before=40, after=40))

    # Certifications
    body.append(section_heading("Certifications & Awards"))
    body.append(body_para(C["certs"], before=20, after=100))

    # Technical Skills
    body.append(section_heading("Technical Skills"))
    for label, rest in C["skills"]:
        inner = run(label + " ", size=SZ_BODY, bold=True, color=ACCENT) + inline(rest)
        body.append(para(inner, ppr="<w:pPr>" + spacing(before=0, after=70) + "</w:pPr>"))

    return "".join(body)


def build(cv_key):
    global rels
    rels = []
    C = CONTENT[cv_key]
    body_xml = build_body(C)

    # Section properties (letter, margins)
    sectpr = (
        '<w:sectPr>'
        '<w:pgSz w:w="12240" w:h="15840"/>'
        '<w:pgMar w:top="864" w:right="936" w:bottom="864" w:left="936" '
        'w:header="720" w:footer="720" w:gutter="0"/>'
        '</w:sectPr>'
    )

    document_xml = (
        '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" '
        'xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">'
        '<w:body>' + body_xml + sectpr + '</w:body></w:document>'
    )

    content_types = (
        '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">'
        '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>'
        '<Default Extension="xml" ContentType="application/xml"/>'
        '<Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>'
        '<Override PartName="/word/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml"/>'
        '<Override PartName="/word/numbering.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.numbering+xml"/>'
        '</Types>'
    )

    root_rels = (
        '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">'
        '<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>'
        '</Relationships>'
    )

    # document rels: styles, numbering, + hyperlinks
    doc_rel_items = [
        '<Relationship Id="rIdStyles" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>',
        '<Relationship Id="rIdNum" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/numbering" Target="numbering.xml"/>',
    ]
    for rid, url in rels:
        doc_rel_items.append(
            f'<Relationship Id="{rid}" '
            'Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink" '
            f'Target="{esc(url)}" TargetMode="External"/>'
        )
    document_rels = (
        '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">'
        + "".join(doc_rel_items) + '</Relationships>'
    )

    styles_xml = (
        '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<w:styles xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">'
        '<w:docDefaults><w:rPrDefault><w:rPr>'
        '<w:rFonts w:ascii="Calibri" w:hAnsi="Calibri" w:cs="Calibri"/>'
        f'<w:sz w:val="{SZ_BODY}"/><w:szCs w:val="{SZ_BODY}"/></w:rPr></w:rPrDefault>'
        '<w:pPrDefault><w:pPr><w:spacing w:after="100" w:line="252" w:lineRule="auto"/></w:pPr></w:pPrDefault>'
        '</w:docDefaults>'
        '<w:style w:type="paragraph" w:default="1" w:styleId="Normal">'
        '<w:name w:val="Normal"/></w:style>'
        '</w:styles>'
    )

    numbering_xml = (
        '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<w:numbering xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">'
        '<w:abstractNum w:abstractNumId="0">'
        '<w:lvl w:ilvl="0"><w:start w:val="1"/><w:numFmt w:val="bullet"/>'
        '<w:lvlText w:val="•"/><w:lvlJc w:val="left"/>'
        '<w:pPr><w:ind w:left="360" w:hanging="216"/></w:pPr>'
        '<w:rPr><w:rFonts w:ascii="Symbol" w:hAnsi="Symbol" w:hint="default"/></w:rPr>'
        '</w:lvl></w:abstractNum>'
        '<w:num w:numId="1"><w:abstractNumId w:val="0"/></w:num>'
        '</w:numbering>'
    )

    out_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), C["out"])
    with zipfile.ZipFile(out_path, "w", zipfile.ZIP_DEFLATED) as z:
        z.writestr("[Content_Types].xml", content_types)
        z.writestr("_rels/.rels", root_rels)
        z.writestr("word/document.xml", document_xml)
        z.writestr("word/_rels/document.xml.rels", document_rels)
        z.writestr("word/styles.xml", styles_xml)
        z.writestr("word/numbering.xml", numbering_xml)

    print("wrote", out_path)


if __name__ == "__main__":
    key = sys.argv[1] if len(sys.argv) > 1 else "ops-rq11154"
    if key not in CONTENT:
        sys.exit(f"unknown cv-key {key!r}; choose from {', '.join(CONTENT)}")
    build(key)
