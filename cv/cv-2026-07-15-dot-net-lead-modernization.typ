#import "template.typ": cv

#show: cv.with(
  location: "Toronto, Ontario",
  tagline: "C# .NET Technical Lead · Legacy .NET Modernization (VB.NET → C#, .NET Framework 2.0–4.8 → .NET 5–8) · Azure Cloud-Native Microservices · Docker / Kubernetes (AKS) · REST & GraphQL · CI/CD, Terraform IaC · Agile Team Leadership & Code Review · 15+ Years",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [Senior .NET technical lead with 15+ years of hands-on C\# / .NET development across the full SDLC — .NET Framework 2.0–4.8 through .NET 5–8 — with a career-long modernization track record: migrating core VB.NET business modules to C\#, rewriting legacy stored procedures as C\# / LINQ, replacing legacy C\# desktop tooling with lightweight PowerShell driving REST APIs, and leading the build of the Microsoft Dynamics CRM successor to a 5,000-user legal case management platform. Most recently enhanced and operated cloud-native .NET Core microservices on Microsoft Azure (App Service, Azure Functions, AKS) — REST and GraphQL APIs governed through Azure API Management, Docker containerization with Kubernetes deployment, and event-driven messaging via queue and storage triggered Azure Functions. Delivers through PR-gated Azure DevOps CI/CD pipelines with Terraform infrastructure as code and observability via Azure Monitor, Application Insights, and Log Analytics. Proven team leadership: led Agile / Scrum ceremonies and estimation as team lead at IRCC, established code review gated on work items as acting lead at Justice, and mentors developers in C\# / .NET and SQL Server optimization. Professional Scrum Master I.],
  experience: (
    (
      org: "Abrams Software",
      location: "Toronto, Ontario (Remote)",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [Built CVForge, a blurb-library and CV-builder product with twin single-page front ends in Vue.js 3 and Angular 18 over an ASP.NET Core (C\#) REST Web API with relational SQL persistence.],
        [Designed the REST API endpoints consumed by both SPA clients and by an MCP tool-server integration.],
        [Shipped other production web applications solo, including a multiplayer game (Node.js, PostgreSQL, with a REST API contract generated from JSON Schema) and a React 19 + TypeScript chess visualization consuming the Lichess REST API.],
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
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer · Release Engineering Lead",
      bullets: (
        [Installed, configured, customized, and upgraded the Azure DevOps Server / TFS platform across dev / UAT / production — complex multi-step upgrades, Kerberos / SPN configuration, and database-tier migration.],
        [Replaced over-engineered legacy C\# desktop tooling with lightweight PowerShell calling REST APIs, bringing everything under source control.],
        [Implemented and deployed web extensions in React / TypeScript / Node.js, contributing upstream to Microsoft's vsts-team-calendar.],
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
*Back-End (.NET):* C\#, ASP.NET (Web Forms → Core), ASP.NET Web API / REST, .NET Framework 2.0 – 4.8 and .NET 5 – 8, VB.NET (legacy migration to C\#), Entity Framework, LINQ, ADO.NET, XML / XSLT, WCF / WPF, IIS, Visual Studio 2005 – 2022.

*Cloud & Containers:* Microsoft Azure — App Service, Azure Functions, AKS, API Management, Key Vault, Managed Identities, Azure Monitor / Application Insights / Log Analytics · Docker containerization and Kubernetes / AKS deployment · Red Hat OpenShift (formal training + production support tickets) · Terraform infrastructure as code · GraphQL alongside REST · event-driven async messaging (queue and storage triggered Azure Functions) · Azure DevOps Pipelines (YAML), GitHub Actions.

*APIs:* RESTful Web API design between services — documented and tested with Swagger (OpenAPI) and Postman; published and governed through Azure API Management; SOAP / WCF on legacy tiers.

*Databases:* MS SQL Server 2005 → 2019, Azure SQL, PostgreSQL — relational modelling, T-SQL stored procedures, indexing, partitioning, execution-plan tuning.

*DevOps & Process:* Azure DevOps Services and Azure DevOps Server / TFS (all supported versions — installation, upgrades, administration), Git, CI/CD pipelines · Agile / Scrum (Professional Scrum Master I) and waterfall delivery · code review, mentoring, JAD sessions, FDD / TDD documentation and effort estimation.

*Security:* OAuth 2.0 / OpenID Connect / PKCE, JWT, Entra ID / Azure AD IAM, Managed Identities, Key Vault secret hygiene, TLS / certificate management, CORS policy, SonarQube (SAST), OWASP ZAP (DAST), CWE / CVSS-graded security audits, NIST-based (ITSG-33 / PBMM) controls, secret-scanning guardrails.

Professional Scrum Master I (Scrum.org) · ITIL v3 Foundation (Loyalist Certification Services).
