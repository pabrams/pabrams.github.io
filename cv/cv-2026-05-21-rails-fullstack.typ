#import "template.typ": cv

#show: cv.with(
  tagline: "Full-Stack Developer · Ruby on Rails · React & TypeScript · AI-Forward Engineering · Cloud, CI/CD & DevOps",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    Senior full-stack developer with 15+ years shipping web applications end-to-end — idea, design, build, deploy, iterate. *AI-forward by default*: daily, hands-on use of *Claude Code, GitHub Copilot, Cursor, and Gemini CLI* across multiple languages and stacks, with a current contract designing prompt fixtures and rubrics that *evaluate and refine AI-generated code* for correctness, security, and design quality — including a multi-week *Ruby on Rails* feature delivery against the *Discourse* codebase (production Ruby, RSpec test coverage, OmniAuth 2FA enforcement flow). Strong on the *React + TypeScript* front end (custom Azure DevOps web extensions, a chess training app on the Lichess REST API, an end-to-end multiplayer web game I shipped solo) and on the *server side* (n-tier ASP.NET serving 5,000+ users, Node.js/Express + WebSocket REST/event servers, PostgreSQL/SQL Server with concurrency-correct transactions and tuned execution plans). *Cloud & DevOps* fluency: CI/CD pipelines in *Azure DevOps* and *GitHub Actions*, *Docker* containerization, *Kubernetes* deployment, IAM/OAuth 2.0, TLS / secret hygiene, ITSG-33 / PBMM controls — Azure-anchored cloud experience with patterns that transfer cleanly to *AWS*. *Startup DNA*: since August 2025 I have been operating as an independent contractor, shipping features end-to-end on tight loops. *Professional Scrum Master I.* Active open-source contributor (60+ public PRs).
  ],
  experience: (
    (
      org: "Abrams Software",
      location: "Kingston / Toronto, Ontario",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [*AI as a daily productivity multiplier.* Hands-on, contract-level work with *Claude Code, GitHub Copilot, Cursor, and Gemini CLI* across *Ruby, TypeScript, React, C\#, Python, Go, Rust, SQL,* and VBA. Routine workflow: scope a feature, prompt the model, review and refine the generated code, run it against tests, audit for security and performance, ship. Same loop the role describes — including *building and shipping features end-to-end* with AI as a core productivity multiplier.],
        [*Ruby on Rails feature delivery against Discourse.* Multi-week engagement writing production *Ruby* code and *RSpec* test coverage for a Discourse feature in the OmniAuth callbacks path — a setting (`enforce_second_factor_on_external_auth`) that lets administrators require 2FA for local logins while still permitting OAuth-provider sign-ins. Exercised the controller logic, locale files, and the full RSpec test suite for OAuth flows; ran the work inside Discourse's *Docker*-heavy build and runtime environment. Engagement was for *Stellar.ai* as part of LLM evaluation work — I wrote the human reference implementation that competing model outputs were graded against.],
        [*LLM training and code evaluation* for #link("https://www.dataannotation.tech")[DataAnnotation.tech] and Stellar.ai. Designed prompt fixtures and grading rubrics that probe *specific model failure modes* — *Ruby on Rails* feature deliveries with RSpec assertions; *security audits* at known-vulnerable revisions with CWE/CVSS-graded inventories; refactor tasks that grade for code _deletion_ (not just additions); adversarial unit tests that cleanly separate models that fix implementations from ones that fix tests; cross-stack migrations; and AI-assistant "skills" that codify methodology and are evaluated by running the same task with and without them.],
        [*TWNR* — *architected and shipped a multiplayer trading game as a full-stack web application, solo.* *React*-style component patterns on the front end (TypeScript); *Express + WebSocket* REST/event server on the back; *PostgreSQL* persistence with concurrency-correct transactions (`SELECT … FOR UPDATE`); *JWT auth*; JSON-Schema-generated REST API contract that doubles as live documentation. Idea → design → build → deploy in tight iterations. Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [*chess.js x-ray attacker support* — diagnosed a missing feature with React-lifecycle breakpoint debugging, opened #link("https://github.com/jhlywa/chess.js/pull/572")[upstream PR \#572], and published a fork as #link("https://www.npmjs.com/package/@pabrams/chess.js")[\@pabrams/chess.js] on npm. Powers #link("https://paulabrams.ca/chess-attack-visualization")[Chess Attack Visualization], a *React + TypeScript* training app consuming the Lichess.org REST API.],
        [*60+ public PRs* to outside repos — Microsoft's `vsts-team-calendar` and `tfs-cli`, the official TypeScript-Website, the *Microsoft Authentication Library .NET* docs, `canada-ca/platform-security`, the Dygma split-keyboard configurator, and others. Comfortable jumping into unfamiliar codebases — exactly the discipline a Rails monolith and a React front end both demand.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Software Engineer, Infrastructure and Cloud Enablement (BDM Project)",
      bullets: (
        [Enhanced and maintained a *microservices* enterprise onboarding application — *C\# / .NET, Blazor, Azure SQL, Azure Functions, GraphQL*. Designed and consumed *REST APIs* between services; integrated with enterprise IAM via *Azure AD / Entra (OAuth 2.0, OpenID Connect)*; published and governed APIs through *Azure API Management* with authentication, throttling, and transformation policies — cloud patterns that map directly to *AWS API Gateway + Cognito / IAM*.],
        [Designed and shipped *custom Azure DevOps web extensions* in *React, TypeScript, and Node.js* — a build/deploy analytics widget that renders success-rate charts from the ADO Builds REST API; a people-by-project reporter that uses an in-memory hashmap to cross-reference user/project membership efficiently (the naive query pattern was unusably slow — a *performance* and *query-design* call); and a weekly work-item digest emailer driven by scheduled pipelines. Responsive UI, custom styling, accessible interactions.],
        [Built *PowerShell tooling* against the Azure DevOps REST API to snapshot area paths, iteration paths, security configurations, and org-level state on a schedule and commit those snapshots into Git as a *configuration-drift detector* — automation that closed a gap no off-the-shelf product covered. Same "ship the tool, don't file the ticket" instinct the role asks for.],
        [*CI/CD pipelines* in Azure DevOps for build, test, *Docker* containerization, *Kubernetes* deployment, and Azure Data Factory (ETL) orchestration. Implemented *ITSG-33 (NIST-based) security controls* — TLS / SSL certificate management, secret hygiene via Azure Key Vault — for SA\&A submissions against a PBMM security profile. Daily *Git* workflow.],
        [Ran weekly *demos and design walkthroughs* for junior developers on Azure DevOps, Key Vault, app registration, and custom extensions. Active participant in *daily stand-ups* with BAs, QA, and developers.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead, Testing Services",
      bullets: (
        [Co-architected an *internal C\# / .NET web application* enabling QA staff to author structured test scenarios via a web UI; designed the *SQL Server* schema and developed the code bridging the application with Azure DevOps via its *REST API*. Integrated with the departmental headless CMS platform.],
        [Engineered Azure DevOps *CI/CD pipelines* for *automated testing* — provisioned Windows agent machines to execute parallel *Selenium* UI tests against deployed applications and integrated logged test results back into ADO work items.],
        [Championed the departmental transition from *LoadRunner to JMeter*, reducing licensing costs while maintaining robust performance-testing capabilities. *Code review* and standards enforcement for the team.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "August 2017 – August 2019",
      title: "Team Lead / Technical Lead",
      bullets: (
        [Led *Agile / Scrum* sprint planning, review, retrospective, *daily stand-up*, and backlog refinement; pioneered capacity-planning and forecasting using Azure DevOps Server; introduced poker planning estimation.],
        [*Mentored developers* in *SQL Server query optimization* — query tuning, indexing strategy, partitioned tables, execution-plan analysis — against large TFS databases and warehouses. Also coached on SSRS and C\# / .NET.],
        [Implemented and deployed *custom web extensions in React / TypeScript / Node.js* with responsive layouts.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "December 2015 – August 2017",
      title: "Development Lead",
      bullets: (
        [Dev lead on the *Legal Case Management System (iCase)* — a large n-tier *ASP.NET / C\#* enterprise web application used by 5,000+ lawyers — while concurrently building its *Microsoft Dynamics CRM* successor. Modified iCase schema and front-end UI to surface migration status to users in real time.],
        [Engineered MS Dynamics CRM *plug-ins, custom actions, and workflow processes* in *C\#*; rewrote SQL stored procedures as C\# with LINQ; used SSIS for ETL between iCase and Dynamics. Applied design patterns (Repository, Strategy, Mediator) and clean-code refactoring. *Deployments to Windows servers* via both manual runbooks and scripted pipelines.],
        [Established *code-review processes* integrated directly with TFS work items — gating standards for maintainability, security, and performance — and mentored junior developers.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer",
      bullets: (
        [Hired alongside one other engineer to take over a *TFS / TFVC* release-management environment from a contractor team. *Decommissioned over-engineered legacy C\# desktop release-management apps* and replaced them with lightweight PowerShell scripts calling the *TFS REST APIs* — net result, most of the contractor tooling was simply deleted. *Bias for action and ownership.*],
        [Implemented and deployed Team Foundation Server *web extensions* in *React / TypeScript / Node.js*; maintained a fork of Microsoft's `vsts-team-calendar` extension with configurable colours, Outlook integration, release-management features, and IE-compatibility shims. UI design and styling work end-to-end.],
        [Guided development teams in migrating from legacy XAML builds to modern, scriptable build definitions; *deployed across Windows environments* both manually and via automated pipelines.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2008 – April 2014",
      title: "Full-Stack Developer (2009–2014) · Software Development Engineer in Test (2008–2009)",
      intro: [Core contributor to the department's flagship *Legal Case Management System (iCase)* — a distributed multi-tier *ASP.NET / C\#* enterprise web application used by 5,000+ lawyers and agents across Canada. Multi-tier with role- and object-based security, integrated with records management, financial, and email systems, 24/7 high availability.],
      subroles: (
        (
          title: "Full-Stack Developer (2009–2014)",
          bullets: (
            [Led development of the *"My iCase" widget portal* — the new entry point to iCase. Ran JAD sessions, produced prototypes, authored BDD/TDD documentation, and implemented the application largely solo. *ASP.NET Web Parts and the Personalization framework* with a *custom SQL personalization provider*, *Knockout.js MVVM* on the front end (a direct ancestor of the *React* patterns I use today), async AJAX web-service calls, async HTTP handlers, ReportViewer in remote SSRS mode.],
            [Diagnosed a homepage report taking \~10 s uncached: profiled with *SQL Profiler, Report Execution logs, and actual execution plans*, then replaced live joins with a flat table populated by a nightly job. *\~50× faster uncached, 3–4× faster cached.* Textbook *query-tuning through execution-plan analysis*.],
            [Built a *self-initiated availability-monitoring suite* for web and document servers because support staff were running checks manually evenings and weekends; eliminated significant overtime and reduced operational risk.],
            [Diagnosed and resolved a *COM Interop memory leak* on the document servers; built automated health monitoring to catch regressions.],
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
