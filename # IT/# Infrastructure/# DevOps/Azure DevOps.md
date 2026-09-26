# Azure DevOps

## Quick Tips

## Glossary

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
  * _Service connections_ = manage endpoints/tokens to external services
