---
title: "CI/CD Modernization (CIC)"
tech: ["TFS", "PowerShell", "CI/CD", "XAML Builds", "TFS Client APIs", "witadmin"]
category: "devops"
order: 3
---
Hired alongside one other engineer at the Department of Citizenship and Immigration to take over a TFS/release-management environment that had been built and maintained by a contractor team. The environment was over-engineered: release engineers were clicking through custom desktop UIs every release night, and the GCMS team's process template was being maintained as raw XML deployed via `witadmin.exe` through a layer of contractor-built tooling rife with technical debt and unnecessary developer-facing features.

- Decommissioned the legacy C# desktop applications used for release management and replaced them with lightweight PowerShell scripts calling the TFS Client APIs and `witadmin` directly. Net result: most of the contractor tooling was simply deleted.
- **Everything about the application ended up in source control** — group memberships, permissions, repository access, process template customizations. The desktop tooling had required UI interaction that wasn't reproducible; replacing it with scripts versioned in TFS made the configuration history visible, reviewable, and recoverable.
- Guided teams in migrating from legacy XAML builds to modern, scriptable build definitions.
- Improved build reliability and maintainability across the organization.
- Wrote runbooks for TFS instance operation, maintenance, and troubleshooting so the work could be handed off cleanly.
- Mentored a junior team member on SSRS, T-SQL, and reports development as part of the broader handover.
- Worked under the constraint of an IE8-mandated environment well into the mid-2010s, which forced backward-compat work on Team Calendar and other extensions used in the department.
