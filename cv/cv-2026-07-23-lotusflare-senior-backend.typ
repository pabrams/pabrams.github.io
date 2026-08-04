#import "template.typ": cv

#show: cv.with(
  location: "Toronto, Ontario",
  tagline: "Senior Backend Engineer · Node.js / TypeScript · .NET Core / C\\# · Java · Python · Distributed Systems & Concurrency · REST APIs & API Gateways · SQL & NoSQL · Docker / Kubernetes / Serverless · 15+ Years",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    *Senior backend engineer with 15+ years designing, building, and operating highly available, distributed web services in production* — from a *load-balanced, geographically distributed* legal case-management platform serving *5,000+ concurrent users nationally, 24/7*, to *cloud-native microservices* on Microsoft Azure. *Language-agnostic by practice:* production *Node.js (Express, NestJS, WebSocket)* and *.NET Core / C\#*, with *Java* (an automation framework) and *Python* (LLM-evaluation grading and tooling) rounding out the toolkit alongside *SQL* and *TypeScript*. *Strong REST API design:* designs and consumes *REST APIs between services*, publishes and governs them through an *API gateway (Azure API Management)* with authentication, throttling, and transformation, and generates *living API documentation from JSON-Schema contracts*. Deep *concurrency and fault-tolerance* experience — *queue-based asynchronous fan-out across microservices*, *transactional concurrency control in PostgreSQL* (`SELECT … FOR UPDATE`), load balancing across distributed tiers, and a self-built *availability-monitoring suite*. *Security best practices by default:* *OAuth 2.0 / OpenID Connect / PKCE, JWT*, Managed Identities, Key Vault secret hygiene, *TLS / certificate management*, *SonarQube + OWASP ZAP in pipelines*, and *CWE / CVSS-graded security audits*. *Advanced data modeling in SQL (SQL Server, Azure SQL, PostgreSQL) and NoSQL (MongoDB)*. Hands-on with *Docker, Kubernetes / AKS, Red Hat OpenShift, serverless (Azure Functions)*, and *CI/CD* (Azure DevOps, GitHub Actions, Jenkins). Active open-source contributor — *60+ public PRs* including Microsoft's `vsts-team-calendar`, `tfs-cli`, and the *Microsoft Authentication Library .NET* docs.
  ],
  experience: (
    (
      org: "Abrams Software",
      location: "Toronto, Ontario (Remote)",
      dates: "August 2025 – Present",
      title: "Backend / Full-Stack Engineer · Independent",
      bullets: (
        [*TWNR* — *architected, shipped, and operates a public-facing multiplayer game as a full-stack web application, solo* — owning the entire cycle from development and testing to running the code on production. Dockerized *TypeScript* monorepo: *Node.js (Express) + WebSocket* backend backed by *PostgreSQL*, per-player *JWT auth*, and a *JSON-Schema-generated REST API contract* that doubles as live documentation. *Concurrency-correct multiplayer state* via PostgreSQL transactions (`SELECT … FOR UPDATE`). Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [*Chess Attack Visualization* — *React 19 + TypeScript* app consuming the *Lichess.org REST API*, with a *NestJS* auth proxy implementing the *OAuth2 PKCE* flow. Diagnosed a missing feature in `chess.js`, opened #link("https://github.com/jhlywa/chess.js/pull/572")[upstream PR \#572], and published a fork on npm. *Portfolio site* operated as *Astro on GitHub Pages with GitHub Actions* CI/CD.],
        [*LLM code evaluation* for #link("https://www.dataannotation.tech")[DataAnnotation.tech] and Stellar.ai — prompt fixtures and grading rubrics across *Node / NestJS, .NET / C\#, Java, Python, TypeScript, React, Go, Rust, SQL, and MongoDB*, including *security audits with CWE / CVSS-graded inventories*. *60+ public PRs* to outside repos including the *Microsoft Authentication Library .NET* docs and `canada-ca/platform-security`.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Backend Engineer — Cloud-Native Microservices (Benefits Delivery Modernization)",
      bullets: (
        [Enhanced, maintained, and *supported in production* a *cloud-native microservices* enterprise onboarding application — *.NET Core / C\# back end, Blazor front end, Azure SQL, Azure Functions, GraphQL* — serving procurement, HR, and IT-ops personnel. *Designed and consumed REST APIs between services* and *published and governed them through Azure API Management (API gateway)* with authentication, throttling, and transformation policies; integrated enterprise IAM via *Azure AD / Entra (OAuth 2.0, OpenID Connect)*.],
        [*Concurrency and event-driven fan-out at scale:* Blazor submissions kicked off *serverless Azure Functions* through *queue- and storage-based handoffs* — *bulk submissions fanning out asynchronously across the microservices* — creating/updating Azure DevOps work items, running pipelines, and provisioning users in on-prem Active Directory (via AAD Connect) by personnel profile.],
        [*Containerized delivery, orchestration, and CI/CD:* operated end-to-end *Azure DevOps pipelines* for build, *Docker* containerization, *Kubernetes / AKS* deployment, and *Azure Data Factory* (ETL) orchestration. Used *Terraform* (infrastructure-as-code) to provision cloud infrastructure, including *IP-address allocation*. Completed formal *Red Hat OpenShift* training and *resolved OpenShift production-support tickets*; troubleshot an *Ansible*-driven provisioning pipeline; evaluated *Aqua* container security. For the *AWS-hosted EI application*, deployed a *self-hosted pipeline agent into AWS* (AWS foundational training).],
        [*Security and observability in production:* migrated the application's downstream identity from rotating secrets (Key Vault + ADO PATs on 90-day rotation) to *Azure Managed Identities* — eliminating the secret-rotation incident class. Implemented *ITSG-33 (NIST-based) controls* against a *PBMM* profile, with *TLS / certificate management* and *Key Vault* secret hygiene. Instrumented and monitored the workloads with *Application Insights, Azure Monitor, and Log Analytics*.],
        [Designed and shipped *custom web extensions in React, TypeScript, and Node.js* — a build/deploy analytics widget rendering success-rate charts via the ADO Builds REST API, and a people-by-project reporter that *replaced an unusably slow query with an in-memory hashmap*. Ran weekly *demos and design walkthroughs*, mentoring junior developers.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead, Testing Services — CI/CD Automation & DevSecOps",
      bullets: (
        [Co-architected and developed an *internal C\# / .NET web application* — web UI for authoring structured automation scenarios, *SQL Server* schema design, and a *co-designed REST API* providing bidirectional integration with *Azure DevOps pipelines* (versioned script-fetch endpoints and structured results-push endpoints). Worked alongside a *Jenkins*-based automated-testing helper app under development by the team.],
        [*Developed automated execution frameworks driven through CI/CD pipelines:* engineered Azure DevOps pipelines that provisioned Windows build agents to run *parallelized automated runs* against deployed applications and fed structured results back into work items. Performed *code review and standards enforcement* for the team.],
        [*DevSecOps / security scanning:* integrated *SonarQube* static analysis (SAST) into Azure DevOps pipelines and wrote a script that *queried the SonarQube REST API to flag vulnerabilities by keyword and surface them into Azure DevOps*. Ran *OWASP ZAP* dynamic scans (DAST) in pipelines, and evaluated *MicroFocus Fortify / ScanCentral* (SAST) for adoption.],
        [Drove a tooling consolidation (*LoadRunner → JMeter*) that *cut software licensing costs* while preserving capability, and contributed to *performance-optimization analysis of high-traffic deployed applications*.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "August 2017 – August 2019",
      title: "Team Lead / Technical Lead — Platform & Tooling",
      bullets: (
        [*Technical leadership of a cross-functional team* — led *Agile / Scrum* sprint planning, review, retrospective, daily stand-up, and backlog refinement; introduced poker-planning estimation and capacity forecasting; set engineering standards and drove delivery cadence.],
        [Implemented and deployed *custom web extensions in React / TypeScript / Node.js* — leading the work hands-on while guiding the team.],
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
        [Engineered *Dynamics CRM plug-ins, custom actions, and workflows in C\#* (rewriting legacy stored procedures as C\# / LINQ); used *SSIS* for ETL between iCase and Dynamics; produced *entity-relationship diagrams* and *multi-month effort-estimation breakdowns* and applied design patterns (Repository, Strategy, Mediator).],
        [*Established code-review processes gated on work items* — enforcing maintainability, security, and performance standards — and *mentored junior developers*.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer · Release Engineering Lead",
      bullets: (
        [Hired alongside one other engineer to take over a release-management environment from a contractor team. *Decommissioned over-engineered legacy C\# desktop apps* and replaced them with lightweight *PowerShell calling REST APIs* — most contractor tooling was simply deleted and *everything ended up in source control*.],
        [Implemented and deployed *web extensions in React / TypeScript / Node.js*; maintained a fork of Microsoft's `vsts-team-calendar` extension and contributed back upstream. *Installed, configured, customized, and upgraded* the Azure DevOps Server / TFS platform across dev / UAT / production — complex multi-step upgrades, *Kerberos / SPN configuration* across application tiers, and database-tier migration.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2008 – April 2014",
      title: "Full-Stack Developer — Legal Case Management System (iCase)",
      intro: [Core developer on the department's flagship *Legal Case Management System (iCase)* — a *distributed, multi-tier ASP.NET / C\# enterprise web platform* used by *5,000+ government lawyers and contracted agent firms across Canada*. *High-availability, fault-tolerant, and load-balanced:* deployed across *5 load-balanced web servers* and *11 regionally distributed document servers* nationwide, with role- and object-based security and integration to records-management, financial, and email systems, running *24/7*.],
      bullets: (
        [*Optimized a high-traffic backend:* diagnosed a homepage report taking ~10 s uncached — profiled with SQL Profiler, Report Execution logs, and execution plans, then replaced live joins with a nightly-populated flat table for a *~50× speedup uncached (3–4× cached)*. Built a *self-initiated availability-monitoring suite* across the distributed web and document servers, and diagnosed and resolved a *COM Interop memory leak* affecting the document tier. Co-led the *SQL Server 2005 → 2012* and *.NET Framework 2.0 → 4.0* upgrades.],
        [*Java automation-framework development:* architected a *Java-based framework (IBM Rational Functional Tester)* that *parsed English-language scenario documents into executable scripts with round-trip code generation*, plus a companion manager in *C\# / SQL Server*. Replaced a labour-intensive *two-week, ~20–25-person manual pre-release validation cycle* with automated execution reviewed by one person in five days — *~98% reduction in effort, ~\$160K saved per release cycle*.],
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

*Languages (language-agnostic toolkit):* *TypeScript / JavaScript (Node.js), C\#, Java, Python, SQL (T-SQL)*, PowerShell, Go (light), XML / XSLT

*Backend Frameworks:* *Node.js, Express, NestJS* · *.NET Core / .NET 6 / 8, ASP.NET Core, ADO.NET, Entity Framework, LINQ* · *Spring Boot* (familiarity)

*Distributed Systems & Concurrency:* *cloud-native microservices*, *event-driven & asynchronous messaging* (queue- / storage-triggered fan-out), *transactional concurrency control* (PostgreSQL `SELECT … FOR UPDATE`, SQL Server isolation levels), *load balancing across distributed tiers*, *24/7 high availability & fault tolerance*, availability monitoring

*APIs:* *RESTful API design between services* · *API gateway (Azure API Management)* — authentication, throttling, transformation · *API documentation from JSON-Schema contracts* (self-documenting) · *API security (OAuth 2.0 / OpenID Connect / PKCE, JWT)* · GraphQL, WebSocket

*Network Protocols:* HTTP / HTTPS, *TLS / certificate management*, WebSocket, TCP/IP fundamentals, DNS & IP provisioning (Terraform), *Kerberos / SPN* configuration across multi-tier deployments

*Databases & Data Modeling:* *SQL — MS SQL Server 2005 → 2019* (schema design, stored procedures, indexing, partitioning, execution-plan tuning), *Azure SQL, PostgreSQL* · *NoSQL — MongoDB* (working familiarity)

*Cloud, Containers & Serverless:* *Docker, Kubernetes / AKS, Red Hat OpenShift* · *Microsoft Azure* — *App Service, Azure Functions (serverless), AKS, Azure SQL, API Management, Key Vault, Managed Identities, Entra / AAD, Storage* · *AWS* — self-hosted pipeline-agent deployment + foundational training · *GCP* — TWNR production hosting

*DevOps / CI-CD:* *Azure DevOps Pipelines (YAML), GitHub Actions, Jenkins* · *Terraform* (IaC), *Ansible* · build, automated test, containerized deploy · Azure Data Factory (ETL)

*Security / DevSecOps:* *SonarQube* (SAST — pipeline integration + REST-API-driven vulnerability queries), *OWASP ZAP* (DAST) · *OAuth 2.0 / OpenID Connect / PKCE, JWT, Entra / AAD IAM, Managed Identities* · *Key Vault* secret hygiene · *ITSG-33 / PBMM controls*, CWE / CVSS-graded security audits

*Observability:* *Azure Monitor, Application Insights, Log Analytics* · Prometheus / Grafana (familiarity) · self-built distributed availability-monitoring suite

*Process / SDLC:* *Agile / Scrum (PSM I)* — daily stand-ups, sprint planning, review, backlog refinement · *full ownership from development/testing through code review to production support* · mentoring, technical documentation · ITIL v3 Foundation
