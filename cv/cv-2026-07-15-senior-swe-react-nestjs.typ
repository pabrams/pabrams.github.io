#import "template.typ": cv

#show: cv.with(
  location: "Toronto, Ontario",
  tagline: "Senior Software Engineer · React / TypeScript · NestJS / Node.js · REST APIs & Cloud-Native Microservices · Application & Cloud Security (OAuth 2.0 / OIDC, SAST / DAST, CWE / CVSS) · MCP & LLM-Assisted Engineering · 15+ Years",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    *Senior software engineer with 15+ years across the full SDLC*, shipping *B2B and B2C web applications* from front-end UI through service back ends and databases. Front end in *React + TypeScript* (component-based SPAs, HTML5 / CSS3, responsive and WCAG-accessible); back end designing and implementing *RESTful APIs in TypeScript with NestJS and Node.js / Express*, plus deep *.NET Core / C\#* experience on *cloud-native microservices*. *Security is a throughline*: *OAuth 2.0 / OpenID Connect / PKCE, JWT auth*, migration to *Azure Managed Identities*, *Key Vault* secret hygiene, TLS / certificate management, client- and server-side *CORS* policy, *SonarQube (SAST)* and *OWASP ZAP (DAST)* in CI pipelines, *CWE / CVSS-graded security audits*, and *NIST-based (ITSG-33 / PBMM) controls*. Hands-on with *AI-assisted engineering*: designed and shipped a *Model Context Protocol (MCP) tool-server* with in-code guardrails, develops daily with *Claude Code*, and evaluates LLM-generated code professionally. Delivers *well-tested code* (*Jest / Vitest / React Testing Library*, xUnit) through *PR-gated CI/CD* in *Agile / Scrum* (Professional Scrum Master I), collaborating in *Azure DevOps* with distributed stakeholders. Active open-source contributor — *60+ public PRs* including Microsoft's `vsts-team-calendar`, `tfs-cli`, and the *Microsoft Authentication Library .NET* docs.
  ],
  experience: (
    (
      org: "Abrams Software",
      location: "Toronto, Ontario (Remote)",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [*Chess Attack Visualization* — *React 19 + TypeScript* single-page app (Vite, *React Testing Library + Vitest / Jest* unit tests) consuming the *Lichess.org REST API*, with a *NestJS / Node.js* auth service implementing the *OAuth2 PKCE* flow with client- and server-side *CORS* configuration. Diagnosed a missing feature in `chess.js`, opened #link("https://github.com/jhlywa/chess.js/pull/572")[upstream PR \#572], and published a fork on npm.],
        [*CVForge* — full-stack SaaS-style product (public at #link("https://github.com/pabrams/cvforge")[github.com/pabrams/cvforge]): a REST Web API (*ASP.NET Core, EF Core, Swagger / OpenAPI docs*) consumed by *two parallel SPA front ends (Angular and Vue 3)*. Designed and shipped a *Model Context Protocol (MCP) tool-server in Node.js* wrapping the API so LLM agents (*Claude Code*) can drive the domain — with *security guardrails enforced in code* (agents cannot modify locked records; agent-created content is always flagged as draft) and a *secret-scanner blocking credential leakage* into exported documents.],
        [*TWNR* — *architected and shipped a public-facing B2C multiplayer game, solo.* Dockerized *TypeScript* monorepo: *Node.js (Express) + WebSocket* server backed by *PostgreSQL*, per-player *JWT auth*, and a *JSON-Schema-generated REST API contract* that doubles as live documentation. Concurrency-correct state via database transactions. Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [*LLM code evaluation* for #link("https://www.dataannotation.tech")[DataAnnotation.tech] and Stellar.ai — prompt fixtures and grading rubrics across *TypeScript, React, Node / NestJS, .NET / C\#, Python, SQL, and MongoDB*, including *security audits with CWE / CVSS-graded vulnerability inventories*. *60+ public PRs* to outside repos including the *Microsoft Authentication Library .NET* docs and `canada-ca/platform-security`.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Software Engineer — Cloud-Native Microservices (Benefits Delivery Modernization)",
      bullets: (
        [Enhanced and maintained a *cloud-native microservices* enterprise onboarding application — *.NET Core / C\# back end, Blazor front end, Azure SQL, Azure Functions, GraphQL*. *Designed API endpoints, defined schemas, and generated documentation* (Swagger / OpenAPI, Postman); *published and governed APIs through Azure API Management* with authentication, throttling, and transformation policies; integrated enterprise IAM via *Entra ID / Azure AD (OAuth 2.0, OpenID Connect)* with SSO / MFA.],
        [*Application and cloud security:* migrated the application's downstream identity from rotating secrets (Key Vault + PATs on 90-day rotation) to *Azure Managed Identities* — eliminating the secret-rotation incident class. Implemented *NIST-based ITSG-33 controls* — TLS / certificate management and *Key Vault* secret hygiene — for security assessment submissions against a *PBMM* profile; configured *Azure AD App registrations* and client- and server-side *CORS* policy.],
        [Designed and shipped *custom web extensions in React, TypeScript, and Node.js* — a build/deploy analytics widget rendering success-rate charts via the ADO REST API, and a people-by-project reporter that replaced an unusably slow query with an in-memory hashmap. Responsive UI, custom CSS, *WCAG*-aligned interactions with cross-browser support.],
        [Operated *CI/CD pipelines* (Azure DevOps) for build, unit testing, *Docker* containerization, *Kubernetes* deployment, and ETL orchestration; daily Git workflow with feature branches and *peer code review on PR-gated CI*. Ran weekly *demos and design walkthroughs*, mentoring junior developers on API integration and security configuration. Supported production — troubleshooting deployed services and resolving user-reported issues.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead — Internal Web Application, CI/CD Automation & DevSecOps",
      bullets: (
        [Co-architected and developed an *internal C\# / .NET web application* — web UI for authoring structured automation scenarios, *SQL Server* schema design, and a *co-designed REST API* providing bidirectional integration with *Azure DevOps pipelines* (versioned script-fetch and structured results-push endpoints).],
        [*DevSecOps / security scanning:* integrated *SonarQube* static analysis (SAST) into CI pipelines and wrote automation that *queried the SonarQube REST API to flag vulnerabilities and surface them into Azure DevOps*; ran *OWASP ZAP* dynamic scans (DAST) in pipelines.],
        [Engineered *Azure DevOps CI/CD pipelines* that provisioned agents to run parallel automated *Selenium* runs against deployed applications and fed structured results back into work items. Performed *code review and standards enforcement* for the team; drove a tooling consolidation that cut licensing costs.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "August 2017 – August 2019",
      title: "Team Lead / Technical Lead",
      bullets: (
        [Led full *Agile / Scrum* delivery — sprint planning, review, retrospective, daily stand-up, backlog refinement, iteration demos, and design walkthroughs; introduced poker-planning estimation and capacity forecasting. *Scoped engineering requirements and timelines* with BAs, product owners, and stakeholders, and *communicated blockers and delays before they required escalation*.],
        [Implemented and deployed *custom web extensions in JavaScript / React / TypeScript / Node.js* with responsive, accessibility-aligned UIs — hands-on while guiding the team. *Mentored developers in SQL Server query optimization* — query tuning, indexing strategy, and execution-plan analysis.],
        [Administered departmental *Azure DevOps Server / TFS* instances and heavily customized process templates; *managed user/group security* and source-control access across multiple project collections.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "December 2015 – August 2017",
      title: "Development Lead — iCase / Microsoft Dynamics CRM Modernization",
      bullets: (
        [Dev lead on the live *Legal Case Management System (iCase)* — a large *n-tier ASP.NET / C\#* enterprise web application used by *5,000+ lawyers and contracted agents* — while concurrently building its *Microsoft Dynamics CRM* successor.],
        [Engineered *Dynamics CRM plug-ins, custom actions, and workflows in C\#*; produced *entity-relationship diagrams* and *detailed effort-estimation breakdowns*. *Established code-review processes gated on work items* — enforcing maintainability, security, and performance standards — and mentored junior developers.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer · Release Engineering Lead",
      bullets: (
        [Took over a release-management environment from a contractor team; *decommissioned over-engineered legacy desktop tooling* and replaced it with lightweight *PowerShell calling REST APIs*, bringing everything under source control.],
        [Implemented and deployed *web extensions in JavaScript / React / TypeScript / Node.js*; maintained a fork of Microsoft's `vsts-team-calendar` extension and *contributed back upstream*. Installed, configured, and upgraded the Azure DevOps Server / TFS platform across dev / UAT / production, including *Kerberos / SPN security configuration*.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2008 – April 2014",
      title: "Full-Stack Developer — Legal Case Management System (iCase)",
      intro: [Core developer on a *distributed, multi-tier ASP.NET / C\# enterprise web platform* used by *5,000+ government lawyers and contracted agent firms across Canada* — *B2B and B2C* flows (internal lawyers, external agent firms tracking their own billing) — deployed across *load-balanced web servers and regionally distributed document servers* with role- and object-based security and *24/7 high availability*.],
      bullets: (
        [Led design and largely solo implementation of the *"My iCase" personalization portal* — the customizable widget-based entry point to iCase — built on *ASP.NET Web Parts with a custom SQL personalization provider*, *Knockout.js MVVM* (a direct ancestor of modern React component patterns), and async AJAX service calls.],
        [*Performance and reliability engineering:* diagnosed a homepage report taking \~10 s uncached and replaced live joins with a nightly-populated flat table (*\~50× faster*); built a *self-initiated availability-monitoring suite* across the distributed servers; resolved a *COM Interop memory leak* on the document tier.],
        [Architected a *Java-based automation framework* that *parsed English-language scenario documents into executable scripts with round-trip code generation* — replacing a two-week, \~20–25-person manual pre-release validation cycle with automated execution reviewed by one person (*\~98% reduction in effort, \~\$160K saved per release cycle*).],
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

*Languages:* *TypeScript, JavaScript, C\#, SQL*, HTML5 / CSS3, Python, PowerShell

*Front-End:* *React 19, TypeScript, HTML5 / CSS3*, Vite, Angular, Vue 3, Blazor, Knockout.js MVVM · *reusable, scalable component design* · responsive, cross-browser, *WCAG accessibility*

*Back-End / APIs:* *Node.js, NestJS, Express* · *.NET Core / C\#, ASP.NET, Entity Framework* · *RESTful API design — endpoints, schemas, and generated documentation (Swagger / OpenAPI, Postman)* · GraphQL, WebSocket · API gateway (Azure API Management)

*Architecture:* *cloud-native microservices*, event-driven / serverless workflows, n-tier SaaS platforms, load balancing, entity-relationship modelling, design patterns

*Security:* *OAuth 2.0 / OpenID Connect / PKCE, JWT*, Entra ID / Azure AD IAM, *Managed Identities*, Key Vault secret hygiene, TLS / certificate management, *CORS* policy, *SonarQube (SAST), OWASP ZAP (DAST)*, *CWE / CVSS-graded security audits*, NIST-based (ITSG-33 / PBMM) controls, secret-scanning guardrails

*AI / LLM Tooling:* *Model Context Protocol (MCP) tool-server design* with in-code agent guardrails · *Claude Code* (daily development driver) · professional *LLM code evaluation* (prompt fixtures, grading rubrics)

*Databases:* *PostgreSQL, MS SQL Server, Azure SQL* — schema design, stored procedures, indexing, execution-plan tuning · MongoDB (working familiarity)

*Cloud / DevOps:* *Microsoft Azure* (App Service, Functions, SQL, API Management, Key Vault, Managed Identities, Entra) · *AWS* (self-hosted pipeline agent + foundational training) · GCP (production hosting) · *Docker, Kubernetes* · *Git, GitHub Actions, Azure DevOps Pipelines (YAML)* — feature branches, PR-gated CI

*Testing:* *Jest, Vitest, React Testing Library*, xUnit / NUnit, Playwright, Selenium

*Process / SDLC:* *Agile / Scrum (PSM I)* — sprint planning, backlog refinement, demos · *peer code review*, mentoring, technical documentation · Azure DevOps, JIRA, Slack-style distributed collaboration
