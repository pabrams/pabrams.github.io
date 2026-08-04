#import "template.typ": cv

#show: cv.with(
  location: "Toronto, Ontario",
  tagline: "Senior Full-Stack Developer · C\\# / .NET Core / Web API / Blazor · ASP.NET · Entity Framework / LINQ · Azure (App Service, Functions, Entra ID, Key Vault, Managed Identities) · JavaScript / React / TypeScript · SQL Server · WCAG AA / AODA · Azure DevOps CI/CD · 15+ Years",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    *Senior full-stack developer with 15+ years across the full SDLC*, shipping *web-based enterprise applications* from front-end UI through service back ends and relational databases — the bulk of it in the *Ontario- and federal-scale public sector*. Deep *C\# / .NET* back-end engineering: *ASP.NET / .NET Core, Web API, Entity Framework, LINQ, ADO.NET*, and a *Blazor* front end, designing and consuming *RESTful APIs between services* documented and tested with *Swagger, Postman, and ThunderClient*. Strong on *Azure application development and security* — *App Service, Azure Functions, Container Instances, Entra ID / Azure AD (OAuth 2.0 / OpenID Connect), MFA / SSO, App registrations, client- and server-side CORS policy, Key Vault, and Managed Identities*. Front end in *JavaScript, HTML / CSS, and React + TypeScript* (component-based SPA patterns), built to *full WCAG AA / AODA accessibility compliance*. Designs and models *relational databases* and writes performant *T-SQL* against *SQL Server*. Disciplined engineering practice: *SOLID design, dependency injection, reusable NuGet components, unit testing (xUnit / Moq)*, code review, and *Azure DevOps CI/CD pipelines*. Delivers in *Agile / Scrum* (Professional Scrum Master I) tracking work in *Azure DevOps / TFS and JIRA*. Active open-source contributor — *60+ public PRs* including Microsoft's `vsts-team-calendar`, `tfs-cli`, and the *Microsoft Authentication Library .NET* docs.
  ],
  experience: (
    (
      org: "Abrams Software",
      location: "Toronto, Ontario (Remote)",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [*Chess Attack Visualization* — *React 19 + TypeScript* single-page app (Vite, React Testing Library + Vitest / Jest) consuming the *Lichess.org REST API*, with a *NestJS* (TypeScript decorator framework analogous to *Spring Boot*) auth proxy implementing the *OAuth2 PKCE* flow with *client- and server-side CORS* configuration. Diagnosed a missing feature in `chess.js`, opened #link("https://github.com/jhlywa/chess.js/pull/572")[upstream PR \#572], and published a fork on npm. *Portfolio site* runs as *Astro on GitHub Pages with GitHub Actions* CI/CD.],
        [*TWNR* — *architected and shipped a public-facing multiplayer game as a full-stack web application, solo.* Dockerized *TypeScript* monorepo: *Node.js (Express) + WebSocket* server backed by *PostgreSQL*, per-player *JWT auth*, and a *JSON-Schema-generated REST API contract* that doubles as live Swagger-style documentation. Concurrency-correct state via database transactions (`SELECT … FOR UPDATE`). Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [*LLM code evaluation* for #link("https://www.dataannotation.tech")[DataAnnotation.tech] and Stellar.ai — prompt fixtures and grading rubrics across *.NET / C\#, JavaScript / TypeScript, React, Java, Python, SQL, and MongoDB*, including *security audits with CWE / CVSS-graded inventories*. *60+ public PRs* to outside repos including the *Microsoft Authentication Library .NET* docs and `canada-ca/platform-security`.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Full-Stack Developer — Cloud Application (Benefits Delivery Modernization)",
      bullets: (
        [Enhanced and maintained an enterprise onboarding application — *.NET Core / C\# back end, Blazor front end, Azure SQL, Azure Functions, Web API, GraphQL* — serving procurement, HR, and IT-ops personnel. *Designed and consumed RESTful Web APIs between services*, documented and tested with *Swagger and Postman*, and integrated enterprise IAM via *Entra ID / Azure AD (OAuth 2.0, OpenID Connect)* with *SSO / MFA*; governed APIs through *Azure API Management* with authentication, throttling, and transformation policies.],
        [*Azure application development and security:* built and operated *Azure Functions, App Service, and Container Instances*; configured *Azure AD App registrations and policies* and *client- and server-side CORS policy*; migrated downstream identity from rotating *Key Vault* secrets and ADO PATs to *Azure Managed Identities* — eliminating the secret-rotation incident class. Applied *SOLID design and dependency injection*, and packaged *reusable components as NuGet* for reuse across the microservices.],
        [Designed and shipped *custom web extensions in JavaScript / React / TypeScript / Node.js* — a build/deploy analytics widget rendering success-rate charts via the ADO REST API, and a people-by-project reporter that replaced an unusably slow query with an in-memory hashmap. Responsive UI, custom *CSS*, *WCAG AA / AODA*-aligned interactions with cross-browser support.],
        [Operated *Azure DevOps CI/CD pipelines* for build, *unit testing (xUnit / Moq)*, *Docker* containerization, *Kubernetes* deployment, and *Azure Data Factory* (ETL) orchestration; daily Git workflow with feature branches and PR-gated CI. Ran weekly *demos and design walkthroughs*, mentoring junior developers on API integration, app registration, and custom extensions.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead — Internal Web Application & CI/CD Automation",
      bullets: (
        [Co-architected and developed an *internal C\# / .NET web application* with a web UI for authoring structured scenarios; *designed and modelled the SQL Server relational schema* and *co-designed the REST Web API* for bidirectional integration with *Azure DevOps pipelines* (versioned script-fetch and structured results-push endpoints). Applied *dependency injection* and unit testing; enforced coding standards through *code review*.],
        [Engineered *Azure DevOps CI/CD pipelines* that provisioned Windows agents to run parallel automated *Selenium* runs against deployed applications and fed structured results back into work items. Drove a tooling consolidation (*LoadRunner → JMeter*) that cut licensing costs while preserving capability. Integrated *SonarQube* (SAST) and *OWASP ZAP* (DAST) into pipelines.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "August 2017 – August 2019",
      title: "Team Lead / Technical Lead",
      bullets: (
        [Led full *Agile / Scrum* delivery — sprint planning, review, retrospective, daily stand-up, backlog refinement, iteration demos, and design walkthroughs; introduced poker-planning estimation and capacity forecasting. *Elicited and translated business requirements* into working software through close BA and stakeholder partnership, including *requirements analysis for reports and enhancements*.],
        [Implemented and deployed *custom web extensions in JavaScript / React / TypeScript / Node.js* with responsive, *accessibility-aligned (WCAG / AODA)* UIs — hands-on while guiding the team. *Mentored developers in SQL Server query optimization* — query tuning, indexing strategy, partitioned tables, and execution-plan analysis against large databases and warehouses.],
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
        [Engineered *Dynamics CRM plug-ins, custom actions, and workflows in C\#* (rewriting legacy stored procedures as *C\# / LINQ*); used *SSIS* for ETL between systems; produced *entity-relationship diagrams* and *detailed effort-estimation breakdowns* (FDD / TDD), and applied design patterns (Repository, Strategy, Mediator). *Established code-review processes gated on work items* and mentored junior developers.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer · Release Engineering Lead",
      bullets: (
        [Hired alongside one other engineer to take over a release-management environment from a contractor team. *Decommissioned over-engineered legacy C\# desktop apps* and replaced them with lightweight *PowerShell calling REST APIs* — most contractor tooling was simply deleted and *everything ended up in source control*.],
        [Implemented and deployed *web extensions in JavaScript / React / TypeScript / Node.js*; maintained a fork of Microsoft's `vsts-team-calendar` extension and contributed back upstream. *Installed, configured, customized, and upgraded* the Azure DevOps Server / TFS platform across dev / UAT / production — multi-step upgrades, *Kerberos / SPN configuration*, and database-tier migration.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2008 – April 2014",
      title: "Full-Stack Developer (2009–2014) · Test-Automation Framework Developer (2008–2009)",
      intro: [Core developer on the department's flagship *Legal Case Management System (iCase)* — a *distributed, multi-tier ASP.NET / C\#* enterprise web platform used by *5,000+ government lawyers and contracted agent firms across Canada*, deployed across *load-balanced web servers and regionally distributed document servers* with role- and object-based security, integration to records-management, financial, and email systems, and *24/7 high availability*.],
      bullets: (
        [Led design and largely solo implementation of the *"My iCase" personalization portal* — the customizable widget-based entry point to iCase. Ran JAD sessions, produced prototypes, authored *FDD / TDD documentation*, then built it on *ASP.NET Web Parts with a custom SQL personalization provider*, *Knockout.js MVVM* (a direct ancestor of modern component frameworks), and async AJAX web-service calls.],
        [*Performance and reporting engineering:* diagnosed a homepage *report* taking \~10 s uncached — profiled with SQL Profiler, Report Execution logs, and execution plans, then replaced live joins with a nightly-populated flat table (*\~50× faster uncached, 3–4× cached*). Built a *self-initiated availability-monitoring suite* across the distributed servers, resolved a *COM Interop memory leak* on the document tier, and co-led the *SQL Server 2005 → 2012* and *.NET Framework 2.0 → 4.0* upgrades.],
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

*Languages:* *C\#, JavaScript, TypeScript, SQL (T-SQL)*, HTML / CSS, PowerShell, Java, Python, XML / XSLT

*.NET / Back-End:* *.NET Core / .NET 6 / 8, ASP.NET / ASP.NET MVC, Web API, ADO.NET, Entity Framework, LINQ* · *Blazor* · *SOLID, dependency injection, reusable NuGet components* · *Node.js, Express, NestJS* · Spring Boot (familiarity)

*Front-End / UI:* *JavaScript, HTML / CSS, React 19, TypeScript*, Blazor, Knockout.js MVVM, Vite, AJAX, jQuery · *responsive, cross-browser, full WCAG AA / AODA accessibility* · UX/UI fundamentals

*APIs:* *RESTful Web API design between services*, GraphQL, WebSocket · *Swagger, Postman, ThunderClient* · API gateway / management (Azure APIM) · SOAP / WCF (legacy)

*Azure:* *App Service, Azure Functions, Container Instances, Azure SQL, API Management, Key Vault, Managed Identities* · *Entra ID / Azure AD — OAuth 2.0 / OpenID Connect, MFA / SSO, App registrations & policies, CORS*

*Databases:* *MS SQL Server (2005 → 2019), Azure SQL* — relational modelling, stored procedures, indexing, partitioning, execution-plan tuning · *PostgreSQL* · MongoDB (working familiarity)

*Testing:* *xUnit / NUnit, Moq*, React Testing Library / Vitest / Jest, Selenium, Playwright · SonarQube (SAST), OWASP ZAP (DAST)

*CI/CD & DevOps:* *Azure DevOps Pipelines (YAML), Git, GitHub Actions* · *Docker, Kubernetes* · Azure Data Factory (ETL) · feature branches, PR-gated CI

*Reporting / Office:* SSRS, Crystal Reports (legacy), Power BI · MS Word, Excel, PowerPoint, Visio

*Also experienced with (Microsoft legacy):* Visual Studio 2005 → 2022, .NET Framework 2.0 → 4.8, IIS, WCF / WPF, SSIS, Azure DevOps Server (TFS) administration & upgrades, multi-threaded Windows services

*Process / SDLC:* *Agile / Scrum (PSM I)* — sprint planning, backlog refinement, demos · Azure DevOps / TFS, JIRA · FDD / TDD with effort estimation, code review, mentoring, technical documentation · ITIL v3 Foundation
