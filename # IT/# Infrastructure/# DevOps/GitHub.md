# GitHub

GitHub is a web platform hosting (mostly software) projects using Git.

## Quick Tips

* Uploading an (existing) local repo to GitHub:
  1. create a repo on GitHub via website or [CLI](https://cli.github.com)
  2. add a remote using the URL provided by GitHub on creation (eg `git remote add origin "https://github.com/{user}/{repository}"`)
  3. push local onto remote repo (eg `git push origin master`)
* If a **README** file is present in the repo, its content gets displayed (with homonyms priority: _README.md_ > _README_ > _README.txt_)

## Glossary

* **Deploy Keys** = a SSH key attached to a single GitHub repo that grants read/write access to that repo only, without requiring a personal user account
  * Generate a public/private pair of SSH keys in a _.ssh_ folder via `ssh-keygen -t ed25519 -f C:\Users\<user>\.ssh\<key_name> -C <public_key_comment>` (`mkdir .ssh` if it does not exist yet)
  * Create/generate (ask AI) a _config_ file in same _.ssh_ folder that sets a host alias, references private SSH key file, and probably `Port 443` (since most companies firewall block default 22)
  * Go to GitHub repository > _Settings > Deploy keys_, set a title like _Work computer_ and paste content of SSH public key (also check _Allow write access_)
  * That repo must be setup using SSH (not HTTPS, check what `git remote get-url origin` displays, and run `git remote set-url origin git@<host_alias>:<user>/<repo>.git` if HTTPS)
  * Test using `ssh -T git@<host_alias>` & `git remote -v`
* **GitHub Actions** = CI/CD workflow to produce releases (artifacts), works by adding a _.github\workflows\{workflow}.yml_ file to repo
* **GitHub Codespace** = shared online IDE (eg Visual Studio Code, JetBrains, GitHub CLI)
* **GitHub Desktop** = Git desktop GUI
* **GitHub Pages** = public website hosting service for GitHub repositories (eg blog via **Jekyll** or [MDwiki](https://dynalon.github.io/mdwiki/#!index.md))
  * Set Repository name as `{username}.github.io`, as its name can be changed _once_ a website is published for the first time (_confirmed_)
* **GitHub Spark** = AI-powered whole app generation & prototyping tool built into GitHub
* **Jekyll** = plain text into static websites/blogs
* **Webhooks** (_Settings > Webhooks_) = notify external services when certain events happen (via POST request)

### Copilot

* **Chat** = IDE-integrated chat
* **CLI** = terminal to answer questions, write/debug code, interact with GitHub.com (eg make changes & create a pull request)
* **Spaces** = include repositories/code/pull requests/issues/free-text/images/files as additional shareable context
