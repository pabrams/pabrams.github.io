#let accent = rgb("#1f4e79")
#let muted = rgb("#555555")

#set document(title: "Paul Abrams - Cover Letter - LotusFlare Senior Backend Engineer", author: "Paul Abrams")
#set page(
  paper: "us-letter",
  margin: (x: 0.85in, top: 0.65in, bottom: 0.6in),
)
#set text(font: ("DejaVu Sans", "Liberation Sans"), size: 10pt, fallback: true)
#set par(justify: false, leading: 0.65em, spacing: 0.78em)
#show link: it => text(fill: accent, it)

// Header
#grid(
  columns: (1fr, auto),
  align: (left + horizon, right + horizon),
  text(size: 20pt, weight: "bold", "Paul Abrams"),
  text(size: 10pt, fill: muted, "Toronto, Ontario"),
)
#v(-0.4em)
#text(size: 10pt, fill: muted, "Senior Backend Engineer")
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
#v(0.3em)

// Date
#text(fill: muted)[July 23, 2026]
#v(0.2em)

Dear LotusFlare Hiring Team,

I'm writing to apply for the *Senior Backend Engineer* role. What draws me to LotusFlare is the shape of the problem: mission-critical, highly available distributed systems handling millions of concurrent API calls, owned end-to-end by the engineers who build them. That describes the systems I've spent 15+ years building and operating — and the way I like to work.

The "ownership" expectation is where I'd start. My current independent project, *TWNR* (#link("https://twnr.paulabrams.ca")[twnr.paulabrams.ca]), is a public multiplayer game I architected, shipped, and operate on production *solo* — a Dockerized *Node.js + WebSocket* backend on *PostgreSQL*, with *JWT auth*, a *JSON-Schema-generated REST API contract* that doubles as live documentation, and *concurrency-correct game state* via transactional locking (`SELECT … FOR UPDATE`). Before that, I spent nearly four years enhancing and *production-supporting a cloud-native microservices platform* at Employment and Social Development Canada — REST APIs between services, governed through an *API gateway (Azure API Management)*, with *queue-driven asynchronous fan-out* for bulk workloads. Earlier, at the Department of Justice, I was a core developer on a *load-balanced, geographically distributed* platform serving *5,000+ concurrent users nationally, 24/7*, where I rebuilt a high-traffic reporting path for a *~50× speedup* and built a self-initiated *availability-monitoring suite* across the distributed tiers.

Against your requirements, briefly:

#v(-0.3em)
- *5–7+ years of scalable, secure production web services* — 15+, across national-scale government platforms and self-operated products.
- *Language-agnostic approach* — production *Node.js* (Express, NestJS) and *.NET / C\#*, plus *Java* and *Python*. I haven't shipped Lua or Scala, but I grade code across ten-plus languages for LLM-evaluation contracts; new languages on a strong distributed-systems foundation come fast.
- *REST APIs, gateways, documentation, security* — API design between microservices, APIM gateway policies, self-documenting JSON-Schema contracts, *OAuth 2.0 / OIDC / PKCE / JWT*.
- *Concurrency and fault tolerance in high-traffic environments* — transactional locking, async queue-based fan-out, load-balanced multi-tier deployments, availability monitoring.
- *Security best practices* — DevSecOps by default: *SonarQube* and *OWASP ZAP* in pipelines, CWE/CVSS-graded audits, Managed Identities, TLS/certificate management, NIST-based controls.
- *SQL and NoSQL data modeling* — deep SQL Server / Azure SQL / PostgreSQL (schema design, indexing, partitioning, execution-plan tuning), working MongoDB.
- *Cloud, containers, serverless* — *Docker, Kubernetes/AKS, OpenShift*, Azure Functions, Terraform, CI/CD across Azure DevOps, GitHub Actions, and Jenkins; Azure, AWS, and GCP exposure.

Your day-to-day — standups, the full develop/test/review/production cycle, close collaboration with product — matches how I've worked for years, including as a certified Scrum Master. I'm a Canadian citizen based in Toronto, comfortable working across time zones with a global team, and available on short notice. My CV is attached — I'd welcome the chance to talk.

#v(0.1em)
Best regards, \
Paul Abrams
