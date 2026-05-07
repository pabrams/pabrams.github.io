#let accent = rgb("#1f4e79")
#let muted = rgb("#555555")

#set document(title: "Paul Abrams - Cover Letter - Vlink Software Developer", author: "Paul Abrams")
#set page(
  paper: "us-letter",
  margin: (x: 0.7in, top: 0.55in, bottom: 0.55in),
)
#set text(font: ("DejaVu Sans", "Liberation Sans"), size: 10pt, fallback: true)
#set par(justify: false, leading: 0.65em, spacing: 0.7em)
#set list(spacing: 0.5em, indent: 0.6em, body-indent: 0.4em)
#show link: it => text(fill: accent, it)

// Header
#grid(
  columns: (1fr, auto),
  align: (left + horizon, right + horizon),
  text(size: 20pt, weight: "bold", "Paul Abrams"),
  text(size: 10pt, fill: muted, "Toronto, Ontario"),
)
#v(-0.4em)
#text(size: 10pt, fill: muted, "Senior Software Developer")
#v(0.1em)
#line(length: 100%, stroke: 0.6pt + accent)
#v(-0.3em)
#text(size: 9pt)[
  (819) 921-7192  #text(fill: muted, "  |  ")
  #link("mailto:j.paul.abrams@protonmail.com")[j.paul.abrams\@protonmail.com]  #text(fill: muted, "  |  ")
  #link("https://linkedin.com/in/paulabrams200")[linkedin.com/in/paulabrams200]  #text(fill: muted, "  |  ")
  #link("https://paulabrams.ca")[paulabrams.ca]
]
#v(0.6em)

// Date
#text(fill: muted)[May 7, 2026]
#v(0.4em)

// Salutation
Dear Chandan,
#v(0.4em)

Thank you for reaching out about the *Software Developer* contract at 222 Jarvis Street. The combination of large-scale enterprise web work, REST API and microservices design, Azure DevOps, and public-sector delivery standards is a strong match for what I've spent the last 15+ years doing in the Government of Canada.

A quick map of my background against the requirements you sent over:

#v(-0.3em)
- *Large-scale, multi-client enterprise web applications (10+ years).* My career has been built on systems of this shape - the Department of Justice's iCase legal case management system (an n-tier enterprise web application used by 5,000+ lawyers and agents nationwide, with role/object-based security and 24/7 availability), and most recently a microservices-architecture onboarding application at ESDC integrated with enterprise IAM.
- *REST APIs and microservices (5+ years).* On the BDM project I designed and consumed REST APIs between microservices, published and managed them through *Azure API Management* with policies for authentication, throttling, and transformation, and implemented OAuth 2.0 / OpenID Connect via *Azure AD / Entra*. I've also built REST tooling against the Azure DevOps and Lichess APIs and a JWT-authenticated WebSocket/REST server for my current independent project.
- *Azure DevOps.* One of my deepest specializations - administering departmental TFS/ADO instances, building CI/CD pipelines, writing PowerShell against the ADO REST API, and developing custom *web extensions in TypeScript / React / Node.js* (build/deploy analytics, people-by-project reporting, scheduled work-item digests) shipped to production teams.
- *Security gateways and protocols.* JWT, OAuth 2.0, OpenID Connect, TLS / SSL - applied to BDM (APIM policies, ITSG-33 / NIST controls against a PBMM profile) and TWNR (JWT auth on the WebSocket layer).
- *OO design, patterns, clean code; SQL tuning.* Enterprise OO codebases day-to-day (C\# / .NET federally; TypeScript and Java alongside), with emphasis on refactoring and pattern application. SQL Server and PostgreSQL primarily; Oracle-style stored-procedure work in current evaluation contracts. I once rebuilt an iCase homepage report by replacing live joins with a flat nightly-job table for a \~50× uncached speedup.
- *Agile delivery.* Professional Scrum Master I. I've led sprint ceremonies, run ADO-based capacity planning and forecasting, and introduced poker-planning estimation as a departmental practice.
- *Public-sector development standards.* 19 of my last 20 years in the Government of Canada delivering against federal SDLC, security (ITSG-33 / PBMM), and accessibility standards - directly analogous to OPS processes.

The through-line of my career has been *self-initiated automation that pays back substantial labour cost*: an RFT framework that compressed a 2-week all-hands regression cycle into one person reviewing results in five days (\~\$160K saved per release), an availability monitor that eliminated weekend overtime, and an ADO configuration-drift detector built because no off-the-shelf product covered the gap. I'd bring the same instinct to your client's team.

I'm based in Toronto and available for the fully onsite arrangement at 222 Jarvis. My current independent contracts are flexible and I can start on short notice. CV attached - happy to set up a conversation at your convenience.

#v(0.4em)
Best regards, \
Paul Abrams
