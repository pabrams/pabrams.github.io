#import "template.typ": cv

#show: cv.with(
  tagline: "Senior Full-Stack Developer · Next.js · React + TypeScript · .NET / Entity Framework · WCAG / AODA · 15+ Years Public Sector",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    Senior full-stack developer with *15+ years across the full SDLC* shipping *web-based B2B and B2C applications in client/server environments* across complex public-sector settings (Department of Justice, CIC/IRCC, ESDC). Strong on the *React + TypeScript* front end (custom Azure DevOps web extensions used across the GoC, a Chess Attack Visualization app on the Lichess REST API, ongoing contributions to a public *Next.js + React 19 + TypeScript* simulation site — JS → TS migration, branded-type unit testing, physics correctness fixes) and the *.NET / C\#* server side — n-tier *ASP.NET / ASP.NET MVC* serving 5,000+ legal users and contracted agents at DoJ; ORM and data-access work using *ADO.NET, Entity Framework, LINQ-to-SQL*, and CRM plug-ins with LINQ; *.NET Framework 2.0 / 3.5 / 4.0 / 4.5 / 5.0* and .NET 6/8 spanning roles. Deep Microsoft legacy + current toolchain — *Visual Studio 2005 / 2008 / 2010 / 2013 / 2015 / 2019 / 2022*, *MS SQL Server 2005, 2008, 2008R2, 2012, 2016, 2019, Azure SQL* with extensive *T-SQL stored-procedure* work, *IIS 7.0 / 8.0 / 10*, *HTML / CSS / XML / XSLT / JavaScript / jQuery / AJAX*, *Knockout.js MVVM* (a Razor / MVC homepage at iCase), some *WPF / WCF* and Windows / web services, *Crystal Reports / SSRS / SSIS*, strong OOP, *entity-relationship modelling*, and *FDD / TDD with detailed effort-estimation breakdowns* (multi-month, work-package level). *REST API* design end-to-end including a JSON-Schema-generated contract for a multiplayer game I shipped solo. *SQL* fluency across SQL Server, Azure SQL, and PostgreSQL — query tuning by execution-plan analysis, schema design, partitioning. *Node.js* via Express + WebSocket production server (TWNR), Vite-served clients, and Azure DevOps extensions. *Microsoft Azure* installation, configuration, customization, and extension experience including hands-on *Azure DevOps Server* (formerly TFS) upgrades through dev → UAT → prod, custom process-template authoring via XML/XSLT, and ADO web-extension authoring. *WCAG / accessibility-aware* delivery across custom ADO extensions and ESDC web applications. Began career as an IT procurement officer (PWGSC, DoJ, 2004–2008) before moving into software development. *Professional Scrum Master I*. *60+ public PRs* to outside repos (Microsoft `vsts-team-calendar`, `tfs-cli`, TypeScript-Website, MSAL .NET docs, `canada-ca/platform-security`, the physicshub Next.js site, others).
  ],
  experience: (
    (
      org: "Abrams Software",
      location: "Kingston / Toronto, Ontario",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [*Next.js + React 19 + TypeScript contributions* to #link("https://github.com/physicshub/physicshub.github.io")[`physicshub.github.io`] — a public physics-simulation site. Led a *JavaScript → TypeScript migration* of the core physics engine (ForceCalculator, ForceRenderer, PhysicsBody, InclinedPlaneBody, DragController, Spring, Time, Utils, Config). Introduced *branded nominal types* for physical units with accompanying TDD coverage. Fixed energy-conservation and boundary-collision bugs that had been latent in the simulation. Worked alongside the existing React component patterns (hooks, context, `@dnd-kit`, Motion, `react-ace`).],
        [*TWNR* — *architected and shipped a public-facing B2C multiplayer trading game as a full-stack web application, solo.* Dockerized *TypeScript pnpm monorepo*: *Node.js + Express + WebSocket* server backed by *PostgreSQL*, terminal-style xterm.js client served by Vite, individual player sign-up with *JWT auth*, *JSON-Schema-generated REST API contract* that doubles as live documentation. Concurrency-correct game state via PostgreSQL transactions (`SELECT … FOR UPDATE`). Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [*Chess Attack Visualization* — *React 19 + TypeScript* training app (Vite, `react-chessboard`, `react-testing-library` + Vitest/Jest unit tests) consuming the *Lichess.org REST API*, with a *NestJS* (the TypeScript decorator-based framework analogous to *Spring Boot*) auth proxy implementing the *OAuth2 PKCE* flow and *RxJS* reactive patterns. Diagnosed a missing x-ray attacker feature in `chess.js` via React-lifecycle breakpoint debugging, opened #link("https://github.com/jhlywa/chess.js/pull/572")[upstream PR \#572], and published a fork as #link("https://www.npmjs.com/package/@pabrams/chess.js")[\@pabrams/chess.js] on npm.],
        [*Portfolio site* at #link("https://paulabrams.ca")[paulabrams.ca] operated as *Astro on GitHub Pages with GitHub Actions* CI/CD.],
        [*LLM code evaluation* for #link("https://www.dataannotation.tech")[DataAnnotation.tech] and Stellar.ai — designing prompt fixtures and grading rubrics that probe specific model failure modes across *TypeScript, React, .NET / C\#, Ruby, Python, Go, Rust, and SQL*. Hands-on with codebases using *TanStack Query (\@tanstack/react-query)*, oRPC, NestJS, and modern React patterns. Security audits at known-vulnerable revisions with CWE/CVSS-graded inventories; adversarial unit tests; AI-assistant "skills" evaluated through controlled ablation.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Software Engineer, Infrastructure and Cloud Enablement (BDM Project)",
      bullets: (
        [Enhanced and maintained a *microservices* enterprise onboarding application serving *procurement, HR, and IT-ops personnel as internal customers* across the BDM project — *C\# / .NET, Blazor, Azure SQL, Azure Functions, GraphQL*. Designed and consumed *REST APIs* between services; integrated with enterprise IAM via *Azure AD / Entra (OAuth 2.0, OpenID Connect)*; published and governed APIs through *Azure API Management* with authentication, throttling, and transformation policies.],
        [Designed and shipped *custom Azure DevOps web extensions* in *React, TypeScript, and Node.js* — a build/deploy analytics widget rendering success-rate charts via the ADO Builds REST API and *Charts.js* (`react-chartjs-2` pattern); a people-by-project reporter using an in-memory hashmap for tractable cross-referencing (the naive query pattern was unusably slow — a *performance* and *query-design* call); and a weekly work-item digest emailer driven by scheduled pipelines. *Responsive UI, custom styling, WCAG-aligned interactions.*],
        [Migrated the BDM Onboarding application's downstream identity from rotating secrets (Key Vault + ADO PATs requiring 90-day rotation) to *Azure Managed Identities* — service principals issued at runtime through Entra. Eliminated the secret-rotation incident class and properly attributed automated activity.],
        [Built *PowerShell tooling* against the Azure DevOps REST API to snapshot org-level state on a schedule and commit those snapshots into Git as a *configuration-drift detector* — closing a gap no off-the-shelf product covered.],
        [*CI/CD pipelines* in Azure DevOps for build, test, *Docker* containerization, *Kubernetes* deployment, and *Azure Data Factory* orchestration. Implemented *ITSG-33 (NIST-based) security controls* for SA\&A submissions against a *PBMM* security profile. Daily Git workflow (feature branches, PR reviews, gated CI).],
        [Ensured *WCAG accessibility compliance* aligned with departmental standards across all delivered web extensions and dashboards. Connected *Power BI to ADO Analytics* for richer team reporting.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead, Testing Services",
      bullets: (
        [Co-architected an *internal C\# / .NET web application* enabling QA staff and business analysts to author structured automated test scenarios via a web UI; designed the *SQL Server* schema and *co-designed the REST API on the web-app side* enabling bidirectional integration with Azure DevOps pipelines — script-fetch endpoints (versioned Selenium scripts generated on the fly from SQL) and results-push endpoints for structured test outcomes. Integrated with the departmental headless CMS platform.],
        [Engineered Azure DevOps *CI/CD pipelines* for *automated testing* — provisioned Windows agents to execute parallel *Selenium UI tests* against deployed applications and integrated logged test results back into ADO work items. *Regression-testing fluency* across xUnit-style unit testing, Selenium UI, and JMeter performance.],
        [Championed the departmental transition from *LoadRunner to JMeter*, reducing licensing costs while maintaining robust performance-testing capabilities. Code review and standards enforcement for the team.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "August 2017 – August 2019",
      title: "Team Lead / Technical Lead",
      bullets: (
        [Led full *Agile / Scrum* delivery — sprint planning, review, retrospective, *daily stand-up*, backlog refinement, *iteration demos*, design walkthroughs; introduced poker planning estimation; pioneered capacity-planning and forecasting using *Azure DevOps Server*. *Translating business requirements into software code/implementations* through close BA partnership.],
        [Administered departmental *TFS / Azure DevOps Server* instances — installation, configuration, *multi-environment upgrades*, *Kerberos* re-configuration — and maintained heavily customized Agile, Scrum, and CMMI process templates (with XSLT-driven WIT XML transformations carried over from the prior tour); managed user/group security across multiple project collections.],
        [*Mentored developers* in *SQL Server query optimization* — query tuning, indexing strategy, partitioned tables, execution-plan analysis — against large TFS databases and warehouses. Also coached on SSRS and C\# / .NET.],
        [Implemented and deployed *custom web extensions in React / TypeScript / Node.js* with responsive layouts and accessibility-aligned interactions. Quickly resolved an *IIS deployment blocker* for a colleague trying to host an open-source web app — a memorable first-week unblock that recalled deep IIS 7 / 8 experience from prior Justice tours.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "December 2015 – August 2017",
      title: "Development Lead — iCase / Microsoft Dynamics CRM Modernization",
      bullets: (
        [Dev lead on the *Legal Case Management System (iCase)* — a large n-tier *ASP.NET / C\# / ADO.NET / .NET Framework 4.0* enterprise *web-based B2B / B2C client/server* application used by 5,000+ lawyers and contracted agents — while concurrently building its *Microsoft Dynamics CRM* successor. Modified iCase schema and front-end UI to surface migration status to users in real time; adjusted the *T-SQL stored procedures* (`icisp_*`) consumed by the department's SAP-based financial information system. Stack: *Visual Studio 2013*, *MS SQL Server 2008R2 / 2012*, *IIS 7 / 8*.],
        [Engineered *MS Dynamics CRM plug-ins, custom actions, and workflow processes* in *C\#*; *rewrote SQL stored procedures as C\# with LINQ inside CRM* — an *ORM-style data-access* pattern equivalent to Entity Framework in spirit; used *SSIS* for ETL between iCase and Dynamics. Configured *relationships between system and custom entities*, generated *entity-relationship diagrams* for the modelled domain, and performed *form customization with JavaScript* on the Dynamics CRM forms. Converted client requirements and functional specifications to technical design with *detailed effort-estimation breakdowns* prior to production. Applied design patterns (Repository, Strategy, Mediator) and clean-code refactoring.],
        [Established *code-review processes* integrated directly with TFS work items — gating standards for maintainability, security, and performance — and mentored junior developers.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer · TFS / Release Engineering Lead",
      bullets: (
        [Hired alongside one other engineer to take over a *TFS / TFVC* release-management environment from a contractor team. *Decommissioned over-engineered legacy C\# desktop release-management apps* and replaced them with lightweight *PowerShell* scripts calling the *TFS REST APIs* — net result, most of the contractor tooling was simply deleted. *Everything about the application ended up in source control* — group memberships, permissions, repository access, process template customizations. Used *XSLT-via-PowerShell* to transform Work Item Template (*WIT XML*) files for automated deployment of custom process templates across TFS project collections.],
        [Implemented and deployed Team Foundation Server *web extensions* in *React / TypeScript / Node.js*; maintained a fork of Microsoft's `vsts-team-calendar` extension with configurable colours, Outlook integration, release-management features, and IE-compatibility shims for the department's mandated browser; contributed back upstream. Some *.NET 3.5* exposure across contractor-built internal apps that this team inherited.],
        [Installed, configured, customized, and *upgraded Azure DevOps Server / TFS* across dev / UAT / production environments — multi-step upgrade paths, *Kerberos / SPN configuration* on TFS application tiers (without domain-controller access, coordinating with AD admins), database tier migration, and process-template re-customization on the upgraded version.],
        [Guided development teams in migrating from legacy *XAML builds to modern, scriptable build definitions*; wrote runbooks for TFS operation, maintenance, and troubleshooting. Led *Waterfall vs Agile SDLC* comparison sessions for departmental application teams.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2008 – April 2014",
      title: "Full-Stack Developer (2009–2014) · Software Development Engineer in Test (2008–2009)",
      intro: [Core contributor to the department's flagship *Legal Case Management System (iCase)* — a distributed multi-tier *ASP.NET / C\#* enterprise *web-based application in a client/server environment*, used by 5,000+ government lawyers and contracted agents across Canada. Role- and object-based security, integration with records management, the department's *SAP-based financial information system*, and email; 24/7 high availability. *B2B and B2C* flows — government lawyers (internal), agent firms contracted by DoJ that ran their own businesses and tracked their billing and timekeeping inside iCase (B2B), and downstream financial reconciliation across separate departmental organizations (B2B). Stack: *Visual Studio 2005 / 2008 / 2010*, *ASP.NET / ADO.NET*, *.NET Framework 2.0 (.NET 2.0.50727) → 4.0* (active participant in the upgrade), *MS SQL Server 2005 → 2008R2 → 2012* with extensive *T-SQL stored-procedure* work, *IIS 6 / 7 / 8*, *HTML / CSS / XML / XSLT / JavaScript / jQuery / AJAX*, *Crystal Reports → SSRS*.],
      subroles: (
        (
          title: "Full-Stack Developer (2009–2014)",
          bullets: (
            [Led design and largely solo implementation of the *"My iCase" widget portal* — the new entry point to iCase. Ran JAD sessions, produced prototypes, authored *FDD / TDD documentation with detailed multi-month, work-package-level effort-estimation breakdowns* prior to production implementation. Built on *ASP.NET Web Parts and the Personalization framework* with a *custom SQL personalization provider*, *Knockout.js MVVM* on the front end (a direct ancestor of modern React patterns), async *AJAX* and async HTTP handlers, ReportViewer in remote SSRS mode.],
            [*Evaluated Entity Framework* for adoption on the iCase platform — prototyped a next-generation iCase on *ASP.NET MVC3 with Razor and Entity Framework* to assess fit, then recommended *against* adoption given that the existing Repository Pattern over SQL Server stored procedures (called via *ADO.NET*) was meeting the application's needs. ORM judgment as much as ORM use.],
            [*Form customization with JavaScript / jQuery* across iCase — notable example: a timekeeping widget on the user homepage that captured agent billable hours inline, written against the underlying Web Parts and personalization model. Produced *entity-relationship diagrams* for the modelled domain prior to schema changes.],
            [Diagnosed a homepage report taking \~10 s uncached: profiled with *SQL Profiler, Report Execution logs, and execution plans*, then replaced live joins with a nightly flat table. *\~50× faster uncached, 3–4× faster cached.*],
            [Built a *self-initiated availability-monitoring suite* (early SRE-style intervention); diagnosed and resolved a *COM Interop memory leak* across document servers; co-led the *SQL Server 2005 → 2008R2 → 2012* upgrades (including stored-procedure changes needed for the 2005 → 2008R2 cutover) and the parallel *.NET Framework 2.0 → 4.0* upgrade; contributed to the *Crystal Reports → SSRS* migration (14 reports for Legal Risk Management). Hands-on with *IIS 6 / 7 / 8* configuration on dev web servers, coordinating with sysadmins to mirror non-default IIS properties through UAT and production.],
          ),
        ),
        (
          title: "Software Development Engineer in Test (2008–2009)",
          bullets: (
            [Voluntarily architected a custom Java-based framework in *IBM Rational Functional Tester* that parsed English-language scenario documents into executable scripts. Replaced a 2-week, 20–25-tester all-hands regression cycle with one person in five days. *\~98% reduction in release validation effort, \~\$160,000 saved per cycle*, eliminated the standing 2-week code freeze.],
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
    [DOJ Team Merit Award 2012 (Cost Recovery Process Improvement); Team Merit Award 2011 (Chart of Accounts); Team Spirit Award 2009],
  ),
)

#v(0.3em)
#text(size: 13pt, weight: "bold", fill: rgb("#1f4e79"), "Technical Skills")
#line(length: 100%, stroke: 0.4pt + rgb("#1f4e79"))
#v(-0.1em)

#set par(leading: 0.6em, spacing: 0.55em)

*Languages & Scripting:* C\#, TypeScript, JavaScript, SQL (T-SQL), HTML, CSS, XML, XSL / XSLT, jQuery, PowerShell, Ruby, Python, Go (light), Rust (light)

*.NET / Server-Side:* .NET Framework 2.0 / 3.5 / 4.0 / 4.5 / 5.0, .NET 6 / 8 / .NET Core, *ASP.NET, ASP.NET MVC, ADO.NET, Entity Framework, LINQ, Razor, Blazor, WCF, WPF, Windows & Web Services, AJAX*, NestJS, Express, Spring Boot (familiarity)

*Front-End / UI:* React 19, Next.js, TypeScript, Knockout.js MVVM, ASP.NET Web Forms + Web Parts, JSON, AJAX, jQuery, form customization via JavaScript on both ASP.NET and Dynamics CRM forms, responsive design, *WCAG / AODA accessibility*

*Databases:* MS SQL Server *2005, 2008, 2008R2, 2012, 2016, 2019*, Azure SQL, PostgreSQL · *stored procedures*, indexes, partitioning, execution-plan tuning, entity-relationship modelling and diagram production

*Web Servers / OS:* *IIS 6.0 / 7.0 / 8.0 / 10*, Windows Server 2008 / 2012 / 2016 / 2019, Linux (Arch / CachyOS)

*Reporting / ETL / BI:* *Crystal Reports, SSRS, SSIS*, Excel, Power BI

*Cloud / DevOps:* Microsoft Azure (App Service, Functions, SQL, APIM, Key Vault, Storage, Managed Identities, Entra / AAD, Data Factory), *Azure DevOps Server (TFS) — installation, configuration, customization, extension, and multi-environment upgrades* with Kerberos / SPN reconfiguration, Azure DevOps Services, Docker, Kubernetes, ITSG-33 / PBMM controls

*Source Control / CI/CD:* Git, GitHub Actions, Azure DevOps Pipelines (YAML), TFS / TFVC, XAML builds (legacy), feature branches and PR-gated CI

*Development Tools:* *Visual Studio 2005, 2008, 2010, 2013, 2015, 2019, 2022*, VS Code, Cursor, SQL Server Management Studio (2005 / 2008 / 2012 / current), MS Project

*Testing:* xUnit, NUnit, Vitest, Jest, React Testing Library, Selenium, Playwright, IBM Rational Functional Tester, JMeter

*SDLC / Methodology:* *Agile / Scrum* (PSM I), *Waterfall* (legacy / regulated environments), Kanban, *FDD / TDD with detailed multi-month, work-package-level effort-estimation breakdowns*, ITIL v3 Foundation, ITSG-33 / PBMM, WCAG / AODA
