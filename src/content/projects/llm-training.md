---
title: "LLM Training & Code Evaluation"
tech: ["JavaScript", "TypeScript", "C#", "Python", "VBA", "React", "Jest", "Vitest", "Node.js", "Docker"]
category: "software-development"
order: 0
---
Training Large Language Models on software development tasks for clients such as [DataAnnotation.tech](https://www.dataannotation.tech/). The work spans expert code review of AI-generated code, comprehensive unit and integration testing across multiple languages and frameworks, and the design of prompt fixtures that probe model failure modes.

- **Adversarial prompt design.** Construct prompts where the model has to make a new set of TypeScript or JavaScript unit tests pass *without* breaking the existing regression suite, exposing the common failure mode of "fixing" things by deleting tests that were already passing.
- **Real-world fixtures from real bug reports.** Mine open GitHub issues from users who fundamentally misunderstand a project's architecture and turn the misunderstanding into a structured prompt - closer to the kind of task a developer actually receives in practice.
- **Domain breadth.** Beyond mainstream stacks: enterprise-style VBA challenges that exercise document generation, event handling, COM Interop, and Office app integration (Outlook, Word, PowerPoint); multi-hop API challenges in Python that force the model to chain several public APIs to solve a single data problem.
- **Recent work** has included unit-test contributions for the Discourse forum software exercising its Docker-heavy build and runtime environment.
