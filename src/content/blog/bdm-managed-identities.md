---
title: "Trading PATs for Managed Identities: a 90-day rotation story"
description: "An Azure microservices app I inherited at ESDC was held together by Key Vault secrets and Personal Access Tokens on a 90-day rotation. A missed alert was an outage. The fix wasn't better rotation — it was getting rid of the secrets."
pubDate: 2026-05-29
draft: true
tags: ["azure", "managed identities", "security", "esdc", "bdm", "lessons learned"]
---

A few years into my time on the Benefits Delivery Modernization (BDM) project at Employment and Social Development Canada — at the time, the largest IT modernization effort in the Government of Canada — I inherited a microservices application used by departmental procurement personnel to onboard contractors and other personnel onto the project. It had a Blazor front end and a fan-out of Azure Functions behind it. The Functions did the real work: creating Azure DevOps work items, kicking off pipelines, sending requests to an on-premises Active Directory provisioning integration (mirrored to Azure AD via AAD Connect), and finally applying AAD group memberships based on a person's profile.

I didn't design any of it. By the time it got to me, it had been built, deployed, and was already in production. What I did own was keeping it running, enhancing it, and — eventually — quietly fixing a class of incidents that I was tired of being on the receiving end of.

## How the credentials were wired

Every downstream call the application made authenticated using a long-lived secret of some kind:

- **Azure App Registration client secrets** in Key Vault, used by the Functions to talk to other Azure resources.
- **Azure DevOps Personal Access Tokens** (PATs), used to call the ADO REST API to create work items and execute pipelines.
- **Function App Settings** referencing the Key Vault entries.

The organization's security policy mandated a 90-day rotation on all of it. In practice, rotating meant: generate a new secret in Azure or ADO, update the Key Vault entry, update the corresponding Function App setting, restart the Function App, and verify everything downstream still worked. There was an alerting setup that warned ahead of expiry.

It mostly worked. The problem was the "mostly."

## Two ways the design quietly hurt us

The first way was operational. If someone missed an expiry alert — vacation, inbox noise, alert routed to a stale distribution list, whatever — the application went down. Not gracefully, either. A Function would call ADO with an expired PAT, get a 401, and the onboarding workflow for whoever was on that submission would fail in the middle. We'd then scramble to find the right person to regenerate the secret, push it through the same rotation steps, and restart everything. The pattern was familiar enough that I started recognizing the support tickets on sight.

The second way was subtler, and bothered me more once I saw it. Because every ADO call was authenticated by a PAT, and every PAT belongs to a *person*, every work item the application auto-generated was attributed to whichever individual had owned the PAT. That person hadn't done the work. The application had. From an audit perspective it was wrong; from a "who do I ask about this work item?" perspective it was misleading; and from a "what happens when that person leaves the team?" perspective it was a future outage waiting to happen.

The underlying issue in both cases was the same: we were treating long-lived secrets as the credential mechanism for a service that already had a perfectly good *identity* mechanism. The Function App is a thing in Azure. It already exists in the directory. Why was it borrowing a person's PAT to act on its own behalf?

## The fix

The Azure feature for this is **Managed Identities**: a service principal in Entra (Azure AD) that's tied directly to an Azure resource, with tokens issued at runtime. No secret to store. No rotation to miss. No human's name on automated activity.

The migration itself was conceptually simple and operationally fiddly:

1. **Enable a system-assigned Managed Identity** on the Function App. This creates the service principal in Entra.
2. **Replace the App Registration / Key Vault / client-secret flow** for Azure-to-Azure calls with `DefaultAzureCredential` (or its equivalent), which picks up the Managed Identity at runtime. Code-side, this was mostly deleting credential plumbing.
3. **Add the Managed Identity to the Azure DevOps organization as a user**, and grant it scoped permissions for the things the Functions actually needed to do — create work items in a specific project, queue specific pipelines, and nothing else.
4. **Replace the PAT-based ADO REST calls** with token acquisition against the ADO resource ID using the Managed Identity.

Step 3 needed cross-team partnership. I didn't own the ADO Services tenant and I didn't own Entra; both have their own administrators with their own change processes. So the rollout involved coordinating with the ADO Services admin to add the identity to the organization and scope its access, and with the Entra admins to align the directory side. None of that is technically complicated, but it's the kind of thing where ignoring the people part is how a migration stalls for six months.

After the migration: no more rotation tickets. No more 90-day secret cycle on the ADO side. Work items created by the application were attributed to *the application*, which is what should have been happening all along.

## What I'd take from this

The temptation when you inherit something fragile is to make the fragility more reliable — better alerting, better rotation runbooks, better handoffs. Sometimes that's the right move. But often the fragility is a symptom of a category error, and the leverage move is to stop doing the thing entirely. Long-lived secrets stored in a vault and shuttled into app settings are a category error when your platform already issues runtime identity tokens for free. Once the credentials don't exist, neither does the rotation problem, the missed-alert problem, the vault-sprawl problem, or the attribution problem. They're all gone in the same edit.

The other thing I keep coming back to is the difference between *credentials* and *identity*. A PAT is a credential — a bearer secret that says "whoever holds this can act as me." A Managed Identity is identity — the platform itself vouching, at runtime, for who's calling. When a service is calling on its own behalf, identity is what you want. Credentials are just a fragile proxy for it.

Inheriting code is one of the more honest tests of an engineer. You didn't choose the design, you don't have the original author's context, and you're judged on what happens *after* you take it over. The Managed Identities migration is one I'm glad I made time for, because the alternative was a tax that everyone after me would have kept paying.
