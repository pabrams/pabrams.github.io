---
title: "How I saved taxpayers hundreds of thousands of dollars per year as a neophyte engineer at the Department of Justice"
description: "Automating regression testing at the Department of Justice in the mid-to-late 2000s."
pubDate: 2026-05-07
tags: ["automated testing", "career accomplishments"]
---

I’m writing this story down so I can stop retelling it to every recruiter and hiring manager who asks. It happened in the mid-to-late 2000s, when test automation wasn’t the standard business practice it is today. Keep these things in mind, before you judge me for my horn-tooting.

I had recently joined the development team at the Department of Justice, working on the department's web-based case management application. Before long, I noticed a major bottleneck in our release cycle. Leading up to every release, the entire team \- business analysts, developers and testers alike \- spent two full weeks manually running through comprehensive regression testing scenarios. It was boring, repetitive work, and it struck me as something that could be mostly automatic.

When I asked why we did this, I learned that previous releases had been plagued by repeated, high-profile regression bugs. Because the software was critical to the department's operations, there was tremendous pressure to prevent the introduction of any more production issues.

As it turned out, I wasn’t the first to think of automating the UI tests. They had already purchased licenses for IBM's Rational Functional Tester, but were daunted by the apparently enormous task of translating English test scenarios to test scripts. Nobody was quite sure how to do it, and everyone was too busy doing the manual testing to find out.

There was also a trust problem. Even if we invested all that time and effort building the scripts, would they really catch problems as well as humans could? What if the people writing the scripts made mistakes? The business team couldn’t read the code, and after the string of recent release disasters, they didn’t have a lot of faith in the development team. As far as they were concerned, the only reliable safeguard was throwing more manual effort at every release.

What I noticed, though, was that the scenarios themselves were very well written. They described exactly what to do, in a consistent style, step by step. That made me realize that their translation from English to Java could be mostly mechanical. If the automated framework was structured in the right way, the script code could end up looking almost identical to the test scenarios themselves, with a one-to-one correspondence between each manual test step and line of code:

|   | Manual test scenario step | Java code |
| :---- | :---- | :---- |
| 1\. | Click the “Files” menu. | clickMenu(“Files”); |
| 2\. | Select “Litigation” from the “File type” dropdown. | selectItem(“File Type”, “Litigation”); |
| 3\. | Select “Active” from the “File Status” dropdown. | selectItem(“File Status”, “Active”); |
| 4\. | Enter “ABC-123” in the “File Number” textbox. | enterText(“File Number”, “ABC-123”); |
| 5\. | Click Submit. | clickButton(“Submit”); |

(Later, I convinced them that it would be better to use consistently defined identifiers like cboFileType instead of literal strings like “File Type”, for reasons I’ll skip here.)

Excited about the possibility of avoiding all that manual drudgery, I cobbled together a basic test framework in Java and translated a small sample scenario. Watching the software click through a full test scenario on its own for the first time was one of those exquisitely satisfying moments software engineers live for. I demoed it first to the lead tester, then to our manager, and finally to the application owners. The benefit was obvious to everyone, and I was assigned to lead a small team of testers and developers to finish the framework and clean up the scenarios so they could be fed into the script generator and turned into ready-to-run Java tests.

We had most of the scenarios ready in time for the next release. To prove the scripts could catch the same bugs as the human testers, the rest of the team continued with manual testing while my small group ran the automated suite in parallel. The scripts held their own, and that was the end of manual regression testing. 

We replaced the full-time effort of 25 people for 10 days with the effort of one person for five days, a savings of roughly 245 person-days per application release, or about $125,000 in today’s money. With an average of 3 or 4 releases a year, the savings added up quickly.

Looking back, what stands out to me isn't really the technical achievement. The framework was straightforward, and the trick of mapping English steps one-to-one onto code wasn't a stroke of genius so much as an obvious pattern once you noticed it. What made the difference, I think, was the laziness inherent in any good automation engineer \- the urge to automate the repetitive stuff so we can free ourselves up for more stimulating work.

 

