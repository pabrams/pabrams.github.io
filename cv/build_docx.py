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

# --- rq11143-backend (cv-2026-07-06-rq11143-backend.typ) --------------------
CONTENT["rq11143-backend"] = {
    "out": "cv-2026-07-06-rq11143-backend.docx",
    "name": "Paul Abrams",
    "location": "Toronto, Ontario",
    "tagline": ("Senior Back-End Developer · Microsoft Azure (App Service, Functions, AKS) · "
                ".NET Core / C# · Java · Python · Node.js / NestJS · REST APIs & Cloud-Native "
                "Microservices · Docker / Kubernetes / OpenShift · Azure DevOps · Jenkins · "
                "Ansible · CI/CD & DevSecOps · 15+ Years"),
    "contact": CONTACT,
    "summary": (
        "**Senior back-end developer with 15+ years building, scaling, and operating "
        "high-availability, distributed enterprise systems** across the Government of Canada — "
        "from a **load-balanced, geographically distributed** legal case-management platform "
        "serving **5,000+ concurrent users nationally** to a **cloud-native microservices** "
        "application on **Microsoft Azure (App Service, Azure Functions, AKS)**. Deep back-end "
        "expertise in **.NET Core / C#** and **Node.js / NestJS**, with **Java** (an automation "
        "framework and **Spring Boot** familiarity) and **Python** (LLM-evaluation grading and "
        "tooling/scripting) rounding out a multi-language toolkit alongside **SQL** and "
        "**TypeScript**. Designs and consumes **REST APIs between services** and publishes/governs "
        "them through an **API gateway (Azure API Management)** with authentication, throttling, "
        "and transformation. Hands-on with **containerization and orchestration** — **Docker, "
        "Kubernetes/AKS, Red Hat OpenShift** — and **DevOps/automation tooling** spanning "
        "**Azure DevOps, Jenkins, Ansible, and CI/CD pipelines**. Practices **DevSecOps** by "
        "default: **SonarQube** and **OWASP ZAP** in pipelines, **CWE / CVSS-graded** security "
        "audits, **OAuth 2.0 / OpenID Connect / Entra IAM**, migration to **Managed Identities**, "
        "**Key Vault** secret hygiene, and **ITSG-33 / PBMM** controls. **Observability-minded** — "
        "**Azure Monitor, Application Insights, Log Analytics**, and a self-built distributed "
        "availability-monitoring suite. **Professional Scrum Master I**; **AODA / WCAG**-aware. "
        "Active open-source contributor — **60+ public PRs** including Microsoft's "
        "`vsts-team-calendar`, `tfs-cli`, and the **Microsoft Authentication Library .NET** docs."
    ),
    "experience": [
        {
            "org": "Abrams Software", "loc": "Toronto, Ontario (Remote)",
            "dates": "August 2025 – Present",
            "title": "Back-End / Full-Stack Developer · Independent",
            "bullets": [
                "**TWNR** — **architected and shipped a public-facing multiplayer game as a "
                "full-stack web application, solo.** Dockerized **TypeScript** monorepo: "
                "**Node.js (Express) + WebSocket** backend backed by **PostgreSQL**, per-player "
                "**JWT auth**, and a **JSON-Schema-generated REST API contract** that doubles as "
                "live documentation. Concurrency-correct state via PostgreSQL transactions "
                "(`SELECT … FOR UPDATE`). Live at [twnr.paulabrams.ca](https://twnr.paulabrams.ca).",
                "**Chess Attack Visualization** — **React 19 + TypeScript** app consuming the "
                "**Lichess.org REST API**, with a **NestJS** (Spring Boot–style decorator "
                "framework) auth proxy implementing the **OAuth2 PKCE** flow. Diagnosed a missing "
                "feature in `chess.js`, opened "
                "[upstream PR #572](https://github.com/jhlywa/chess.js/pull/572), and published a "
                "fork on npm. **Portfolio site** operated as **Astro on GitHub Pages with GitHub "
                "Actions** CI/CD.",
                "**LLM code evaluation** for [DataAnnotation.tech](https://www.dataannotation.tech) "
                "and Stellar.ai — prompt fixtures and grading rubrics across **.NET / C#, Java, "
                "Python, TypeScript, React, Node / NestJS, Go, Rust, SQL, and MongoDB**, including "
                "**security audits with CWE / CVSS-graded inventories**. **60+ public PRs** to "
                "outside repos including the **Microsoft Authentication Library .NET** docs and "
                "`canada-ca/platform-security`.",
            ],
        },
        {
            "org": "Employment and Social Development, Canada", "loc": "Gatineau, QC",
            "dates": "December 2021 – July 2025",
            "title": "Senior Back-End Developer — Cloud-Native Microservices (Benefits Delivery Modernization)",
            "bullets": [
                "Enhanced and maintained a **cloud-native microservices** enterprise onboarding "
                "application — **.NET Core / C# back end, Blazor front end, Azure SQL, Azure "
                "Functions, GraphQL** — serving procurement, HR, and IT-ops personnel. **Designed "
                "and consumed REST APIs between services** and **published and governed them "
                "through Azure API Management (API gateway)** with authentication, throttling, and "
                "transformation policies; integrated enterprise IAM via **Azure AD / Entra "
                "(OAuth 2.0, OpenID Connect)**.",
                "**Serverless, event-driven workflows:** Blazor submissions kicked off **Azure "
                "Functions** triggered through **queue- and storage-based handoffs**, which "
                "created/updated Azure DevOps work items, ran pipelines, and provisioned users in "
                "on-prem Active Directory (via AAD Connect) by personnel profile — **bulk "
                "submissions fanning out asynchronously across the microservices**.",
                "**Containerized delivery, orchestration, and CI/CD:** operated end-to-end **Azure "
                "DevOps pipelines** for build, **Docker** containerization, **Kubernetes / AKS** "
                "deployment, and **Azure Data Factory** (ETL) orchestration. Used **Terraform** "
                "(infrastructure-as-code) to provision cloud infrastructure, including IP-address "
                "allocation. Completed formal **Red Hat OpenShift** training and **resolved "
                "OpenShift production-support tickets**; troubleshot an **Ansible**-driven "
                "provisioning pipeline that installed and configured software on BDM "
                "onboarding-training environments; evaluated **Aqua** container security. For the "
                "**AWS-hosted EI application**, deployed a **self-hosted pipeline agent into AWS** "
                "(AWS foundational training).",
                "**Cloud security and observability:** migrated the application's downstream "
                "identity from rotating secrets (Key Vault + ADO PATs on 90-day rotation) to "
                "**Azure Managed Identities** — eliminating the secret-rotation incident class. "
                "Implemented **ITSG-33 (NIST-based) controls** against a **PBMM** profile. "
                "Instrumented and monitored the Azure workloads with **Application Insights, Azure "
                "Monitor, and Log Analytics**, and connected **Power BI to ADO Analytics** for "
                "delivery metrics.",
                "Designed and shipped **custom web extensions in React, TypeScript, and Node.js** "
                "— a build/deploy analytics widget rendering success-rate charts via the ADO Builds "
                "REST API, and a people-by-project reporter that replaced an unusably slow query "
                "with an in-memory hashmap. Ran weekly **demos and design walkthroughs**, mentoring "
                "junior developers.",
            ],
        },
        {
            "org": "Employment and Social Development, Canada", "loc": "Gatineau, QC",
            "dates": "August 2019 – November 2021",
            "title": "Development Lead, Testing Services — CI/CD Automation & DevSecOps",
            "bullets": [
                "Co-architected and developed an **internal C# / .NET web application** — web UI "
                "for authoring structured automation scenarios, **SQL Server** schema design, and "
                "a **co-designed REST API** providing bidirectional integration with **Azure DevOps "
                "pipelines** (versioned script-fetch endpoints and structured results-push "
                "endpoints). Worked alongside a **Jenkins**-based automated-testing helper app "
                "under development by the team — CI execution-engine familiarity.",
                "**Developed automated execution frameworks driven through CI/CD pipelines:** "
                "engineered Azure DevOps pipelines that provisioned Windows build agents to run "
                "**parallelized automated runs** against deployed applications and fed structured "
                "results back into work items. Performed **code review and standards enforcement** "
                "for the team.",
                "**DevSecOps / security scanning:** integrated **SonarQube** static analysis (SAST) "
                "into Azure DevOps pipelines and wrote a script that **queried the SonarQube REST "
                "API to flag vulnerabilities by keyword and surface them into Azure DevOps** — "
                "API-driven automation of a manual security-review step. Ran **OWASP ZAP** dynamic "
                "scans (DAST) in pipelines, and evaluated **MicroFocus Fortify / ScanCentral** "
                "(SAST) for adoption.",
                "Drove a tooling consolidation (**LoadRunner → JMeter**) that **cut software "
                "licensing costs** while preserving capability, and contributed to "
                "performance-optimization analysis of high-traffic deployed applications.",
            ],
        },
        {
            "org": "Department of Immigration, Refugees, and Citizenship, Canada", "loc": "Ottawa, ON",
            "dates": "August 2017 – August 2019",
            "title": "Team Lead / Technical Lead — Platform & Tooling",
            "bullets": [
                "**Technical leadership of a cross-functional team** — led **Agile / Scrum** sprint "
                "planning, review, retrospective, daily stand-up, and backlog refinement; "
                "introduced poker-planning estimation and capacity forecasting; set engineering "
                "standards and drove delivery cadence.",
                "Implemented and deployed **custom web extensions in React / TypeScript / Node.js** "
                "with responsive, accessibility-aligned UIs — leading the work hands-on while "
                "guiding the team.",
                "**Mentored developers in SQL Server query optimization** — query tuning, indexing "
                "strategy, partitioned tables, and execution-plan analysis against large databases "
                "and warehouses; coached on C# / .NET and SSRS.",
                "Administered departmental **Azure DevOps Server / TFS** instances and heavily "
                "customized process templates; managed user/group security and source-control "
                "access across multiple project collections.",
            ],
        },
        {
            "org": "Department of Justice, Canada", "loc": "Ottawa, ON",
            "dates": "December 2015 – August 2017",
            "title": "Acting Lead Developer — iCase / Microsoft Dynamics CRM Modernization",
            "bullets": [
                "**Lead developer** on the live **Legal Case Management System (iCase)** — a large "
                "**n-tier ASP.NET / C# / ADO.NET** enterprise web application used by **5,000+ "
                "lawyers** — while concurrently building its **Microsoft Dynamics CRM** successor. "
                "Modified schema and **front-end UI to surface data-migration status in real "
                "time**, and adjusted integration stored procedures consumed by the department's "
                "SAP-based financial system.",
                "Engineered **Dynamics CRM plug-ins, custom actions, and workflows in C#** "
                "(rewriting legacy stored procedures as C# / LINQ); used **SSIS** for ETL between "
                "iCase and Dynamics; produced **entity-relationship diagrams** and **multi-month "
                "effort-estimation breakdowns** (FDD / TDD) and applied design patterns "
                "(Repository, Strategy, Mediator).",
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
                "Hired alongside one other engineer to take over a release-management environment "
                "from a contractor team. **Decommissioned over-engineered legacy C# desktop apps** "
                "and replaced them with lightweight **PowerShell calling REST APIs** — most "
                "contractor tooling was simply deleted and **everything ended up in source "
                "control**.",
                "Implemented and deployed **web extensions in React / TypeScript / Node.js**; "
                "maintained a fork of Microsoft's `vsts-team-calendar` extension and contributed "
                "back upstream. **Installed, configured, customized, and upgraded** the Azure "
                "DevOps Server / TFS platform across dev / UAT / production — complex multi-step "
                "upgrades, **Kerberos / SPN configuration**, and database-tier migration.",
            ],
        },
        {
            "org": "Department of Justice, Canada", "loc": "Ottawa, ON",
            "dates": "October 2008 – April 2014",
            "title": "Full-Stack Developer — Legal Case Management System (iCase)",
            "intro": (
                "Core developer on the department's flagship **Legal Case Management System "
                "(iCase)** — a **distributed, multi-tier ASP.NET / C# enterprise web platform** "
                "used by **5,000+ government lawyers and contracted agent firms across Canada**. "
                "**High-availability and load-balanced:** deployed across **5 load-balanced web "
                "servers** and **11 regionally distributed document servers** nationwide, with "
                "role- and object-based security and integration to records-management, financial, "
                "and email systems, running **24/7**."
            ),
            "bullets": [
                "**Optimized a high-traffic backend:** diagnosed a homepage report taking ~10 s "
                "uncached — profiled with SQL Profiler, Report Execution logs, and execution plans, "
                "then replaced live joins with a nightly-populated flat table for a **~50× speedup "
                "uncached (3–4× cached)**. Built a **self-initiated availability-monitoring suite** "
                "across the distributed web and document servers, and diagnosed and resolved a "
                "**COM Interop memory leak** affecting the document tier. Co-led the **SQL Server "
                "2005 → 2012** and **.NET Framework 2.0 → 4.0** upgrades.",
                "**Java automation-framework development:** architected a **Java-based framework "
                "(IBM Rational Functional Tester)** that **parsed English-language scenario "
                "documents into executable scripts with round-trip code generation**, plus a "
                "companion manager in **C# / SQL Server**. Replaced a labour-intensive **two-week, "
                "~20–25-person manual pre-release validation cycle** with automated execution "
                "reviewed by one person in five days — **~98% reduction in effort, ~$160K saved "
                "per release cycle**.",
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
        ("Languages:", "**C#, Java, Python, SQL (T-SQL), TypeScript, JavaScript**, PowerShell, "
         "XML / XSLT, Go (light)"),
        ("Back-End Frameworks:", "**.NET Core / .NET 6 / 8, ASP.NET Core, ADO.NET, Entity "
         "Framework, LINQ** · **Node.js, Express, NestJS** · **Spring Boot** (familiarity)"),
        ("Microservices & APIs:", "**cloud-native microservices architecture**, **REST API design "
         "between services**, GraphQL, WebSocket · **API gateway / management (Azure API "
         "Management)** — auth, throttling, transformation · event-driven & async messaging "
         "(queue- / storage-triggered) · load balancing across cloud & on-prem tiers"),
        ("Containers & Orchestration:", "**Docker, Kubernetes / AKS, Red Hat OpenShift** "
         "(training + production troubleshooting)"),
        ("DevOps / CI-CD & Automation:", "**Azure DevOps Pipelines (YAML), GitHub Actions, "
         "Jenkins** · **Ansible** (provisioning-pipeline troubleshooting + config management) · "
         "**Terraform** (IaC — infrastructure & IP provisioning) · Azure Data Factory (ETL) · "
         "build, automated test, containerized deploy"),
        ("Cloud:", "**Microsoft Azure** — **App Service, Azure Functions (serverless), AKS, Azure "
         "SQL, API Management, Key Vault, Managed Identities, Entra / AAD, Storage, Data Factory** "
         "· **AWS** — self-hosted pipeline-agent deployment + foundational training · **GCP** — "
         "TWNR production hosting"),
        ("Observability:", "**Azure Monitor, Application Insights, Log Analytics** · "
         "Prometheus / Grafana (familiarity) · self-built distributed availability-monitoring "
         "suite"),
        ("Security / DevSecOps:", "**SonarQube** (SAST — pipeline integration + REST-API-driven "
         "vulnerability queries), **OWASP ZAP** (DAST), MicroFocus Fortify / ScanCentral & Aqua "
         "(evaluated) · **OAuth 2.0 / OpenID Connect / PKCE, Entra / AAD IAM, Managed Identities** "
         "· TLS / certificate management, **Key Vault** secret hygiene · **ITSG-33 / PBMM "
         "controls**, CWE / CVSS-graded security audits"),
        ("Databases:", "**SQL — MS SQL Server 2005 → 2019** (T-SQL, stored procedures, indexing, "
         "partitioning, execution-plan tuning), **Azure SQL, PostgreSQL** · **NoSQL — MongoDB** "
         "(working familiarity)"),
        ("Process / SDLC:", "**Agile / Scrum (PSM I)** — sprint planning, review, daily stand-up, "
         "backlog refinement · **structured methodologies** for design, development, "
         "implementation & maintenance · code review, mentoring, technical documentation · "
         "ITIL v3 Foundation"),
    ],
}

# --- rq11142-cloud-specialist (cv-2026-07-06-rq11142-cloud-app-specialist.typ) ---
CONTENT["rq11142-cloud-specialist"] = {
    "out": "cv-2026-07-06-rq11142-cloud-app-specialist.docx",
    "name": "Paul Abrams",
    "location": "Toronto, Ontario",
    "tagline": ("Senior Cloud Application Specialist / Engineer · Microsoft Azure (App Service, "
                "Functions, AKS) · API-Driven Automation of Manual Processes · End-to-End CI/CD & "
                "DevSecOps · Docker / Kubernetes / OpenShift · Azure DevOps · Jenkins · Ansible · "
                "Terraform · 15+ Years"),
    "contact": CONTACT,
    "summary": (
        "**Senior cloud application specialist with 15+ years designing, building, and operating "
        "cloud-native and distributed enterprise systems** across the Government of Canada — most "
        "recently a **cloud-native microservices** application on **Microsoft Azure (App Service, "
        "Azure Functions, AKS)**. **Signature pattern: replacing manual processes with code that "
        "drives RESTful APIs** — from **Terraform** infrastructure-as-code that provisions cloud "
        "infrastructure and IP addresses, to **PowerShell / TypeScript** tools calling REST APIs "
        "that deleted over-engineered legacy systems, to a script that **queries the SonarQube "
        "REST API to automate vulnerability triage into Azure DevOps**. Designs and consumes "
        "**REST APIs between services** and governs them through an **API gateway (Azure API "
        "Management)** with authentication, throttling, and transformation. **DevSecOps "
        "end-to-end:** designs and operates **CI/CD pipelines with integrated security** — "
        "**SonarQube** (SAST) and **OWASP ZAP** (DAST) in-pipeline, **CWE / CVSS-graded** audits, "
        "PR-gated release gates, and **ITSG-33 / PBMM** controls — with a track record of "
        "migrating downstream identity to **Azure Managed Identities** to eliminate a whole class "
        "of secret-rotation risk. Hands-on across **Docker, Kubernetes/AKS, Red Hat OpenShift, "
        "Jenkins, and Ansible**, with **enterprise cloud architecture, data engineering (ETL/ELT, "
        "Azure Data Factory), and observability (Azure Monitor, Application Insights, Log "
        "Analytics)**. Deep back-end in **.NET Core / C#, Node.js / NestJS**, with **Java, Python, "
        "SQL, and TypeScript**. **Professional Scrum Master I.** Active open-source contributor — "
        "**60+ public PRs** including Microsoft's `vsts-team-calendar`, `tfs-cli`, and the "
        "**Microsoft Authentication Library .NET** docs."
    ),
    "experience": [
        {
            "org": "Abrams Software", "loc": "Toronto, Ontario (Remote)",
            "dates": "August 2025 – Present",
            "title": "Cloud Application Developer · Independent",
            "bullets": [
                "**TWNR** — **architected and shipped a public-facing multiplayer game as a "
                "full-stack web application, solo.** Dockerized **TypeScript** monorepo: "
                "**Node.js (Express) + WebSocket** backend backed by **PostgreSQL**, per-player "
                "**JWT auth**, and a **JSON-Schema-generated REST API contract** that doubles as "
                "live documentation. Concurrency-correct state via PostgreSQL transactions "
                "(`SELECT … FOR UPDATE`). Live at [twnr.paulabrams.ca](https://twnr.paulabrams.ca).",
                "**Chess Attack Visualization** — **React 19 + TypeScript** app consuming the "
                "**Lichess.org REST API**, with a **NestJS** (Spring Boot–style decorator "
                "framework) auth proxy implementing the **OAuth2 PKCE** flow. Diagnosed a missing "
                "feature in `chess.js`, opened "
                "[upstream PR #572](https://github.com/jhlywa/chess.js/pull/572), and published a "
                "fork on npm. **Portfolio site** operated as **Astro on GitHub Pages with GitHub "
                "Actions** CI/CD.",
                "**LLM code evaluation** for [DataAnnotation.tech](https://www.dataannotation.tech) "
                "and Stellar.ai — prompt fixtures and grading rubrics across **.NET / C#, Java, "
                "Python, TypeScript, React, Node / NestJS, Go, Rust, SQL, and MongoDB**, including "
                "**security audits with CWE / CVSS-graded inventories**. **60+ public PRs** to "
                "outside repos including the **Microsoft Authentication Library .NET** docs and "
                "`canada-ca/platform-security`.",
            ],
        },
        {
            "org": "Employment and Social Development, Canada", "loc": "Gatineau, QC",
            "dates": "December 2021 – July 2025",
            "title": "Senior Cloud Application Engineer — Cloud-Native Microservices (Benefits Delivery Modernization)",
            "bullets": [
                "Enhanced and maintained a **cloud-native microservices** enterprise onboarding "
                "application — **.NET Core / C# back end, Blazor front end, Azure SQL, Azure "
                "Functions, GraphQL** — serving procurement, HR, and IT-ops personnel. **Designed "
                "and consumed REST APIs between services** and **published and governed them "
                "through Azure API Management (API gateway)** with authentication, throttling, and "
                "transformation policies; integrated enterprise IAM via **Azure AD / Entra "
                "(OAuth 2.0, OpenID Connect)**.",
                "**Replaced manual processes with API-driven code:** wrote **Terraform** "
                "(infrastructure-as-code) to provision cloud infrastructure — **including "
                "IP-address allocation** — through provider REST APIs instead of manual "
                "configuration. Built **durable Azure Functions** that called the **Azure DevOps "
                "REST API** to create work items, run pipelines, and provision users in on-prem "
                "Active Directory (via AAD Connect) by personnel profile — **bulk submissions "
                "fanning out asynchronously across the microservices**, replacing manual "
                "onboarding steps.",
                "**End-to-end CI/CD with integrated security (DevSecOps):** operated **Azure "
                "DevOps pipelines** for build, **Docker** containerization, **Kubernetes / AKS** "
                "deployment, and **Azure Data Factory** (ETL/ELT) orchestration, with **SonarQube** "
                "(SAST) quality/security gates and PR-gated release controls. Completed formal "
                "**Red Hat OpenShift** training and **resolved OpenShift production-support "
                "tickets**; troubleshot an **Ansible**-driven provisioning pipeline for BDM "
                "onboarding-training environments; evaluated **Aqua** container security. Ensured "
                "pipelines met **ITSG-33 (NIST-based) controls** against a **PBMM** profile.",
                "**Enterprise security integration:** migrated the application's downstream "
                "identity from rotating secrets (Key Vault + ADO PATs on 90-day rotation) to "
                "**Azure Managed Identities** — eliminating the entire secret-rotation incident "
                "class and properly attributing automated activity. Managed **TLS / certificate "
                "hygiene** and **Key Vault** secrets.",
                "**Observability:** instrumented the Azure workloads with **Application Insights, "
                "Azure Monitor, and Log Analytics**; connected **Power BI to ADO Analytics** for "
                "delivery metrics. Shipped **custom web extensions in React / TypeScript / "
                "Node.js** against the ADO Builds REST API and mentored junior developers in "
                "weekly demos and design walkthroughs.",
            ],
        },
        {
            "org": "Employment and Social Development, Canada", "loc": "Gatineau, QC",
            "dates": "August 2019 – November 2021",
            "title": "Development Lead, Testing Services — CI/CD Automation & DevSecOps",
            "bullets": [
                "**Signature pattern — code against REST APIs to replace manual work:** "
                "co-designed a **REST API** bridging an internal **C# / .NET** scenario-authoring "
                "web app with **Azure DevOps pipelines** (versioned script-fetch and structured "
                "results-push endpoints), and wrote a script that **queried the SonarQube REST API "
                "to flag vulnerabilities by keyword and surface them into Azure DevOps** — "
                "automating a manual security-review step. Worked alongside a **Jenkins**-based "
                "automated-testing helper app under development by the team.",
                "**DevSecOps in the pipeline:** integrated **SonarQube** static analysis (SAST) "
                "and **OWASP ZAP** dynamic scans (DAST) into Azure DevOps pipelines; evaluated "
                "**MicroFocus Fortify / ScanCentral** (SAST) for adoption. Engineered pipelines "
                "that provisioned Windows build agents for **parallelized automated runs** against "
                "deployed applications, feeding structured results back into work items.",
                "Drove a tooling consolidation (**LoadRunner → JMeter**) that **cut software "
                "licensing costs** while preserving capability; performed **code review and "
                "standards enforcement** and contributed to performance-optimization analysis of "
                "high-traffic applications.",
            ],
        },
        {
            "org": "Department of Immigration, Refugees, and Citizenship, Canada", "loc": "Ottawa, ON",
            "dates": "August 2017 – August 2019",
            "title": "Team Lead / Technical Lead — Platform & Tooling",
            "bullets": [
                "**Technical leadership of a cross-functional team** — led **Agile / Scrum** sprint "
                "planning, review, retrospective, daily stand-up, and backlog refinement; "
                "introduced poker-planning estimation; set engineering standards and drove "
                "delivery cadence.",
                "Implemented and deployed **custom web extensions in React / TypeScript / "
                "Node.js**; **mentored developers in SQL Server query optimization** — query "
                "tuning, indexing strategy, partitioned tables, and execution-plan analysis. "
                "Administered departmental **Azure DevOps Server / TFS** instances, customized "
                "process templates, and managed source-control security across multiple project "
                "collections.",
            ],
        },
        {
            "org": "Department of Justice, Canada", "loc": "Ottawa, ON",
            "dates": "December 2015 – August 2017",
            "title": "Acting Lead Developer — iCase / Microsoft Dynamics CRM Modernization",
            "bullets": [
                "**Lead developer** on the live **Legal Case Management System (iCase)** — a large "
                "**n-tier ASP.NET / C# / ADO.NET** enterprise web application used by **5,000+ "
                "lawyers** — while concurrently building its **Microsoft Dynamics CRM** successor. "
                "Modified schema and **front-end UI to surface data-migration status in real "
                "time**, and adjusted integration stored procedures consumed by the department's "
                "SAP-based financial system.",
                "Engineered **Dynamics CRM plug-ins, custom actions, and workflows in C#** "
                "(rewriting legacy stored procedures as C# / LINQ); used **SSIS** for **ETL** "
                "between iCase and Dynamics; produced **entity-relationship diagrams** and "
                "**effort-estimation breakdowns** (FDD / TDD). **Established code-review processes "
                "gated on work items** and **mentored junior developers**.",
            ],
        },
        {
            "org": "Department of Citizenship and Immigration, Canada", "loc": "Ottawa, ON",
            "dates": "April 2014 – December 2015",
            "title": "Senior Software Engineer · Release Engineering Lead",
            "bullets": [
                "**Replacing manual processes via code and APIs:** hired alongside one other "
                "engineer to take over a release-management environment from a contractor team. "
                "**Decommissioned over-engineered legacy C# desktop apps** and replaced them with "
                "lightweight **PowerShell calling REST APIs** — most contractor tooling was simply "
                "deleted and **everything ended up in source control**.",
                "Implemented and deployed **web extensions in React / TypeScript / Node.js**; "
                "maintained a fork of Microsoft's `vsts-team-calendar` extension and contributed "
                "back upstream. **Installed, configured, customized, and upgraded** the Azure "
                "DevOps Server / TFS platform across dev / UAT / production — complex multi-step "
                "upgrades, **Kerberos / SPN configuration**, and database-tier migration.",
            ],
        },
        {
            "org": "Department of Justice, Canada", "loc": "Ottawa, ON",
            "dates": "October 2008 – April 2014",
            "title": "Full-Stack Developer — Legal Case Management System (iCase)",
            "intro": (
                "Core developer on the department's flagship **Legal Case Management System "
                "(iCase)** — a **distributed, multi-tier ASP.NET / C# enterprise web platform** "
                "used by **5,000+ government lawyers and contracted agent firms across Canada**, "
                "deployed across **5 load-balanced web servers** and **11 regionally distributed "
                "document servers** with **24/7 high availability**."
            ),
            "bullets": [
                "**Optimized a high-traffic backend:** diagnosed a homepage report taking ~10 s "
                "uncached — profiled with SQL Profiler, Report Execution logs, and execution plans, "
                "then replaced live joins with a nightly-populated flat table for a **~50× speedup "
                "uncached (3–4× cached)**. Built a **self-initiated availability-monitoring suite** "
                "across the distributed web and document servers, and diagnosed and resolved a "
                "**COM Interop memory leak** on the document tier.",
                "**Java automation-framework development:** architected a **Java-based framework "
                "(IBM Rational Functional Tester)** that **parsed English-language scenario "
                "documents into executable scripts with round-trip code generation**, plus a "
                "companion manager in **C# / SQL Server** — replacing a **two-week, ~20–25-person "
                "manual pre-release validation cycle** with automated execution reviewed by one "
                "person in five days (**~98% reduction in effort, ~$160K saved per release "
                "cycle**).",
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
        ("Cloud:", "**Microsoft Azure** — **App Service, Azure Functions (serverless), AKS, Azure "
         "SQL, API Management, Key Vault, Managed Identities, Entra / AAD, Storage, Data Factory** "
         "· **AWS** — self-hosted pipeline-agent deployment + foundational training · **GCP** — "
         "TWNR production hosting"),
        ("API-Driven Automation:", "**writing code to drive RESTful APIs and replace manual "
         "processes** — **Terraform** IaC (infrastructure & IP provisioning via provider APIs), "
         "**Azure DevOps REST API** tooling, **SonarQube REST API** vulnerability automation, "
         "**PowerShell / TypeScript** REST clients · REST API design between services, GraphQL, "
         "WebSocket · API gateway / management (Azure API Management)"),
        ("CI/CD & DevOps:", "**end-to-end CI/CD pipeline design** · **Azure DevOps Pipelines "
         "(YAML), GitHub Actions, Jenkins** · **Ansible** (provisioning-pipeline troubleshooting + "
         "config management) · **Docker, Kubernetes / AKS, Red Hat OpenShift** (training + "
         "production troubleshooting) · Azure Data Factory (ETL/ELT)"),
        ("DevSecOps / Security:", "**integrated security in CI/CD** — **SonarQube** (SAST, "
         "pipeline + API automation), **OWASP ZAP** (DAST), MicroFocus Fortify / ScanCentral & "
         "Aqua (evaluated) · **OAuth 2.0 / OpenID Connect / PKCE, Entra / AAD IAM, Managed "
         "Identities** · TLS / certificate management, **Key Vault** secret hygiene, encryption · "
         "**ITSG-33 / PBMM controls**, CWE / CVSS-graded audits, compliance (SA&A)"),
        ("Observability:", "**Azure Monitor, Application Insights, Log Analytics** · "
         "Prometheus / Grafana (familiarity) · self-built distributed availability-monitoring "
         "suite · Power BI on ADO Analytics"),
        ("Enterprise Cloud Architecture:", "**cloud-native microservices**, event-driven & async "
         "messaging (queue- / storage-triggered), serverless, load balancing & high availability "
         "across cloud & on-prem tiers, IAM & encryption, design patterns, entity-relationship "
         "modelling"),
        ("Languages & Back-End:", "**.NET Core / C#, Java, Python, SQL (T-SQL), TypeScript, "
         "JavaScript**, PowerShell, XML / XSLT, Go (light) · **ASP.NET Core, ADO.NET, Entity "
         "Framework, LINQ, Node.js, Express, NestJS, Spring Boot** (familiarity) · **React 19, "
         "Blazor**"),
        ("Databases / Data Engineering:", "**MS SQL Server 2005 → 2019** (T-SQL, stored "
         "procedures, indexing, partitioning, execution-plan tuning), **Azure SQL, PostgreSQL** · "
         "**ETL/ELT** (Azure Data Factory, SSIS) · **MongoDB** (working familiarity)"),
        ("Process / SDLC:", "**Agile / Scrum (PSM I)** · **structured methodologies** for design, "
         "development, implementation & maintenance · code review, mentoring, technical "
         "documentation · ITIL v3 Foundation"),
    ],
}

# --- russelltobin-net (cv-2026-07-08-russelltobin-fullstack-net.typ) ---------
CONTENT["russelltobin-net"] = {
    "out": "cv-2026-07-08-russelltobin-fullstack-net.docx",
    "name": "Paul Abrams",
    "location": "Toronto, Ontario",
    "tagline": ("Senior Full-Stack .NET Developer · C# / ASP.NET / .NET Core / Web API / "
                "Blazor WASM / WCF · Entity Framework / LINQ · Azure (Functions, App Service, "
                "Entra ID, Key Vault, Managed Identities, DevOps CI/CD) · REST / Swagger / "
                "Postman / OAuth / CORS · SQL Server · JavaScript / TypeScript · Crystal Reports · "
                "xUnit / Moq · WCAG / AODA · Agile / Scrum · 15+ Years"),
    "contact": CONTACT,
    "summary": (
        "**Senior full-stack .NET developer with 15+ years across the full SDLC**, shipping "
        "**enterprise web applications** from front-end UI through service back ends and "
        "relational databases — the bulk of it in the **Ontario- and federal-scale public "
        "sector**. Deep **C# / .NET** engineering: **ASP.NET / ASP.NET MVC, .NET Core, Web API, "
        "Entity Framework, LINQ, ADO.NET**, and a **Blazor** front end, with **WCF** and **WPF** "
        "on legacy tiers. Designs and consumes **RESTful APIs between services** documented and "
        "tested with **Swagger, Postman, and ThunderClient**, secured with **OAuth 2.0 / OpenID "
        "Connect, client- and server-side CORS policy, and API-management throttling**. Strong on "
        "**Azure application development and security** — **Azure Functions, App Service, "
        "Container Instances, Entra ID / Azure AD, MFA / SSO, App registrations, Key Vault, and "
        "Managed Identities**. Front end in **JavaScript, HTML / CSS, and React + TypeScript** "
        "(component-based SPA patterns; framework-transferable to Angular), built to **full WCAG "
        "AA / AODA accessibility compliance**. Designs and models **relational databases** and "
        "writes performant **T-SQL** against **SQL Server**. Disciplined engineering practice: "
        "**SOLID design, dependency injection, reusable NuGet components, unit testing with "
        "xUnit / Moq**, code review, and **Azure DevOps CI/CD pipelines**. Builds operational and "
        "management **reports** (SSRS, Crystal Reports, Power BI). Delivers in **Agile / Scrum** "
        "(Professional Scrum Master I) tracking work in **Azure DevOps / TFS and JIRA**. Active "
        "open-source contributor — **60+ public PRs** including Microsoft's `vsts-team-calendar`, "
        "`tfs-cli`, and the **Microsoft Authentication Library .NET** docs."
    ),
    "experience": [
        {
            "org": "Abrams Software", "loc": "Toronto, Ontario (Remote)",
            "dates": "August 2025 – Present",
            "title": "Full-Stack Developer · Independent",
            "bullets": [
                "**Chess Attack Visualization** — **React 19 + TypeScript** single-page app (Vite, "
                "React Testing Library + Vitest / Jest) consuming the **Lichess.org REST API**, "
                "with a **NestJS** (TypeScript decorator framework analogous to **Spring Boot**) "
                "auth proxy implementing the **OAuth2 PKCE** flow with **client- and server-side "
                "CORS** configuration. Diagnosed a missing feature in `chess.js`, opened "
                "[upstream PR #572](https://github.com/jhlywa/chess.js/pull/572), and published a "
                "fork on npm. **Portfolio site** runs as **Astro on GitHub Pages with GitHub "
                "Actions** CI/CD.",
                "**TWNR** — **architected and shipped a public-facing multiplayer game as a "
                "full-stack web application, solo.** Dockerized **TypeScript** monorepo: **Node.js "
                "(Express) + WebSocket** server backed by **PostgreSQL**, per-player **JWT auth**, "
                "and a **JSON-Schema-generated REST API contract** that doubles as live "
                "Swagger-style documentation. Concurrency-correct state via database transactions "
                "(`SELECT … FOR UPDATE`). Live at [twnr.paulabrams.ca](https://twnr.paulabrams.ca).",
                "**LLM code evaluation** for [DataAnnotation.tech](https://www.dataannotation.tech) "
                "and Stellar.ai — prompt fixtures and grading rubrics across **.NET / C#, "
                "JavaScript / TypeScript, React, Java, Python, SQL, and MongoDB**, including "
                "**security audits with CWE / CVSS-graded inventories**. **60+ public PRs** to "
                "outside repos including the **Microsoft Authentication Library .NET** docs and "
                "`canada-ca/platform-security`.",
            ],
        },
        {
            "org": "Employment and Social Development, Canada", "loc": "Gatineau, QC",
            "dates": "December 2021 – July 2025",
            "title": "Senior Full-Stack Developer — Cloud Application (Benefits Delivery Modernization)",
            "bullets": [
                "Enhanced and maintained an enterprise onboarding application — **.NET Core / C# "
                "back end, Blazor front end, Azure SQL, Azure Functions, Web API, GraphQL** — "
                "serving procurement, HR, and IT-ops personnel. **Designed and consumed RESTful "
                "Web APIs between services**, documented and tested with **Swagger and Postman**, "
                "and integrated enterprise IAM via **Entra ID / Azure AD (OAuth 2.0, OpenID "
                "Connect)** with **SSO / MFA**; governed APIs through **Azure API Management** with "
                "authentication, throttling, and transformation policies.",
                "**Azure application development and security:** built and operated **Azure "
                "Functions, App Service, and Container Instances**; configured **Azure AD App "
                "registrations and policies** and **client- and server-side CORS policy**; "
                "migrated downstream identity from rotating **Key Vault** secrets and ADO PATs to "
                "**Azure Managed Identities** — eliminating the secret-rotation incident class. "
                "Applied **SOLID design and dependency injection**, and packaged **reusable "
                "components as NuGet** for reuse across the microservices.",
                "Designed and shipped **custom web extensions in JavaScript / React / TypeScript / "
                "Node.js** — a build/deploy analytics widget rendering success-rate charts via the "
                "ADO REST API, and a people-by-project reporter that replaced an unusably slow "
                "query with an in-memory hashmap. Responsive UI, custom **CSS**, **WCAG AA / "
                "AODA**-aligned interactions with cross-browser support.",
                "Operated **Azure DevOps CI/CD pipelines** for build, **unit testing (xUnit / "
                "Moq)**, **Docker** containerization, **Kubernetes** deployment, and **Azure Data "
                "Factory** (ETL / ELT data-pipeline) orchestration; daily Git workflow with "
                "feature branches and PR-gated CI. Ran weekly **demos and design walkthroughs**, "
                "mentoring junior developers on API integration, app registration, and custom "
                "extensions.",
            ],
        },
        {
            "org": "Employment and Social Development, Canada", "loc": "Gatineau, QC",
            "dates": "August 2019 – November 2021",
            "title": "Development Lead — Internal Web Application & CI/CD Automation",
            "bullets": [
                "Co-architected and developed an **internal C# / .NET web application** with a web "
                "UI for authoring structured scenarios; **designed and modelled the SQL Server "
                "relational schema** and **co-designed the REST Web API** for bidirectional "
                "integration with **Azure DevOps pipelines** (versioned script-fetch and "
                "structured results-push endpoints). Applied **dependency injection** and unit "
                "testing; enforced coding standards through **code review**.",
                "Engineered **Azure DevOps CI/CD pipelines** that provisioned Windows agents to "
                "run parallel automated **Selenium** runs against deployed applications and fed "
                "structured results back into work items. Drove a tooling consolidation "
                "(**LoadRunner → JMeter**) that cut licensing costs while preserving capability. "
                "Integrated **SonarQube** (SAST) and **OWASP ZAP** (DAST) into pipelines.",
            ],
        },
        {
            "org": "Department of Immigration, Refugees, and Citizenship, Canada", "loc": "Ottawa, ON",
            "dates": "August 2017 – August 2019",
            "title": "Team Lead / Technical Lead",
            "bullets": [
                "Led full **Agile / Scrum** delivery — sprint planning, review, retrospective, "
                "daily stand-up, backlog refinement, iteration demos, and design walkthroughs; "
                "introduced poker-planning estimation and capacity forecasting. **Elicited and "
                "translated business requirements** into working software through close BA and "
                "stakeholder partnership, including **requirements analysis for reports and "
                "enhancements**.",
                "Implemented and deployed **custom web extensions in JavaScript / React / "
                "TypeScript / Node.js** with responsive, **accessibility-aligned (WCAG / AODA)** "
                "UIs — hands-on while guiding the team. **Mentored developers in SQL Server query "
                "optimization** — query tuning, indexing strategy, partitioned tables, and "
                "execution-plan analysis against large databases and warehouses.",
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
                "(rewriting legacy stored procedures as **C# / LINQ**); used **SSIS** for ETL "
                "between systems; produced **entity-relationship diagrams** and **detailed "
                "effort-estimation breakdowns** (FDD / TDD), and applied design patterns "
                "(Repository, Strategy, Mediator). **Established code-review processes gated on "
                "work items** and mentored junior developers.",
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
                "control**.",
                "Implemented and deployed **web extensions in JavaScript / React / TypeScript / "
                "Node.js**; maintained a fork of Microsoft's `vsts-team-calendar` extension and "
                "contributed back upstream. **Installed, configured, customized, and upgraded** "
                "the Azure DevOps Server / TFS platform across dev / UAT / production — multi-step "
                "upgrades, **Kerberos / SPN configuration**, and database-tier migration.",
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
                "servers** with role- and object-based security, integration to records-"
                "management, financial, and email systems, and **24/7 high availability**."
            ),
            "bullets": [
                "Led design and largely solo implementation of the **\"My iCase\" personalization "
                "portal** — the customizable widget-based entry point to iCase. Ran JAD sessions, "
                "produced prototypes, authored **FDD / TDD documentation**, then built it on "
                "**ASP.NET Web Parts with a custom SQL personalization provider**, **Knockout.js "
                "MVVM** (a direct ancestor of modern component frameworks), and async AJAX "
                "web-service calls.",
                "**Performance and reporting engineering:** diagnosed a homepage **report** taking "
                "~10 s uncached — profiled with SQL Profiler, Report Execution logs, and execution "
                "plans, then replaced live joins with a nightly-populated flat table (**~50× "
                "faster uncached, 3–4× cached**). Built a **self-initiated availability-monitoring "
                "suite** across the distributed servers, resolved a **COM Interop memory leak** on "
                "the document tier, and co-led the **SQL Server 2005 → 2012** and **.NET Framework "
                "2.0 → 4.0** upgrades.",
                "Architected a **Java-based automation framework (IBM Rational Functional "
                "Tester)** that **parsed English-language scenario documents into executable "
                "scripts with round-trip code generation**, plus a companion manager in **C# / "
                "SQL Server** — replacing a labour-intensive **two-week, ~20–25-person manual "
                "pre-release validation cycle** with automated execution reviewed by one person in "
                "five days (**~98% reduction in effort, ~$160K saved per release cycle**).",
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
        ("Languages:", "**C#, JavaScript, TypeScript, SQL (T-SQL)**, HTML / CSS, PowerShell, "
         "Java, Python, XML / XSLT"),
        (".NET / Back-End:", "**.NET Core / .NET 6 / 8, ASP.NET / ASP.NET MVC, Web API, ADO.NET, "
         "Entity Framework, LINQ** · **Blazor (WASM)** · **WCF, WPF** (legacy) · **SOLID, "
         "dependency injection, reusable NuGet components** · **Node.js, Express, NestJS** · "
         "Spring Boot (familiarity)"),
        ("Front-End / UI:", "**JavaScript, HTML / CSS, React 19, TypeScript**, Blazor, Knockout.js "
         "MVVM, Vite, AJAX, jQuery · component-based SPA (Angular-transferable) · **responsive, "
         "cross-browser, full WCAG AA / AODA accessibility** · UX/UI fundamentals"),
        ("APIs:", "**RESTful Web API design between services**, GraphQL, WebSocket · **Swagger, "
         "Postman, ThunderClient** · **OAuth 2.0 / OpenID Connect, CORS** · API gateway / "
         "management (Azure APIM) · SOAP / WCF (legacy)"),
        ("Azure:", "**Azure Functions, App Service, Container Instances, Azure SQL, API "
         "Management, Key Vault, Managed Identities** · **Entra ID / Azure AD — OAuth 2.0 / "
         "OpenID Connect, MFA / SSO, App registrations & policies, CORS**"),
        ("Databases:", "**MS SQL Server (2005 → 2019), Azure SQL** — relational modelling, stored "
         "procedures, indexing, partitioning, execution-plan tuning · **PostgreSQL** · MongoDB "
         "(working familiarity)"),
        ("Testing:", "**xUnit / NUnit, Moq**, React Testing Library / Vitest / Jest, Selenium, "
         "Playwright · SonarQube (SAST), OWASP ZAP (DAST)"),
        ("CI/CD & DevOps:", "**Azure DevOps Pipelines (YAML), Git, GitHub Actions** · **Docker, "
         "Kubernetes** · Azure Data Factory (ETL / ELT) · feature branches, PR-gated CI"),
        ("Reporting / Office:", "SSRS, **Crystal Reports** (legacy), Power BI · MS Word, Excel, "
         "PowerPoint, Visio"),
        ("Also experienced with (Microsoft legacy):", "Visual Studio 2005 → 2022, .NET Framework "
         "2.0 → 4.8, IIS, WCF / WPF, SSIS, Azure DevOps Server (TFS) administration & upgrades, "
         "multi-threaded Windows services"),
        ("Process / SDLC:", "**Agile / Scrum (PSM I)** — sprint planning, backlog refinement, "
         "demos · Azure DevOps / TFS, JIRA · FDD / TDD with effort estimation, code review, "
         "mentoring, technical documentation · ITIL v3 Foundation"),
        ("Adjacent / rapidly transferable:", "Deep relational-database and **T-SQL** experience "
         "transfers directly to **Oracle / PL-SQL** (and TOAD as a client); **component-based "
         "SPA** fluency across **React, Blazor, and Knockout.js MVVM** transfers directly to "
         "**Angular**; comfortable adding **Redis** distributed caching to the .NET / Azure "
         "stack."),
    ],
}

# --- rq11319-scope (cv-2026-07-10-rq11319-scope-senior.typ) ------------------
CONTENT["rq11319-scope"] = {
    "out": "cv-2026-07-10-rq11319-scope-senior.docx",
    "name": "Paul Abrams",
    "location": "Toronto, Ontario",
    "tagline": ("Senior Software Developer · ASP.NET Web API / C# / VB.NET / SQL · "
                "Vue.js & Angular · 15+ Years Enterprise Government Systems · "
                "Justice-Domain (Legal Case Management) · TFS → Azure DevOps Transition "
                "& Agile SCRUM Leadership"),
    "contact": CONTACT,
    "summary": (
        "Senior full-stack developer with 15+ years across the full SDLC, shipping web-based "
        "enterprise applications from front-end UI through service back ends and relational "
        "databases."
    ),
    "experience": [
        {
            "org": "Abrams Software", "loc": "Toronto, Ontario (Remote)",
            "dates": "August 2025 – Present",
            "title": "Full-Stack Developer · Independent",
            "bullets": [
                "Built CVForge, a blurb-library and CV-builder product with twin single-page "
                "front ends in **Vue.js 3 and Angular 18** over an **ASP.NET Core (C#) REST "
                "Web API** with relational SQL persistence.",
                "Designed the REST API endpoints consumed by both SPA clients and by an MCP "
                "tool-server integration.",
                "Shipped other production web applications solo, including a multiplayer game "
                "(Node.js, PostgreSQL, with a REST API contract generated from JSON Schema) and "
                "a React 19 + TypeScript chess visualization consuming the Lichess REST API.",
            ],
        },
        {
            "org": "Employment and Social Development, Canada", "loc": "Gatineau, QC",
            "dates": "December 2021 – July 2025",
            "title": "Senior Software Developer — Cloud-Native Microservices",
            "bullets": [
                "Enhanced and maintained a **cloud-native microservices** onboarding application "
                "(**.NET Core / C#**, Blazor, Azure SQL, Azure Functions).",
                "**Designed and consumed REST APIs between services**, documented with **Swagger** "
                "and governed through Azure API Management.",
                "Migrated downstream identity to Azure Managed Identities, eliminating the "
                "secret-rotation incident class.",
            ],
        },
        {
            "org": "Employment and Social Development, Canada", "loc": "Gatineau, QC",
            "dates": "August 2019 – November 2021",
            "title": "Senior Software Developer — Internal Web Application & CI/CD Automation",
            "bullets": [
                "Co-architected and developed an **internal C# / .NET web application** — web UI "
                "for authoring structured automation scenarios, **SQL Server** relational schema "
                "design, and a co-designed **REST API** providing bidirectional integration with "
                "Azure DevOps pipelines.",
                "Engineered Azure DevOps pipelines that provisioned Windows agents to run "
                "parallelized automated runs against deployed applications; enforced coding "
                "standards through **code review**.",
                "Drove a tooling consolidation that cut software licensing costs while preserving "
                "capability.",
            ],
        },
        {
            "org": "Department of Immigration, Refugees, and Citizenship, Canada", "loc": "Ottawa, ON",
            "dates": "August 2017 – August 2019",
            "title": "Team Lead / Technical Lead — Platform & Tooling",
            "bullets": [
                "**Technical leadership of a cross-functional team** — led **Agile / Scrum** "
                "sprint planning, review, retrospective, daily stand-up, and backlog refinement; "
                "introduced poker-planning estimation and capacity forecasting; set engineering "
                "standards.",
                "**Mentored developers in SQL Server query optimization** — query tuning, "
                "indexing strategy, partitioned tables, and execution-plan analysis — and coached "
                "on C# / .NET.",
                "Administered departmental **Azure DevOps Server / TFS** instances, maintained "
                "heavily customized process templates, and managed user/group security across "
                "multiple project collections.",
            ],
        },
        {
            "org": "Department of Justice, Canada", "loc": "Ottawa, ON",
            "dates": "December 2015 – August 2017",
            "title": "Acting Lead Developer — iCase / Microsoft Dynamics CRM Modernization",
            "bullets": [
                "Lead developer on the live **Legal Case Management System (iCase)** — a large "
                "n-tier **ASP.NET / C# / ADO.NET** enterprise web application used by **5,000+ "
                "government lawyers** — while concurrently building its Microsoft Dynamics CRM "
                "successor.",
                "Engineered Dynamics CRM plug-ins, custom actions, and workflows in C# (rewriting "
                "legacy stored procedures as **C# / LINQ**); used **SSIS** for ETL; produced "
                "**entity-relationship diagrams** and multi-month effort-estimation breakdowns "
                "(FDD / TDD).",
                "Established code-review processes gated on work items and **mentored junior "
                "developers**.",
            ],
        },
        {
            "org": "Department of Citizenship and Immigration, Canada", "loc": "Ottawa, ON",
            "dates": "April 2014 – December 2015",
            "title": "Senior Software Engineer · Release Engineering Lead",
            "bullets": [
                "**Installed, configured, customized, and upgraded** the Azure DevOps Server / "
                "TFS platform across dev / UAT / production — complex multi-step upgrades, "
                "Kerberos / SPN configuration, and database-tier migration.",
                "Replaced over-engineered legacy C# desktop tooling with lightweight PowerShell "
                "calling REST APIs, bringing everything under source control.",
                "Implemented and deployed web extensions in React / TypeScript / Node.js, "
                "contributing upstream to Microsoft's `vsts-team-calendar`.",
            ],
        },
        {
            "org": "Department of Justice, Canada", "loc": "Ottawa, ON",
            "dates": "October 2008 – April 2014",
            "title": "Full-Stack Developer — Legal Case Management System (iCase)",
            "bullets": [
                "Core developer on a **distributed, multi-tier ASP.NET / C# enterprise platform** "
                "used by **5,000+ government lawyers nationally**.",
                "Optimized a high-traffic backend report for a **~50x speedup** via "
                "execution-plan analysis.",
                "**Migrated core business modules from VB.NET to C#.**",
            ],
        },
    ],
    "education": [
        ("Bachelor of Computer Science (Honours)", "Carleton University",
         "September 1999 – May 2003"),
    ],
    "certs": (
        "[Professional Scrum Master I](https://www.scrum.org/user/2230283) (Scrum.org)  ·  "
        "ITIL v3 Foundation (Loyalist Certification Services)"
    ),
    "skills": [
        ("Back-End (.NET):", "**C#, ASP.NET (Web Forms → Core), ASP.NET Web API / REST, .NET "
         "Framework 2.0 – 4.8 and .NET 5 – 8, VB.NET (legacy migration to C#)**, Entity "
         "Framework, LINQ, ADO.NET, XML / XSLT, WCF / WPF, IIS, Visual Studio 2005 – 2022"),
        ("Databases:", "**MS SQL Server 2005 → 2019, Azure SQL**, PostgreSQL — relational "
         "modelling, T-SQL stored procedures, indexing, partitioning, execution-plan tuning"),
        ("APIs:", "**RESTful Web API design between services** — documented and tested with "
         "**Swagger (OpenAPI) and Postman**; published and governed through Azure API "
         "Management; SOAP / WCF on legacy tiers"),
        ("Front-End:", "**JavaScript, TypeScript, HTML / CSS, React, Angular, Vue**, Blazor, "
         "Knockout.js — responsive, WCAG AA / AODA accessible"),
        ("DevOps & Process:", "**Azure DevOps Services and Azure DevOps Server / TFS (all "
         "supported versions — installation, upgrades, administration)**, Git, CI/CD pipelines "
         "· **Agile / Scrum (Professional Scrum Master I)** and waterfall delivery · code "
         "review, mentoring, JAD sessions, FDD / TDD documentation and effort estimation"),
    ],
}

# --- react-nestjs-senior (cv-2026-07-15-senior-swe-react-nestjs.typ) --------
CONTENT["react-nestjs-senior"] = {
    "out": "cv-2026-07-15-senior-swe-react-nestjs.docx",
    "name": "Paul Abrams",
    "location": "Toronto, Ontario",
    "tagline": ("Senior Software Engineer · React / TypeScript · NestJS / Node.js · "
                "REST APIs & Cloud-Native Microservices · Application & Cloud Security "
                "(OAuth 2.0 / OIDC, SAST / DAST, CWE / CVSS) · MCP & LLM-Assisted "
                "Engineering · 15+ Years"),
    "contact": CONTACT,
    "summary": (
        "**Senior software engineer with 15+ years across the full SDLC**, shipping **B2B and "
        "B2C web applications** from front-end UI through service back ends and databases. "
        "Front end in **React + TypeScript** (component-based SPAs, HTML5 / CSS3, responsive "
        "and WCAG-accessible); back end designing and implementing **RESTful APIs in "
        "TypeScript with NestJS and Node.js / Express**, plus deep **.NET Core / C#** "
        "experience on **cloud-native microservices**. **Security is a throughline**: "
        "**OAuth 2.0 / OpenID Connect / PKCE, JWT auth**, migration to **Azure Managed "
        "Identities**, **Key Vault** secret hygiene, TLS / certificate management, client- "
        "and server-side **CORS** policy, **SonarQube (SAST)** and **OWASP ZAP (DAST)** in CI "
        "pipelines, **CWE / CVSS-graded security audits**, and **NIST-based (ITSG-33 / PBMM) "
        "controls**. Hands-on with **AI-assisted engineering**: designed and shipped a "
        "**Model Context Protocol (MCP) tool-server** with in-code guardrails, develops daily "
        "with **Claude Code**, and evaluates LLM-generated code professionally. Delivers "
        "**well-tested code** (**Jest / Vitest / React Testing Library**, xUnit) through "
        "**PR-gated CI/CD** in **Agile / Scrum** (Professional Scrum Master I), collaborating "
        "in **Azure DevOps** with distributed stakeholders. Active open-source contributor — "
        "**60+ public PRs** including Microsoft's `vsts-team-calendar`, `tfs-cli`, and the "
        "**Microsoft Authentication Library .NET** docs."
    ),
    "experience": [
        {
            "org": "Abrams Software", "loc": "Toronto, Ontario (Remote)",
            "dates": "August 2025 – Present",
            "title": "Full-Stack Developer · Independent",
            "bullets": [
                "**Chess Attack Visualization** — **React 19 + TypeScript** single-page app "
                "(Vite, **React Testing Library + Vitest / Jest** unit tests) consuming the "
                "**Lichess.org REST API**, with a **NestJS / Node.js** auth service "
                "implementing the **OAuth2 PKCE** flow with client- and server-side **CORS** "
                "configuration. Diagnosed a missing feature in `chess.js`, opened "
                "[upstream PR #572](https://github.com/jhlywa/chess.js/pull/572), and "
                "published a fork on npm.",
                "**CVForge** — full-stack SaaS-style product (public at "
                "[github.com/pabrams/cvforge](https://github.com/pabrams/cvforge)): a REST "
                "Web API (**ASP.NET Core, EF Core, Swagger / OpenAPI docs**) consumed by "
                "**two parallel SPA front ends (Angular and Vue 3)**. Designed and shipped a "
                "**Model Context Protocol (MCP) tool-server in Node.js** wrapping the API so "
                "LLM agents (**Claude Code**) can drive the domain — with **security "
                "guardrails enforced in code** (agents cannot modify locked records; "
                "agent-created content is always flagged as draft) and a **secret-scanner "
                "blocking credential leakage** into exported documents.",
                "**TWNR** — **architected and shipped a public-facing B2C multiplayer game, "
                "solo.** Dockerized **TypeScript** monorepo: **Node.js (Express) + "
                "WebSocket** server backed by **PostgreSQL**, per-player **JWT auth**, and a "
                "**JSON-Schema-generated REST API contract** that doubles as live "
                "documentation. Concurrency-correct state via database transactions. Live at "
                "[twnr.paulabrams.ca](https://twnr.paulabrams.ca).",
                "**LLM code evaluation** for "
                "[DataAnnotation.tech](https://www.dataannotation.tech) and Stellar.ai — "
                "prompt fixtures and grading rubrics across **TypeScript, React, Node / "
                "NestJS, .NET / C#, Python, SQL, and MongoDB**, including **security audits "
                "with CWE / CVSS-graded vulnerability inventories**. **60+ public PRs** to "
                "outside repos including the **Microsoft Authentication Library .NET** docs "
                "and `canada-ca/platform-security`.",
            ],
        },
        {
            "org": "Employment and Social Development, Canada", "loc": "Gatineau, QC",
            "dates": "December 2021 – July 2025",
            "title": "Senior Software Engineer — Cloud-Native Microservices (Benefits Delivery Modernization)",
            "bullets": [
                "Enhanced and maintained a **cloud-native microservices** enterprise "
                "onboarding application — **.NET Core / C# back end, Blazor front end, Azure "
                "SQL, Azure Functions, GraphQL**. **Designed API endpoints, defined schemas, "
                "and generated documentation** (Swagger / OpenAPI, Postman); **published and "
                "governed APIs through Azure API Management** with authentication, "
                "throttling, and transformation policies; integrated enterprise IAM via "
                "**Entra ID / Azure AD (OAuth 2.0, OpenID Connect)** with SSO / MFA.",
                "**Application and cloud security:** migrated the application's downstream "
                "identity from rotating secrets (Key Vault + PATs on 90-day rotation) to "
                "**Azure Managed Identities** — eliminating the secret-rotation incident "
                "class. Implemented **NIST-based ITSG-33 controls** — TLS / certificate "
                "management and **Key Vault** secret hygiene — for security assessment "
                "submissions against a **PBMM** profile; configured **Azure AD App "
                "registrations** and client- and server-side **CORS** policy.",
                "Designed and shipped **custom web extensions in React, TypeScript, and "
                "Node.js** — a build/deploy analytics widget rendering success-rate charts "
                "via the ADO REST API, and a people-by-project reporter that replaced an "
                "unusably slow query with an in-memory hashmap. Responsive UI, custom CSS, "
                "**WCAG**-aligned interactions with cross-browser support.",
                "Operated **CI/CD pipelines** (Azure DevOps) for build, unit testing, "
                "**Docker** containerization, **Kubernetes** deployment, and ETL "
                "orchestration; daily Git workflow with feature branches and **peer code "
                "review on PR-gated CI**. Ran weekly **demos and design walkthroughs**, "
                "mentoring junior developers on API integration and security configuration. "
                "Supported production — troubleshooting deployed services and resolving "
                "user-reported issues.",
            ],
        },
        {
            "org": "Employment and Social Development, Canada", "loc": "Gatineau, QC",
            "dates": "August 2019 – November 2021",
            "title": "Development Lead — Internal Web Application, CI/CD Automation & DevSecOps",
            "bullets": [
                "Co-architected and developed an **internal C# / .NET web application** — "
                "web UI for authoring structured automation scenarios, **SQL Server** schema "
                "design, and a **co-designed REST API** providing bidirectional integration "
                "with **Azure DevOps pipelines** (versioned script-fetch and structured "
                "results-push endpoints).",
                "**DevSecOps / security scanning:** integrated **SonarQube** static analysis "
                "(SAST) into CI pipelines and wrote automation that **queried the SonarQube "
                "REST API to flag vulnerabilities and surface them into Azure DevOps**; ran "
                "**OWASP ZAP** dynamic scans (DAST) in pipelines.",
                "Engineered **Azure DevOps CI/CD pipelines** that provisioned agents to run "
                "parallel automated **Selenium** runs against deployed applications and fed "
                "structured results back into work items. Performed **code review and "
                "standards enforcement** for the team; drove a tooling consolidation that "
                "cut licensing costs.",
            ],
        },
        {
            "org": "Department of Immigration, Refugees, and Citizenship, Canada", "loc": "Ottawa, ON",
            "dates": "August 2017 – August 2019",
            "title": "Team Lead / Technical Lead",
            "bullets": [
                "Led full **Agile / Scrum** delivery — sprint planning, review, "
                "retrospective, daily stand-up, backlog refinement, iteration demos, and "
                "design walkthroughs; introduced poker-planning estimation and capacity "
                "forecasting. **Scoped engineering requirements and timelines** with BAs, "
                "product owners, and stakeholders, and **communicated blockers and delays "
                "before they required escalation**.",
                "Implemented and deployed **custom web extensions in JavaScript / React / "
                "TypeScript / Node.js** with responsive, accessibility-aligned UIs — "
                "hands-on while guiding the team. **Mentored developers in SQL Server query "
                "optimization** — query tuning, indexing strategy, and execution-plan "
                "analysis.",
                "Administered departmental **Azure DevOps Server / TFS** instances and "
                "heavily customized process templates; **managed user/group security** and "
                "source-control access across multiple project collections.",
            ],
        },
        {
            "org": "Department of Justice, Canada", "loc": "Ottawa, ON",
            "dates": "December 2015 – August 2017",
            "title": "Development Lead — iCase / Microsoft Dynamics CRM Modernization",
            "bullets": [
                "Dev lead on the live **Legal Case Management System (iCase)** — a large "
                "**n-tier ASP.NET / C#** enterprise web application used by **5,000+ lawyers "
                "and contracted agents** — while concurrently building its **Microsoft "
                "Dynamics CRM** successor.",
                "Engineered **Dynamics CRM plug-ins, custom actions, and workflows in C#**; "
                "produced **entity-relationship diagrams** and **detailed effort-estimation "
                "breakdowns**. **Established code-review processes gated on work items** — "
                "enforcing maintainability, security, and performance standards — and "
                "mentored junior developers.",
            ],
        },
        {
            "org": "Department of Citizenship and Immigration, Canada", "loc": "Ottawa, ON",
            "dates": "April 2014 – December 2015",
            "title": "Senior Software Engineer · Release Engineering Lead",
            "bullets": [
                "Took over a release-management environment from a contractor team; "
                "**decommissioned over-engineered legacy desktop tooling** and replaced it "
                "with lightweight **PowerShell calling REST APIs**, bringing everything "
                "under source control.",
                "Implemented and deployed **web extensions in JavaScript / React / "
                "TypeScript / Node.js**; maintained a fork of Microsoft's "
                "`vsts-team-calendar` extension and **contributed back upstream**. "
                "Installed, configured, and upgraded the Azure DevOps Server / TFS platform "
                "across dev / UAT / production, including **Kerberos / SPN security "
                "configuration**.",
            ],
        },
        {
            "org": "Department of Justice, Canada", "loc": "Ottawa, ON",
            "dates": "October 2008 – April 2014",
            "title": "Full-Stack Developer — Legal Case Management System (iCase)",
            "intro": (
                "Core developer on a **distributed, multi-tier ASP.NET / C# enterprise web "
                "platform** used by **5,000+ government lawyers and contracted agent firms "
                "across Canada** — **B2B and B2C** flows (internal lawyers, external agent "
                "firms tracking their own billing) — deployed across **load-balanced web "
                "servers and regionally distributed document servers** with role- and "
                "object-based security and **24/7 high availability**."
            ),
            "bullets": [
                "Led design and largely solo implementation of the **“My iCase” "
                "personalization portal** — the customizable widget-based entry point to "
                "iCase — built on **ASP.NET Web Parts with a custom SQL personalization "
                "provider**, **Knockout.js MVVM** (a direct ancestor of modern React "
                "component patterns), and async AJAX service calls.",
                "**Performance and reliability engineering:** diagnosed a homepage report "
                "taking ~10 s uncached and replaced live joins with a nightly-populated "
                "flat table (**~50× faster**); built a **self-initiated "
                "availability-monitoring suite** across the distributed servers; resolved a "
                "**COM Interop memory leak** on the document tier.",
                "Architected a **Java-based automation framework** that **parsed "
                "English-language scenario documents into executable scripts with "
                "round-trip code generation** — replacing a two-week, ~20–25-person manual "
                "pre-release validation cycle with automated execution reviewed by one "
                "person (**~98% reduction in effort, ~$160K saved per release cycle**).",
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
        ("Languages:", "**TypeScript, JavaScript, C#, SQL**, HTML5 / CSS3, Python, "
         "PowerShell"),
        ("Front-End:", "**React 19, TypeScript, HTML5 / CSS3**, Vite, Angular, Vue 3, "
         "Blazor, Knockout.js MVVM · **reusable, scalable component design** · responsive, "
         "cross-browser, **WCAG accessibility**"),
        ("Back-End / APIs:", "**Node.js, NestJS, Express** · **.NET Core / C#, ASP.NET, "
         "Entity Framework** · **RESTful API design — endpoints, schemas, and generated "
         "documentation (Swagger / OpenAPI, Postman)** · GraphQL, WebSocket · API gateway "
         "(Azure API Management)"),
        ("Architecture:", "**cloud-native microservices**, event-driven / serverless "
         "workflows, n-tier SaaS platforms, load balancing, entity-relationship modelling, "
         "design patterns"),
        ("Security:", "**OAuth 2.0 / OpenID Connect / PKCE, JWT**, Entra ID / Azure AD IAM, "
         "**Managed Identities**, Key Vault secret hygiene, TLS / certificate management, "
         "**CORS** policy, **SonarQube (SAST), OWASP ZAP (DAST)**, **CWE / CVSS-graded "
         "security audits**, NIST-based (ITSG-33 / PBMM) controls, secret-scanning "
         "guardrails"),
        ("AI / LLM Tooling:", "**Model Context Protocol (MCP) tool-server design** with "
         "in-code agent guardrails · **Claude Code** (daily development driver) · "
         "professional **LLM code evaluation** (prompt fixtures, grading rubrics)"),
        ("Databases:", "**PostgreSQL, MS SQL Server, Azure SQL** — schema design, stored "
         "procedures, indexing, execution-plan tuning · MongoDB (working familiarity)"),
        ("Cloud / DevOps:", "**Microsoft Azure** (App Service, Functions, SQL, API "
         "Management, Key Vault, Managed Identities, Entra) · **AWS** (self-hosted pipeline "
         "agent + foundational training) · GCP (production hosting) · **Docker, "
         "Kubernetes** · **Git, GitHub Actions, Azure DevOps Pipelines (YAML)** — feature "
         "branches, PR-gated CI"),
        ("Testing:", "**Jest, Vitest, React Testing Library**, xUnit / NUnit, Playwright, "
         "Selenium"),
        ("Process / SDLC:", "**Agile / Scrum (PSM I)** — sprint planning, backlog "
         "refinement, demos · **peer code review**, mentoring, technical documentation · "
         "Azure DevOps, JIRA, Slack-style distributed collaboration"),
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
    key = sys.argv[1] if len(sys.argv) > 1 else "russelltobin-net"
    if key not in CONTENT:
        sys.exit(f"unknown cv-key {key!r}; choose from {', '.join(CONTENT)}")
    build(key)
