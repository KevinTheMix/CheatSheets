# GitHub

GitHub is a web platform hosting (mostly software) projects using Git.

## Quick Tips

* Uploading an (existing) local repo to GitHub:
  1. create a repo on GitHub via website or [CLI](https://cli.github.com)
  2. add a remote using the URL provided by GitHub on creation (eg `git remote add origin "https://github.com/{user}/{repository}"`)
  3. push local onto remote repo (eg `git push origin master`)
* If a **README** file is present in the repo, its content gets displayed (with homonyms priority: _README.md_ > _README_ > _README.txt_)

## Glossary

* **GitHub Actions** = CI/CD workflow to produce releases (artifacts), works by adding a _.github\workflows\{workflow}.yml_ file to repo
* **GitHub Codespace** = shared online IDE (eg Visual Studio Code, JetBrains, GitHub CLI)
* **GitHub Desktop** = Git desktop GUI
* **GitHub Pages** = public website hosting service for GitHub repositories (eg blog via **Jekyll** or [MDwiki](https://dynalon.github.io/mdwiki/#!index.md))
  * Set Repository name as `{username}.github.io`, as its name can be changed _once_ a website is published for the first time (_confirmed_)
* **Jekyll** = plain text into static websites/blogs
* **Webhooks** (_Settings > Webhooks_) = notify external services when certain events happen (via POST request)
