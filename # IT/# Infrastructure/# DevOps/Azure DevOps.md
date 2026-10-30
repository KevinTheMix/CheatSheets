# Azure DevOps

## Quick Tips

* Clone URLs for a project name containing spaces (eg *My Project*) differ per protocol:
  * HTTPS = spaces percent-encoded: `https://dev.azure.com/<org>/My%20Project/_git/<repo>`
  * SSH = spaces literal (quote URL in shell), no `%20`: `git@ssh.dev.azure.com:v3/<org>/My Project/<repo>`
  * Copy exact URL from *Repos > Files > Clone*

## Glossary

* *AzureKeyVault@2* (task, where *@2* is obligatory major version pin) = downloads Azure Key Vault secrets as secret (masked) pipeline variables, usable in later steps as `$(secret-name)`
  * `azureSubscription` = Azure Resource Manager service connection; its service principal needs *Get* + *List* on secrets (access policy) or the *Key Vault Secrets User* role (RBAC)
  * `SecretsFilter` = `'*'` (all) or comma-separated secret names; `RunAsPreJob: true` = fetch before any other step so secrets are available to the whole job
  * Secret variables are NOT exposed as env vars to scripts automatically: map them explicitly via pipeline YAML `env:` section (eg `MY_PWD: $(my-pwd)`)
* **Azure Resource Manager (ARM)** = Azure's deployment/management layer: every create/update/delete of an Azure resource (from Portal, CLI, PowerShell, Terraform…) goes through its API
  * Referenced by Azure tasks via their `azureSubscription` input; what they can do depends on the RBAC roles granted to that identity
* **Service Connection** = manage endpoints/tokens to external services
  * *ARM service connection* = credential pipelines use to authenticate to Azure, backed by a service principal or managed identity (workload identity federation recommended over client secret), scoped to a subscription/management group/resource group

## Menus

* **Overview** = project summary/dashboard, wiki, teams & their members/permissions
* **Boards** = work items (epics/features/user stories/tasks/bugs), sprints/backlog, kanban boards, queries
* **Repos** = Git repos browsing, branches, commits, pull requests, tags, branch policies
* **Pipelines** = build (CI) pipelines, classic Releases (CD), environments, task groups, deployment groups, library (variable groups/secure files)
  * *Pipelines* (CI) = fetch sources from Git, restore dependencies, compile/build, run tests, produce an artifact (.zip, .dlls, Dockr image, etc)
    * *Edit > (vertical) … > Triggers > YAML > Get sources > Select a source* = change Service connection to primary source repo (from which ADO obtains YAML pipeline file itself, which can reference other endpoints)
  * *Releases* (CD) = takes built artifact, design stages visually to deploy it to environments with approvals/gates/variables (now refered to as "Classic Release", as opposed to configuring multi-stages YAML pipelines recommended by Microsoft)
    * *Edit > click a stage lightning/user icon buttons* = configure Pre-/Post-deployment conditions (triggers & approvals)
    * *Edit > click a stage "n jobs, m tasks" > add/modify/remove Tasks* (may also contain Service connections eg to fetch some secrets from Kubernetes)
  * *Task Group* = edit existing Release Task Groups (also via right-click in its stage > *Manage task group*)
* **Test Plans** = manual/exploratory test plans & suites, test cases, test results/runs
* **Artifacts** = package feeds (NuGet/npm/Maven/etc) published from pipelines or pushed manually
* **Project settings**
  * General > *Notifications* = configure global e-mail notifications
  * Pipelines > *Service connections*
* **User settings**
  * *Notifications* = configure personal e-mail notifications
