#import "template.typ": cv

#show: cv.with(
  location: "Toronto, Ontario",
  tagline: "Senior Cloud Application Specialist / Engineer · Microsoft Azure (App Service, Functions, AKS) · API-Driven Automation of Manual Processes · End-to-End CI/CD & DevSecOps · Docker / Kubernetes / OpenShift · Azure DevOps · Jenkins · Ansible · Terraform · 15+ Years",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    *Senior cloud application specialist with 15+ years designing, building, and operating cloud-native and distributed enterprise systems* across the Government of Canada — most recently a *cloud-native microservices* application on *Microsoft Azure (App Service, Azure Functions, AKS)*. *Signature pattern: replacing manual processes with code that drives RESTful APIs* — from *Terraform* infrastructure-as-code that provisions cloud infrastructure and IP addresses, to *PowerShell / TypeScript* tools calling REST APIs that deleted over-engineered legacy systems, to a script that *queries the SonarQube REST API to automate vulnerability triage into Azure DevOps*. Designs and consumes *REST APIs between services* and governs them through an *API gateway (Azure API Management)* with authentication, throttling, and transformation. *DevSecOps end-to-end:* designs and operates *CI/CD pipelines with integrated security* — *SonarQube* (SAST) and *OWASP ZAP* (DAST) in-pipeline, *CWE / CVSS-graded* audits, PR-gated release gates, and *ITSG-33 / PBMM* controls — with a track record of migrating downstream identity to *Azure Managed Identities* to eliminate a whole class of secret-rotation risk. Hands-on across *Docker, Kubernetes/AKS, Red Hat OpenShift, Jenkins, and Ansible*, with *enterprise cloud architecture, data engineering (ETL/ELT, Azure Data Factory), and observability (Azure Monitor, Application Insights, Log Analytics)*. Deep back-end in *.NET Core / C\#, Node.js / NestJS*, with *Java, Python, SQL, and TypeScript*. *Professional Scrum Master I.* Active open-source contributor — *60+ public PRs* including Microsoft's `vsts-team-calendar`, `tfs-cli`, and the *Microsoft Authentication Library .NET* docs.
  ],
  experience: (
    (
      org: "Abrams Software",
      location: "Toronto, Ontario (Remote)",
      dates: "August 2025 – Present",
      title: "Cloud Application Developer · Independent",
      bullets: (
        [*TWNR* — *architected and shipped a public-facing multiplayer game as a full-stack web application, solo.* Dockerized *TypeScript* monorepo: *Node.js (Express) + WebSocket* backend backed by *PostgreSQL*, per-player *JWT auth*, and a *JSON-Schema-generated REST API contract* that doubles as live documentation. Concurrency-correct state via PostgreSQL transactions (`SELECT … FOR UPDATE`). Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [*Chess Attack Visualization* — *React 19 + TypeScript* app consuming the *Lichess.org REST API*, with a *NestJS* (Spring Boot–style decorator framework) auth proxy implementing the *OAuth2 PKCE* flow. Diagnosed a missing feature in `chess.js`, opened #link("https://github.com/jhlywa/chess.js/pull/572")[upstream PR \#572], and published a fork on npm. *Portfolio site* operated as *Astro on GitHub Pages with GitHub Actions* CI/CD.],
        [*LLM code evaluation* for #link("https://www.dataannotation.tech")[DataAnnotation.tech] and Stellar.ai — prompt fixtures and grading rubrics across *.NET / C\#, Java, Python, TypeScript, React, Node / NestJS, Go, Rust, SQL, and MongoDB*, including *security audits with CWE / CVSS-graded inventories*. *60+ public PRs* to outside repos including the *Microsoft Authentication Library .NET* docs and `canada-ca/platform-security`.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Cloud Application Engineer — Cloud-Native Microservices (Benefits Delivery Modernization)",
      bullets: (
        [Enhanced and maintained a *cloud-native microservices* enterprise onboarding application — *.NET Core / C\# back end, Blazor front end, Azure SQL, Azure Functions, GraphQL* — serving procurement, HR, and IT-ops personnel. *Designed and consumed REST APIs between services* and *published and governed them through Azure API Management (API gateway)* with authentication, throttling, and transformation policies; integrated enterprise IAM via *Azure AD / Entra (OAuth 2.0, OpenID Connect)*.],
        [*Replaced manual processes with API-driven code:* wrote *Terraform* (infrastructure-as-code) to provision cloud infrastructure — *including IP-address allocation* — through provider REST APIs instead of manual configuration. Built *durable Azure Functions* that called the *Azure DevOps REST API* to create work items, run pipelines, and provision users in on-prem Active Directory (via AAD Connect) by personnel profile — *bulk submissions fanning out asynchronously across the microservices*, replacing manual onboarding steps.],
        [*End-to-end CI/CD with integrated security (DevSecOps):* operated *Azure DevOps pipelines* for build, *Docker* containerization, *Kubernetes / AKS* deployment, and *Azure Data Factory* (ETL/ELT) orchestration, with *SonarQube* (SAST) quality/security gates and PR-gated release controls. Completed formal *Red Hat OpenShift* training and *resolved OpenShift production-support tickets*; troubleshot an *Ansible*-driven provisioning pipeline for BDM onboarding-training environments; evaluated *Aqua* container security. Ensured pipelines met *ITSG-33 (NIST-based) controls* against a *PBMM* profile.],
        [*Enterprise security integration:* migrated the application's downstream identity from rotating secrets (Key Vault + ADO PATs on 90-day rotation) to *Azure Managed Identities* — eliminating the entire secret-rotation incident class and properly attributing automated activity. Managed *TLS / certificate hygiene* and *Key Vault* secrets.],
        [*Observability:* instrumented the Azure workloads with *Application Insights, Azure Monitor, and Log Analytics*; connected *Power BI to ADO Analytics* for delivery metrics. Shipped *custom web extensions in React / TypeScript / Node.js* against the ADO Builds REST API and mentored junior developers in weekly demos and design walkthroughs.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead, Testing Services — CI/CD Automation & DevSecOps",
      bullets: (
        [*Signature pattern — code against REST APIs to replace manual work:* co-designed a *REST API* bridging an internal *C\# / .NET* scenario-authoring web app with *Azure DevOps pipelines* (versioned script-fetch and structured results-push endpoints), and wrote a script that *queried the SonarQube REST API to flag vulnerabilities by keyword and surface them into Azure DevOps* — automating a manual security-review step. Worked alongside a *Jenkins*-based automated-testing helper app under development by the team.],
        [*DevSecOps in the pipeline:* integrated *SonarQube* static analysis (SAST) and *OWASP ZAP* dynamic scans (DAST) into Azure DevOps pipelines; evaluated *MicroFocus Fortify / ScanCentral* (SAST) for adoption. Engineered pipelines that provisioned Windows build agents for *parallelized automated runs* against deployed applications, feeding structured results back into work items.],
        [Drove a tooling consolidation (*LoadRunner → JMeter*) that *cut software licensing costs* while preserving capability; performed *code review and standards enforcement* and contributed to performance-optimization analysis of high-traffic applications.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "August 2017 – August 2019",
      title: "Team Lead / Technical Lead — Platform & Tooling",
      bullets: (
        [*Technical leadership of a cross-functional team* — led *Agile / Scrum* sprint planning, review, retrospective, daily stand-up, and backlog refinement; introduced poker-planning estimation; set engineering standards and drove delivery cadence.],
        [Implemented and deployed *custom web extensions in React / TypeScript / Node.js*; *mentored developers in SQL Server query optimization* — query tuning, indexing strategy, partitioned tables, and execution-plan analysis. Administered departmental *Azure DevOps Server / TFS* instances, customized process templates, and managed source-control security across multiple project collections.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "December 2015 – August 2017",
      title: "Acting Lead Developer — iCase / Microsoft Dynamics CRM Modernization",
      bullets: (
        [*Lead developer* on the live *Legal Case Management System (iCase)* — a large *n-tier ASP.NET / C\# / ADO.NET* enterprise web application used by *5,000+ lawyers* — while concurrently building its *Microsoft Dynamics CRM* successor. Modified schema and *front-end UI to surface data-migration status in real time*, and adjusted integration stored procedures consumed by the department's SAP-based financial system.],
        [Engineered *Dynamics CRM plug-ins, custom actions, and workflows in C\#* (rewriting legacy stored procedures as C\# / LINQ); used *SSIS* for *ETL* between iCase and Dynamics; produced *entity-relationship diagrams* and *effort-estimation breakdowns* (FDD / TDD). *Established code-review processes gated on work items* and *mentored junior developers*.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer · Release Engineering Lead",
      bullets: (
        [*Replacing manual processes via code and APIs:* hired alongside one other engineer to take over a release-management environment from a contractor team. *Decommissioned over-engineered legacy C\# desktop apps* and replaced them with lightweight *PowerShell calling REST APIs* — most contractor tooling was simply deleted and *everything ended up in source control*.],
        [Implemented and deployed *web extensions in React / TypeScript / Node.js*; maintained a fork of Microsoft's `vsts-team-calendar` extension and contributed back upstream. *Installed, configured, customized, and upgraded* the Azure DevOps Server / TFS platform across dev / UAT / production — complex multi-step upgrades, *Kerberos / SPN configuration*, and database-tier migration.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2008 – April 2014",
      title: "Full-Stack Developer — Legal Case Management System (iCase)",
      intro: [Core developer on the department's flagship *Legal Case Management System (iCase)* — a *distributed, multi-tier ASP.NET / C\# enterprise web platform* used by *5,000+ government lawyers and contracted agent firms across Canada*, deployed across *5 load-balanced web servers* and *11 regionally distributed document servers* with *24/7 high availability*.],
      bullets: (
        [*Optimized a high-traffic backend:* diagnosed a homepage report taking ~10 s uncached — profiled with SQL Profiler, Report Execution logs, and execution plans, then replaced live joins with a nightly-populated flat table for a *~50× speedup uncached (3–4× cached)*. Built a *self-initiated availability-monitoring suite* across the distributed web and document servers, and diagnosed and resolved a *COM Interop memory leak* on the document tier.],
        [*Java automation-framework development:* architected a *Java-based framework (IBM Rational Functional Tester)* that *parsed English-language scenario documents into executable scripts with round-trip code generation*, plus a companion manager in *C\# / SQL Server* — replacing a *two-week, ~20–25-person manual pre-release validation cycle* with automated execution reviewed by one person in five days (*~98% reduction in effort, ~\$160K saved per release cycle*).],
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

*Cloud:* *Microsoft Azure* — *App Service, Azure Functions (serverless), AKS, Azure SQL, API Management, Key Vault, Managed Identities, Entra / AAD, Storage, Data Factory* · *AWS* — self-hosted pipeline-agent deployment + foundational training · *GCP* — TWNR production hosting

*API-Driven Automation:* *writing code to drive RESTful APIs and replace manual processes* — *Terraform* IaC (infrastructure & IP provisioning via provider APIs), *Azure DevOps REST API* tooling, *SonarQube REST API* vulnerability automation, *PowerShell / TypeScript* REST clients · REST API design between services, GraphQL, WebSocket · API gateway / management (Azure API Management)

*CI/CD & DevOps:* *end-to-end CI/CD pipeline design* · *Azure DevOps Pipelines (YAML), GitHub Actions, Jenkins* · *Ansible* (provisioning-pipeline troubleshooting + config management) · *Docker, Kubernetes / AKS, Red Hat OpenShift* (training + production troubleshooting) · Azure Data Factory (ETL/ELT)

*DevSecOps / Security:* *integrated security in CI/CD* — *SonarQube* (SAST, pipeline + API automation), *OWASP ZAP* (DAST), MicroFocus Fortify / ScanCentral & Aqua (evaluated) · *OAuth 2.0 / OpenID Connect / PKCE, Entra / AAD IAM, Managed Identities* · TLS / certificate management, *Key Vault* secret hygiene, encryption · *ITSG-33 / PBMM controls*, CWE / CVSS-graded audits, compliance (SA\&A)

*Observability:* *Azure Monitor, Application Insights, Log Analytics* · Prometheus / Grafana (familiarity) · self-built distributed availability-monitoring suite · Power BI on ADO Analytics

*Enterprise Cloud Architecture:* *cloud-native microservices*, event-driven & async messaging (queue- / storage-triggered), serverless, load balancing & high availability across cloud & on-prem tiers, IAM & encryption, design patterns, entity-relationship modelling

*Languages & Back-End:* *.NET Core / C\#, Java, Python, SQL (T-SQL), TypeScript, JavaScript*, PowerShell, XML / XSLT, Go (light) · *ASP.NET Core, ADO.NET, Entity Framework, LINQ, Node.js, Express, NestJS, Spring Boot* (familiarity) · *React 19, Blazor*

*Databases / Data Engineering:* *MS SQL Server 2005 → 2019* (T-SQL, stored procedures, indexing, partitioning, execution-plan tuning), *Azure SQL, PostgreSQL* · *ETL/ELT* (Azure Data Factory, SSIS) · *MongoDB* (working familiarity)

*Process / SDLC:* *Agile / Scrum (PSM I)* · *structured methodologies* for design, development, implementation & maintenance · code review, mentoring, technical documentation · ITIL v3 Foundation
