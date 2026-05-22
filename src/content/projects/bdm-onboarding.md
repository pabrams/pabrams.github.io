---
title: "BDM Onboarding Application (ESDC)"
tech: ["C# .NET", "Blazor", "Azure SQL", "Azure Functions", "Azure Logic Apps", "APIM", "GraphQL", "Azure AD / Entra", "Managed Identities", "Key Vault"]
category: "software-development"
order: 6
---
Enhanced and maintained a microservices-architecture application for onboarding personnel at Employment and Social Development Canada's Benefits Delivery Modernization (BDM) project — at the time, the largest IT project in the Government of Canada. The application combined a Blazor front end used by departmental procurement personnel with a fan-out of Azure Functions, Azure SQL persistence, Azure API Management at the edge, and integrations into Azure DevOps and on-premises Active Directory (mirrored to Azure AD / Entra via AAD Connect).

**Event-driven workflow.** Submissions from procurement kicked off durable Azure Functions that used the Azure DevOps REST API to create work items and execute pipelines; downstream the functions provisioned users in on-prem Active Directory and applied AAD group memberships based on personnel profile. Bulk submissions fanned out through asynchronous handoffs across the microservices.

**Migration to Azure Managed Identities.** When I inherited the application, downstream authentication was a combination of Azure Key Vault secrets and Azure DevOps Personal Access Tokens, all subject to a 90-day rotation policy. Rotation required regenerating secrets, updating Key Vault entries, updating the Function App's settings, and restarting it; a missed alert could take the whole application down. Separately, because ADO calls were authenticated by a PAT, every auto-generated work item was attributed to whichever individual the PAT belonged to — operationally awkward and a quiet auditing problem.

The fix was to migrate the downstream identity to **Azure Managed Identities**: service principals issued at runtime through Entra. I added the managed identity directly to the Azure DevOps organization and scoped its permissions appropriately, partnering with the ADO Services and Entra administrators on the rollout. The migration eliminated the entire secret-rotation incident class and properly attributed automated activity to the application itself.

Inherited from a previous team; not all of the original design decisions were mine, but enhancements, identity modernization, and ongoing maintenance landed on my desk.
