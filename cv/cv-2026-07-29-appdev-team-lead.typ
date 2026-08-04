#import "template.typ": cv

#show: cv.with(
  location: "Toronto, Ontario",
  tagline: "Application Development Team Lead · Hands-On C# / .NET Core + React.js / Next.js Full-Stack · Application Architecture & Technical Design · Team Mentoring, Code Review & Agile Delivery · Azure (Logic Apps, Data Factory, Entra ID) & Azure DevOps CI/CD · MS SQL Server Design & Performance Tuning · 15+ Years",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [Full-stack developer and technical lead with 15+ years building enterprise web applications across the Government of Canada, including 10+ years in team-lead and technical-lead roles. A hands-on lead by preference — deep C\# / .NET Core back-end and REST API work alongside React.js, Next.js, and TypeScript front ends, delivered through code review, mentoring, and Agile ceremonies run first-hand. Advises on and approves application architecture: most recently reviewing and signing off cloud architecture for two national benefits systems migrating to Azure and AWS, and co-designing the schema, integration points, and API contract for an internal no-code test-authoring platform. Professional Scrum Master I.],
  experience: (
    (
      org: "Abrams Software",
      location: "Toronto, Ontario",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [Built CVForge, a blurb-library and CV-builder product — an Angular 18 single-page front end over an ASP.NET Core (C\#) REST Web API with relational SQL persistence.],
        [Designed the REST API endpoints consumed by the SPA client and by an MCP tool-server integration.],
        [Shipped other production web applications solo, including a multiplayer game (Node.js, PostgreSQL, with a REST API contract generated from JSON Schema) and a React 19 + TypeScript chess visualization consuming the Lichess REST API.],
      ),
    ),
    (
      org: "Abrams Software",
      location: "Toronto, Ontario",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [*Chess Attack Visualization* — *React 19 + TypeScript* single-page app (Vite, *React Testing Library + Vitest / Jest* unit tests) consuming the *Lichess.org REST API*, with a *NestJS / Node.js* auth service implementing the *OAuth2 PKCE* flow with client- and server-side *CORS* configuration. Diagnosed a missing feature in chess.js, opened upstream PR \#572 (x-ray attacker detection), and published a fork on npm as \@pabrams/chess.js.],
      ),
    ),
    (
      org: "Abrams Software",
      location: "Toronto, Ontario",
      dates: "August 2025 – Present",
      title: "Open-Source Contributor",
      bullets: (
        [*Next.js + React 19 + TypeScript contributions* to physicshub.github.io — a public physics-simulation site. Led a *JavaScript → TypeScript migration* of the core physics engine (ForceCalculator, ForceRenderer, PhysicsBody, InclinedPlaneBody, DragController, Spring, Time, Utils, Config). Introduced *branded nominal types* for physical units with accompanying TDD coverage. Fixed energy-conservation and boundary-collision bugs that had been latent in the simulation. Worked alongside the existing React component patterns (hooks, context, \@dnd-kit, Motion, react-ace).],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Technical Lead — Infrastructure and Cloud Enablement (Benefits Delivery Modernization)",
      bullets: (
        [*Technical lead of the Infrastructure and Cloud Enablement division* on Benefits Delivery Modernization — at the time the largest IT program in the Government of Canada. Led the team that owned the shared build, deployment, and Azure DevOps platform every application team on the program depended on.],
        [*Reviewed and approved proposed application architecture* for the Old Age Security application migrating to *Azure* and the Employment Insurance application migrating to *AWS* — advising the delivery teams on design decisions and holding sign-off, because my team would inherit development and maintenance of both systems from the contractor organizations building them.],
        [*Mentored junior developers* and ran *weekly demonstrations* of that week's work — CI/CD pipeline design, PowerShell automation, and Azure DevOps extension development — as a standing forum for design walkthroughs and knowledge transfer across the program's development teams.],
        [*Championed code review* as an engineering practice rather than a gate: designed pull request workflows and branch policies for the program's teams, and actively drove reviewer participation across them.],
        [Designed and shipped *custom Azure DevOps web extensions* in *React.js, TypeScript, and Node.js* to support the program's development teams — including a configurable build and deployment graph scoped to selected build folders and time ranges, and a team-wiki extension that let teams author entries per area path and surfaced how stale each document had become. Responsive UI with accessibility-aligned interactions.],
        [Built *PowerShell automation* against the Azure DevOps REST API — scheduled snapshots of area paths, iteration paths, and security configuration committed into Git as a configuration-drift detector, plus scheduled work-item digest reporting. Authored *CI/CD pipelines* in Azure DevOps for build, test, Docker containerization, Kubernetes deployment, and Azure Data Factory (ETL) orchestration.],
        [*Administered Azure DevOps Services end to end* for every development team on the program — repository provisioning, build and branch policies, branching-strategy advice, service connections, Microsoft Entra ID integration, organization and project security, and organization-to-organization data migrations using the nkdagility (Martin Hinshelwood) migration tools. Advised on process-template customization, mostly by discouraging it, then by making the resulting templates maintainable once teams chose to proceed.],
        [Enhanced and maintained the program's *cloud-native microservices onboarding application* — *Blazor, C\# / ASP.NET Core, Azure Functions, Azure SQL, Azure Logic Apps* — with REST APIs governed through *Azure API Management* and identity through *Azure AD / Entra (OAuth 2.0, OpenID Connect)*. Migrated downstream identity from rotating Key Vault secrets and 90-day Azure DevOps personal access tokens to *Azure Managed Identities*, eliminating the secret-rotation incident class.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead, Testing Services",
      bullets: (
        [*Development lead for Testing Services.* Participated in architecting an internal *C\# / .NET* web application that let QA staff and business analysts author automated test scenarios through a web UI without writing code — advising on the *SQL Server schema design, the integration points, and the REST API contract* that gave the application bidirectional integration with Azure DevOps pipelines: script-fetch endpoints serving versioned Selenium scripts generated on the fly from SQL, and results-push endpoints returning structured outcomes.],
        [Engineered Azure DevOps *CI/CD pipelines for automated testing* — provisioned Windows agents to execute parallel Selenium UI tests against deployed applications and fed logged results back into Azure DevOps work items.],
        [Championed the departmental move from *LoadRunner to JMeter*, cutting licensing cost while preserving performance-testing capability.],
        [Established coding standards and enforced them through *code review*; mentored team members on .NET and pipeline practice.],
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
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Release Engineering Lead — Platform and Internal Tooling",
      bullets: (
        [Owned the department's on-premises *Team Foundation Server / Azure DevOps Server* platform end to end across development, UAT, and production — installation, configuration, complex multi-step version upgrades, database-tier migration, and *Kerberos / SPN configuration* for delegated authentication between the application and database tiers.],
        [Designed, built, and maintained a suite of internal tools integrated with TFS — web applications, *Microsoft Outlook extensions*, and command-line utilities — defining the integration architecture between the in-house tooling and the TFS APIs.],
        [Replaced over-engineered legacy C\# desktop tooling with lightweight *PowerShell calling REST APIs*, bringing the toolchain under source control.],
        [Implemented and deployed *web extensions in React, TypeScript, and Node.js*, contributing upstream to Microsoft's vsts-team-calendar.],
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
  ),
  education: (
    (degree: "Bachelor of Computer Science (Honours)", school: "Carleton University", dates: "September 1999 – May 2003"),
  ),
)

#v(0.3em)
#text(size: 13pt, weight: "bold", fill: rgb("#1f4e79"), "Technical Skills")
#line(length: 100%, stroke: 0.4pt + rgb("#1f4e79"))
#v(0.2em)
*Front-End:* React.js (hooks, context, component-based SPAs), Next.js, TypeScript, JavaScript (ES6+), HTML5 / CSS3 — responsive layout, WCAG AA / AODA accessible; Angular, Vue, Blazor, Knockout.js; unit testing with Jest / Vitest / React Testing Library.

*Back-End (.NET):* C\#, ASP.NET (Web Forms → Core), ASP.NET Web API / REST, .NET Framework 2.0 – 4.8 and .NET 5 – 8, VB.NET (legacy migration to C\#), Entity Framework, LINQ, ADO.NET, XML / XSLT, WCF / WPF, IIS, Visual Studio 2005 – 2022.

*APIs:* RESTful Web API design between services — documented and tested with Swagger (OpenAPI) and Postman; published and governed through Azure API Management; SOAP / WCF on legacy tiers.

*Databases:* MS SQL Server 2005 → 2019, Azure SQL, PostgreSQL — relational modelling, T-SQL stored procedures, indexing, partitioning, execution-plan tuning.

*Cloud & Containers:* Microsoft Azure — App Service, Azure Functions, AKS, API Management, Key Vault, Managed Identities, Azure Monitor / Application Insights / Log Analytics · Docker containerization and Kubernetes / AKS deployment · Red Hat OpenShift (formal training + production support tickets) · Terraform infrastructure as code · GraphQL alongside REST · event-driven async messaging (queue and storage triggered Azure Functions) · Azure DevOps Pipelines (YAML), GitHub Actions.

*DevOps & Process:* Azure DevOps Services and Azure DevOps Server / TFS (all supported versions — installation, upgrades, administration), Git, CI/CD pipelines · Agile / Scrum (Professional Scrum Master I) and waterfall delivery · code review, mentoring, JAD sessions, FDD / TDD documentation and effort estimation.

*Security:* OAuth 2.0 / OpenID Connect / PKCE, JWT, Entra ID / Azure AD IAM, Managed Identities, Key Vault secret hygiene, TLS / certificate management, CORS policy, SonarQube (SAST), OWASP ZAP (DAST), CWE / CVSS-graded security audits, NIST-based (ITSG-33 / PBMM) controls, secret-scanning guardrails.

*AI / LLM Tooling:* Model Context Protocol (MCP) tool-server design with in-code agent guardrails · Claude Code (daily development driver) · professional LLM code evaluation (prompt fixtures, grading rubrics) · AI cybersecurity capability-evaluation task authoring (containerized vulnerable/patched targets, differential automated graders, difficulty calibration via the Anthropic API).

Professional Scrum Master I (Scrum.org) · ITIL v3 Foundation (Loyalist Certification Services).

*Open source (60+ public PRs):* chess.js \#572 — x-ray attacker detection, with a published fork on npm as \@pabrams/chess.js · Microsoft vsts-team-calendar \#207 — es6-promise polyfill fixing "Promise is not defined" in IE · azure-devops-node-api \#159 · azure-devops-extension-hot-reload-and-debug \#3 · Microsoft TypeScript-Website \#3477 / \#3478 · microsoft-authentication-library-for-dotnet \#317 — PowerShell support docs · physicshub (three fixes) · canada-ca/platform-security · Dygmalab/Bazecor (Dygma keyboard configurator).

*Awards (Department of Justice, Canada):* Team Merit Award 2012 (Cost Recovery Process Improvement) · Team Merit Award 2011 (Chart of Accounts) · Team Spirit Award 2009.


#v(0.3em)
#text(size: 13pt, weight: "bold", fill: rgb("#1f4e79"), "Core Competencies")
#line(length: 100%, stroke: 0.4pt + rgb("#1f4e79"))
#v(0.2em)
Senior .NET technical lead with 15+ years of hands-on C\# / .NET development across the full SDLC — .NET Framework 2.0–4.8 through .NET 5–8 — with a career-long modernization track record: migrating core VB.NET business modules to C\#, rewriting legacy stored procedures as C\# / LINQ, replacing legacy C\# desktop tooling with lightweight PowerShell driving REST APIs, and leading the build of the Microsoft Dynamics CRM successor to a 5,000-user legal case management platform. Most recently enhanced and operated cloud-native .NET Core microservices on Microsoft Azure (App Service, Azure Functions, AKS) — REST and GraphQL APIs governed through Azure API Management, Docker containerization with Kubernetes deployment, and event-driven messaging via queue and storage triggered Azure Functions. Delivers through PR-gated Azure DevOps CI/CD pipelines with Terraform infrastructure as code and observability via Azure Monitor, Application Insights, and Log Analytics. Proven team leadership: led Agile / Scrum ceremonies and estimation as team lead at IRCC, established code review gated on work items as acting lead at Justice, and mentors developers in C\# / .NET and SQL Server optimization. Professional Scrum Master I.

