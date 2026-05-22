---
title: "Internal QA Tools & Test Automation (ESDC)"
tech: ["C#", ".NET", "SQL Server", "Selenium", "Azure DevOps Pipelines", "REST API", "PowerShell", "JMeter"]
category: "software-development"
order: 4
---
Co-architected an internal C# / .NET web application enabling QA staff and business analysts to author structured automated test scenarios via a point-and-click web UI at ESDC, during a development assignment to the Pensions automated testing initiative. Test scenarios were stored in a versioned SQL Server schema; an on-the-fly script generator translated each scenario version into executable Selenium code.

**Bidirectional REST API design.** Co-designed the REST API on the web-app side that bridged the test-authoring application with Azure DevOps pipelines:

- **Script-fetch endpoint** — pipelines called into the web app to retrieve the on-the-fly-generated Selenium code for a specific test scenario version. Scripts couldn't live in a git repo because they were generated from the SQL authoring model at run time, so a pull-based REST API was the only viable shape.
- **Results-push endpoint** — at the end of execution the pipeline POSTed structured per-step outcomes (pass/fail, screenshots, timing) back to the web app, bound to the run record in SQL.

Azure DevOps acted as the execution engine; the custom API owned the test domain and the historical record. Collaborated with the web-side developer who finalized and deployed the API; I owned the script-generation code, the ADO pipeline integration, and the agent infrastructure.

**Pipeline engineering.** Engineered ADO pipelines for automated testing, provisioning Windows agent machines to execute parallel Selenium UI tests against deployed applications and integrating logged test results back into ADO work items.

**Performance testing.** Championed the departmental transition from LoadRunner to JMeter, significantly reducing licensing costs while maintaining robust performance-testing capabilities.
