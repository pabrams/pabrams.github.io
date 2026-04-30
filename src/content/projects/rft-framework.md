---
title: "Automated Test Framework (DOJ)"
tech: ["Java", "C#", "SQL Server", "IBM Rational Functional Tester", "Test Automation"]
category: "software-development"
order: 5
---
Identified a critical regression-testing bottleneck at the Department of Justice and voluntarily architected a custom Java-based framework in IBM Rational Functional Tester (RFT) that parsed English-language scenario documents and auto-generated executable test scripts. Originally attempted in VB.NET; pivoted to Java on advice from IBM support, who confirmed the .NET path was effectively unsupported.

Replaced the department's "all-hands" manual regression cycle - roughly 20–25 testers running for two weeks every release - with one person reviewing automated results in five days. **~98% reduction in release validation effort**, eliminated the standing 2-week code freeze per release, and saved an estimated $160,000 per cycle.

- Wrote a separate test manager in C# and SQL Server to schedule scripts, execute them on RFT VMs, and track results.
- Built round-trip code generation: not only did the framework turn English scenarios into scripts, it could also reproduce updated English-language scenarios from the script source, so QA staff could keep working in their native medium.
- Trained a team of QA Specialists to author scenarios and ran consecutive co-op summers training students to extend the framework for new modules.
- Authored a multi-document knowledge base covering installation, configuration, maintenance, troubleshooting, and test management.
- Contributed over 500 posts on the IBM Developerworks Automated Functional Testing forums, helping other practitioners with Java/RFT framework patterns.
