#import "template.typ": cv

#show: cv.with(
  tagline: "Senior Full-Stack Software Developer · Java & TypeScript · Microservices & APIs · Automation Obsessed",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    Senior full-stack software developer with 15+ years designing, building, and shipping scalable enterprise systems across the Government of Canada and the private sector. Deep object-oriented design experience in *Java*, *C\# / .NET*, and *TypeScript*; track record of building distributed services, microservices, and *REST APIs* that integrate with enterprise IAM, ERP-adjacent financial systems, and cloud platforms. Hands-on with *Docker, Kubernetes, Azure (and AWS)*, *PostgreSQL / SQL Server*, *React*, and the full *CI/CD* lifecycle (Azure Pipelines, GitHub Actions, scripted YAML). Career-long pattern of *self-initiated automation that pays back substantial labour cost* - an RFT/Java framework that compressed a 2-week regression cycle into 5 days (\$160K saved per release), an availability-monitoring suite that ended weekend overtime, configuration-drift detectors against REST APIs - directly aligned with Redwood's "any process that can be automated, should be automated" philosophy. *Professional Scrum Master I*; experienced mentor and architectural-review lead; active open-source contributor (60+ PRs to Microsoft, TypeScript, chess.js, and others).
  ],
  experience: (
    (
      org: "Abrams Software",
      location: "Kingston / Toronto, Ontario",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [*TWNR* - architected and built a real-time multiplayer space-trading game as an *event-driven distributed system*. TypeScript pnpm monorepo: Express + WebSocket REST/event server, *PostgreSQL* persistence, *JWT-based authentication*, and a *JSON-Schema-generated message-protocol contract* that doubles as live API documentation. Concurrency-correct game state via PostgreSQL transactions with `SELECT … FOR UPDATE`. Modular, testable, and scoped for horizontal scale. Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [*LLM training and code evaluation* for #link("https://www.dataannotation.tech")[DataAnnotation.tech] and Stellar.ai. Designed prompt fixtures and rubrics that probe specific model failure modes - *Java* coding tasks with JUnit assertions, security audits at known-vulnerable revisions with CWE/CVSS-graded inventories, refactor tasks designed to grade for code _deletion_, adversarial unit tests that cleanly separate models that fix implementations from ones that fix tests, cross-stack migrations (MongoDB to PostgreSQL with concurrency-correct transactions, JS to TS with branded nominal types), VBA / Office COM Interop challenges, and AI-assistant "skills" that codify methodology and are evaluated by running the same task with and without them. Languages exercised: *Java, TypeScript, JavaScript, Python, C\#, Go, Rust, VBA, PostgreSQL/PL-SQL*.],
        [*chess.js x-ray attacker support* - diagnosed missing functionality with React-lifecycle breakpoint debugging, opened #link("https://github.com/jhlywa/chess.js/pull/572")[upstream PR \#572], and published a fork as #link("https://www.npmjs.com/package/@pabrams/chess.js")[\@pabrams/chess.js] on npm. Powers #link("https://paulabrams.ca/chess-attack-visualization")[Chess Attack Visualization], a chess training app integrated with the Lichess.org REST API.],
        [Steady stream of *open-source contributions* to Microsoft's `vsts-team-calendar` and `tfs-cli`, the official TypeScript-Website, the Microsoft Authentication Library .NET docs, `canada-ca/platform-security`, the Dygma split-keyboard configurator, and others. *60+ public PRs* across outside repos.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Software Engineer, Infrastructure and Cloud Enablement (BDM Project)",
      bullets: (
        [Enhanced and maintained a *microservices-architecture* enterprise onboarding application used across the department. *Designed and consumed REST APIs* between services; integrated with enterprise IAM via *Azure AD / Entra (OAuth 2.0, OpenID Connect)*; published and managed APIs through *Azure API Management (APIM)* with policies for authentication, throttling, and transformation. Stack: C\# / .NET, Blazor, Azure SQL, Azure Logic Apps, Azure Functions, GraphQL.],
        [Designed and developed *custom Azure DevOps web extensions* in *TypeScript / React / Node.js* - a build/deploy analytics widget configurable by pipeline folder path that renders success-rate charts from the ADO Builds REST API, a people-by-project reporter that uses an in-memory hashmap to cross-reference user/project membership efficiently (the naive query pattern was unusably slow), and a weekly work-item digest emailer driven by scheduled ADO pipelines.],
        [Built *PowerShell automation tooling* against the Azure DevOps REST API to inventory area paths, iteration paths, security configurations, and other org-level state on a schedule and commit those snapshots into source control as a configuration-drift detector - an automation that closed a gap no off-the-shelf product covered.],
        [Implemented *CI/CD pipelines* in Azure DevOps for build, test, *Docker* container builds, *Kubernetes* deployments, and triggering Azure Data Factory (ETL) processes. Implemented *ITSG-33 (NIST-based) security controls*, including TLS / SSL certificate management, for SA\&A submissions against a PBMM security profile. (PowerShell, YAML, Docker, Kubernetes, Azure, AWS.)],
        [Ran weekly *demos and design walkthroughs* for junior developers on the team's tooling - Azure DevOps, Azure Key Vault, app registration, custom extensions - mentoring engineers on architecture and clean-code patterns.],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead, Testing Services",
      bullets: (
        [Co-architected an *internal web application* enabling QA staff to author structured test scenarios via a web UI; designed the relational database schema and developed the C\# code bridging the application with Azure DevOps via its REST API. Integrated with the departmental headless CMS platform.],
        [Engineered Azure DevOps pipelines for *automated testing* - provisioned agent machines to execute parallel *Selenium* UI tests and integrated logged test results back into ADO work items.],
        [Championed the departmental transition from *LoadRunner to JMeter*, significantly reducing licensing costs while maintaining robust performance-testing capabilities. Modernization-by-deletion of legacy testing tooling.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "April 2018 – August 2019",
      title: "Team Lead / Technical Lead",
      bullets: (
        [Conducted *Agile / Scrum* sprint planning, review, retrospective, daily stand-up, and backlog refinement; pioneered capacity-planning and forecasting using Azure DevOps Server (TFS) to establish best practices for broader departmental adoption; introduced *poker planning* estimation.],
        [*Mentored development teams* in SSRS, T-SQL, C\# / .NET, automated testing, and crafting performant SQL queries (including query tuning, indexing strategy, partitioned tables) against TFS databases and warehouses.],
        [Administered departmental TFS instances and maintained heavily customized Agile, Scrum, and CMMI process templates. Implemented and deployed custom web extensions (TypeScript / React / Node.js).],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "January 2016 – March 2018",
      title: "Development Lead",
      bullets: (
        [Dev lead on the legacy *Legal Case Management System (iCase)* - a large-scale, multi-tenant n-tier ASP.NET enterprise web application used by 5,000+ lawyers and agents - while concurrently building its *Microsoft Dynamics CRM* successor. Modified iCase schema and front-end UI to surface migration status to users in real-time; adjusted *integration stored procedures* consumed by the financial information system.],
        [Engineered MS Dynamics CRM *plug-ins, custom actions, and workflow processes*; rewrote SQL stored procedures as C\# with LINQ; used SSIS for the ETL between iCase and Dynamics. Applied design patterns (Repository, Strategy, Mediator) and clean-code refactoring.],
        [Mentored junior developers and integrated *code-review processes* directly with TFS work items.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer",
      bullets: (
        [Hired alongside one other engineer to take over a TFS / release-management environment from a contractor team. *Decommissioned over-engineered legacy C\# desktop release-management apps* and replaced them with lightweight PowerShell scripts calling the TFS *REST APIs* - net result, most of the contractor tooling was simply deleted.],
        [Implemented and deployed Team Foundation Server *web extensions* in TypeScript / React / Node.js; maintained a fork of Microsoft's `vsts-team-calendar` extension with configurable colours, Outlook integration, release-management features, and IE8 backward-compatibility for the department's mandated browser.],
        [Guided development teams in migrating from legacy XAML builds to modern, scriptable build definitions; wrote runbooks for TFS operation, maintenance, and troubleshooting so the work could be handed off cleanly.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2006 – March 2014",
      title: "Full-Stack Developer (2009–2014) · Software Development Engineer in Test (2008–2009)",
      intro: [Core contributor to the department's flagship *Legal Case Management System (iCase)* - a distributed, multi-tenant enterprise web application used by 5,000+ lawyers and agents across Canada to manage sensitive case files, timekeeping, billing, and reporting. Multi-tier with role- and object-based security, integrated with records management, financial, and email systems, 24/7 high availability.],
      subroles: (
        (
          title: "Full-Stack Developer (2009–2014)",
          bullets: (
            [Led development of the *"My iCase" widget portal* - the new entry point to iCase. Gathered requirements from business analysts, ran JAD sessions, produced prototypes, and authored *BDD/TDD* documentation before implementing the application largely solo. ASP.NET Web Parts and the Personalization framework with a *custom SQL personalization provider*, Knockout.js for MVVM, async AJAX web service calls, an async HTTP handler that served images from cached business objects, ReportViewer in remote SSRS mode, and a JavaScript polyfill to make HTML5 work in the department-mandated IE8.],
            [Diagnosed a homepage report that took \~10 seconds uncached: profiled with SQL Profiler, Report Execution logs, and actual execution plans, then replaced live joins with a flat table populated by a nightly job. *\~50× faster uncached, 3–4× faster cached.* Demonstrated *application-performance tuning and diagnostics*.],
            [Built a *self-initiated availability-monitoring suite* for web and document servers because support staff were running checks manually evenings and weekends; eliminated significant overtime and reduced human-resource risk.],
            [Diagnosed and resolved a *COM Interop memory leak* across the document servers; built automated health monitoring to catch regressions.],
            [Co-led the *SQL Server 2005 to 2012 upgrade* including dev coordination and testing. Migrated core business modules from VB.NET to C\#; contributed to the Crystal Reports to SSRS migration, including 14 SSRS reports for the Legal Risk Management module.],
          ),
        ),
        (
          title: "Software Development Engineer in Test (2008–2009)",
          bullets: (
            [Identified a critical regression-testing bottleneck and voluntarily architected a custom *Java*-based framework in *IBM Rational Functional Tester (RFT)* that parsed English-language scenario documents and auto-generated executable test scripts. Pivoted from VB.NET to *Java* on advice from IBM Support; developed in *Eclipse*.],
            [Replaced the department's *"all-hands" manual regression cycle* (\~20–25 testers running for two weeks every release) with one person reviewing automated results in five days. *\~98% reduction in release validation effort*, eliminated the standing 2-week code freeze per release, *saved an estimated \$160,000 per cycle*. Definitive example of full-stack automation paying back labour cost.],
            [Wrote a separate test manager in C\# and SQL Server; built round-trip code generation. Trained QA Specialists, co-op students, and junior staff. Authored a multi-document KB. Contributed *500+ posts* to the IBM Developerworks Automated Functional Testing forums.],
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
