#import "template.typ": cv

#show: cv.with(
  tagline: "Senior Backend Engineer · Node.js & TypeScript Microservices · Azure (Functions, APIM, Key Vault, SQL) · CI/CD, Docker & Kubernetes · Model-Endpoint Integration",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    Senior backend engineer with 15+ years designing, building, and operating enterprise web systems — including a four-year run on a *microservices* enterprise platform in *Azure*. Strong on *Node.js and TypeScript* in production (Express + WebSocket REST/event servers, multiple Azure DevOps extensions deployed against live REST APIs, a JSON-Schema-generated REST contract that doubles as live documentation). Deep hands-on with *Azure services* — *Azure Functions* and Logic Apps for event-driven workloads, *Azure SQL* and SQL Server with tuned execution plans, *Azure API Management* for published/governed APIs, *Azure Key Vault* for secret hygiene, *Azure AD / Entra* for OAuth 2.0 / OpenID Connect, *Azure Data Factory* for ETL — combined with *CI/CD* pipelines in *Azure DevOps* and *GitHub Actions*, *Docker* containerization, and *Kubernetes* deployment. Routinely integrate with model/LLM endpoints: my current contract designs prompt fixtures and grading rubrics that *wrap, exercise, and evaluate model endpoints* for correctness, security, and operational reliability. Strong on *observability and operational excellence* (self-built availability-monitoring suites, COM Interop leak diagnosis, configuration-drift detection committed to Git). *Professional Scrum Master I*, comfortable in *daily stand-ups* and *Azure DevOps* workflows, with a long record of *mentoring* developers in code review, SQL tuning, and CI/CD. Active open-source contributor (60+ public PRs).
  ],
  experience: (
    (
      org: "Abrams Software",
      location: "Kingston / Toronto, Ontario",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [*TWNR* — architected and shipped a *Node.js / TypeScript* multiplayer trading game with a service-decomposed back end, solo. *Express + WebSocket* REST/event server; *PostgreSQL* persistence with concurrency-correct transactions (`SELECT … FOR UPDATE`); *JWT* auth; *JSON-Schema-generated REST API contract* that doubles as live documentation; React-style components on the front end. Idea → design → build → deploy in tight iterations. Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [*Wrapping and evaluating LLM model endpoints* for #link("https://www.dataannotation.tech")[DataAnnotation.tech] and Stellar.ai. Designed prompt fixtures and grading rubrics that *exercise model endpoints* under reproducible conditions and grade outputs against pre-authored ground truth — security audits at known-vulnerable revisions (CWE/CVSS-graded), refactor tasks that grade for code _deletion_, adversarial unit tests that separate "fixes the code" from "fixes the tests", and AI-assistant "skills" evaluated by running the same task with and without them. Same operational shape as wrapping ML/model endpoints *reliably, observably, and securely*.],
        [*Daily, hands-on use of AI in development* — Claude Code, GitHub Copilot, Cursor, Gemini CLI — across Node.js/TypeScript, C\#, Python, Go, Rust, SQL. Routine workflow: scope a feature, prompt, review and refine generated code, run it against unit tests, audit for security and performance, ship.],
        [*chess.js x-ray attacker support* — diagnosed a missing feature with React-lifecycle breakpoint debugging, opened #link("https://github.com/jhlywa/chess.js/pull/572")[upstream PR \#572], and published a fork as #link("https://www.npmjs.com/package/@pabrams/chess.js")[\@pabrams/chess.js] on npm. Powers #link("https://paulabrams.ca/chess-attack-visualization")[Chess Attack Visualization], a *React + TypeScript* training app consuming the Lichess.org REST API.],
        [*60+ public PRs* to outside repos — Microsoft's `vsts-team-calendar` and `tfs-cli`, the official TypeScript-Website, the *Microsoft Authentication Library .NET* docs, `canada-ca/platform-security`, and others. Comfortable jumping into unfamiliar codebases — exactly the discipline a two-service modernization across rules engine and model endpoints demands.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Software Engineer, Infrastructure and Cloud Enablement (BDM Project)",
      bullets: (
        [Enhanced and maintained a *microservices enterprise onboarding application* on *Azure* — designed and consumed *REST APIs* between services, integrated with enterprise IAM via *Azure AD / Entra* (*OAuth 2.0, OpenID Connect*), and published / governed those APIs through *Azure API Management* with authentication, throttling, and transformation policies. Stack spanned *C\# / .NET, Blazor, Azure Functions, Azure SQL, GraphQL,* and *Azure Logic Apps* — directly analogous to the *Risking + Model Services* ecosystem with its rules engine and ML endpoints.],
        [Designed and shipped *custom Azure DevOps web extensions* in *Node.js, TypeScript, and React* — a build/deploy analytics widget that renders success-rate charts from the ADO Builds REST API; a people-by-project reporter that swaps a slow query pattern for an in-memory hashmap (*performance* and *query-design* call); and a weekly work-item digest emailer driven by *scheduled Azure Pipelines*. Production *Node.js + TypeScript* against live Azure REST APIs.],
        [Built *PowerShell tooling* against the Azure DevOps REST API to snapshot area paths, iteration paths, security configurations, and org-level state on a schedule and commit those snapshots into Git as a *configuration-drift detector* — observability automation that closed a gap no off-the-shelf product covered.],
        [*CI/CD pipelines* in *Azure DevOps* for build, test, *Docker* containerization, *Kubernetes* deployment, and *Azure Data Factory* (ETL) orchestration. Implemented *ITSG-33 (NIST-based) security controls* — TLS / SSL certificate management and secret hygiene via *Azure Key Vault* — for SA\&A submissions against a *PBMM* security profile. Daily *Git* workflow.],
        [Ran weekly *demos and design walkthroughs* for junior developers on Azure DevOps, Key Vault, app registration, and custom extension architecture. Active in *daily stand-ups* with product owners, BAs, QA, and engineering.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead, Testing Services",
      bullets: (
        [Co-architected an *internal C\# / .NET web application* enabling QA staff to author structured test scenarios via a web UI; designed the *SQL Server* schema and built the *REST API* integration with Azure DevOps. Integrated with the departmental headless CMS platform.],
        [Engineered Azure DevOps *CI/CD pipelines* for *automated testing* — provisioned Windows agent machines to execute parallel *Selenium* UI tests against deployed applications and integrated logged test results back into ADO work items. *Testing-pyramid* discipline: unit tests at the bottom, targeted integration tests in the middle, automated UI tests sparingly at the top.],
        [Championed the departmental transition from *LoadRunner to JMeter*, reducing licensing costs while maintaining robust performance-testing capabilities. *Code review* and standards enforcement for the team.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "April 2018 – August 2019",
      title: "Team Lead / Technical Lead",
      bullets: (
        [Led *Agile / Scrum* sprint planning, review, retrospective, *daily stand-up*, and backlog refinement; pioneered capacity-planning and forecasting using Azure DevOps Server; introduced poker planning estimation.],
        [*Mentored developers* in *SQL Server query optimization* (T-SQL, indexing, partitioned tables, execution-plan analysis) against large TFS databases and warehouses. Coached on SSRS and C\# / .NET. Active *technical mentoring* and code-review culture.],
        [Implemented and deployed *custom web extensions in Node.js, TypeScript, and React* with responsive layouts; administered departmental TFS instances and customized Agile/Scrum/CMMI process templates.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "January 2016 – March 2018",
      title: "Development Lead",
      bullets: (
        [Dev lead on the *Legal Case Management System (iCase)* — a large n-tier *ASP.NET / C\#* enterprise web application used by 5,000+ lawyers — while concurrently building its *Microsoft Dynamics CRM* successor. Modified the iCase schema and front-end UI to surface migration status to users in real time; adjusted *SQL Server stored procedures* consumed by the *financial information system* — direct experience aligning *technical decisions to business outcomes* in a regulated, risk-sensitive context.],
        [Engineered MS Dynamics CRM *plug-ins, custom actions, and workflow processes* in *C\#*; rewrote SQL stored procedures as C\# with LINQ; used SSIS for ETL between iCase and Dynamics. Applied *design patterns* (Repository, Strategy, Mediator) and clean-code refactoring.],
        [Established *code-review processes* integrated directly with TFS work items — gating standards for maintainability, security, and performance — and *mentored junior developers* one-on-one.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer",
      bullets: (
        [Hired alongside one other engineer to take over a *TFS* release-management environment from a contractor team. *Decommissioned over-engineered legacy C\# desktop release-management apps* and replaced them with lightweight *PowerShell scripts calling the TFS REST APIs* — net result, most of the contractor tooling was simply deleted. *Bias for action and ownership.*],
        [Implemented and deployed Team Foundation Server *web extensions in Node.js, TypeScript, and React*; maintained a fork of Microsoft's `vsts-team-calendar` extension with configurable colours, Outlook integration, release-management features, and IE-compatibility shims for the department's mandated browser. UI work end-to-end.],
        [Guided development teams in migrating from legacy XAML builds to modern, scriptable *build/release definitions*; deployed across Windows environments both manually and via automated pipelines; wrote runbooks for TFS operation, maintenance, and troubleshooting.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2006 – March 2014",
      title: "Full-Stack Developer (2009–2014) · Software Development Engineer in Test (2008–2009)",
      intro: [Core contributor to the department's flagship *Legal Case Management System (iCase)* — a distributed multi-tier *ASP.NET / C\#* enterprise web application used by 5,000+ lawyers and agents across Canada. Multi-tier with role- and object-based security, integrated with records management, financial, and email systems, 24/7 high availability.],
      subroles: (
        (
          title: "Full-Stack Developer (2009–2014)",
          bullets: (
            [Led development of the *"My iCase" widget portal* — the new entry point to iCase. Gathered requirements, ran JAD sessions, produced prototypes, authored BDD/TDD documentation, and implemented the application largely solo. ASP.NET Web Parts with a *custom SQL personalization provider*; *Knockout.js MVVM* on the front end (a direct ancestor of the TypeScript/React patterns I use today); async AJAX web-service calls; an async HTTP handler that served images from cached business objects.],
            [Diagnosed a homepage report taking \~10 s uncached: profiled with *SQL Profiler, Report Execution logs, and actual execution plans*, then replaced live joins with a flat table populated by a nightly job. *\~50× faster uncached, 3–4× faster cached.* Textbook *query-tuning through execution-plan analysis*.],
            [Built a *self-initiated availability-monitoring suite* for web and document servers because support staff were running checks manually evenings and weekends — eliminated significant overtime and reduced operational risk. *Observability and operational excellence* baked in from the start.],
            [Diagnosed and resolved a *COM Interop memory leak* across 11 document servers; built automated health monitoring to catch regressions.],
          ),
        ),
        (
          title: "Software Development Engineer in Test (2008–2009)",
          bullets: (
            [Identified a critical regression-testing bottleneck and voluntarily architected a custom framework in *IBM Rational Functional Tester* that parsed English-language scenario documents and auto-generated executable test scripts.],
            [Replaced the department's *"all-hands" manual regression cycle* (\~20–25 testers running for two weeks every release) with one person reviewing automated results in five days. *\~98% reduction in release validation effort*, eliminated the standing 2-week code freeze per release, *saved an estimated \$160,000 per cycle*. *Quality-first* mindset delivering measurable business outcomes.],
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
