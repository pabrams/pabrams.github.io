#import "template.typ": cv

#show: cv.with(
  tagline: "Senior .NET Developer · C\\# / ASP.NET MVC · React & TypeScript · AI-Assisted Development · SQL Server",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    Senior full-stack developer with 15+ years building and shipping large enterprise web applications across the Government of Canada and the private sector. Deep *.NET / C\# / ASP.NET MVC* and *REST API* experience — n-tier ASP.NET systems serving 5,000+ users, microservices integrated with enterprise IAM, SQL Server backends with hand-tuned execution plans (one homepage report taken from \~10 s to sub-second, \~50× faster, via execution-plan analysis and a flat-table refactor). Strong *React, TypeScript, JavaScript, HTML, and CSS* on the front end — multiple custom Azure DevOps web extensions in React/TypeScript, plus production React apps integrating with REST APIs. Power user of *AI coding assistants* (GitHub Copilot, Claude Code, Cursor, Gemini CLI) in daily work, with a current contract designing prompt fixtures and rubrics to *evaluate and refine AI-generated code* for correctness, security, and design quality — exactly the discipline this role calls for. Strong on *code review, performance, and security* (ITSG-33 / PBMM controls, OAuth 2.0 / Entra, TLS); fluent with *Git, TFVC (TFS), and CI/CD* (Azure Pipelines, GitHub Actions). *Professional Scrum Master I*, comfortable in daily stand-ups with BAs, QA, and fellow developers. Active open-source contributor (60+ public PRs).
  ],
  experience: (
    (
      org: "Abrams Software",
      location: "Kingston / Toronto, Ontario",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [*AI-assisted development at the contract level.* Daily, hands-on work with *GitHub Copilot, Claude Code, Cursor, and Gemini CLI* across *C\#, TypeScript, React, SQL,* Python, Go, Rust, and VBA. Routine workflow: write effective prompts, review and refine AI-generated code, run it against unit tests, audit for security and performance, and iterate. This is the same loop the role describes.],
        [*LLM training and code evaluation* for #link("https://www.dataannotation.tech")[DataAnnotation.tech] and Stellar.ai. Designed prompt fixtures and grading rubrics that probe *specific model failure modes* — *C\# / .NET* coding tasks with assertions, *security audits* at known-vulnerable revisions with CWE/CVSS-graded inventories, refactor tasks that grade for code _deletion_ (not just additions), adversarial unit tests that cleanly separate models that fix implementations from ones that fix tests, cross-stack migrations, and AI-assistant "skills" that codify methodology and are evaluated by running the same task with and without them. Direct experience *validating and refining AI-generated code* against design, performance, and security standards.],
        [*TWNR* — architected and built a multiplayer trading game as a full-stack web application. *TypeScript / React*-style component patterns on the front end; Express + WebSocket REST/event server on the back; *SQL* persistence (PostgreSQL) with concurrency-correct transactions (`SELECT … FOR UPDATE`); JWT auth; JSON-Schema-generated REST API contract that doubles as live documentation. Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [*chess.js x-ray attacker support* — diagnosed a missing feature with React-lifecycle breakpoint debugging, opened #link("https://github.com/jhlywa/chess.js/pull/572")[upstream PR \#572], and published a fork as #link("https://www.npmjs.com/package/@pabrams/chess.js")[\@pabrams/chess.js] on npm. Powers #link("https://paulabrams.ca/chess-attack-visualization")[Chess Attack Visualization], a *React + TypeScript* training app consuming the Lichess.org REST API.],
        [*60+ public PRs* to outside repos — Microsoft's `vsts-team-calendar` and `tfs-cli`, the official TypeScript-Website, the *Microsoft Authentication Library .NET* docs, `canada-ca/platform-security`, the Dygma split-keyboard configurator, and others.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Software Engineer, Infrastructure and Cloud Enablement (BDM Project)",
      bullets: (
        [Enhanced and maintained a *microservices* enterprise onboarding application — *C\# / .NET, Blazor, Azure SQL, Azure Functions, GraphQL*. Designed and consumed *REST APIs* between services; integrated with enterprise IAM via *Azure AD / Entra (OAuth 2.0, OpenID Connect)*; published and governed APIs through *Azure API Management (APIM)* with authentication, throttling, and transformation policies.],
        [Designed and shipped *custom Azure DevOps web extensions* in *React, TypeScript, and Node.js* — a build/deploy analytics widget that renders success-rate charts from the ADO Builds REST API, a people-by-project reporter that uses an in-memory hashmap to cross-reference user/project membership efficiently (the naive query pattern was unusably slow — a *performance* and *SQL-query-design* call), and a weekly work-item digest emailer driven by scheduled pipelines. *Responsive UI, custom styling, accessible interactions.*],
        [Built *PowerShell tooling* against the Azure DevOps *REST API* to snapshot area paths, iteration paths, security configurations, and org-level state on a schedule and commit those snapshots into Git as a *configuration-drift detector* — automation that closed a gap no off-the-shelf product covered.],
        [*CI/CD pipelines* in Azure DevOps for build, test, *Docker* containerization, Kubernetes deployment, and Azure Data Factory (ETL) orchestration. Implemented *ITSG-33 (NIST-based) security controls* — TLS / SSL certificate management, secret hygiene via Azure Key Vault — for SA\&A submissions against a PBMM security profile. Daily *Git* workflow; team also used *TFVC* on adjacent projects.],
        [Ran weekly *demos and design walkthroughs* for junior developers on Azure DevOps, Azure Key Vault, app registration, and custom extensions. Active participant in *daily stand-ups* with BAs, QA, and developers.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead, Testing Services",
      bullets: (
        [Co-architected an *internal C\# / .NET web application* enabling QA staff to author structured test scenarios via a web UI; designed the *SQL Server* schema and developed the C\# code bridging the application with Azure DevOps via its *REST API*. Integrated with the departmental headless CMS platform.],
        [Engineered Azure DevOps *CI/CD pipelines* for *automated testing* — provisioned Windows agent machines to execute parallel *Selenium* UI tests against deployed applications and integrated logged test results back into ADO work items.],
        [Championed the departmental transition from *LoadRunner to JMeter*, reducing licensing costs while maintaining robust performance-testing capabilities. *Code review* and standards enforcement for the team.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "April 2018 – August 2019",
      title: "Team Lead / Technical Lead",
      bullets: (
        [Led *Agile / Scrum* sprint planning, review, retrospective, *daily stand-up*, and backlog refinement; pioneered capacity-planning and forecasting using Azure DevOps Server (*TFS / TFVC*); introduced poker planning estimation.],
        [*Mentored developers in SQL Server query optimization* — *T-SQL*, query tuning, indexing strategy, partitioned tables, and execution-plan analysis — against large TFS databases and warehouses. Also coached on SSRS and C\# / .NET.],
        [Administered departmental *TFS instances and TFVC source control*; maintained heavily customized Agile, Scrum, and CMMI process templates. Implemented and deployed *custom web extensions in React / TypeScript / Node.js* with responsive layouts.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "January 2016 – March 2018",
      title: "Development Lead",
      bullets: (
        [Dev lead on the *Legal Case Management System (iCase)* — a large n-tier *ASP.NET / C\#* enterprise web application used by 5,000+ lawyers — while concurrently building its *Microsoft Dynamics CRM* successor. Modified iCase schema and front-end UI to surface migration status to users in real time; adjusted *SQL Server stored procedures* consumed by the financial information system.],
        [Engineered MS Dynamics CRM *plug-ins, custom actions, and workflow processes* in *C\#*; rewrote SQL stored procedures as C\# with LINQ; used SSIS for the ETL between iCase and Dynamics. Applied design patterns (Repository, Strategy, Mediator) and clean-code refactoring. *Deployments to Windows servers* via both manual runbooks and scripted pipelines.],
        [Established *code-review processes* integrated directly with TFS work items — gating standards for maintainability, security, and performance — and mentored junior developers.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer",
      bullets: (
        [Hired alongside one other engineer to take over a *TFS / TFVC* release-management environment from a contractor team. *Decommissioned over-engineered legacy C\# desktop release-management apps* and replaced them with lightweight PowerShell scripts calling the *TFS REST APIs* — net result, most of the contractor tooling was simply deleted.],
        [Implemented and deployed Team Foundation Server *web extensions* in *React / TypeScript / Node.js*; maintained a fork of Microsoft's `vsts-team-calendar` extension with configurable colours, Outlook integration, release-management features, and IE-compatibility shims for the department's mandated browser. UI design and styling work end-to-end.],
        [Guided development teams in migrating from legacy XAML builds to modern, scriptable build definitions; *deployed across Windows environments* both manually and via automated pipelines; wrote runbooks for TFS operation, maintenance, and troubleshooting.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2006 – March 2014",
      title: "Full-Stack Developer (2009–2014) · Software Development Engineer in Test (2008–2009)",
      intro: [Core contributor to the department's flagship *Legal Case Management System (iCase)* — a distributed multi-tier *ASP.NET / C\#* enterprise web application used by 5,000+ lawyers and agents across Canada to manage sensitive case files, timekeeping, billing, and reporting. Multi-tier with role- and object-based security, integrated with records management, financial, and email systems, 24/7 high availability.],
      subroles: (
        (
          title: "Full-Stack Developer (2009–2014)",
          bullets: (
            [Led development of the *"My iCase" widget portal* — the new entry point to iCase. Gathered requirements from business analysts, ran JAD sessions, produced prototypes, and authored BDD/TDD documentation before implementing the application largely solo. *ASP.NET Web Parts and the Personalization framework* with a *custom SQL personalization provider*, *Knockout.js MVVM* on the front end (a direct ancestor of the React patterns I use today), async AJAX web-service calls, an async HTTP handler that served images from cached business objects, ReportViewer in remote SSRS mode, and a JavaScript polyfill for HTML5 in IE.],
            [Diagnosed a homepage report that took \~10 s uncached: profiled with *SQL Profiler, Report Execution logs, and actual execution plans*, then replaced live joins with a flat table populated by a nightly job. *\~50× faster uncached, 3–4× faster cached.* Textbook example of *SQL Server query optimization through indexing and execution-plan analysis*.],
            [Built a *self-initiated availability-monitoring suite* for web and document servers because support staff were running checks manually evenings and weekends; eliminated significant overtime and reduced operational risk.],
            [Diagnosed and resolved a *COM Interop memory leak* on the document servers; built automated health monitoring to catch regressions.],
            [Co-led the *SQL Server 2005 to 2012 upgrade* including dev coordination and testing. Migrated core business modules from VB.NET to *C\#*; contributed to the Crystal Reports → SSRS migration, including 14 SSRS reports for the Legal Risk Management module.],
          ),
        ),
        (
          title: "Software Development Engineer in Test (2008–2009)",
          bullets: (
            [Identified a critical regression-testing bottleneck and voluntarily architected a custom framework in *IBM Rational Functional Tester* that parsed English-language scenario documents and auto-generated executable test scripts.],
            [Replaced the department's *"all-hands" manual regression cycle* (\~20–25 testers running for two weeks every release) with one person reviewing automated results in five days. *\~98% reduction in release validation effort*, eliminated the standing 2-week code freeze per release, *saved an estimated \$160,000 per cycle*.],
            [Wrote a separate test manager in *C\# and SQL Server*; trained QA Specialists, co-op students, and junior staff; authored a multi-document KB; contributed 500+ posts to the IBM Developerworks Automated Functional Testing forums.],
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
