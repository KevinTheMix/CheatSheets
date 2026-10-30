# GitHub

GitHub is a web platform hosting (mostly software) projects using Git.

## Quick Tips

* Uploading an (existing) local repo to GitHub:
  1. create a repo on GitHub via website or [CLI](https://cli.github.com)
  2. add a remote using the URL provided by GitHub on creation (eg `git remote add origin "https://github.com/{user}/{repository}"`)
  3. push local onto remote repo (eg `git push origin master`)
* Set repo/global e-mail to [GitHub e-mail](https://github.com/settings/emails) (or use anonymous one if enabled)
* If a **README** file is present in the repo, its content gets displayed (with homonyms priority: *README.md* > *README* > *README.txt*)

## Glossary

* **Dependabot** = (user created, now GitHub-maintained) bot that opens pull requests to update vulnerable/outdated dependencies (eg npm, pip, Maven, NuGet, Docker, GitHub Actions)
  * *.github\dependabot.yml* = **optional** config for **version updates** (ecosystem, directory, schedule), read from default branch
  * **Alerts** = notify about vulnerable dependencies (enabled in *Settings > Advanced Security*)
  * **Security updates** = automatic pull requests fixing alerted dependencies, no config file needed
  * **Version updates** = scheduled pull requests keeping dependencies current, need *dependabot.yml*
* **Deploy Keys** = a SSH key attached to a single GitHub repo that grants read/write access to that repo only, without requiring a personal user account (mostly intended for CI/CD, servers, bots)
  * *~/.ssh/config* = file that tells SSH which private key to use for which host/alias
  * Generate a public/private pair of SSH keys in a *.ssh* folder via `ssh-keygen -t ed25519 -f ~\.ssh\<key_name> -C <public_key_comment>` (`mkdir .ssh` if it does not exist yet)
  * Create/generate (ask AI) a *config* file in same *.ssh* folder that sets a host alias, references private SSH key file, and probably `Port 443` (since most companies firewall block default 22)
  * Go to GitHub repo (use private browsing if necessary) > *Settings > Deploy keys*, set a title (eg *Work computer*), paste content of SSH public key (also check *Allow write access*)
  * If the repo is public and already cloned, it must be locally configured to use SSH, not HTTPS (check what `git remote get-url origin` displays, run `git remote set-url origin git@<host_alias>:<user>/<repo>.git` if HTTPS)
  * If the repo is private, it must now be cloned, using `git clone git@<host>:<user>/<repo>.git` where *host* is the Host title field defined in the config file
  * Test using `ssh -T git@<host_alias>` & `git remote -v`
* **GitHub Actions** = (disable-able) CI/CD workflow feature to produce releases (artifacts), processed by short-term GitHub virtual machines (up to some alloted compute time)
  * Any *.yml*/*.yaml* file directly in `.github\workflows\` (no subfolders) is picked up automatically once pushed to GitHub
  * Runs are started according to its `on:` triggers (eg `push`/`pull_request`/`schedule`/`workflow_dispatch`, and `schedule`/`workflow_dispatch` if file is on default branch)
  * Conventional workflow file names = *ci.yml* (build/test/lint on push & pull request), *release.yml*, *deploy.yml*
* **GitHub Codespace** = shared online IDE (eg Visual Studio Code, JetBrains, GitHub CLI)
* **GitHub Container Registry** ([GHCR](https://ghcr.io)) = GitHub's container image registry (à la Docker Hub), part of GitHub Packages
  * Images named `ghcr.io/<owner>/<image>:<tag>` (eg `ghcr.io/github/github-mcp-server`)
  * `docker pull ghcr.io/<owner>/<image>` = public images need no auth
  * `docker login ghcr.io -u <user>` = log in with a PAT (`read:packages`/`write:packages` scopes) as password, for private images or pushing
* **GitHub Desktop** = Git desktop GUI
* **GitHub Packages** = package hosting alongside repos (containers via GHCR, npm, Maven/Gradle, NuGet, RubyGems; no PyPI), auth via PAT or `GITHUB_TOKEN` in Actions
* **GitHub Pages** = public website hosting service for GitHub repositories (eg blog via **Jekyll** or [MDwiki](https://dynalon.github.io/mdwiki/#!index.md))
  * Set Repository name as `<username>.github.io`, as its name can be changed *once* a website is published for the first time (*confirmed*)
* **GitHub Spark** = AI-powered whole app generation & prototyping tool built into GitHub
* **Jekyll** = plain text into static websites/blogs
* **Rulesets** = configure global rights to create/merge/delete certain branches
* **Webhooks** (*Settings > Webhooks*) = notify external services when certain events happen (via POST request)

### Copilot

* **Chat** = IDE-integrated chat
* **CLI** = terminal to answer questions, write/debug code, interact with GitHub.com (eg make changes & create a pull request)
* **Spaces** = include repositories/code/pull requests/issues/free-text/images/files as additional shareable context
