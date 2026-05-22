---
title: "Legal Case Management System (DOJ)"
tech: ["ASP.NET", "C#", "SQL Server", "Knockout.js", "SSRS", "JavaScript", "Microsoft Dynamics CRM", "LINQ", "SSIS"]
category: "software-development"
order: 3
---
Multi-year role as a core contributor on the Department of Justice Canada's flagship Legal Case Management System (iCase) - a distributed enterprise application used by 5,000+ lawyers and agents across Canada to manage sensitive case files, timekeeping, billing, and reporting. The system was multi-tier (web/app/db) with role- and object-based security, integrated with the department's records management, financial, and email systems, and had to remain available 24/7.

**Homepage / "My iCase" portal.** Led development of a customizable widget-based portal that became the new entry point to iCase. Gathered requirements directly from the business analyst team, ran JAD sessions, produced prototypes, and authored the BDD/TDD documentation before implementing the application largely solo. Built on ASP.NET Web Parts and the Personalization framework with a custom SQL personalization provider, Knockout.js for MVVM binding, async AJAX web service calls, an async HTTP handler that served images out of cached business objects, Microsoft ReportViewer in remote SSRS mode, and a JavaScript polyfill to make HTML5 work in the department-mandated IE8.

- Diagnosed a homepage report that took ~10 seconds uncached: profiled it with SQL Profiler, Report Execution logs, and actual execution plans, then replaced the heavy live joins with a flat table populated by a nightly job (the report only needed up-to-yesterday data). Result: roughly **50× faster uncached, 3–4× faster cached**.

**Reliability and monitoring.** Built a self-initiated availability-monitoring suite for the web and document servers because support staff were logging in evenings and weekends to run the same checks manually. Scheduled tests pinged each server, and failures were emailed to the appropriate operations group. Eliminated significant overtime hours and reduced the human-resource risk of relying on volunteer monitoring.

**COM Interop memory leak.** Diagnosed and resolved a memory leak across the document servers and implemented automated health monitoring to catch regressions.

**Reporting modernization.** Contributed to the multi-year migration from Crystal Reports to SSRS, including authoring 14 new SSRS reports for the Legal Risk Management module, and provided technical guidance to the reports team on the conversion pattern.

**Dynamics CRM successor (2016–2018).** Returned to the project as dev lead on the legacy iCase side while concurrently helping build its Microsoft Dynamics CRM replacement. On the iCase side, modified schema and front-end UI to surface migration status to users in real-time, and adjusted the integration stored procedures (`icisp_*`) consumed by the financial information system. On the Dynamics side, engineered CRM plug-ins, custom actions, and processes; rewrote SQL stored procedures as C# with LINQ inside CRM; and used SSIS for the ETL between the two systems.

**Entity Framework evaluation.** Evaluated Entity Framework for adoption on the iCase platform — prototyped a next-generation iCase on ASP.NET MVC3 with Razor and Entity Framework to assess fit, then recommended *against* adoption. The existing Repository Pattern over SQL Server stored procedures was meeting the application's needs, and the assessment surfaced enough friction with EF in the iCase context to make the switch a net loss.

**Other contributions.** Co-led the SQL Server 2005 -> 2012 database upgrade including dev coordination and testing; rebuilt iCase's UI as a widget-based interface using Knockout.js and ASP.NET to eliminate full-page postbacks and reduce server load; built a self-service icon library so the business team could maintain iCase iconography without developer involvement; contributed to the Internet Explorer 8 compatibility upgrade; participated in the GoC GCTools Hackathon; built a Timekeeping Compliance Indicator giving employees and managers a real-time view of progress against expected hours.

**Mentoring.** Trained co-op students on iCase and the automated test framework over consecutive summers, mentored a junior developer in SSRS and T-SQL on a sister project, and supported a deaf colleague (ASL/LSF first language) through the SQL Server upgrade - a useful exercise in patient, written-first technical collaboration.

**Recognition.** Department of Justice Team Merit Award (2012, Cost Recovery Process Improvement); Team Merit Award (2011, Chart of Accounts implementation); Team Spirit Award (2009).
