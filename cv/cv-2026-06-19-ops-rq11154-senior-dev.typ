#import "template.typ": cv

#show: cv.with(
  location: "Toronto, Ontario",
  tagline: "Senior Software Developer · .NET Core / C\\# · Node.js / NestJS · Cloud-Native Microservices & REST APIs · Docker / Kubernetes · Azure & CI/CD · 15+ Years High-Availability Distributed Government Systems",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    *Senior software developer with 15+ years building, scaling, and operating high-availability, distributed enterprise systems* across the Government of Canada — from a *load-balanced, geographically distributed* legal case-management platform serving *5,000+ concurrent users nationally* to a *cloud-native microservices* application on Microsoft Azure. Deep *backend* expertise in *.NET Core / C\#* and *Node.js / NestJS* (a TypeScript decorator framework analogous to *Spring Boot* / ASP.NET Core), designing and consuming *REST APIs between services* and publishing/governing them through an *API gateway (Azure API Management)* with authentication, throttling, and transformation. Hands-on with *Docker and Kubernetes* containerized deployment, *CI/CD pipelines* (Azure DevOps, GitHub Actions), *serverless / event-driven workflows* (Azure Functions, queue- and storage-triggered handoffs), and *load balancing* across cloud and on-prem tiers. Strong relational-database engineering (*MS SQL Server, Azure SQL, PostgreSQL*) with working *NoSQL (MongoDB)* exposure, and a track record of *optimizing high-traffic backends* (e.g. a ~50× report speedup via execution-plan analysis). *Security-minded by default:* OAuth 2.0 / OpenID Connect / Entra IAM, migration to *Managed Identities*, *Key Vault* secret hygiene, TLS / certificate management, and *ITSG-33 / PBMM* controls. *Recurring pattern*: self-initiated automation frameworks that pay back substantial labour cost. *Professional Scrum Master I*; *AODA / WCAG*-aware. Active open-source contributor — *60+ public PRs* including Microsoft's `vsts-team-calendar`, `tfs-cli`, and the *Microsoft Authentication Library .NET* docs.
  ],
  experience: (
    (
      org: "Abrams Software",
      location: "Kingston / Toronto, Ontario (Remote)",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [*TWNR* — *architected and shipped a public-facing multiplayer game as a full-stack web application, solo.* Dockerized *TypeScript* monorepo: *Node.js (Express) + WebSocket* backend backed by *PostgreSQL*, per-player *JWT auth*, and a *JSON-Schema-generated REST API contract* that doubles as live documentation. Concurrency-correct state via PostgreSQL transactions (`SELECT … FOR UPDATE`). Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [*Chess Attack Visualization* — *React 19 + TypeScript* app consuming the *Lichess.org REST API*, with a *NestJS* (Spring Boot–style decorator framework) auth proxy implementing the *OAuth2 PKCE* flow. Diagnosed a missing feature in `chess.js`, opened #link("https://github.com/jhlywa/chess.js/pull/572")[upstream PR \#572], and published a fork on npm. *Portfolio site* operated as *Astro on GitHub Pages with GitHub Actions* CI/CD.],
        [*LLM code evaluation* for #link("https://www.dataannotation.tech")[DataAnnotation.tech] and Stellar.ai — prompt fixtures and grading rubrics across *.NET / C\#, TypeScript, React, Node / NestJS, Python, Go, Rust, SQL, and MongoDB*, including *security audits with CWE / CVSS-graded inventories*. *60+ public PRs* to outside repos including the *Microsoft Authentication Library .NET* docs and `canada-ca/platform-security`.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Software Developer — Cloud-Native Microservices (Benefits Delivery Modernization)",
      bullets: (
        [Enhanced and maintained a *cloud-native microservices* enterprise onboarding application — *.NET Core / C\# back end, Blazor front end, Azure SQL, Azure Functions, GraphQL* — serving procurement, HR, and IT-ops personnel. *Designed and consumed REST APIs between services* and *published and governed them through Azure API Management (API gateway)* with authentication, throttling, and transformation policies; integrated enterprise IAM via *Azure AD / Entra (OAuth 2.0, OpenID Connect)*.],
        [*Serverless, event-driven workflows:* Blazor submissions kicked off *Azure Functions* triggered through *queue- and storage-based handoffs*, which created/updated Azure DevOps work items, ran pipelines, and provisioned users in on-prem Active Directory (via AAD Connect) by personnel profile — *bulk submissions fanning out asynchronously across the microservices*. Built a scheduled weekly work-item digest emailer driven by pipelines.],
        [*Containerized delivery and CI/CD:* operated end-to-end *Azure DevOps pipelines* for build, *Docker* containerization, *Kubernetes* deployment, and *Azure Data Factory* (ETL) orchestration. For the *AWS-hosted EI application*, deployed a *self-hosted pipeline agent into AWS* to run CI/CD there (completed AWS foundational training). Administered Azure DevOps for all BDM teams; advised on branching strategies and PR workflows; connected *Power BI to ADO Analytics*; ensured *WCAG / AODA* accessibility compliance.],
        [*Cloud security best practices:* migrated the application's downstream identity from rotating secrets (Key Vault + ADO PATs on 90-day rotation) to *Azure Managed Identities* — eliminating the secret-rotation incident class and properly attributing automated activity. Implemented *ITSG-33 (NIST-based) controls* — TLS / certificate management and *Key Vault* secret hygiene — for SA\&A submissions against a *PBMM* profile.],
        [Designed and shipped *custom web extensions in React, TypeScript, and Node.js* — a build/deploy analytics widget rendering success-rate charts via the ADO Builds REST API, and a people-by-project reporter that replaced an unusably slow query with an in-memory hashmap. Ran weekly *demos and design walkthroughs*, mentoring junior developers.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Senior Software Developer — Internal Web Application & CI/CD Automation",
      bullets: (
        [Co-architected and developed an *internal C\# / .NET web application* — web UI for authoring structured automation scenarios, *SQL Server* schema design, and a *co-designed REST API* providing bidirectional integration with *Azure DevOps pipelines* (versioned script-fetch endpoints and structured results-push endpoints).],
        [*Developed automated execution frameworks driven through CI/CD pipelines:* engineered Azure DevOps pipelines that provisioned Windows build agents to run *parallelized automated runs* against deployed applications and fed structured results back into work items. Performed *code review and standards enforcement* for the team.],
        [Drove a tooling consolidation that *cut software licensing costs* while preserving capability, and contributed to performance-optimization analysis of high-traffic deployed applications.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "August 2017 – August 2019",
      title: "Team Lead / Technical Lead — Platform & Tooling",
      bullets: (
        [*Technical leadership of a cross-functional team* — led *Agile / Scrum* sprint planning, review, retrospective, daily stand-up, and backlog refinement; introduced poker-planning estimation and capacity forecasting; set engineering standards and drove delivery cadence.],
        [Implemented and deployed *custom web extensions in React / TypeScript / Node.js* with responsive, accessibility-aligned UIs — leading the work hands-on while guiding the team.],
        [*Mentored developers in SQL Server query optimization* — query tuning, indexing strategy, partitioned tables, and execution-plan analysis against large databases and warehouses; coached on C\# / .NET and SSRS.],
        [Administered departmental *Azure DevOps Server / TFS* instances and heavily customized process templates; managed user/group security and source-control access across multiple project collections.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "December 2015 – August 2017",
      title: "Acting Lead Developer — iCase / Microsoft Dynamics CRM Modernization",
      bullets: (
        [*Lead developer* on the live *Legal Case Management System (iCase)* — a large *n-tier ASP.NET / C\# / ADO.NET* enterprise web application used by *5,000+ lawyers* — while concurrently building its *Microsoft Dynamics CRM* successor. Modified schema and *front-end UI to surface data-migration status in real time*, and adjusted integration stored procedures consumed by the department's SAP-based financial system.],
        [Engineered *Dynamics CRM plug-ins, custom actions, and workflows in C\#* (rewriting legacy stored procedures as C\# / LINQ); used *SSIS* for ETL between iCase and Dynamics; produced *entity-relationship diagrams* and *multi-month effort-estimation breakdowns* (FDD / TDD) and applied design patterns (Repository, Strategy, Mediator).],
        [*Established code-review processes gated on work items* — enforcing maintainability, security, and performance standards — and *mentored junior developers*.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer · Release Engineering Lead",
      bullets: (
        [Hired alongside one other engineer to take over a release-management environment from a contractor team. *Decommissioned over-engineered legacy C\# desktop apps* and replaced them with lightweight *PowerShell calling REST APIs* — most contractor tooling was simply deleted and *everything ended up in source control*. *Bias for action and ownership.*],
        [Implemented and deployed *web extensions in React / TypeScript / Node.js*; maintained a fork of Microsoft's `vsts-team-calendar` extension and contributed back upstream. Used *XSLT-via-PowerShell* to transform work-item-template XML for *automated deployment of custom process templates* — early build/deploy pipeline automation.],
        [*Installed, configured, customized, and upgraded* the Azure DevOps Server / TFS platform across dev / UAT / production — complex multi-step upgrades, *Kerberos / SPN configuration* on application tiers (coordinated with AD and DC admins without direct access), and database-tier migration.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2008 – April 2014",
      title: "Full-Stack Developer — Legal Case Management System (iCase)",
      intro: [Core developer on the department's flagship *Legal Case Management System (iCase)* — a *distributed, multi-tier ASP.NET / C\# enterprise web platform* used by *5,000+ government lawyers and contracted agent firms across Canada*. *High-availability and load-balanced:* deployed across *5 load-balanced web servers* and *11 regionally distributed document servers* nationwide, with role- and object-based security and integration to records-management, financial, and email systems, running *24/7*.],
      bullets: (
        [Led design and largely solo implementation of the *"My iCase" personalization portal* — the new, *customizable widget-based entry point* to iCase. Ran JAD sessions, produced prototypes, authored BDD / TDD documentation, then built it on *ASP.NET Web Parts with a custom SQL personalization provider*, *Knockout.js MVVM* component binding (a direct ancestor of the *React* patterns I use today), and async AJAX web-service calls.],
        [*Optimized a high-traffic backend:* diagnosed a homepage report taking ~10 s uncached — profiled with SQL Profiler, Report Execution logs, and execution plans, then replaced live joins with a nightly-populated flat table for a *~50× speedup uncached (3–4× cached)*. Built a *self-initiated availability-monitoring suite* across the distributed web and document servers, and diagnosed and resolved a *COM Interop memory leak* affecting the document tier.],
        [*Early automation-framework development:* architected a *Java-based framework (IBM Rational Functional Tester)* that *parsed English-language scenario documents into executable scripts with round-trip code generation*, plus a companion manager in *C\# / SQL Server*. Replaced a labour-intensive *two-week, ~20–25-person manual pre-release validation cycle* with automated execution reviewed by one person in five days — *~98% reduction in effort, ~\$160K saved per release cycle*, eliminating the standing code freeze.],
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

*Backend Frameworks:* *.NET Core / .NET 6 / 8, C\#, ASP.NET Core, ADO.NET, Entity Framework, LINQ* · *Node.js, Express, NestJS* · Spring Boot (familiarity)

*Microservices & APIs:* *cloud-native microservices architecture*, *REST API design between services*, GraphQL, WebSocket · *API gateway / management (Azure API Management)* — auth, throttling, transformation · event-driven & async messaging (queue- / storage-triggered) · load balancing across cloud & on-prem tiers

*Containers & CI/CD:* *Docker, Kubernetes* · *Azure DevOps Pipelines (YAML), GitHub Actions*, Jenkins (exposure) — build, automated test, containerized deploy · Azure Data Factory (ETL)

*Cloud:* *Microsoft Azure* — *Azure Functions (serverless)*, App Service, Azure SQL, *API Management, Key Vault, Managed Identities, Entra / AAD*, Storage, Data Factory · *AWS* — self-hosted pipeline-agent deployment for the BDM EI application + foundational training · *GCP* — TWNR production hosting

*Databases:* *SQL — MS SQL Server 2005 → 2019* (T-SQL, stored procedures, indexing, partitioning, execution-plan tuning), *Azure SQL, PostgreSQL* · *NoSQL — MongoDB* (working familiarity)

*Security:* *OAuth 2.0 / OpenID Connect / PKCE, Entra / AAD IAM*, *Managed Identities*, TLS / certificate management, *Key Vault* secret hygiene, *ITSG-33 / PBMM controls*, CWE / CVSS-graded security audits

*Version Control:* *Git, GitHub*, Azure DevOps Repos / TFVC · feature branches, PR-gated CI

*Languages & Front-End:* *TypeScript, JavaScript, C\#, SQL (T-SQL)*, PowerShell, Python, XML / XSLT, Go (light) · *React 19, Blazor*, Knockout.js, HTML / CSS, *responsive design, WCAG / AODA accessibility* · unit testing (xUnit / NUnit, Jest / Vitest)

*Process / SDLC:* *Agile / Scrum (PSM I)* — sprint planning, review, daily stand-up, backlog refinement · code review, mentoring, technical documentation, design walkthroughs · ITIL v3 Foundation
