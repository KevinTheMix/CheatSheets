# Microsoft Copilot

## Quick Tips

* Use Researcher Agent to compensate no AI credits
* Old `m365.cloud.microsoft` URLs are being replaced by `copilot.cloud.microsoft`

### Resources

* [Copilot Cowork docs](https://learn.microsoft.com/en-us/microsoft-365/copilot/cowork)
* [Copilot Studio docs](https://learn.microsoft.com/en-us/microsoft-copilot-studio)
* [Microsoft Copilot docs](https://learn.microsoft.com/en-us/microsoft-365/copilot)
* [Work IQ docs](https://learn.microsoft.com/en-us/microsoft-365/copilot/extensibility/work-iq)
* [Copilot Cowork: A new way of getting work done](https://www.microsoft.com/en-us/copilot/blog/2026/03/09/copilot-cowork-a-new-way-of-getting-work-done)

## Glossary

* **Agent Builder** = for everyone (including non-technical), builds declarative agents from natural language inside Microsoft Copilot (_Work_ & _Web_ modes) & Teams
  * Knowledge sources = SharePoint, Copilot connectors, web
  * Skills supported (preview, Frontier program only)
  * No external actions/connectors/workflows (copy agent to Copilot Studio for that)
* **Brand Kit** = set of logos/colors/fonts/guidelines so Copilot generates on-brand content (eg in PowerPoint/Create)
* **Copilot Credits** = common currency for usage-based billing (eg Cowork, Work IQ API, advanced work in SharePoint/OneDrive)
  * Paid via PAYG, Copilot Credit Pre-purchase Plan (P3) or prepaid capacity packs
  * Monitored by admins in _Microsoft 365 admin center > Copilot > Cost management_
  * [Copilot Credit Estimator](https://aka.ms/CopilotCreditPlanningModel)
* **Copilot for M365** = former name of **Microsoft 365 Copilot**, ie paid add-on license (Premium) grounding Copilot in work data (Microsoft Graph & Work IQ) with priority access
* **Frontier program** = early access program to preview Copilot features (eg Cowork App skill, Agent Builder skills)
* **M365** = Microsoft 365, subscription suite (Word, Excel, PowerPoint, Outlook, Teams, OneDrive, SharePoint…)
* [Microsoft Copilot](https://copilot.cloud.microsoft) = AI assistant for work (formerly _Microsoft 365 Copilot app_), also available as desktop/mobile app, in Edge, Outlook & Teams
  * **Copilot Chat (Basic)** = included with M365, web-grounded only (work content must be uploaded/opened)
  * **Microsoft 365 Copilot (Basic)** = Copilot Chat + standard access to Copilot inside Office apps
  * **Microsoft 365 Copilot (Premium)** = add-on license, automatic grounding in work data, priority access, Cowork access
  * Model selector: _Auto_ (default router), _Quick response_, _Think deeper_ (Anthropic models available too)
* **Microsoft Copilot Cowork** = agent carrying out multi-step tasks on user's behalf across M365 (send emails, schedule meetings, create docs, post in Teams, deep research…), asking approval before sensitive actions
  * Open <https://copilot.cloud.microsoft> & select _Cowork_ in the top toggle next to _Chat_ (also in Outlook, Teams, desktop & mobile apps)
  * Built on Anthropic's _Claude Cowork_ technology, powered by Work IQ
  * Requires Premium license & usage-based billing (consumes Copilot Credits)
  * Built-in skills (Word, Excel, PowerPoint, PDF, Email, Deep Research…) + up to 50 custom skills & plugins
  * Scheduled & event-driven tasks (eg on email/Teams message received)
  * Model picker & reasoning effort level (quality vs speed vs cost)
  * `/cost` skill = displays number of credits used for a task
* [Microsoft Copilot Studio](https://copilotstudio.microsoft.com) = low-code studio to build/manage agents & workflows (actions, connectors), for makers, developers & IT pros
  * **Harness** = engine running an agent/workflow, impacting reasoning & billing
    * _GitHub Copilot harness_ = reasoning-heavy multi-step work
    * _Standard harness_ = rule-based agents with designed topics
    * _Copilot chat harness_ = extends Copilot Chat with organization knowledge
* **Pay-As-You-Go** (PAYG) = usage-based billing through an Azure subscription instead of a full license (eg Copilot Chat agents using work data, SharePoint agents, Copilot Studio)
  * Admins define billing policies (users + Azure subscription + budget) connected to a Copilot service
* [Power Platform](https://powerplatform.microsoft.com) = Microsoft low-code suite (Power Apps, Power Automate, Power BI, Power Pages, Copilot Studio)
* **Researcher** = built-in agent for deep, multi-step research across web & work data (files, emails, meetings, chats), producing cited reports with visuals
  * Found under _Agents_ in Microsoft Copilot chat
* **Tenant** = dedicated Microsoft Entra ID instance representing an organization (users, licenses, data, policies), identified by a tenant ID
  * Copilot only accesses data within the user's tenant, respecting its permissions & admin settings
* **Work IQ** = context/data/skills/tools business intelligence/semantic layer that personalizes copilot to an organisation
  * Included in Premium license (can be turned on/off), or billed separately in Copilot Credits via **Work IQ API** for custom apps/agents
  * Also available via 3rd party MCP: `npx -y @microsoft/workiq mcp` (eg in GitHub Copilot), needs admin consent & usage-based billing plan
  * `workiq accept-eula` = accept license before first use
  * `workiq ask -q "<question>"` = query M365 data from CLI
