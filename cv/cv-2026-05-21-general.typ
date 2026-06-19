#import "template.typ": cv

#show: cv.with(
  tagline: "Senior Full-Stack Developer · Web & Cloud · CI/CD · 15+ Years Government / Enterprise · Professional Scrum Master",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    Full-stack developer with *15+ years* of progressive experience building *web-based B2B and B2C applications in client/server environments*, modernizing legacy systems, and operating CI/CD pipelines at scale across the Government of Canada — Department of Justice, CIC / IRCC, ESDC (BDM). *Recurring pattern*: self-initiated automation that pays back substantial labour cost — an *IBM Rational Functional Tester* framework that eliminated a 2-week regression cycle (*\~98% reduction in release validation effort, \~\$160K saved per cycle*), a self-built availability-monitoring suite that replaced volunteer evening checks, scheduled tooling that closed gaps no off-the-shelf product covered, *modernization by deletion* (decommissioned contractor-built UI-driven release apps in favour of PowerShell against REST APIs). Strong on *.NET / C\#* server-side (n-tier *ASP.NET / ASP.NET MVC / ADO.NET / Entity Framework / LINQ* at 5,000+ users; *.NET Framework 2.0 / 3.5 / 4.0 / 4.5 / 5.0* and .NET 6/8 across roles), *React + TypeScript* on the front end (custom Azure DevOps web extensions, chess training app, end-to-end multiplayer web game shipped solo), and *Microsoft Azure* PaaS (Functions, Storage, SQL, APIM, Key Vault, Entra) alongside *Azure DevOps Server (TFS)* installation, configuration, customization, and multi-environment *upgrades*. Deep Microsoft toolchain: *Visual Studio 2005 → 2022*, *MS SQL Server 2005 / 2008 / 2008R2 / 2012 / 2016+*, *IIS 7 / 8 / 10*, *HTML / CSS / XML / XSLT / JavaScript / jQuery / AJAX*, *Crystal Reports / SSRS / SSIS*, OOP, *entity-relationship modelling*, *FDD/TDD with multi-month work-package-level effort-estimation breakdowns*. Comfortable in regulated environments — *ITSG-33 / PBMM*, *WCAG / AODA*, *ITIL*. *Professional Scrum Master I*. Active open-source contributor (60+ public PRs to outside repos including Microsoft's `vsts-team-calendar`, `tfs-cli`, the TypeScript-Website, MSAL .NET docs, and `canada-ca/platform-security`).
  ],
  experience: (
    (
      org: "Abrams Software",
      location: "Kingston / Toronto, Ontario (Remote)",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [*TWNR* — *architected and shipped a public-facing B2C multiplayer trading game as a full-stack web application, solo.* Dockerized *TypeScript* pnpm monorepo: *Express + WebSocket* server backed by *PostgreSQL*, terminal-style *xterm.js* client served by Vite, individual player sign-up with *JWT auth*, *JSON-Schema-generated REST API contract* that doubles as live documentation. Concurrency-correct game state via PostgreSQL transactions (`SELECT … FOR UPDATE`). Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [*Chess Attack Visualization* — *React + TypeScript* training app consuming the *Lichess.org REST API*. Diagnosed a missing x-ray attacker feature in `chess.js` via React-lifecycle breakpoint debugging, opened #link("https://github.com/jhlywa/chess.js/pull/572")[upstream PR \#572], and published a fork as #link("https://www.npmjs.com/package/@pabrams/chess.js")[\@pabrams/chess.js] on npm. Live at #link("https://paulabrams.ca/chess-attack-visualization")[paulabrams.ca/chess-attack-visualization].],
        [*Portfolio site* at #link("https://paulabrams.ca")[paulabrams.ca] operated as *Astro on GitHub Pages with GitHub Actions* CI/CD.],
        [*LLM code evaluation* for #link("https://www.dataannotation.tech")[DataAnnotation.tech] and Stellar.ai — designing prompt fixtures and grading rubrics that probe specific model failure modes across *.NET / C\#, TypeScript, React, Ruby, Python, Go, Rust, and SQL*, including security audits at known-vulnerable revisions with CWE/CVSS-graded inventories, adversarial unit tests, and AI-assistant "skills" evaluated through controlled ablation.],
        [*60+ public PRs* to outside repos — Microsoft's `vsts-team-calendar` and `tfs-cli`, the official TypeScript-Website, the *Microsoft Authentication Library .NET* docs, `canada-ca/platform-security`, the Dygma split-keyboard configurator, and others.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Software Engineer, Infrastructure and Cloud Enablement (BDM Project)",
      bullets: (
        [Enhanced and maintained a *microservices* enterprise onboarding application serving *procurement, HR, and IT-ops personnel as internal customers* across the BDM project — *C\# / .NET, Blazor, Azure SQL, Azure Functions, GraphQL*. Designed and consumed *REST APIs* between services; integrated with enterprise IAM via *Azure AD / Entra (OAuth 2.0, OpenID Connect)*; published and governed APIs through *Azure API Management* with authentication, throttling, and transformation policies.],
        [*Event-driven workflows* via *Azure Functions* — Blazor front-end submissions kicked off Functions that triggered ADO pipelines, applied ADO security and work-item updates, integrated with on-prem Active Directory via AAD Connect, and applied AAD group memberships based on personnel profile. Bulk submissions fanned out through asynchronous handoffs across the microservices.],
        [*Migrated the BDM Onboarding application's downstream identity* from rotating secrets (Key Vault entries + Azure DevOps PATs requiring 90-day rotation, with all auto-generated ADO work items attributed to a single person's identity) to *Azure Managed Identities* — service principals issued at runtime through Entra. Eliminated the secret-rotation incident class and properly attributed automated activity. Partnered with the Azure DevOps Services and Entra administrators on permission scoping.],
        [Designed and shipped *custom Azure DevOps web extensions* in *React, TypeScript, and Node.js* — a build/deploy analytics widget rendering success-rate charts via the ADO Builds REST API and Charts.js; a people-by-project reporter using an in-memory hashmap for tractable cross-referencing (the naive query pattern was unusably slow); and a weekly work-item digest emailer driven by scheduled pipelines. Responsive UI, custom styling, accessibility-aligned interactions.],
        [Built *PowerShell tooling* against the Azure DevOps REST API to snapshot area paths, iteration paths, security configurations, and org-level state on a schedule and commit those snapshots into Git as a *configuration-drift detector* — automation that closed a gap no off-the-shelf product covered.],
        [*CI/CD pipelines* in Azure DevOps for build, test, *Docker* containerization, *Kubernetes* deployment, and *Azure Data Factory* (ETL) orchestration. Implemented *ITSG-33 (NIST-based) security controls* — TLS / SSL certificate management, secret hygiene via *Azure Key Vault* — for SA\&A submissions against a *PBMM* security profile.],
        [Administered *Azure DevOps Services* for all BDM teams; advised on custom Agile / Scrum / CMMI process templates, branching strategies, PR workflows; connected *Power BI to ADO Analytics* for richer reporting; ensured *WCAG* accessibility compliance aligned with departmental standards.],
        [Ran weekly *demos and design walkthroughs* for junior developers on Azure DevOps, Key Vault, app registration, and custom extensions.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead, Testing Services",
      bullets: (
        [Co-architected an *internal C\# / .NET web application* enabling QA staff and business analysts to author structured automated test scenarios via a web UI; designed the *SQL Server* schema and *co-designed the REST API on the web-app side* enabling bidirectional integration with Azure DevOps pipelines — script-fetch endpoints (versioned Selenium scripts generated on the fly from SQL) and results-push endpoints for structured test outcomes. Integrated with the departmental headless CMS platform.],
        [Engineered Azure DevOps *CI/CD pipelines for automated testing* — provisioned Windows agents to execute parallel *Selenium UI tests* against deployed applications and integrated logged test results back into ADO work items.],
        [Championed the departmental transition from *LoadRunner to JMeter*, reducing licensing costs while maintaining robust performance-testing capabilities. Code review and standards enforcement for the team.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "August 2017 – August 2019",
      title: "Team Lead / Technical Lead",
      bullets: (
        [Led *Agile / Scrum* sprint planning, review, retrospective, *daily stand-up*, and backlog refinement; pioneered capacity-planning and forecasting using Azure DevOps Server; introduced poker planning estimation across a cross-functional team.],
        [Administered departmental *TFS* instances and maintained heavily customized Agile, Scrum, and CMMI process templates; managed user/group security across multiple project collections.],
        [*Mentored developers* in *SQL Server query optimization* — query tuning, indexing strategy, partitioned tables, execution-plan analysis — against large TFS databases and warehouses. Also coached on SSRS and C\# / .NET.],
        [Implemented and deployed *custom web extensions in React / TypeScript / Node.js* with responsive layouts and accessibility-aligned interactions.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "December 2015 – August 2017",
      title: "Development Lead — iCase / Microsoft Dynamics CRM Modernization",
      bullets: (
        [Dev lead on the *Legal Case Management System (iCase)* — a large n-tier *ASP.NET / C\# / ADO.NET / .NET Framework 4* enterprise web application used by 5,000+ lawyers — while concurrently building its *Microsoft Dynamics CRM* successor. Modified iCase schema and front-end UI to surface migration status to users in real time, and adjusted the integration stored procedures (`icisp_*`) consumed by the department's SAP-based financial information system. Stack also: *Visual Studio 2013, MS SQL Server 2008R2 / 2012, IIS 7 / 8*.],
        [Engineered *MS Dynamics CRM plug-ins, custom actions, and workflow processes* in *C\#*; rewrote SQL stored procedures as C\# with LINQ inside CRM; used *SSIS* for ETL between iCase and Dynamics. Set up *relationships between system and custom entities*; performed *form customization with JavaScript* on CRM forms; produced *entity-relationship diagrams* and *detailed multi-month effort-estimation breakdowns* (FDD/TDD) prior to implementation. Applied design patterns (Repository, Strategy, Mediator) and clean-code refactoring.],
        [Established *code-review processes* integrated directly with TFS work items — gating standards for maintainability, security, and performance — and mentored junior developers.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer · TFS / Release Engineering Lead",
      bullets: (
        [Hired alongside one other engineer to take over a *TFS / TFVC* release-management environment from a contractor team. *Decommissioned over-engineered legacy C\# desktop release-management apps* and replaced them with lightweight *PowerShell* scripts calling the *TFS REST APIs* — net result, most of the contractor tooling was simply deleted. *Everything about the application ended up in source control* — group memberships, permissions, repository access, process template customizations. Bias for action and ownership. Used *XSLT-via-PowerShell* to transform Work Item Template (WIT) XML for automated deployment of custom *TFS process templates*.],
        [*Installed, configured, customized, and upgraded TFS / Azure DevOps Server* across dev / UAT / production environments — complex multi-step upgrade paths, *Kerberos / SPN configuration* on application tiers without domain-controller access (coordinated with AD admins), database-tier migration, and process-template re-customization post-upgrade.],
        [Implemented and deployed Team Foundation Server *web extensions* in *React / TypeScript / Node.js*; maintained a fork of Microsoft's `vsts-team-calendar` extension with configurable colours, Outlook integration, release-management features, and IE-compatibility shims for the department's mandated browser; contributed back upstream.],
        [Guided development teams in migrating from legacy *XAML builds to modern, scriptable build definitions*; ran *Waterfall vs Agile* SDLC comparison sessions; wrote runbooks for TFS operation, maintenance, and troubleshooting so the work could be handed off cleanly.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2008 – April 2014",
      title: "Full-Stack Developer (2009–2014) · Software Development Engineer in Test (2008–2009)",
      intro: [Core contributor to the department's flagship *Legal Case Management System (iCase)* — a distributed multi-tier *ASP.NET / C\#* enterprise *web-based B2B / B2C client/server* application used by 5,000+ government lawyers and contracted agent firms across Canada (agents ran their own businesses and tracked billing and timekeeping inside iCase — B2B; financial integration also crossed organizational lines within the department). Multi-tier with role- and object-based security, integrated with records management, financial, and email systems, 24/7 high availability across regionally distributed document servers. Stack: *Visual Studio 2005 / 2008 / 2010, ASP.NET / ADO.NET, .NET Framework 2.0 → 4.0, MS SQL Server 2005 → 2008R2 → 2012, IIS 6 / 7 / 8, HTML / CSS / XML / XSLT / JavaScript / jQuery / AJAX, Crystal Reports → SSRS*.],
      subroles: (
        (
          title: "Full-Stack Developer (2009–2014)",
          bullets: (
            [Led design and largely solo implementation of the *"My iCase" widget portal* — the new entry point to iCase. Ran JAD sessions, produced prototypes, authored BDD/TDD documentation. Built on *ASP.NET Web Parts and the Personalization framework* with a *custom SQL personalization provider*, *Knockout.js MVVM* on the front end (a direct ancestor of the *React* patterns I use today), async AJAX web-service calls, async HTTP handlers, ReportViewer in remote SSRS mode, and an HTML5 polyfill for the department-mandated IE8.],
            [Diagnosed a homepage report that took \~10 s uncached: profiled with *SQL Profiler, Report Execution logs, and actual execution plans*, then replaced live joins with a flat table populated by a nightly job. *\~50× faster uncached, 3–4× faster cached.*],
            [Built a *self-initiated availability-monitoring suite* for web and document servers (an early SRE-style intervention before the term was widely used); eliminated significant overtime and reduced operational risk.],
            [Diagnosed and resolved a *COM Interop memory leak* across the document servers; built automated health monitoring to catch regressions.],
            [Co-led the *SQL Server 2005 → 2012* database upgrade; migrated core business modules from VB.NET to C\#; contributed to the *Crystal Reports → SSRS* migration including 14 SSRS reports for the Legal Risk Management module.],
          ),
        ),
        (
          title: "Software Development Engineer in Test (2008–2009)",
          bullets: (
            [Identified a critical regression-testing bottleneck and voluntarily architected a custom Java-based framework in *IBM Rational Functional Tester (RFT)* that parsed English-language scenario documents and auto-generated executable test scripts. Pivoted from VB.NET to Java on advice from IBM Support.],
            [Replaced the department's *"all-hands" manual regression cycle* (\~20–25 testers running for two weeks every release) with one person reviewing automated results in five days. *\~98% reduction in release validation effort*, eliminated the standing 2-week code freeze per release, *saved an estimated \$160,000 per cycle*.],
            [Wrote a separate test manager in C\# and SQL Server. Built *round-trip code generation*: the framework could also reproduce updated English-language scenarios from the script source. Trained QA Specialists and co-op students. Contributed *500+ posts* to the IBM Developerworks Automated Functional Testing forums.],
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
