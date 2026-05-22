#import "template.typ": cv

#show: cv.with(
  tagline: "Senior Full-Stack Developer · .NET & React/TypeScript · Microsoft Azure · Dynamics 365 · DevOps · 15+ Years Government / Enterprise",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    Senior full-stack developer with *15+ years* shipping web applications end-to-end in *complex enterprise and Government of Canada* environments — Department of Justice, IRCC, ESDC. Deep on *.NET / C\#* server-side (n-tier ASP.NET serving 5,000+ users) and *React + TypeScript* on the front end (custom Azure DevOps web extensions, chess training app on the Lichess REST API, an end-to-end multiplayer web game shipped solo). *Microsoft Azure* fluency across PaaS — *Azure Functions, Azure SQL, Azure Storage, API Management, Key Vault, Entra/Azure AD* — and *event-driven / serverless* architectures. *Microsoft Dynamics CRM* delivery experience: engineered plug-ins, custom actions, and workflow processes in C\# as part of the iCase → Dynamics modernization at DoJ, and SSIS ETL between legacy and replacement systems. *CI/CD* in *Azure DevOps* and *GitHub Actions* (Docker, Kubernetes, ITSG-33 / PBMM controls); *automated testing* (unit, integration, Selenium UI). *Professional Scrum Master I*. Active Agile delivery — sprint planning, stand-ups, retrospectives, cross-functional collaboration with BAs, QA, designers. Currently operating as an independent contractor; available within ~1 week and open to relocation to Edmonton on contract award.
  ],
  experience: (
    (
      org: "Abrams Software",
      location: "Kingston / Toronto, Ontario",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [*TWNR* — *architected and shipped a multiplayer trading game as a full-stack web application, solo.* *React*-style component patterns on the front end (TypeScript); *Express + WebSocket* REST/event server on the back; *PostgreSQL* persistence with concurrency-correct transactions (`SELECT … FOR UPDATE`); *JWT auth*; *JSON-Schema-generated REST API contract* that doubles as live documentation. Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [*Chess Attack Visualization* — *React + TypeScript* training app consuming the *Lichess.org REST API*. Diagnosed a missing x-ray attacker feature in `chess.js` via React-lifecycle breakpoint debugging, opened #link("https://github.com/jhlywa/chess.js/pull/572")[upstream PR \#572], and published a fork as #link("https://www.npmjs.com/package/@pabrams/chess.js")[\@pabrams/chess.js] on npm. Live at #link("https://paulabrams.ca/chess-attack-visualization")[paulabrams.ca/chess-attack-visualization].],
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
        [Enhanced and maintained a *microservices* enterprise onboarding application — *C\# / .NET, Blazor, Azure SQL, Azure Functions, GraphQL*. Designed and consumed *REST APIs* between services; integrated with enterprise IAM via *Azure AD / Entra (OAuth 2.0, OpenID Connect)*; published and governed APIs through *Azure API Management* with authentication, throttling, and transformation policies.],
        [*Event-driven workflows* via *Azure Functions* — Blazor front-end submissions kicked off Functions that triggered ADO pipelines, applied ADO security and work-item updates, integrated with on-prem Active Directory via AAD Connect, and applied AAD group memberships based on personnel profile. Bulk submissions fanned out through asynchronous handoffs across the microservices.],
        [*Migrated the BDM Onboarding application's downstream identity* from rotating secrets (Key Vault entries + Azure DevOps PATs requiring 90-day rotation, with all auto-generated ADO work items attributed to a single person's identity) to *Azure Managed Identities* — service principals issued at runtime through Entra. Eliminated the secret-rotation incident class and properly attributed automated activity. Partnered with the Azure DevOps Services and Entra administrators on permission scoping.],
        [Designed and shipped *custom Azure DevOps web extensions* in *React, TypeScript, and Node.js* — a build/deploy analytics widget rendering success-rate charts via the ADO Builds REST API and Charts.js; a people-by-project reporter using an in-memory hashmap for tractable cross-referencing (the naive query pattern was unusably slow — a *performance* and *query-design* call); and a weekly work-item digest emailer driven by scheduled pipelines. Responsive UI, custom styling, accessibility-aligned interactions.],
        [Built *PowerShell tooling* against the Azure DevOps REST API to snapshot area paths, iteration paths, security configurations, and org-level state on a schedule and commit those snapshots into Git as a *configuration-drift detector* — automation that closed a gap no off-the-shelf product covered.],
        [*CI/CD pipelines* in Azure DevOps for build, test, *Docker* containerization, *Kubernetes* deployment, and *Azure Data Factory* (ETL) orchestration. Implemented *ITSG-33 (NIST-based) security controls* — TLS / SSL certificate management, secret hygiene via *Azure Key Vault* — for SA\&A submissions against a *PBMM* security profile. Daily *Git* workflow.],
        [Ran weekly *demos and design walkthroughs* for junior developers on Azure DevOps, Key Vault, app registration, and custom extensions. Active participant in *daily stand-ups* with BAs, QA, and developers.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead, Testing Services",
      bullets: (
        [Co-architected an *internal C\# / .NET web application* enabling QA staff and business analysts to author structured automated test scenarios via a web UI; designed the *SQL Server* schema and *co-designed the REST API on the web-app side* enabling bidirectional integration with Azure DevOps pipelines — script-fetch endpoints (versioned Selenium scripts generated on the fly from SQL) and results-push endpoints for structured test outcomes. Integrated with the departmental headless CMS platform.],
        [Engineered Azure DevOps *CI/CD pipelines* for *automated testing* — provisioned Windows agents to execute parallel *Selenium* UI tests against deployed applications and integrated logged test results back into ADO work items.],
        [Championed the departmental transition from *LoadRunner to JMeter*, reducing licensing costs while maintaining robust performance-testing capabilities. Code review and standards enforcement for the team.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "April 2018 – August 2019",
      title: "Team Lead / Technical Lead",
      bullets: (
        [Led *Agile / Scrum* sprint planning, review, retrospective, *daily stand-up*, and backlog refinement; pioneered capacity-planning and forecasting using Azure DevOps Server; introduced poker planning estimation across a cross-functional team.],
        [*Mentored developers* in *SQL Server query optimization* — query tuning, indexing strategy, partitioned tables, execution-plan analysis — against large TFS databases and warehouses. Also coached on SSRS and C\# / .NET.],
        [Implemented and deployed *custom web extensions in React / TypeScript / Node.js* with responsive layouts and accessibility-aligned interactions.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "January 2016 – March 2018",
      title: "Development Lead — iCase / Microsoft Dynamics CRM Modernization",
      bullets: (
        [Dev lead on the *Legal Case Management System (iCase)* — a large n-tier *ASP.NET / C\#* enterprise web application used by 5,000+ lawyers — while concurrently building its *Microsoft Dynamics CRM* successor. Modified iCase schema and front-end UI to surface migration status to users in real time, and adjusted the integration stored procedures (`icisp_*`) consumed by the department's SAP-based financial information system.],
        [Engineered *MS Dynamics CRM plug-ins, custom actions, and workflow processes* in *C\#*; rewrote SQL stored procedures as C\# with LINQ inside CRM; used *SSIS* for ETL between iCase and Dynamics. Applied design patterns (Repository, Strategy, Mediator) and clean-code refactoring. Deployments to Windows servers via both manual runbooks and scripted pipelines.],
        [Established *code-review processes* integrated directly with TFS work items — gating standards for maintainability, security, and performance — and mentored junior developers.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer",
      bullets: (
        [Hired alongside one other engineer to take over a *TFS / TFVC* release-management environment from a contractor team. *Decommissioned over-engineered legacy C\# desktop release-management apps* and replaced them with lightweight PowerShell scripts calling the *TFS REST APIs* — net result, most of the contractor tooling was simply deleted. *Everything about the application ended up in source control* — group memberships, permissions, repository access, process template customizations. Bias for action and ownership.],
        [Implemented and deployed Team Foundation Server *web extensions* in *React / TypeScript / Node.js*; maintained a fork of Microsoft's `vsts-team-calendar` extension with configurable colours, Outlook integration, release-management features, and IE-compatibility shims.],
        [Guided development teams in migrating from legacy XAML builds to modern, scriptable build definitions; deployed across Windows environments both manually and via automated pipelines.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2006 – March 2014",
      title: "Full-Stack Developer (2009–2014) · Software Development Engineer in Test (2008–2009)",
      intro: [Core contributor to the department's flagship *Legal Case Management System (iCase)* — a distributed multi-tier *ASP.NET / C\#* enterprise web application used by 5,000+ lawyers and agents across Canada (including external Crown agents). Multi-tier with role- and object-based security, integrated with records management, financial, and email systems, 24/7 high availability.],
      subroles: (
        (
          title: "Full-Stack Developer (2009–2014)",
          bullets: (
            [Led design and largely solo implementation of the *"My iCase" widget portal* — the new entry point to iCase, serving thousands of internal and external users. Ran JAD sessions, produced prototypes, authored BDD/TDD documentation. Built on *ASP.NET Web Parts and the Personalization framework* with a *custom SQL personalization provider*, *Knockout.js MVVM* on the front end (a direct ancestor of the *React* patterns I use today), async AJAX web-service calls, async HTTP handlers, ReportViewer in remote SSRS mode, and an HTML5 polyfill for the department-mandated IE8 environment.],
            [Diagnosed a homepage report taking \~10 s uncached: profiled with *SQL Profiler, Report Execution logs, and actual execution plans*, then replaced live joins with a flat table populated by a nightly job. *\~50× faster uncached, 3–4× faster cached.* Textbook *query-tuning through execution-plan analysis*.],
            [Built a *self-initiated availability-monitoring suite* for web and document servers because support staff were running checks manually evenings and weekends; eliminated significant overtime and reduced operational risk.],
            [Diagnosed and resolved a *COM Interop memory leak* on the document servers; built automated health monitoring to catch regressions.],
            [Co-led the *SQL Server 2005 → 2012* database upgrade including dev coordination and testing; rebuilt iCase's UI as a widget-based Knockout.js interface to eliminate full-page postbacks; contributed to the multi-year migration from *Crystal Reports to SSRS*, authoring 14 new SSRS reports for the Legal Risk Management module.],
          ),
        ),
        (
          title: "Software Development Engineer in Test (2008–2009)",
          bullets: (
            [Identified a critical regression-testing bottleneck and voluntarily architected a custom framework in *IBM Rational Functional Tester* that parsed English-language scenario documents and auto-generated executable test scripts.],
            [Replaced the department's *"all-hands" manual regression cycle* (\~20–25 testers running for two weeks every release) with one person reviewing automated results in five days. *\~98% reduction in release validation effort*, eliminated the standing 2-week code freeze per release, *saved an estimated \$160,000 per cycle*.],
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
