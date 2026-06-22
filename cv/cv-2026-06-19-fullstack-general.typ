#import "template.typ": cv

#show: cv.with(
  location: "Toronto, Ontario",
  tagline: "Senior Full-Stack Developer · TypeScript / React · Node.js / NestJS · .NET / C\\# · PostgreSQL & SQL · Cloud, Docker & CI/CD · 15+ Years Shipping Web Applications",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    Senior full-stack developer with *15+ years across the full SDLC*, shipping *web-based B2B and B2C applications* from front-end UI through service back ends and databases. Front end in *React + TypeScript* (also Next.js, Blazor, Knockout.js MVVM); back end in *.NET / C\# and Node.js / NestJS / Express*, designing *REST APIs*, data-access layers, and *n-tier and cloud-native microservices* architectures. I've shipped products *solo* (a Dockerized multiplayer game on Node + PostgreSQL; a React training app on a public REST API) and delivered *at enterprise scale* (an n-tier ASP.NET platform serving *5,000+ users* with 24/7 high availability across load-balanced, geographically distributed servers). Strong *SQL* engineering across *SQL Server, Azure SQL, and PostgreSQL* — schema design, stored procedures, and execution-plan tuning — with working *MongoDB* exposure. Comfortable across *cloud and DevOps*: *Microsoft Azure* (Functions, App Service, API Management, Key Vault, Entra), *Docker / Kubernetes*, and *CI/CD* (Azure DevOps, GitHub Actions). *Recurring pattern:* self-initiated automation that pays back substantial labour cost, and *modernization by deletion* — replacing over-engineered systems with simpler, well-tested ones. *Professional Scrum Master I.* Active open-source contributor — *60+ public PRs* to outside repos including Microsoft's `vsts-team-calendar`, `tfs-cli`, the TypeScript Website, and the *Microsoft Authentication Library .NET* docs.
  ],
  experience: (
    (
      org: "Abrams Software",
      location: "Toronto, Ontario (Remote)",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [*TWNR* — *architected and shipped a public-facing B2C multiplayer game as a full-stack web application, solo.* Dockerized *TypeScript* pnpm monorepo: *Node.js (Express) + WebSocket* server backed by *PostgreSQL*, terminal-style xterm.js client served by Vite, per-player sign-up with *JWT auth*, and a *JSON-Schema-generated REST API contract* that doubles as live documentation. Concurrency-correct game state via PostgreSQL transactions (`SELECT … FOR UPDATE`). Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [*Chess Attack Visualization* — *React 19 + TypeScript* training app (Vite, React Testing Library + Vitest / Jest) consuming the *Lichess.org REST API*, with a *NestJS* (TypeScript decorator framework analogous to *Spring Boot*) auth proxy implementing the *OAuth2 PKCE* flow. Diagnosed a missing feature in `chess.js`, opened #link("https://github.com/jhlywa/chess.js/pull/572")[upstream PR \#572], and published a fork on npm. *Portfolio site* runs as *Astro on GitHub Pages with GitHub Actions* CI/CD.],
        [*Next.js + React 19 + TypeScript* open-source contributions to #link("https://github.com/physicshub/physicshub.github.io")[`physicshub.github.io`], a public physics-simulation site — led a *JavaScript → TypeScript migration* of the core engine, introduced *branded nominal types* with TDD coverage, and fixed latent energy-conservation and boundary-collision bugs.],
        [*LLM code evaluation* for #link("https://www.dataannotation.tech")[DataAnnotation.tech] and Stellar.ai — prompt fixtures and grading rubrics across *TypeScript, React, Node / NestJS, .NET / C\#, Python, Go, Rust, SQL, and MongoDB*, including *security audits with CWE / CVSS-graded inventories*. *60+ public PRs* to outside repos including the *Microsoft Authentication Library .NET* docs and `canada-ca/platform-security`.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Software Engineer — Cloud-Native Microservices (BDM Project)",
      bullets: (
        [Enhanced and maintained a *cloud-native microservices* enterprise onboarding application — *.NET / C\# back end, Blazor front end, Azure SQL, Azure Functions, GraphQL*. *Designed and consumed REST APIs between services*; integrated enterprise IAM via *Azure AD / Entra (OAuth 2.0, OpenID Connect)*; published and governed APIs through *Azure API Management* with authentication, throttling, and transformation policies.],
        [Designed and shipped *custom web extensions in React, TypeScript, and Node.js* — a build/deploy analytics widget rendering success-rate charts via the ADO Builds REST API, and a people-by-project reporter that replaced an unusably slow query with an in-memory hashmap. Responsive UI, custom styling, *WCAG / AODA*-aligned interactions.],
        [Migrated the application's downstream identity from rotating secrets (Key Vault + ADO PATs) to *Azure Managed Identities* — eliminating the secret-rotation incident class. Operated *CI/CD pipelines* in Azure DevOps for build, test, *Docker* containerization, *Kubernetes* deployment, and *Azure Data Factory* (ETL) orchestration; daily Git workflow with feature branches and PR-gated CI.],
        [Ran weekly *demos and design walkthroughs*, mentoring junior developers on microservice integration, app registration, and custom extensions.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead — Internal Web Application & CI/CD Automation",
      bullets: (
        [Co-architected and developed an *internal C\# / .NET web application* with a web UI for authoring structured scenarios; designed the *SQL Server* schema and *co-designed the REST API* for bidirectional integration with *Azure DevOps pipelines* (versioned script-fetch and structured results-push endpoints). Integrated with the departmental headless CMS.],
        [Engineered *Azure DevOps CI/CD pipelines* that provisioned Windows agents to run parallel automated *Selenium* runs against deployed applications and fed structured results back into work items. Drove a tooling consolidation (*LoadRunner → JMeter*) that cut licensing costs while preserving capability. Code review and standards enforcement for the team.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "August 2017 – August 2019",
      title: "Team Lead / Technical Lead",
      bullets: (
        [Led full *Agile / Scrum* delivery — sprint planning, review, retrospective, daily stand-up, backlog refinement, iteration demos, and design walkthroughs; introduced poker-planning estimation and capacity forecasting. *Translated business requirements into working software* through close BA partnership.],
        [Implemented and deployed *custom web extensions in React / TypeScript / Node.js* with responsive, accessibility-aligned UIs — hands-on while guiding the team. *Mentored developers in SQL Server query optimization* — query tuning, indexing strategy, partitioned tables, and execution-plan analysis against large databases and warehouses.],
        [Administered departmental *Azure DevOps Server / TFS* instances — installation, configuration, multi-environment upgrades, Kerberos re-configuration — and maintained heavily customized process templates; managed user/group security across multiple project collections.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "December 2015 – August 2017",
      title: "Development Lead — iCase / Microsoft Dynamics CRM Modernization",
      bullets: (
        [Dev lead on the live *Legal Case Management System (iCase)* — a large *n-tier ASP.NET / C\# / ADO.NET* enterprise web application used by *5,000+ lawyers and contracted agents* — while concurrently building its *Microsoft Dynamics CRM* successor. Modified schema and *front-end UI to surface migration status in real time*, and adjusted the integration stored procedures consumed by the department's SAP-based financial system.],
        [Engineered *Dynamics CRM plug-ins, custom actions, and workflows in C\#* (rewriting legacy stored procedures as C\# / LINQ); used *SSIS* for ETL between systems; produced *entity-relationship diagrams* and *detailed effort-estimation breakdowns* (FDD / TDD), and applied design patterns (Repository, Strategy, Mediator). *Established code-review processes gated on work items* and mentored junior developers.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer · Release Engineering Lead",
      bullets: (
        [Hired alongside one other engineer to take over a release-management environment from a contractor team. *Decommissioned over-engineered legacy C\# desktop apps* and replaced them with lightweight *PowerShell calling REST APIs* — most contractor tooling was simply deleted and *everything ended up in source control*. *Modernization by deletion.*],
        [Implemented and deployed *web extensions in React / TypeScript / Node.js*; maintained a fork of Microsoft's `vsts-team-calendar` extension with configurable colours and Outlook integration, contributed back upstream. *Installed, configured, customized, and upgraded* the Azure DevOps Server / TFS platform across dev / UAT / production — multi-step upgrades, *Kerberos / SPN configuration*, and database-tier migration.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2008 – April 2014",
      title: "Full-Stack Developer (2009–2014) · Test-Automation Framework Developer (2008–2009)",
      intro: [Core developer on the department's flagship *Legal Case Management System (iCase)* — a *distributed, multi-tier ASP.NET / C\#* enterprise web platform used by *5,000+ government lawyers and contracted agent firms across Canada*, deployed across *load-balanced web servers and regionally distributed document servers* with role- and object-based security, integration to records-management, financial, and email systems, and *24/7 high availability*. *B2B and B2C* flows: internal lawyers, external agent firms tracking their own billing/timekeeping in iCase, and downstream financial reconciliation.],
      bullets: (
        [Led design and largely solo implementation of the *"My iCase" personalization portal* — the new, customizable widget-based entry point to iCase. Ran JAD sessions, produced prototypes, authored *FDD / TDD documentation*, then built it on *ASP.NET Web Parts with a custom SQL personalization provider*, *Knockout.js MVVM* (a direct ancestor of modern React patterns), and async AJAX web-service calls. *Evaluated Entity Framework* against the existing Repository-pattern-over-stored-procedures and recommended against adoption on the merits — ORM judgment as much as ORM use.],
        [*Performance and reliability engineering:* diagnosed a homepage report taking \~10 s uncached — profiled with SQL Profiler, Report Execution logs, and execution plans, then replaced live joins with a nightly-populated flat table (*\~50× faster uncached, 3–4× cached*). Built a *self-initiated availability-monitoring suite* across the distributed servers, and diagnosed and resolved a *COM Interop memory leak* on the document tier. Co-led the *SQL Server 2005 → 2012* and *.NET Framework 2.0 → 4.0* upgrades.],
        [Architected a *Java-based automation framework (IBM Rational Functional Tester)* that *parsed English-language scenario documents into executable scripts with round-trip code generation*, plus a companion manager in *C\# / SQL Server* — replacing a labour-intensive *two-week, ~20–25-person manual pre-release validation cycle* with automated execution reviewed by one person in five days (*\~98% reduction in effort, \~\$160K saved per release cycle*).],
      ),
    ),
  ),
  education: (
    (degree: "Bachelor of Computer Science (Honours)", school: "Carleton University", dates: "September 1999 – May 2003"),
  ),
  certifications: (
    [#link("https://www.scrum.org/user/2230283")[Professional Scrum Master I] (Scrum.org)],
    [ITIL v3 Foundation (Loyalist Certification Services)],
    [DOJ Team Merit Award 2012; Team Merit Award 2011; Team Spirit Award 2009],
  ),
)

#v(0.3em)
#text(size: 13pt, weight: "bold", fill: rgb("#1f4e79"), "Technical Skills")
#line(length: 100%, stroke: 0.4pt + rgb("#1f4e79"))
#v(-0.1em)

#set par(leading: 0.6em, spacing: 0.55em)

*Languages:* *TypeScript, JavaScript, C\#, SQL (T-SQL)*, PowerShell, Python, HTML / CSS, XML / XSLT, Go (light)

*Front-End / UI:* *React 19, Next.js, TypeScript*, Blazor, Knockout.js MVVM, Vite, JSON, AJAX, jQuery · *responsive design, WCAG / AODA accessibility*

*Back-End / APIs:* *.NET 6 / 8 / .NET Core, ASP.NET / ASP.NET MVC, ADO.NET, Entity Framework, LINQ* · *Node.js, Express, NestJS* · *REST API design*, GraphQL, WebSocket · Spring Boot (familiarity)

*Architecture:* n-tier client/server, *cloud-native microservices*, event-driven workflows, API gateway / management (Azure APIM), design patterns, entity-relationship modelling

*Databases:* *MS SQL Server (2005 → 2019), Azure SQL, PostgreSQL* — stored procedures, indexing, partitioning, execution-plan tuning · *MongoDB* (working familiarity)

*Cloud / DevOps:* *Microsoft Azure* (App Service, Functions, SQL, API Management, Key Vault, Storage, Managed Identities, Entra / AAD, Data Factory) · *AWS / GCP* (working exposure) · *Docker, Kubernetes*

*Source Control / CI/CD:* *Git, GitHub, GitHub Actions, Azure DevOps Pipelines (YAML)* · feature branches, PR-gated CI

*Testing:* *Jest, Vitest, React Testing Library*, xUnit / NUnit, Playwright, Selenium

*Also experienced with (Microsoft legacy):* Visual Studio 2005 → 2022, .NET Framework 2.0 → 4.8, IIS, WCF / WPF, SSRS / SSIS, Crystal Reports, Azure DevOps Server (TFS) administration & upgrades

*Process / SDLC:* *Agile / Scrum (PSM I)*, Kanban, FDD / TDD with effort estimation, code review, mentoring · Waterfall (regulated environments) · ITIL v3 Foundation
