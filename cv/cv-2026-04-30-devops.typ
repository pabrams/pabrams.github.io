#import "template.typ": cv

#show: cv.with(
  tagline: "DevOps & Cloud Engineer · CI/CD · Azure DevOps · Infrastructure Automation",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    DevOps and cloud engineer with 15+ years of progressive experience modernizing release engineering, designing CI/CD pipelines, administering Azure DevOps at scale, and operating in regulated environments (ITSG-33 / PBMM, WCAG, ITIL). A recurring pattern: modernization _by deletion_ - replacing UI-driven release apps and contractor-built process wrappers with lightweight scripted alternatives that teams can read, version, and own. Active contributor to Microsoft's Azure DevOps tooling ecosystem (`vsts-team-calendar`, `tfs-cli`) and to the Government of Canada's `canada-ca/platform-security`. Proficient with Azure DevOps Pipelines, GitHub Actions, PowerShell, YAML, Docker, Kubernetes, Azure (AD/Entra, Key Vault, Functions, Logic Apps, Data Factory, APIM, Cosmos DB / Service Bus exposure), and SQL Server / PostgreSQL.
  ],
  experience: (
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Software Engineer, Infrastructure and Cloud Enablement (BDM Project)",
      bullets: (
        [Implemented *CI/CD pipelines* in Azure DevOps for build, test, cloud deployments, and triggering *Azure Data Factory* processes for the automated movement of data. Supported and advised other teams on how to implement and manage their pipelines. (PowerShell, YAML, Docker, Kubernetes, Azure, AWS.)],
        [Implemented *ITSG-33* (NIST-based) security controls for SA\&A submissions against a *PBMM security profile*. Managed cross-project / cross-organization credential, identity, and secret management - Entra / Azure AD app registrations, Key Vault, managed identities, service connections.],
        [Administered *Azure DevOps Services* for all teams in the BDM project. Advised on custom Agile process templates and branching strategies; designed pull-request workflows and code-review practices; provided expert advice for connecting *Power BI to ADO Analytics*; ensured accessibility compliance aligned with departmental standards (WCAG).],
        [Built *PowerShell tooling* against the Azure DevOps REST API to inventory area paths, iteration paths, security configurations, and other org-level state on a schedule, committing those snapshots into source control as a stopgap *configuration-drift detector* - making unintended UI-only changes visible the next time a PR opened against the inventory repo.],
        [Developed and deployed custom *Azure DevOps web extensions* (TypeScript / React / Node.js) - a build/deploy analytics widget configurable by pipeline folder path that renders success-rate charts from the ADO Builds API, a people-by-project reporter, and a weekly work-item digest emailer driven by scheduled ADO pipelines that ran PowerShell against the work-item REST API.],
        [Ran weekly demos and walkthroughs for junior developers on the team's tooling - Azure DevOps, Key Vault, app registration, custom extensions.],
        [Concurrently enhanced and maintained a microservices-architecture application for personnel onboarding, integrated with enterprise IAM in Azure AD / Entra. (C\# .NET, Blazor, Azure SQL, Logic Apps, Functions, APIM, GraphQL.)],
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead, Testing Services",
      bullets: (
        [Engineered *ADO pipelines for automated testing* - provisioned agent machines to execute parallel *Selenium UI tests* and integrated logged test results back into ADO. Authored runbooks for pipeline-driven UI test runs.],
        [Co-architected an internal web application enabling QA staff to author structured test scenarios via a web UI; designed the database schema and developed the C\# code bridging the application with Azure DevOps. Integrated with the departmental headless CMS.],
        [Championed the departmental transition from *LoadRunner to JMeter*, significantly reducing licensing costs while maintaining robust performance-testing capabilities.],
      ),
    ),
    (
      org: "Department of Immigration, Refugees, and Citizenship, Canada",
      location: "Ottawa, ON",
      dates: "April 2018 – August 2019",
      title: "Team Lead / Technical Lead",
      bullets: (
        [Administered departmental *TFS* instances and maintained heavily customized *Agile, Scrum, and CMMI process templates*; managed user/group security across multiple project collections.],
        [Pioneered *capacity planning and forecasting* using Azure DevOps Server (TFS) - sprint burnup/burndown, lead/cycle time, velocity dashboards - to establish best practices for broader departmental adoption. Introduced poker-planning estimation. Conducted sprint planning, review, retrospective, daily stand-up, and backlog refinement.],
        [Implemented and deployed custom Team Foundation Server *web extensions* (TypeScript / React / Node.js).],
        [Mentored development teams in SSRS, T-SQL, C\#/.NET, automated testing, and crafting performant SQL queries against TFS databases and warehouses.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer · TFS / Release Engineering Lead",
      bullets: (
        [Hired alongside one other engineer to take over a TFS / release-management environment from a contractor team. Transitioned the department from *manual, UI-based release procedures to fully automated CI/CD workflows*, significantly reducing deployment times and human error.],
        [*Slashed technical debt* by decommissioning over-engineered, legacy C\# desktop applications used for release management and replacing them with lightweight PowerShell calling the TFS Client APIs directly - net result, most of the contractor tooling was simply deleted.],
        [Guided development teams in migrating from legacy *XAML builds to modern, scriptable build definitions*, improving build reliability and maintainability across the organization.],
        [Maintained a fork of Microsoft's `vsts-team-calendar` extension with configurable colours, Outlook integration, release-management features, and IE8 backward-compatibility for the department's mandated browser; contributed back upstream.],
        [Served as a centralized technical authority across full Agile and waterfall SDLC - coding standards, code review, source-control integration, PR workflows, automated build and testing. Wrote runbooks for TFS operation, maintenance, and troubleshooting.],
      ),
    ),
    (
      org: "Abrams Software",
      location: "Kingston / Toronto, Ontario (Remote)",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [Architected and operate *TWNR* - a real-time multiplayer space trading game - as a Dockerized TypeScript pnpm monorepo: Express + WebSocket server backed by PostgreSQL, terminal-style xterm.js client served by Vite, with concurrency-correct game state via PostgreSQL transactions. Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [Operate the *portfolio site itself* at #link("https://paulabrams.ca")[paulabrams.ca] as Astro on GitHub Pages with GitHub Actions CI/CD.],
        [Steady stream of *open-source contributions* to the Azure DevOps tooling ecosystem - Microsoft's #link("https://github.com/microsoft/vsts-team-calendar")[`vsts-team-calendar`] (PR \#507), #link("https://github.com/microsoft/tfs-cli")[`tfs-cli`] (PR \#456), the Microsoft Authentication Library .NET docs, and the Government of Canada's `canada-ca/platform-security`. 60+ public PRs across outside repos.],
        [LLM training and code evaluation for #link("https://www.dataannotation.tech")[DataAnnotation.tech] and Stellar.ai. Designs prompt fixtures and rubrics that probe specific model failure modes - including security audits at known-vulnerable revisions with CWE/CVSS-graded inventories, and adversarial deliverable prompts (PowerPoint reports, BI dashboards) with intentionally messy inputs that probe domain expertise. Heavy use of Docker and Linux for reproducible evaluation environments.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "January 2016 – March 2018",
      title: "Development Lead",
      bullets: (
        [Dev lead on the legacy Legal Case Management System (iCase) while concurrently building its *Microsoft Dynamics CRM* successor; engineered Dynamics CRM plug-ins, custom actions, and processes; rewrote SQL stored procedures as C\# with LINQ inside CRM; used *SSIS* for the ETL between iCase and Dynamics.],
        [Mentored junior developers and integrated code-review processes directly with TFS work items.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2006 – March 2014",
      title: "Full-Stack Developer (2009–2014) · Software Development Engineer in Test (2008–2009)",
      intro: [Core contributor to the department's flagship *Legal Case Management System (iCase)* - a distributed enterprise application used by 5,000+ lawyers and agents across Canada. Multi-tier with role- and object-based security, integrated with records management, financial, and email systems, 24/7 high availability across \~11 document servers regionally distributed.],
      bullets: (
        [*Self-initiated availability monitoring suite* for web and document servers. Scheduled tests pinged each server; failures emailed the appropriate operations group. Replaced manual evening / weekend checks by support staff, eliminating significant overtime. (An early SRE-style intervention before the term was widely used.)],
        [Diagnosed and resolved a *COM Interop memory leak* across the document servers; built automated health monitoring to catch regressions.],
        [Co-led the *SQL Server 2005 to 2012* upgrade including dev coordination and testing.],
        [Identified a critical regression-testing bottleneck and voluntarily architected a custom Java-based framework in *IBM Rational Functional Tester (RFT)* that parsed English-language scenario documents and auto-generated executable test scripts. Replaced the department's "all-hands" manual regression cycle (\~20–25 testers running for two weeks every release) with one person reviewing automated results in five days. *\~98% reduction in release validation effort*, eliminated the standing 2-week code freeze per release, *saved an estimated \$160,000 per cycle* in engineering hours. Contributed 500+ posts to the IBM Developerworks Automated Functional Testing forums.],
        [Diagnosed a homepage report that took \~10 seconds uncached: replaced live joins with a flat table populated by a nightly job, achieving *\~50× faster uncached, 3–4× cached*. (Performance engineering on the \"My iCase\" widget portal.)],
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
