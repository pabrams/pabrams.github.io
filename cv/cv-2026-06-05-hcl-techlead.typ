#import "template.typ": cv

#show: cv.with(
  tagline: "Technical Lead Engineer · React + TypeScript · NestJS / Node.js · Cloud-Native Microservices · CI/CD & Security · 15+ Years Leading Teams · Professional Scrum Master",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    *Hands-on technical lead* with *15+ years* building and leading the delivery of *web-based B2B and B2C applications* — full-stack on *React + TypeScript* front ends and *Node.js / NestJS / Express* and *.NET / C\#* service back ends, on *cloud-native microservices* architectures. Repeatedly trusted to *drive architecture, scalability, security, and engineering best practices* while *staying in the code* and *mentoring the team*: Team/Technical Lead and Development Lead roles across the Department of Justice, IRCC, and ESDC, leading sprint planning, code review, and design walkthroughs while shipping production features myself. Comfortable owning the full stack — *REST API design between services*, *Azure API Management* for publish/throttle/transform, enterprise *IAM via OAuth 2.0 / OpenID Connect / Entra*, *Azure Functions* event-driven workflows, *Docker / Kubernetes*, and *CI/CD pipelines* (Azure DevOps, GitHub Actions) — and collaborating across *Product, UX, and distributed stakeholders*. *Security-minded by default*: *ITSG-33 / PBMM* controls, TLS / certificate management, secret hygiene via *Key Vault*, migration to *Managed Identities*, and CWE / CVSS-graded security audits. *Recurring pattern*: self-initiated automation that pays back substantial labour cost (an *RFT* framework that cut a 2-week regression cycle ~98% / ~\$160K per release; a self-built availability-monitoring suite; *modernization by deletion*). *Professional Scrum Master I.* Active open-source contributor — *60+ public PRs* to outside repos including Microsoft's `vsts-team-calendar`, `tfs-cli`, the TypeScript-Website, MSAL .NET docs, and `canada-ca/platform-security`.
  ],
  experience: (
    (
      org: "Abrams Software",
      location: "Kingston / Toronto, Ontario (Remote)",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [*Chess Attack Visualization* — *React 19 + TypeScript* training app (Vite, `react-chessboard`, React Testing Library + *Vitest / Jest* unit tests) consuming the *Lichess.org REST API*, with a *NestJS* (TypeScript decorator-based framework analogous to *Spring Boot* / ASP.NET Core) auth proxy implementing the *OAuth2 PKCE* flow and *RxJS* reactive patterns. Diagnosed a missing x-ray attacker feature in `chess.js` via React-lifecycle breakpoint debugging, opened #link("https://github.com/jhlywa/chess.js/pull/572")[upstream PR \#572], and published a fork as #link("https://www.npmjs.com/package/@pabrams/chess.js")[\@pabrams/chess.js] on npm. Live at #link("https://paulabrams.ca/chess-attack-visualization")[paulabrams.ca/chess-attack-visualization].],
        [*TWNR* — *architected and shipped a public-facing B2C multiplayer trading game as a full-stack web application, solo.* Dockerized *TypeScript* pnpm monorepo: *Node.js (Express) + WebSocket* server backed by *PostgreSQL*, terminal-style *xterm.js* client served by Vite, per-player sign-up with *JWT auth*, and a *JSON-Schema-generated REST API contract* that doubles as live documentation. Concurrency-correct game state via PostgreSQL transactions (`SELECT … FOR UPDATE`). Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [*Portfolio site* at #link("https://paulabrams.ca")[paulabrams.ca] operated as *Astro on GitHub Pages with GitHub Actions* CI/CD.],
        [*LLM code evaluation* for #link("https://www.dataannotation.tech")[DataAnnotation.tech] and Stellar.ai — designing prompt fixtures and grading rubrics that probe specific model failure modes across *TypeScript, React, Node / NestJS, .NET / C\#, Ruby, Python, Go, Rust, and SQL*. Hands-on with codebases using *NestJS, TanStack Query (\@tanstack/react-query)*, oRPC, and modern React patterns; *security audits at known-vulnerable revisions with CWE / CVSS-graded inventories*; adversarial unit tests; AI-assistant "skills" evaluated through controlled ablation.],
        [*60+ public PRs* to outside repos — Microsoft's `vsts-team-calendar` and `tfs-cli`, the official TypeScript-Website, the *Microsoft Authentication Library .NET* docs, `canada-ca/platform-security`, the Dygma split-keyboard configurator, and others.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Software Engineer, Infrastructure and Cloud Enablement (BDM Project)",
      bullets: (
        [Enhanced and maintained a *cloud-native microservices* enterprise onboarding application serving *procurement, HR, and IT-ops* personnel as internal customers — *Blazor / C\# / .NET front and back end, Azure SQL, Azure Functions, GraphQL*. *Designed and consumed REST APIs between services*; integrated with enterprise IAM via *Azure AD / Entra (OAuth 2.0, OpenID Connect)*; *published and governed APIs through Azure API Management* with authentication, throttling, and transformation policies — the same architectural patterns I bring to *NestJS / Node.js* SaaS back ends.],
        [Designed and shipped *custom web extensions in React, TypeScript, and Node.js* — a build/deploy analytics widget rendering success-rate charts via the ADO Builds REST API and Charts.js; a people-by-project reporter using an in-memory hashmap for tractable cross-referencing (the naive query pattern was unusably slow); and a weekly work-item digest emailer driven by scheduled pipelines. Responsive UI, custom styling, accessibility-aligned interactions.],
        [*Event-driven workflows* via *Azure Functions* — Blazor front-end submissions kicked off Functions that triggered ADO pipelines, applied security and work-item updates, integrated with on-prem Active Directory via AAD Connect, and applied group memberships based on personnel profile. Bulk submissions fanned out through *asynchronous handoffs across the microservices*.],
        [*Application, network, and cloud security:* migrated the onboarding application's downstream identity from rotating secrets (Key Vault entries + ADO PATs on 90-day rotation) to *Azure Managed Identities* — service principals issued at runtime through Entra — eliminating the secret-rotation incident class and properly attributing automated activity. Implemented *ITSG-33 (NIST-based) controls* — TLS / SSL certificate management, secret hygiene via *Azure Key Vault* — for SA\&A submissions against a *PBMM* profile.],
        [*CI/CD pipelines* in Azure DevOps for build, test, *Docker* containerization, *Kubernetes* deployment, and *Azure Data Factory* (ETL) orchestration. Administered Azure DevOps for all BDM teams; advised on process templates, branching strategies, and PR workflows; connected *Power BI to ADO Analytics*; ensured *WCAG* compliance.],
        [*Mentored and guided engineers* — ran weekly *demos and design walkthroughs* for junior developers on Azure DevOps, Key Vault, app registration, custom extensions, and microservice integration patterns.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "April 2018 – August 2019",
      title: "Team Lead / Technical Lead",
      bullets: (
        [*Technical leadership of a cross-functional team* — led *Agile / Scrum* sprint planning, review, retrospective, daily stand-up, and backlog refinement; pioneered capacity-planning and forecasting; introduced poker-planning estimation. Set engineering standards and drove the team's delivery cadence.],
        [Implemented and deployed *custom web extensions in React / TypeScript / Node.js* with responsive layouts and accessibility-aligned interactions — leading the work hands-on while guiding the team.],
        [*Mentored developers* in *SQL Server query optimization* — query tuning, indexing strategy, partitioned tables, execution-plan analysis — against large databases and warehouses; coached on SSRS and C\# / .NET.],
        [Administered departmental *TFS / Azure DevOps Server* instances and maintained heavily customized Agile, Scrum, and CMMI process templates; managed user/group security across multiple project collections.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "January 2016 – March 2018",
      title: "Development Lead — iCase / Microsoft Dynamics CRM Modernization",
      bullets: (
        [*Dev lead* on the *Legal Case Management System (iCase)* — a large n-tier *ASP.NET / C\# / ADO.NET* enterprise web application used by 5,000+ lawyers — while concurrently building its *Microsoft Dynamics CRM* successor. Modified iCase schema and front-end UI to surface migration status in real time and adjusted the integration stored procedures consumed by the department's SAP-based financial system.],
        [*Drove architecture and engineering best practices:* applied design patterns (Repository, Strategy, Mediator) and clean-code refactoring; produced *entity-relationship diagrams* and *detailed multi-month effort-estimation breakdowns* (FDD/TDD) prior to implementation. Engineered *Dynamics CRM plug-ins, custom actions, and workflows* in *C\#*; used *SSIS* for ETL between iCase and Dynamics.],
        [*Established code-review processes* integrated directly with work items — gating standards for maintainability, security, and performance — and *mentored junior developers*.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead, Testing Services",
      bullets: (
        [Co-architected an *internal C\# / .NET web application* enabling QA staff and business analysts to author structured automated test scenarios via a web UI; designed the *SQL Server* schema and *co-designed the REST API* enabling bidirectional integration with Azure DevOps pipelines — script-fetch endpoints (versioned Selenium scripts generated on the fly) and results-push endpoints for structured outcomes.],
        [Engineered Azure DevOps *CI/CD pipelines for automated testing* — provisioned agents to execute *parallel Selenium UI tests* against deployed applications and integrated logged results back into work items. *Code review and standards enforcement* for the team.],
        [Championed the departmental transition from *LoadRunner to JMeter*, reducing licensing costs while maintaining robust performance testing.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer · TFS / Release Engineering Lead",
      bullets: (
        [Hired alongside one other engineer to take over a release-management environment from a contractor team. *Decommissioned over-engineered legacy C\# desktop apps* and replaced them with lightweight *PowerShell* scripts calling *REST APIs* — net result, most contractor tooling was simply deleted, and *everything about the application ended up in source control*. Bias for action and ownership.],
        [Implemented and deployed *web extensions in React / TypeScript / Node.js*; maintained a fork of Microsoft's `vsts-team-calendar` extension with configurable colours, Outlook integration, and release-management features; contributed back upstream.],
        [*Installed, configured, customized, and upgraded* the platform across dev / UAT / production — complex multi-step upgrade paths, *Kerberos / SPN configuration* on application tiers without DC access, and database-tier migration.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2006 – March 2014",
      title: "Full-Stack Developer (2009–2014) · Software Development Engineer in Test (2008–2009)",
      intro: [Core contributor to the department's flagship *Legal Case Management System (iCase)* — a distributed multi-tier *ASP.NET / C\#* enterprise *web-based B2B / B2C client/server* application used by 5,000+ government lawyers and contracted agent firms across Canada. Multi-tier with role- and object-based security, integrated with records-management, financial, and email systems, 24/7 high availability across regionally distributed document servers.],
      subroles: (
        (
          title: "Full-Stack Developer (2009–2014)",
          bullets: (
            [Led design and largely solo implementation of the *"My iCase" widget portal* — the new entry point to iCase. Ran JAD sessions, produced prototypes, authored BDD/TDD documentation. Built on *ASP.NET Web Parts* with a custom SQL personalization provider, *Knockout.js MVVM* on the front end (a direct ancestor of the *React* patterns I use today), and async AJAX web-service calls.],
            [*Performance engineering:* diagnosed a homepage report that took ~10 s uncached — profiled with SQL Profiler, Report Execution logs, and actual execution plans, then replaced live joins with a flat table populated by a nightly job. *~50× faster uncached, 3–4× faster cached.*],
            [Built a *self-initiated availability-monitoring suite* for web and document servers (an early SRE-style intervention); eliminated significant overtime and reduced operational risk. Diagnosed and resolved a *COM Interop memory leak* across the document servers.],
          ),
        ),
        (
          title: "Software Development Engineer in Test (2008–2009)",
          bullets: (
            [Voluntarily architected a custom Java-based framework in *IBM Rational Functional Tester (RFT)* that parsed English-language scenario documents and auto-generated executable test scripts. Replaced the department's *"all-hands" manual regression cycle* (~20–25 testers, two weeks per release) with one person reviewing automated results in five days — *~98% reduction in release-validation effort*, eliminated the standing 2-week code freeze, *saved an estimated \$160,000 per cycle*. Trained QA Specialists and co-op students; contributed *500+ posts* to the IBM Developerworks AFT forums.],
          ),
        ),
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

*Languages:* *TypeScript, JavaScript*, C\#, SQL (T-SQL), HTML, CSS, XML / XSLT, PowerShell, Ruby, Python, Go (light), Rust (light)

*Front-End / UI:* *React 19, TypeScript*, Next.js, Vite, RxJS, TanStack Query, Knockout.js MVVM, JSON, AJAX, jQuery, *responsive design, WCAG / AODA accessibility*

*Node / Server-Side:* *NestJS, Node.js, Express*, REST API design, GraphQL, WebSocket · *.NET 6 / 8 / .NET Core, ASP.NET / ASP.NET MVC, ADO.NET, Entity Framework, LINQ, Blazor* · Spring Boot (familiarity)

*Architecture:* *cloud-native microservices*, event-driven workflows, API gateway / management (Azure APIM), n-tier client/server, entity-relationship modelling, design patterns (Repository, Strategy, Mediator)

*Cloud / DevOps:* *Microsoft Azure* (App Service, Functions, SQL, APIM, Key Vault, Storage, Managed Identities, Entra / AAD, Data Factory) · cloud-agnostic architecture principles (AWS / GCP) · *Docker, Kubernetes* · Azure DevOps Server administration, customization & multi-environment upgrades

*Security:* *application, network, and cloud security* — OAuth 2.0 / OpenID Connect / PKCE, Entra / AAD IAM, TLS / certificate management, Key Vault secret hygiene, Managed Identities, *ITSG-33 / PBMM controls*, CWE / CVSS-graded security audits

*Source Control / CI/CD:* *Git, GitHub Actions*, Azure DevOps Pipelines (YAML), feature branches and PR-gated CI

*Databases:* PostgreSQL, Azure SQL, MS SQL Server *2005 → 2019* · stored procedures, indexing, partitioning, execution-plan tuning

*Testing:* *Jest, Vitest, React Testing Library*, Mocha (familiar), Playwright, Selenium, xUnit / NUnit, IBM Rational Functional Tester, JMeter

*Leadership / SDLC:* *technical leadership, mentoring, code review, architecture & estimation* · *Agile / Scrum* (PSM I), Kanban, FDD / TDD, Waterfall (regulated environments), ITIL v3 Foundation
