---
title: "Azure DevOps Web Extensions"
tech: ["TypeScript", "React", "Node.js", "Azure DevOps SDK", "PowerShell", "Charts.js"]
category: "software-development"
order: 2
---
Built a series of custom Azure DevOps web extensions and scheduled-pipeline tools to fill specific workflow gaps that the out-of-the-box product didn't address. First exposure to Node.js, TypeScript, and React professionally - picked up while solving real problems.

- **Build/deploy analytics widget.** Configurable by pipeline folder path, the widget recursively considers every build and deployment under that path and renders success-rate charts by team using the ADO Builds API and Charts.js. Lets a team or program lead see at a glance which pipelines are healthy, with no SQL or external BI infrastructure required.
- **People-by-project reporter.** ADO tracks user identities at the organization level, not the project level, which makes "who is on which project" surprisingly hard to answer. Built an extension that uses an in-memory hashmap to cross-reference users against project memberships efficiently — the naive query pattern was unusably slow.
- **Weekly work-item digest emailer.** ADO had no time-based notification triggers, so I set up scheduled ADO pipelines that ran PowerShell against the work-item REST API and sent digest emails through a departmental SMTP server. A small but heavily-used piece of internal plumbing.
- **VSTS Team Calendar fork (CIC era).** Forked Microsoft's [`vsts-team-calendar`](https://github.com/microsoft/vsts-team-calendar) extension and added configurable colors, Outlook integration, release-management features, and IE8 backward-compatibility for the department's mandated browser. Maintained the fork against upstream changes and contributed back where possible.

Built across multiple departments, with a small handful of contributions made back upstream to Microsoft's [`vsts-team-calendar`](https://github.com/microsoft/vsts-team-calendar) and [`tfs-cli`](https://github.com/microsoft/tfs-cli) repos along the way.
