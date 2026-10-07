# Azure DevOps

## Quick Tips

## Glossary

* _AzureKeyVault@2_ (task, where _@2_ is obligatory major version pin) = downloads Azure Key Vault secrets as secret (masked) pipeline variables, usable in later steps as `$(secret-name)`
  * `azureSubscription` = Azure Resource Manager service connection; its service principal needs _Get_ + _List_ on secrets (access policy) or the _Key Vault Secrets User_ role (RBAC)
  * `SecretsFilter` = `'*'` (all) or comma-separated secret names; `RunAsPreJob: true` = fetch before any other step so secrets are available to the whole job
  * Secret variables are NOT exposed as env vars to scripts automatically: map them explicitly via pipeline YAML `env:` section (eg `MY_PWD: $(my-pwd)`)
* **Azure Resource Manager (ARM)** = Azure's deployment/management layer: every create/update/delete of an Azure resource (from Portal, CLI, PowerShell, Terraform…) goes through its API
  * Referenced by Azure tasks via their `azureSubscription` input; what they can do depends on the RBAC roles granted to that identity
* **Service Connection** = manage endpoints/tokens to external services
  * _ARM service connection_ = credential pipelines use to authenticate to Azure, backed by a service principal or managed identity (workload identity federation recommended over client secret), scoped to a subscription/management group/resource group

## Menus

* **Overview** = project summary/dashboard, wiki, teams & their members/permissions
* **Boards** = work items (epics/features/user stories/tasks/bugs), sprints/backlog, kanban boards, queries
* **Repos** = Git repos browsing, branches, commits, pull requests, tags, branch policies
* **Pipelines** = build (CI) pipelines, classic Releases (CD), environments, task groups, deployment groups, library (variable groups/secure files)
  * _Pipelines_ (CI) = fetch sources from Git, restore dependencies, compile/build, run tests, produce an artifact (.zip, .dlls, Dockr image, etc)
    * _Edit > (vertical) … > Triggers > YAML > Get sources > Select a source_ = change Service connection to primary source repo (from which ADO obtains YAML pipeline file itself, which can reference other endpoints)
  * _Releases_ (CD) = takes built artifact, design stages visually to deploy it to environments with approvals/gates/variables (now refered to as "Classic Release", as opposed to configuring multi-stages YAML pipelines recommended by Microsoft)
    * _Edit > click a stage lightning/user icon buttons_ = configure Pre-/Post-deployment conditions (triggers & approvals)
    * _Edit > click a stage "n jobs, m tasks" > add/modify/remove Tasks_ (may also contain Service connections eg to fetch some secrets from Kubernetes)
  * _Task Group_ = edit existing Release Task Groups (also via right-click in its stage > _Manage task group_)
* **Test Plans** = manual/exploratory test plans & suites, test cases, test results/runs
* **Artifacts** = package feeds (NuGet/npm/Maven/etc) published from pipelines or pushed manually
* **Project settings**
  * General > _Notifications_ = configure global e-mail notifications
  * Pipelines > _Service connections_
* **User settings**
  * _Notifications_ = configure personal e-mail notifications
