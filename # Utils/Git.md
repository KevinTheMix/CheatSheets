# Git

Git is a version control system for tracking files changes and coordinating work with speed, storage & data integrity in mind.
Git employs a three-tiered architecture composed of a **Working Directory**, a **Staging Area**, and a **Repository** (aka HEAD).
Contrary to earlier client-server VCS architectures, Git is distributed and does not require ongoing sync with a central online entity.
It also is self-contained as each cloned repo contains the full versions history (in hidden `.git/` folder) as a sequence of update deltas (requiring minimal storage).

In Git all operations are atomic: either they succeed as whole, or they fail without any changes (from [GIT vs CVS](https://stackoverflow.com/a/824241/3559724)).

## Quick Tips

* Always commit after tidy, before refactoring
* [Practical Git](https://practicalgit.com) (eg "Recover a deleted local branch")
* A local repo (for personal projects) provides version control by itself without the need of any associated remote repos
* Use trailing (_dangling_) commas whenever possible at the end of source code lines in order to reduce the number of lines marked as modified
* [A Hacker's Guide to Git](https://wildlyinaccurate.com/a-hackers-guide-to-git)
* [Scott Chacon - Git Tips and Tricks](https://blog.gitbutler.com/git-tips-and-tricks) = also a FOSDEM 2024 talk (by GitHub cofounder)

## Glossary

* [Alias](https://githowto.com/aliases) = single term shorthand for a longer command (defined in any config file under the _alias_ section)
* **Branch** = a reference pointing to the _latest commit in that branch_
  * A branch is _not_ a chain of commits; even though commits can be said to be _on_ a branch, branches play no role in a commits (self-sufficient) chain/history
  * It's true that a branch can be made to point to an earlier commit (via `reset`), but that just means that the earlier commit becomes the latest one for that branch
  * Creating a branch equates creating a new pointer to the current commit (multiple branches can point to the same commit, notably in the case of a branch creation)
  * **Tip of a branch** = the specific (latest) commit that the branch points to
  * See [Branchig & Merging](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging)
* **Cache** = another term for the staging area
* **Cherry picking** = applying specific commits from one branch to another, actually creating new commits (à la copy-paste, with different hashes), forming a new parallel commit history
* **Cloning** = creating a local repository based on a remote repository, still associated to it (via push/pull commands)
  * **Shallow Cloning** = cloning only a limited portion of the commit history, which reduces the number of objects and improves performance
* **Commit** = fundamental building blocks of a Git repository recording a snapshot of a project at a specific point in time (saved in local repo DB in `.git/objects/`)
  * **Commit hash** = human-friendly identity/name of a commit (short version usually first 7 characters of the longer 40 characters version)
  * Each commit holds a reference to its parent commit (or multiple parents in the case of a merge commit), forming a chain that constitutes the history of the project
  * Commits no longer referenced anywhere (eg after a hard reset) are eventually garbage collected, even if they are still cited in the reflog
  * In CLI, commits can always be specified by hash or their various references (eg _HEAD_, a branch, a tag, a reflog entry)
* **Configuration files**
  * _.gitconfig_ (User), _C:/Program Files/Git/etc/gitconfig_ (System), _./git/config_ (Local) = configuration sections
  * _.gitattributes_ = (binary/textual) merging and [line ending](https://stackoverflow.com/a/10855862/3559724) stragtegies per file type
  * _.gitignore_ = tracking strategy per file type
* **Feature Branch Workflow** = create local _feature_ branch from _main_, make many commits, push to remote, pull request, resolve feedback locally/together, resolve merge conflicts to _main_
* **Fetching** = re-synching from remote repository into local repository
* **Fork** = on platforms like GitHub, duplicates an existing repository/project along with its full history towards the user's own account
  * This is typically followed by a cloning (to work locally), pushing changes to (_origin_) remote, and ending with a pull request back to the original (_upstream_) repo
* **Gitflow** = a Git branches management strategy/workflow, now abandoned in favor of **Trunk-based development**, which suits larger releases cycle of multiple features
  * Uses a _develop_ branch (for features integration) in addition to _main_ (for releases, commits with version number tags)
  * _develop_ is initially empty (not created off an existing branch) so it contains full repo history (not an abridged version like _main_)
  * Features get pushed to _develop_, never directly to _main_ (features + _develop_ = basically Feature Branch Workflow)
  * A dedicated _release_ branch is created once enough features have accumulated in _develop_, to which new commits can be added but only for release-oriented features (eg bug fixing, doc)
  * When ready, _release_ branch gets merged into _main_ (with a version tag) **and** _develop_ (preferably via a pull request approved only by senior members), then deleted
  * _hotfix_ branches can be created off _main_ for quick production patches, also increment _main_ (minor) version number, and also merge to _develop_ (or current _release_)
* **HEAD** = a special reference (stored in the `.git/HEAD` file) to either a branch (via a symbolic reference eg `ref: refs/heads/main`) or specific commit (then said to be in a **detached HEAD** state)
  * **Detached HEAD** is useful to make experimental changes and create easily discardable **detached/orphaned commits** (ie that don't belong to any branch)
* **Index** = another term for the staging area
* **Merging** = combines changes from a given branch (usually a feature branch) into the current branch (usually the main/master branch)
  * If there are any conflicts, the operation is put on hold until the user has manually resolved all of them
  * This creates a **Merge Commit** with joined development histories, ie a commit with two parents (the previous commit on current & latest commit on imported branch)
  * **Fast-Forward Merge** = avoids creating a merge commit (eg whenrebasing, or when feature branch is ahead from current branch: current is an ancestor of feature), this is the default
* **Origin** = default name (and alias for a URL) given to remote repository from which a local repo was cloned (and will eventually be pushed)
  * Multiple other remotes can be added to a same (local) repo, each with a different name (eg `upstream`, `github`, `bitbucket`)
* **Pull Request** = on collaborative platforms (eg GitHub, Azure DevOps), a formal proposal to merge changes into a codebase
* **Rebasing** = modifies the commit history of a branch to maintain a cleaner, more linear project history ("I want my branch to start from this commit instead")
  * A typical use case is when working on a feature branch, switching to main, pulling latest remote changes from origin, then rebasing the feature branch from the updated main to integrate those latest changes
  * Don't rebase commits that have already been pushed to shared repo (use merging instead); rebase only local/unshared branches
* **Repository** = a regular folder augmented into a self-contained version-controlled directory that tracks changes to (some/all of its) files over time
* **Reference** (or just **ref(s)**) = label/pointer to specific commits (ie aliases for commit hashes), saved as files (in the `.git/refs/` directory)
  * Branches (`refs/heads/{branch}`), Tags (`refs/tags/{tag}`), remote branches (`refs/remotes/{remote}`), even _HEAD_ are all (types of) references
* **Reflog** (**reference log**) = history of all reference modifications (à la VG _saved states_), stored as one file per reference (in `.git/logs/`)
  * It is a safety net to recover lost commits/changes, at least for a little time until garbage collection permanently clears them
  * Reflog entries (aka lines) use the following format: `{after} {before} {author name & email} {timestamp with zone} {action}: {comment}`
  * The reflog is forward-only (it's a growing list/log, not a stack), but its entries may be pruned over time due to retention policies
* **Refspec** (**reference specification**) = mapping between local & remote references (eg for `fetch` & `push`, saved in that remote's section in `.git/config` in the `+<source>:<destination>` format)
* **Remote (repository)** = a (nonmandatory) repo hosted on a separate/centralized/shared server, required for some commands (cloning, fetching, pull, pushing)
  * It is essentially an alias for an URL, and is required to push changes from a local repo (also requires linking local to remote branches, see `git push -u …`)
* [Resetting](https://stackoverflow.com/a/50022436/3559724) = unstaging (_soft_) and uncommitting (_mixed_) and removing changes (_hard_)
* **Scope** = one of three levels where configuration parameters can be defined (System in _Program Files_, User in _~_, Local in  _._)
* [Staging (area)](https://githowto.com/staging_and_committing) (aka **Index** or **Cache**) = logical space/list of files registered for next commit
  * Modified files are not automatically all registered; they have to be deliberately _staged_ (thus enabling granular control over committed files)
* **Stashing** = temporarily saving changes that are not ready to be committed (eg work-in-progress) on the side to be resumed later (eg after some work on other branches)
* **Tag** = reference to a specific commit in the history (generally for significant milestones or release; note that tags can have the same name as a branch)
  * **Lightweight Tags** are simple references to specific commits whereas **Annotated Tags** include additional metadata (notably a mandatory message, plus a creation date & tagger's name/email)
* **Trunk-based development** = branch workflow tailored for CI/CD, advocating short-lived feature branches with few small commits, and a clean always latest _main_ (vouched for by CI pipeline)
* **Upstream** = on platforms (like GitHub or GitLab), this is the original repo from which a project was forked
* **Work(ing) tree** (aka **Working Directory**) = a directory where the (project) files reside and where changes are made (note: may also contain untracked files)

## API/CLI

* `--` = see <https://stackoverflow.com/a/22750480/3559724>
* [Practical Git - Cheat Sheet](https://practicalgit.com/cheat-sheet)
* `git {command} --help` = opens local HTML manual page (or `man git-{command}` on Unix)
* `{commit}~n` = nth commit before a given commit (on Unix use `^` instead of `~`, no _n_ equates _n=1_)
* `{reflog}@{n}` = the (zero-based) nth before latest reflog entry for a given branch (eg `master@{1}` or `HEAD@{-1}` or `@{1}` just for special default _HEAD_)
* On Windows, use double quotes (`"`) instead of single quotes (`'`), especially relevant when Git suggest a command fix (containing single quotes)

### Configuration

* `git config --{scope}` = where _scope_ is `--system` (Global), `--global` (User), `--local` or _nothing_ (Local)
* `git config --{scope} --edit` = open target config file in default editor (itself defined at User scope under _core.editor_ parameter)
* `git config --{scope} --l(ist)` = list the aggregated config parameters at a given scope
* `git config --{scope} {section}.{parameter} {value}` = directly set given parameter
  * Eg `git config --system credential.helper = manager(-core)` = remove this line to [avoid opening Credential Manager](https://stackoverflow.com/a/37185202/3559724)
  * Eg `git config --global core.askpass =` (as-is) = disables the OpenSSH credentials popup
  * Eg `git config --global core.safecrlf warn` = makes files with mixed Linux/Windows line endings non-blocking
  * Eg `git config --global http.sslVerify false` = (ideally temporarily) disable SSL certificates
  * Eg `git config --global user.email "a@b.c"` = set user email
  * Eg `git config --global user.name "Koko"` = set user name
  * Eg `git config --global alias.hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short`

### Info/Logging

* `git blame`
* `git diff (--staged)`= shows (un)staged changes in tracked files (`Page Down` to scroll down, `q` to exit)
* `git diff {a} {b}` = shows difference between two git states (eg files, commits, local branches, local branch vs remote branch)
* `git log {branch}` = lists commits history (parental ancestry) for that branch (_HEAD_ by default, if a tag has same name use full branch namespace eg `refs/heads/{branch}`)
* `git log {tag}` = lists commits history for that tag (if tag has same name as a branch, Git complains and displays tag commits history)
* `git log` = lists commits history in anti-chronological order (ie last first)
  * `--pretty={format}` = where built-in _format_ is `oneline`, `short`, `medium` (default), `full`, `fuller` by increasing length, or `reference`, etc.
  * `--pretty=format:\"{custom}\"` = custom format (eg `%ad` author date, `%an` author, `%cd` date, `%d` references if any, `%h` hash, `%s` comment, `%n` newline)
  * `--max-count=10` = limits output
  * `--since="5 minutes ago"` = after
  * `--until="5 minutes ago"` = before
  * `--date={format}` = formats all dates (eg `short`, `iso`, `local`, `relative` eg "2 hours ago")
  * `--author="{name}"`
  * `--graph` = draws Ascii tree of commits
  * `--all` = includes all commits (not just the ancestors of currently checked-out)
* `git reflog (show) {reference}` = display reflog of a reference (eg `git reflog HEAD`)
* `git status` = information about the working tree state (staged changes, unstaged changes, untracked files)

## Local

* `git init` = sets up the current directory as a Git repository
* `git add` = stages one (`git add {file}`, _case sensitive_), several (`git add {*pattern*}`), or all (`git add .`) to be included in the next commit
  * Note that it's possible to keep some files in the Git repo untracked/ignored if they're never added
* `git add -i` = stages interactively (via CLI)
* `git branch` = lists all branches (with current branch highlighted)
* `git branch {branch}` = creates a new branch
* `git branch {branch} {commit}` = creates a new branch pointing to a specific commit
* `git checkout (HEAD)` = lists modified files
  * (ChatGPT3.5:) starting from Git version 2.23 (2019.08), the recommendation is to use `git switch` or `git restore` instead of `git checkout` for clarity and consistency
  * `git checkout .` = discards local changes in the working directory for all files (**warning**: destructive)
  * `git checkout -` == `git switch -`
  * `git checkout {file}` == `git restore {file}`
  * `git checkout {branch}` == `git switch {branch}`
  * `git checkout {commit}` = checks out specified commit (detaches _HEAD_), works only if there are no unstaged changes or the commit is the last one
  * `git checkout -b {branch}` = creates a branch and checks it out
* `git clean -fdx` = deletes all gitignored/untracked files (add `-n` option to preview but not do) (**warning**: destructive)
* `git commit` = when a message is not provided, the default text editor is launched and its result fed as message
* `git commit -m "{message}"`
* `git commit -a` = stages all (already/previously) tracked files then commit ine one go
* `git merge {branch}` = merges changes from given into current branch, creating a (merge) commit
* `git merge --abort/--continue` = abort/continues the latest merge operation paused due to conflicts
* `git merge --ff`
* `git merge --(no-)squash {feature_branch}` = brings the change from feature branch into current branch's working tree, without committing (no merge commit gets created)
* `git reset` = unstages all files (removes them from staging area thereby excluding them the next commit)
* `git reset {file}` = unstages one or several files (opposite of `add`)
* `git reset ({commit}) --soft` = uncommits (changes are left staged)
* `git reset ({commit}) --mixed` = uncommits & unstages changes (left in the working tree)
* `git reset ({commit}) --hard` = uncommits & unstages & delete changes (**warning**: destructive)
* `git reset --soft HEAD~1` = cancels the last commit (`HEAD~1` means commit one step before aka parent commit)
* `git reset --hard HEAD` = reverts all uncommitted changes
* `git reset --hard HEAD@{1}` = reverts repo to state before most recent changes (eg by a commit/branch switch/reset)
* `git reset --hard origin/{main}` = resets local repo (eg _main_) to origin's version (fetch it beforehand to get latest version)
* `git restore {file}` = restores a staged file (or directory) to its last staged state, or an unstaged one to its HEAD state (**warning**: destructive)
* `git restore {file} --staged` = unstages file (similar to `git reset {file}`)
* `git revert HEAD` = cancels very last commit (only if there are no unstaged changes)
* `git revert {commit}` = cancels specific commit (only if there are no unstaged changes)
* `git rm {file}` = deletes a (tracked) file (both from Git & physically on disk) during next commit
* `git rm {file} --cached` = un-tracks a file during next commit
* `git rm {directory} --r` = deletes a a directory during next commit
* `git switch -` (with hyphen === `@{-1}`) = switch to previous branch (more precisely the previous location in _HEAD_ reflog, non-destructive)
* `git switch --detach` = detaches HEAD from the current branch (the content of the _HEAD_ file changes from a symbolic branch ref to a commit hash)
* `git switch {branch}` = switches to branch (by moving HEAD to (latest commit of) that branch), or does nothing if already on that branch
* `git tag (-l(ist))` = lists all tags
* `git tag -n` = lists tags with messages
* `git tag {tag}` = creates a new lightweight tag at the latest commit (eg a version/release name `git tag v1.0.0`) with an optional message (`-m {message}`)
* `git tag {tag} -a -m "{message}` = creates an annotated tag with a (required) message
* `git tag {tag} -d` = deletes tag

### Remote

* `git clone {url}` = creates a local copy of remote repo (with _origin_ default name remote) including all branches & commits, and adds an (_upstream_) remote if _origin_ is a forked repo (keeping track of the original)
* `git fetch` = fetches zero or one remote (the only one, or the one named _origin_, otherwise none)
* `git fetch {remote}` = fetches remote (saved in the `.git/refs/remotes` folder, necessary after removing/re-adding a remote)
* `git fetch --all` = fetches changes from all (configured) remote repositories, but does not merge/update local branches
* `git fetch --prune` = fetches remote and remove local branches that no longer exist remotely
* `git branch -u {remote}/{branch}` (or `--set-upstream-to {remote}/{branch}`) = links local branch to remote branch (adds (max one, previous gets replaced) _branch_ section in `.git/config`)
* `git remote` = lists all the remote repos names associated with local repo
* `git remote -v` = lists all remote repositories names & URLs associated with local repo
* `git remote add {remote} {url}` = adds a remote repo to local repo (adds a _remote_ section in `.git/config`)
* `git remote set-url {remote} {url}` = update the remote's URL (in the context of GitHub, the URL format `git@github.com:user/repo.git` is an SSH URL)
* `git remote remove {remote}` = removes remote repo (deletes _remote_ & _branch_ sections in `.git/config` & folder from `.git/refs/remotes`, note that even `origin` can be removed)
* `git remote prune {remote}` = removes local branches that no longer exist on the remote repo
* `git remote show {remote}` = detailed information about remote repo
* `git ls-remote {remote}` = list all remote references (including branches)
* `git pull {remote} {branch}` = `git fetch` + `git merge`
* `git push` = pushes changes to remote branch linked with current branch
* `git push {remote} {branch}` = pushes changes to a remote repo branch
* `git push {remote} {tag}` = shares local tag with remote repo (eg `git push origin v1.0.0`)
* `git push -u {remote} {branch}` (or `--set-upstream-to`) = links current local branch to a remote branch (=> set up only once), then pushes changes to it

## Troubleshooting

* Authentication error: _could not create ssl/tls secure channel_
  * [Proven solution](https://support.captureone.com/hc/en-us/articles/360014239757) = fix by enabling TLS 1.2 (disabled by default on Windows 7)
    * Go to `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols`
    * Right-click on **Protocols** folder, `New > Key`, and rename the freshly created folder to _TLS 1.2_
    * Create a new **Key** under that folder, name that subfolder _Client_
    * Create a new **DWORD (32-bit) Value** under that subfolder, set its **Name** to _DisabledByDefault_ (**Data** must be 0)
    * (Optional:) restart computer if necessary

## Extensions

* **AppVeyor** = desktop CI/CD service used to build/test projects hosted on GitHub & co (GitLab, BitBucket)
* `gitk` = commit history, branches and tags GUI visualizer
* **GitLab** = web-based DevOps for Git (wiki, issue tracking, CI)
* [Git Credential Manager (GCM)](https://github.com/git-ecosystem/git-credential-manager) = provides 2FA capabilities to Git's simple 1FA authentication (mandatory for GitHub & co)
  * Stores logins in Windows Credential Store
  * Replaces the older [Git Credential Manager for Windows](https://github.com/Microsoft/Git-Credential-Manager-for-Windows)

### Github

GitHub is a web platform hosting (mostly software) projects using Git.

* Uploading an (existing) local repo to GitHub:
  1. create a repo on GitHub via the website (or [CLI](https://cli.github.com/))
  2. add a remote using the URL provided by GitHub on creation (eg `git remote add origin "https://github.com/{user}/{repository}"`)
  3. push local onto remote repo (eg `git push origin master`)
* If a **README** file is present in the repo, its content gets displayed (with homonyms priority: _README.md_ > _README_ > _README.txt_)

* **GitHub Codespace** = shared online IDE (eg Visual Studio Code, JetBrains, GitHub CLI)
* **GitHub Desktop** = Git desktop GUI
* [GitHub Pages](https://pages.github.com) = public website hosting service for GitHub repositories
  * Set Repository name as `{username}.github.io` (its name can be changed _once_ the website is published for the first time **confirmed**)
  * Configure it further (or unpublish it) via repository Settings > _Pages_
