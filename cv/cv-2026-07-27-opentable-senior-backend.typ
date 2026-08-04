#import "template.typ": cv

#show: cv.with(
  location: "Toronto, Ontario",
  tagline: "Senior Software Engineer — C# / .NET · Microservices · High-Scale Backend",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [Senior full-stack .NET developer with 15+ years shipping enterprise web applications, now building AI-integrated systems hands-on: a Model Context Protocol (MCP) tool-server with in-code agent guardrails, daily LLM-assisted development with Claude Code, and professional evaluation of LLM-generated code via the Anthropic API.],
  experience: (
    (
      org: "Abrams Software",
      location: "Toronto, Ontario",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [Built CVForge, a blurb-library and CV-builder product — a Vue.js 3 single-page front end over an ASP.NET Core (C\#) REST Web API with relational SQL persistence.],
        [Designed the REST API endpoints consumed by the SPA client and by an MCP tool-server integration.],
        [Shipped other production web applications solo, including a multiplayer game (Node.js, PostgreSQL, with a REST API contract generated from JSON Schema) and a React 19 + TypeScript chess visualization consuming the Lichess REST API.],
      ),
    ),
    (
      org: "Abrams Software",
      location: "Toronto, Ontario",
      dates: "August 2025 – Present",
      title: "LLM / AI Code & Security Evaluation",
      bullets: (
        [Authored and QC-reviewed cybersecurity capability-evaluation tasks that measure whether AI coding agents can identify and exploit real software vulnerabilities. For each task, reproduced a published advisory (GitHub Security Advisory / Go vuln DB) as paired vulnerable and patched Docker Compose environments, wrote a reference exploit proof-of-concept, and built an automated differential grader that verifies exploitation through observable side-effects (out-of-band callbacks, canary tokens) — passing on the vulnerable build, failing on the patched one, and hardened against grader-gaming.],
        [Covered deserialization RCE, SSRF, path traversal, authentication bypass, cryptographic, logic, and race-condition vulnerability classes across Java, Go, Python, TypeScript/Node, C++, and Ruby target codebases. Calibrated task difficulty by running a reference model one-shot against a target pass rate using the Anthropic API, and ran dual-LLM-judge QC review scoring vulnerability match, prompt leakage, and grader soundness.],
        [Broader LLM code evaluation for DataAnnotation.tech and Stellar.ai — prompt fixtures and grading rubrics across .NET/C\#, TypeScript, React, Node/NestJS, Python, Go, Rust, SQL, and MongoDB, including CWE/CVSS-graded security audits.],
      ),
    ),
    (
      org: "Abrams Software",
      location: "Toronto, Ontario",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [*TWNR* — *architected and shipped a public-facing B2C multiplayer game, solo.* Dockerized *TypeScript* monorepo: *Node.js (Express) + WebSocket* server backed by *PostgreSQL*, per-player *JWT auth*, and a *JSON-Schema-generated REST API contract* that doubles as live documentation. Concurrency-correct state via database transactions. Live at twnr.paulabrams.ca.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Software Developer — Cloud-Native Microservices",
      bullets: (
        [Enhanced and maintained a cloud-native microservices onboarding application (.NET Core / C\#, Blazor, Azure SQL, Azure Functions).],
        [Designed and consumed REST APIs between services, documented with Swagger and governed through Azure API Management.],
        [Migrated downstream identity to Azure Managed Identities, eliminating the secret-rotation incident class.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Senior Software Developer — Internal Web Application & CI/CD Automation",
      bullets: (
        [Co-architected and developed an internal C\# / .NET web application — web UI for authoring structured automation scenarios, SQL Server relational schema design, and a co-designed REST API providing bidirectional integration with Azure DevOps pipelines.],
        [Engineered Azure DevOps pipelines that provisioned Windows agents to run parallelized automated runs against deployed applications; enforced coding standards through code review.],
        [Drove a tooling consolidation that cut software licensing costs while preserving capability.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "August 2017 – August 2019",
      title: "Team Lead / Technical Lead — Platform & Tooling",
      bullets: (
        [Technical leadership of a cross-functional team — led Agile / Scrum sprint planning, review, retrospective, daily stand-up, and backlog refinement; introduced poker-planning estimation and capacity forecasting; set engineering standards.],
        [Mentored developers in SQL Server query optimization — query tuning, indexing strategy, partitioned tables, and execution-plan analysis — and coached on C\# / .NET.],
        [Administered departmental Azure DevOps Server / TFS instances, maintained heavily customized process templates, and managed user/group security across multiple project collections.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "December 2015 – August 2017",
      title: "Acting Lead Developer — iCase / Microsoft Dynamics CRM Modernization",
      bullets: (
        [Lead developer on the live Legal Case Management System (iCase) — a large n-tier ASP.NET / C\# / ADO.NET enterprise web application used by 5,000+ government lawyers — while concurrently building its Microsoft Dynamics CRM successor.],
        [Engineered Dynamics CRM plug-ins, custom actions, and workflows in C\# (rewriting legacy stored procedures as C\# / LINQ); used SSIS for ETL; produced entity-relationship diagrams and multi-month effort-estimation breakdowns (FDD / TDD).],
        [Established code-review processes gated on work items and mentored junior developers.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2008 – April 2014",
      title: "Full-Stack Developer — Legal Case Management System (iCase)",
      bullets: (
        [Core developer on a distributed, multi-tier ASP.NET / C\# enterprise platform used by 5,000+ government lawyers nationally.],
        [Optimized a high-traffic backend report for a \~50x speedup via execution-plan analysis.],
        [Migrated core business modules from VB.NET to C\#.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2008 – April 2014",
      title: "Software Development Engineer in Test / Full-Stack Developer — iCase",
      bullets: (
        [Architected a *Java-based automation framework* that *parsed English-language scenario documents into executable scripts with round-trip code generation* — replacing a two-week, \~20–25-person manual pre-release validation cycle with automated execution reviewed by one person (*\~98% reduction in effort, \~\$160K saved per release cycle*).],
      ),
    ),
  ),
  education: (
    (degree: "Bachelor of Computer Science (Honours)", school: "Carleton University", dates: "September 1999 – May 2003"),
  ),
)

#v(0.3em)
#text(size: 13pt, weight: "bold", fill: rgb("#1f4e79"), "Technical Skills")
#line(length: 100%, stroke: 0.4pt + rgb("#1f4e79"))
#v(0.2em)
*Back-End (.NET):* C\#, ASP.NET (Web Forms → Core), ASP.NET Web API / REST, .NET Framework 2.0 – 4.8 and .NET 5 – 8, VB.NET (legacy migration to C\#), Entity Framework, LINQ, ADO.NET, XML / XSLT, WCF / WPF, IIS, Visual Studio 2005 – 2022.

*Databases:* MS SQL Server 2005 → 2019, Azure SQL, PostgreSQL — relational modelling, T-SQL stored procedures, indexing, partitioning, execution-plan tuning.

*APIs:* RESTful Web API design between services — documented and tested with Swagger (OpenAPI) and Postman; published and governed through Azure API Management; SOAP / WCF on legacy tiers.

*AI / LLM Tooling:* Model Context Protocol (MCP) tool-server design with in-code agent guardrails · Claude Code (daily development driver) · professional LLM code evaluation (prompt fixtures, grading rubrics) · AI cybersecurity capability-evaluation task authoring (containerized vulnerable/patched targets, differential automated graders, difficulty calibration via the Anthropic API).

*Cloud & Containers:* Microsoft Azure — App Service, Azure Functions, AKS, API Management, Key Vault, Managed Identities, Azure Monitor / Application Insights / Log Analytics · Docker containerization and Kubernetes / AKS deployment · Red Hat OpenShift (formal training + production support tickets) · Terraform infrastructure as code · GraphQL alongside REST · event-driven async messaging (queue and storage triggered Azure Functions) · Azure DevOps Pipelines (YAML), GitHub Actions.

*DevOps & Process:* Azure DevOps Services and Azure DevOps Server / TFS (all supported versions — installation, upgrades, administration), Git, CI/CD pipelines · Agile / Scrum (Professional Scrum Master I) and waterfall delivery · code review, mentoring, JAD sessions, FDD / TDD documentation and effort estimation.

*Security:* OAuth 2.0 / OpenID Connect / PKCE, JWT, Entra ID / Azure AD IAM, Managed Identities, Key Vault secret hygiene, TLS / certificate management, CORS policy, SonarQube (SAST), OWASP ZAP (DAST), CWE / CVSS-graded security audits, NIST-based (ITSG-33 / PBMM) controls, secret-scanning guardrails.

Professional Scrum Master I (Scrum.org) · ITIL v3 Foundation (Loyalist Certification Services).

*Open source (60+ public PRs):* chess.js \#572 — x-ray attacker detection, with a published fork on npm as \@pabrams/chess.js · Microsoft vsts-team-calendar \#207 — es6-promise polyfill fixing "Promise is not defined" in IE · azure-devops-node-api \#159 · azure-devops-extension-hot-reload-and-debug \#3 · Microsoft TypeScript-Website \#3477 / \#3478 · microsoft-authentication-library-for-dotnet \#317 — PowerShell support docs · physicshub (three fixes) · canada-ca/platform-security · Dygmalab/Bazecor (Dygma keyboard configurator).

*Awards (Department of Justice, Canada):* Team Merit Award 2012 (Cost Recovery Process Improvement) · Team Merit Award 2011 (Chart of Accounts) · Team Spirit Award 2009.


#v(0.3em)
#text(size: 13pt, weight: "bold", fill: rgb("#1f4e79"), "Core Competencies")
#line(length: 100%, stroke: 0.4pt + rgb("#1f4e79"))
#v(0.2em)
*Senior software developer with 15+ years building, scaling, and operating high-availability, distributed enterprise systems* across the Government of Canada — from a *load-balanced, geographically distributed* legal case-management platform serving *5,000+ concurrent users nationally* to a *cloud-native microservices* application on Microsoft Azure. Deep *backend* expertise in *.NET Core / C\#* and *Node.js / NestJS* (a TypeScript decorator framework analogous to *Spring Boot* / ASP.NET Core), designing and consuming *REST APIs between services* and publishing/governing them through an *API gateway (Azure API Management)* with authentication, throttling, and transformation. Hands-on with *Docker and Kubernetes* containerized deployment, *CI/CD pipelines* (Azure DevOps, GitHub Actions), *serverless / event-driven workflows* (Azure Functions, queue- and storage-triggered handoffs), and *load balancing* across cloud and on-prem tiers. Strong relational-database engineering (*MS SQL Server, Azure SQL, PostgreSQL*) with working *NoSQL (MongoDB)* exposure, and a track record of *optimizing high-traffic backends* (e.g. a \~50× report speedup via execution-plan analysis). *Security-minded by default:* OAuth 2.0 / OpenID Connect / Entra IAM, migration to *Managed Identities*, *Key Vault* secret hygiene, TLS / certificate management, and *ITSG-33 / PBMM* controls. *Recurring pattern*: self-initiated automation frameworks that pay back substantial labour cost. *Professional Scrum Master I*; *AODA / WCAG*-aware. Active open-source contributor — *60+ public PRs* including Microsoft's vsts-team-calendar, tfs-cli, and the *Microsoft Authentication Library .NET* docs.
