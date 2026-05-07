#let accent = rgb("#1f4e79")
#let muted = rgb("#555555")

#set document(title: "Paul Abrams - Cover Letter - Redwood Senior Full Stack Developer", author: "Paul Abrams")
#set page(
  paper: "us-letter",
  margin: (x: 0.85in, top: 0.75in, bottom: 0.75in),
)
#set text(font: ("DejaVu Sans", "Liberation Sans"), size: 10.5pt, fallback: true)
#set par(justify: false, leading: 0.75em, spacing: 0.95em)
#show link: it => text(fill: accent, it)

// Header
#grid(
  columns: (1fr, auto),
  align: (left + horizon, right + horizon),
  text(size: 20pt, weight: "bold", "Paul Abrams"),
  text(size: 10pt, fill: muted, "Toronto, Ontario"),
)
#v(-0.4em)
#text(size: 10pt, fill: muted, "Senior Full-Stack Software Developer")
#v(0.1em)
#line(length: 100%, stroke: 0.6pt + accent)
#v(-0.3em)
#text(size: 9pt)[
  (819) 921-7192  #text(fill: muted, "  |  ")
  #link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com]  #text(fill: muted, "  |  ")
  #link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200]  #text(fill: muted, "  |  ")
  #link("https://github.com/pabrams")[github.com/pabrams]  #text(fill: muted, "  |  ")
  #link("https://paulabrams.ca")[paulabrams.ca]
]
#v(0.6em)

// Date
#text(fill: muted)[May 7, 2026]
#v(0.4em)

// Salutation
Dear Todd,
#v(0.4em)

Thank you for reaching out about the *Senior Full-Stack Software Developer* role at Redwood Software. I'm writing to express my strong interest. The combination of *Java*, full-stack delivery, scalable APIs and microservices, cloud and containerization, and - most of all - Redwood's stated *obsession with automation* maps unusually well onto how I've spent the last 15+ years.

Redwood's framing - "any process that can be automated, should be automated" - is essentially the operating principle of my career. The headline example: as an SDET at the Department of Justice I voluntarily replaced a 2-week, 20-25-person manual regression cycle with a *Java* automation framework I built on IBM Rational Functional Tester (developed in *Eclipse*), shrinking each release validation to one person reviewing results in five days - a *\~98% reduction* in effort and an *estimated \$160,000 saved per cycle*. That same instinct - look for the recurring manual cost, automate it, document it - has shown up in every role since: an availability-monitoring suite that ended weekend on-call overtime, a configuration-drift detector built against the Azure DevOps REST API because no off-the-shelf product covered the gap, the decommissioning of legacy C\# release-management desktop apps in favour of lightweight PowerShell against the TFS REST APIs.

A quick map of my background against the role's requirements:

#v(-0.3em)
- *Full-stack delivery, 15+ years.* My career has been built on enterprise full-stack systems - the Department of Justice's iCase legal case management system (a multi-tenant n-tier ASP.NET application used by 5,000+ lawyers and agents, with role- and object-based security, financial-system integration, and 24/7 availability requirements) and most recently a *microservices-architecture* enterprise onboarding platform at ESDC integrated with enterprise IAM. I lead architecture, design, deployment, and the rest of the SDLC; I am as comfortable in the data layer and CI/CD pipeline as I am in the React UI.
- *Java and object-oriented design.* My first major framework was a Java/RFT system; I currently exercise *Java (11/17)*, JUnit, and Eclipse regularly through LLM evaluation contracts that include Java coding tasks. My day-to-day OO experience runs deep across Java and C\# / .NET - design patterns, clean-code refactoring, modern functional/streams idioms.
- *APIs, microservices, and distributed systems.* On the BDM project I designed and consumed REST APIs between microservices and published them through *Azure API Management* with policies for authentication, throttling, and transformation; integrated *OAuth 2.0 / OpenID Connect* via Entra. My current independent project (TWNR) is an *event-driven distributed system* with a WebSocket/REST gateway, *PostgreSQL* persistence with `SELECT … FOR UPDATE` for concurrency correctness, JWT auth, and a JSON-Schema-generated message protocol that doubles as live API documentation.
- *Front-end: HTML, CSS, JavaScript / TypeScript, React.* I've shipped multiple production *React + TypeScript* web extensions for Azure DevOps (build/deploy analytics, people-by-project reporting, scheduled work-item digests) and my current work uses TypeScript end-to-end.
- *Cloud and containerization.* Deep Azure (Functions, Logic Apps, APIM, Key Vault, AAD/Entra, Data Factory, Pipelines, App Insights), with hands-on *Docker* and *Kubernetes* deployment experience and AWS exposure through cross-cloud projects.
- *Automated testing.* JUnit, Jest, Selenium, Playwright (touched), automated end-to-end pipelines in ADO, *BDD/TDD* practiced from the iCase widget portal onward.
- *Mentoring and architectural leadership.* I ran weekly demos and design walkthroughs at ESDC for junior developers, mentored teams in SQL tuning, .NET, and automated testing at IRCC and DOJ, led architecture discussions, and have been a Dev Lead / Team Lead three times.
- *Open-source / GitHub portfolio.* *60+ public PRs* across outside repos including chess.js, Microsoft's `vsts-team-calendar` and `tfs-cli`, the official TypeScript-Website, MSAL .NET docs, and `canada-ca/platform-security`. I publish my own forks to npm when blocked upstream (#link("https://www.npmjs.com/package/@pabrams/chess.js")[\@pabrams/chess.js]).
- *Agile.* Professional Scrum Master I (Scrum.org); ran sprint ceremonies and capacity-planning at IRCC; introduced poker-planning estimation as a department-wide practice.

Beyond the checklist, what I'd hope to bring to Redwood is a particular *automation reflex* - and a willingness to delete code, not just write it. A meaningful share of the wins on my CV are stories where the right answer was to remove an entire process, not to improve it incrementally. That feels well aligned with "lights-out automation for mission-critical business processes."

I'm based in Toronto and *fully able to support a 2-3 day on-site hybrid* arrangement. I'm a *Canadian citizen* with no work-authorization constraints, available to start on short notice, and happy to provide the rest of the screener responses ahead of our call.

I've attached an up-to-date CV tailored to the role and look forward to connecting.

#v(0.4em)
Best regards, \
Paul Abrams
