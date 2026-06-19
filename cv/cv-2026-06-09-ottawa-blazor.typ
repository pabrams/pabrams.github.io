#import "template.typ": cv

#show: cv.with(
  location: "Ottawa, Ontario",
  tagline: ".NET / C\\# / Blazor Developer · Reusable Component UIs · Azure DevOps Pipelines & Work-Item Delivery · 15+ Years Government of Canada Web Portals · Professional Scrum Master",
  contact: (
    "(819) 921-7192",
    link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com],
    link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200],
    link("https://github.com/pabrams")[github.com/pabrams],
    link("https://paulabrams.ca")[paulabrams.ca],
  ),
  summary: [
    *Hands-on .NET developer* with *15+ years* building and improving *web-based portals* across the Government of Canada — *Blazor / C\# / .NET* front and back end on *cloud-native, microservices* architectures. *Directly relevant to the City of Ottawa engagement:* I have built and enhanced *resident- and business-facing portals* (a Blazor onboarding portal at ESDC; the *"My iCase" personalization portal* used by 5,000+ lawyers and external agent firms), expanded *personalization functionality* (a customizable, widget-based portal backed by a *custom personalization provider*), and shipped *notification functionality* (event-driven *Azure Functions*, scheduled digest emailers, and availability alerting). I *translate designs into reusable, component-based UIs*, and I am *deeply fluent in Azure DevOps* — analyzing and completing *work items* against sprint timelines, collaborating with Product Owners on acceptance criteria, and *leveraging ADO pipelines to automate build, test, and deployment*. I work the way the role describes: a *simplified SCRUM* cadence of daily stand-ups, sprint planning, and sprint reviews, with *documentation and active knowledge-sharing* throughout. *Security- and reliability-minded by default* — IAM via *OAuth 2.0 / OpenID Connect / Entra*, migration to *Managed Identities*, TLS / certificate and secret hygiene via *Key Vault*, *ITSG-33 / PBMM* controls, and self-built monitoring that improved supportability. *Professional Scrum Master I.* Active open-source contributor — *60+ public PRs* including Microsoft's Azure DevOps tooling (`vsts-team-calendar`, `tfs-cli`) and the *Microsoft Authentication Library .NET* docs.
  ],
  experience: (
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "December 2021 – July 2025",
      title: "Senior Software Engineer, Infrastructure and Cloud Enablement (BDM Project)",
      bullets: (
        [Enhanced and maintained a *cloud-native, microservices onboarding portal* — *Blazor / C\# / .NET front and back end*, Azure SQL, Azure Functions, GraphQL — serving procurement, HR, and IT-ops personnel. Built and extended the *Blazor front end as reusable, component-based UI*; integrated with enterprise IAM via *Azure AD / Entra (OAuth 2.0, OpenID Connect)*; designed and consumed *REST APIs between services* and *published / governed them through Azure API Management* with authentication, throttling, and transformation policies.],
        [*Expanded notification functionality:* Blazor front-end submissions kicked off *event-driven Azure Functions* that created and updated *Azure DevOps work items*, triggered pipelines, provisioned users in on-prem Active Directory (via AAD Connect), and applied group memberships by personnel profile — with bulk submissions fanning out through asynchronous handoffs across the microservices. Built a *scheduled weekly work-item digest emailer* driven by ADO pipelines.],
        [*Leveraged Azure DevOps pipelines end to end* — build, automated test, *Docker* containerization, *Kubernetes* deployment, and *Azure Data Factory* (ETL) orchestration. Administered Azure DevOps for all BDM teams; advised on process templates, branching strategies, and PR workflows; connected *Power BI to ADO Analytics*; ensured *WCAG* accessibility compliance.],
        [*Security, reliability, and supportability:* migrated the portal's downstream identity from rotating secrets (Key Vault + ADO PATs on 90-day rotation) to *Azure Managed Identities* — eliminating the secret-rotation incident class and properly attributing automated activity. Implemented *ITSG-33 (NIST-based) controls* — TLS / certificate management, *Key Vault* secret hygiene — for SA\&A submissions against a *PBMM* profile.],
        [Designed and shipped *custom ADO web extensions in React, TypeScript, and Node.js* — a build/deploy analytics widget rendering success-rate charts via the ADO Builds REST API, a people-by-project reporter, and the digest emailer above. *Documented developed applications and automated processes*, and ran weekly *demos and design walkthroughs* sharing technical knowledge with junior developers.],
      ),
    ),
    (
      org: "Department of Justice, Canada",
      location: "Ottawa, ON",
      dates: "October 2006 – August 2019 (multiple roles)",
      title: "Full-Stack / .NET Developer · Development Lead · SDET — Legal Case Management System (iCase)",
      intro: [Core contributor and later *Development Lead* on the department's flagship *Legal Case Management System (iCase)* — a distributed multi-tier *ASP.NET / C\#* enterprise *web portal* used by *5,000+ government lawyers and external agent firms* across Canada to manage case files, timekeeping, billing, and reporting. Multi-tier with role- and object-based security, integrated with records-management, financial, and email systems, 24/7 high availability.],
      subroles: (
        (
          title: "Development Lead — iCase / Dynamics CRM Modernization (2016–2018)",
          bullets: (
            [*Dev lead* on the live iCase portal while concurrently building its *Microsoft Dynamics CRM* successor. Modified schema and *front-end UI to surface migration status in real time*; engineered Dynamics CRM *plug-ins, custom actions, and workflows* in *C\#*; used SSIS for ETL between systems. *Established code-review processes gated on work items* and mentored junior developers.],
          ),
        ),
        (
          title: "Full-Stack / .NET Developer (2009–2014)",
          bullets: (
            [Led design and largely solo implementation of the *"My iCase" personalization portal* — the new, *customizable widget-based entry point* to iCase. Ran JAD sessions, produced prototypes, and authored BDD/TDD documentation, then built it on *ASP.NET Web Parts and the Personalization framework with a custom SQL personalization provider*, *Knockout.js MVVM* component binding (a direct ancestor of the *React / Blazor component* patterns I use today), and async AJAX web-service calls. *Directly analogous to the role's personalization and reusable-component work.*],
            [*Performance and reliability engineering:* diagnosed a homepage report that took \~10 s uncached — profiled with SQL Profiler and execution plans, then replaced live joins with a nightly-populated flat table (*\~50× faster uncached*). Built a *self-initiated availability-monitoring suite* that emailed failures to the right operations group, eliminating volunteer evening/weekend checks. Diagnosed and resolved a *COM Interop memory leak* across the document servers.],
          ),
        ),
        (
          title: "Team Lead / Technical Lead — IRCC (2018–2019)",
          bullets: (
            [Led *Agile / Scrum* sprint planning, review, retrospective, daily stand-up, and backlog refinement; introduced poker-planning estimation and capacity forecasting. Implemented custom web extensions in *React / TypeScript / Node.js*; mentored developers in *C\# / .NET* and *SQL Server query optimization*; administered *Azure DevOps Server* and its customized process templates.],
          ),
        ),
        (
          title: "Software Development Engineer in Test (2008–2009)",
          bullets: (
            [Voluntarily architected a framework in *IBM Rational Functional Tester* that parsed English-language scenario documents and auto-generated executable tests — replacing a \~20–25-tester, two-week manual regression cycle with one person reviewing automated results in five days. *\~98% reduction in release-validation effort; \~\$160K saved per cycle.* Trained QA staff and authored the supporting knowledge base.],
          ),
        ),
      ),
    ),
    (
      org: "Employment and Social Development, Canada",
      location: "Gatineau, QC",
      dates: "August 2019 – November 2021",
      title: "Development Lead, Testing Services",
      bullets: (
        [Co-architected an *internal C\# / .NET web application* letting QA staff and business analysts author structured test scenarios via a web UI; designed the *SQL Server* schema and *co-designed the REST API* for bidirectional integration with *Azure DevOps pipelines* — versioned script-fetch endpoints and results-push endpoints.],
        [Engineered Azure DevOps *CI/CD pipelines for automated testing* — provisioned agents to run *parallel Selenium UI tests* against deployed applications and integrated results back into work items. Code review and standards enforcement for the team.],
        [Championed the departmental transition from *LoadRunner to JMeter*, cutting licensing costs while maintaining robust performance testing.],
      ),
    ),
    (
      org: "Department of Citizenship and Immigration, Canada",
      location: "Ottawa, ON",
      dates: "April 2014 – December 2015",
      title: "Senior Software Engineer · TFS / Release Engineering Lead",
      bullets: (
        [Hired alongside one other engineer to take over a release-management environment from a contractor team. *Decommissioned over-engineered legacy C\# desktop apps* and replaced them with lightweight *PowerShell* calling *REST APIs* — most contractor tooling was simply deleted, and *everything ended up in source control*. Bias for action and ownership.],
        [Implemented and deployed *web extensions in React / TypeScript / Node.js*; maintained a fork of Microsoft's `vsts-team-calendar` extension with configurable colours, Outlook integration, and release-management features, contributed back upstream. *Installed, configured, customized, and upgraded* the ADO/TFS platform across dev / UAT / production.],
      ),
    ),
    (
      org: "Abrams Software",
      location: "Kingston / Toronto, Ontario (Remote)",
      dates: "August 2025 – Present",
      title: "Full-Stack Developer · Independent",
      bullets: (
        [*Chess Attack Visualization* — *React 19 + TypeScript* training app (Vite, Vitest / Jest) consuming the *Lichess.org REST API*, with a *NestJS* auth proxy implementing the *OAuth2 PKCE* flow. Diagnosed a missing feature in `chess.js`, opened #link("https://github.com/jhlywa/chess.js/pull/572")[upstream PR \#572], and published a fork on npm. Live at #link("https://paulabrams.ca/chess-attack-visualization")[paulabrams.ca/chess-attack-visualization].],
        [*TWNR* — architected and shipped a *public-facing B2C multiplayer game as a full-stack web application, solo*: Dockerized *TypeScript* monorepo, *Node.js (Express) + WebSocket* server backed by *PostgreSQL* with per-player *JWT auth* and a *JSON-Schema-generated REST API contract*. Live at #link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca].],
        [*LLM code evaluation* for #link("https://www.dataannotation.tech")[DataAnnotation.tech] and Stellar.ai — prompt fixtures and grading rubrics across *TypeScript, React, Node / NestJS, .NET / C\#, Python, Go, Rust, and SQL*, including *security audits with CWE / CVSS-graded inventories*. *60+ public PRs* to outside repos, including the *Microsoft Authentication Library .NET* docs and `canada-ca/platform-security`.],
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

*.NET / C\#:* *.NET 6 / 8 / .NET Core, C\#, Blazor*, ASP.NET / ASP.NET MVC, ADO.NET, Entity Framework, LINQ · component-based UI, reusable components

*Front-End / UI:* *Blazor, React 19, TypeScript*, JavaScript, Vite, Knockout.js MVVM, HTML, CSS, JSON, AJAX · *responsive design, WCAG / AODA accessibility*, design-to-component translation (Figma-style design handoff)

*Azure DevOps:* *work-item analysis & delivery, ADO pipelines (YAML) for automated build / test / deploy*, ADO REST API, custom web extensions, ADO Server administration & process-template customization, Power BI on ADO Analytics

*Cloud / Azure:* App Service, *Azure Functions* (event-driven), SQL, *API Management*, *Key Vault*, Storage, *Managed Identities*, *Entra / AAD*, Data Factory · *Docker, Kubernetes*

*Server-Side / APIs:* REST API design, GraphQL, WebSocket · NestJS, Node.js, Express · n-tier client/server, *cloud-native microservices*, event-driven workflows

*Security:* OAuth 2.0 / OpenID Connect / PKCE, Entra / AAD IAM, TLS / certificate management, Key Vault secret hygiene, Managed Identities, *ITSG-33 / PBMM controls*, CWE / CVSS-graded audits

*Databases:* MS SQL Server *2005 → 2019* (T-SQL, stored procedures, indexing, execution-plan tuning), Azure SQL, PostgreSQL

*Testing:* Selenium, Playwright, *Jest, Vitest*, xUnit / NUnit, IBM Rational Functional Tester, JMeter

*Process / SDLC:* *Agile / Scrum (PSM I)* — daily stand-ups, sprint planning & review, simplified SCRUM · code review, mentoring, technical documentation & knowledge-sharing · ITIL v3 Foundation
