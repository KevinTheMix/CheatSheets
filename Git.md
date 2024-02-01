# Git

Git is a version control system for tracking files changes and coordinating work with speed, storage & data integrity in mind.
Git employs a three-tiered architecture composed of a **Working Directory**, a **Staging Area**, and a **Repository** (aka HEAD).
Contrary to earlier client-server VCS architectures, Git is distributed and does not require ongoing sync with a central online entity.
It also is self-contained as each cloned repo contains the full versions history (in hidden `.git/` folder) as a sequence of update deltas (requiring minimal storage).

## Quick Tips

* Use trailing (_dangling_) commas at the end of source code lines (even with no follow-up) in order to reduce the number of lines marked as modified
* A local repo (for personal projects) provides version control by itself without the need of any associated remote repos
* Authentication error: _could not create ssl/tls secure channel_
  * [Proven solution](https://support.captureone.com/hc/en-us/articles/360014239757--Could-not-create-SSL-TLS-secure-channel-activation-error-on-Windows-7): fix by enabling TLS 1.2 (disabled by default on Windows 7)
    * Go to `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols`
    * Right-click on **Protocols** folder, `New > Key`, and rename the freshly created folder to _TLS 1.2_
    * Create a new **Key** under that folder, name that subfolder _Client_
    * Create a new **DWORD (32-bit) Value** under that subfolder, set its **Name** to _DisabledByDefault_ (**Data** must be 0)
    * (Optional:) restart computer if necessary

## Glossary

* [Alias](https://githowto.com/aliases) = single term shorthand for a longer command (defined in any config file under the _alias_ section)
* **Branch** = a reference pointing to the _latest commit in that branch_
  * A branch is _not_ a chain of commits; even though commits can be said to be _on_ a branch, branches play no role in a commits (self-sufficient) chain/history
  * It's true that a branch can be made to point to an earlier commit (via `reset`), but that just means that the earlier commit becomes the latest one for that branch
  * Creating a branch equates creating a new pointer to the current commit (multiple branches can point to the same commit, notably in the case of a branch creation)
  * **Tip of a branch** = the specific (latest) commit that the branch points to
* **Cache** = another term for the staging area
* **Cherry picking** = applying specific commits from one branch to another, actually creating new commits (à la copy-paste, with different hashes) since a new parallel commit history also has to exist
* **Cloning** = creating a local repository based on a remote repository still associated to it (via push/pull commands)
* **Commit** = fundamental building blocks of a Git repository recording a snapshot of a project at a specific point in time (saved in local repo DB in `.git/objects/`)
  * **Commit hash** = human-friendly identity/name of a commit (short version usually first 7 characters of the longer 40 characters version)
  * **Detached/Orphaned Commits** (in the case of a detached HEAD) don't belong to any branch (usually transitorily until next branch checkout)
  * Each commit holds a reference to its parent commit (or multiple parents in the case of a merge commit), forming a chain that constitutes the history of the project
  * Commits no longer referenced anywhere (eg after a hard reset) are eventually garbage collected, even if they are still cited in the reflog
* **Configuration files**
  * _.gitconfig_ (User), _C:/Program Files/Git/etc/gitconfig_ (System), _./git/config_ (Local) = configuration sections
  * _.gitattributes_ = (binary/textual) merging and [line ending](https://stackoverflow.com/a/10855862/3559724) stragtegies per file type
  * _.gitignore_ = tracking strategy per file type
* **Fetching** = re-synching from remote repository into local repository
* **Fork** = on platforms like GitHub, duplicates an existing repository/project along with its full history towards the user's own account
  * This is typically followed by a cloning (to work locally), pushing changes to (_origin_) remote, and ending with a pull request back to the original (_upstream_) repo
* **HEAD** = a special reference to either a branch or a specific commit (then said in a **detached HEAD** state), ie what's opened in the editor minus any new unstaged changes
  * Unlike other refs, HEAD is saved in the `.git/HEAD` file, which contains either a symbolic reference to a branch (eg `ref: refs/heads/main`) or a specific commit's hash
* **Index** = another term for the staging area
* **Merging** = combines changes from a given branch (usually a feature branch) into the current branch (usually the main/master branch)
  * If there are any conflicts, the operation is put on hold until the user has manually resolved all of them
  * This creates a **Merge Commit** with joined development histories, ie a commit with two parents (the previous commit on current & latest commit on imported branch)
* **Origin** = default name (and alias for a URL) given to remote repository from which a local repo was cloned (and will eventually be pushed)
  * Multiple other remotes can be added to a same (local) repo, each with a different name (eg `upstream`, `github`, `bitbucket`)
* **Pull Request** = on collaborative platforms (eg GitHub, Azure DevOps), a formal proposal to merge changes into a codebase
* **Rebasing** = modifies the commit history of a branch to maintain a cleaner, more linear project history ("I want my branch to start from this commit instead")
  * A typical use case is when working on a feature branch, switching to main, pulling latest remote changes from origin, then rebasing the feature branch from the updated main to integrate those latest changes
  * Don't rebase commits that have already been pushed to shared repo (use merging instead); rebase only local/unshared branches
* **Repository** = a regular folder augmented into a self-contained version-controlled directory that tracks changes to (some/all of its) files over time
* **Reference** (or just **ref(s)**) = label/pointer to specific commits (ie aliases for commit hashes), saved as files (in the `.git/refs/` directory)
  * Branches (`refs/heads/{branch}`), Tags (`refs/tags/{tag}`), remote branches (`refs/remotes/{remote}`), even _HEAD_ are all (types of) references
* **Reflog** (**reference log**) = history of all reference modifications (à la VG _saved states_), used as a safety net to recover lost commits/changes (for a little time until garbage collection permanently clears them)
  * Reflog entries (aka lines, found in `.git/logs/`) use the following format: `{previous_commit} {new_commit} {user_name} <{user_email}> {timestamp} {action}: {comment}`
  * The reflog is forward-only (it's a growing list/log, not a stack), but its entries may be pruned over time due to retention policies
* **Refspec** (**reference specification**) = mapping between local & remote references (eg for `fetch` & `push`, saved in that remote's section in `.git/config` in the `+<source>:<destination>` format)
* **Remote (repository)** = a (nonmandatory) repo hosted on a separate/centralized/shared server, required for some commands (cloning, fetching, pull, pushing)
  * Having a remote set up is the first step to pushing changes (as it essentially provides an alias for URL), but the local branch must have a remote branch linked as well
* [Resetting](https://stackoverflow.com/a/50022436/3559724) = unstaging (_soft_) and uncommitting (_mixed_) and removing changes (_hard_)
* **Scope** = one of three levels where configuration parameters can be defined (System in _Program Files_, User in _~_, Local in  _._)
* [Staging (area)](https://githowto.com/staging_and_committing) (aka **Index** or **Cache**) = logical space/list of files registered for the next commit
  * Modified files are not automatically all registered; they have to be deliberately _staged_ (thus enabling granular control over committed files)
* **Tag** = reference to a specific commit in the history (generally for significant milestones or release; note that tags can have the same name as a branch)
  * **Lightweight Tags** are simple references to specific commits whereas **Annotated Tags** include additional metadata (notably a mandatory message, plus a creation date & tagger's name/email)
* **Upstream** = on platforms (like GitHub or GitLab), this is the original repo from which a project was forked
* **Work(ing) tree** (aka **Working Directory**) = a directory where the (project) files reside and where changes are made (note: may also contain untracked files)

## API/CLI

* `HEAD~n`, `{branch}~n`, `{commit}~n`, `{ref}~n` (on Unix use `^` instead of `~`, no _n_ equates _n=1_) = refers to the nth commit before a given commit (note: _HEAD_, branches & references all point to commits)
* `git {command} --help` = opens local HTML manual page (or `man git-{command}` on Unix)

* `git init` = sets up the current directory as a Git repository
* `git add` = stages one (`git add {file}`, _case sensitive_), several (`git add {*pattern*}`), or all (`git add .`) to be included in the next commit
  * Note that it's possible to keep some files in the Git repo untracked/ignored if they're never added
* `git add -i` = stages interactively (via CLI)
* `git branch` = lists all branches (with current branch highlighted)
* `git branch {branch}` = creates a new branch
* `git branch {branch} {commit}` = creates a new branch pointing to a specific commit
* `git checkout .` = revert all uncommitted changes (**warning**: discards any changes)
* `git checkout HEAD` = reverts working directory content back to last commit state (**warning**: discards any changes)
* `git checkout {file}` = reverts specific file to current branch last commit (**warning**: discards any changes)
* `git checkout {branch}` = moves HEAD to (latest commit of) branch (same thing, or does nothing if already on that branch)
* `git checkout {commit}` = detaches HEAD, makes it point directly to specific commit
* `git commit` = when a message is not provided, the default text editor is launched and its result fed as message
* `git commit -m "{message}"`
* `git commit -a` = stages all (already/previously) tracked files then commit ine one go
* `git merge {branch}` = merges changes from given into current branch, creating a (merge) commit
* `git merge --abort/--continue` = abort/continues the latest merge operation paused due to conflicts
* `git reset {file}` = unstages one or several files (opposite of `add`), removing them from the staging area, thereby excluding them from the next commit
* `git reset ({commit}) --soft` = uncommits (changes are left staged)
* `git reset ({commit}) --mixed` = uncommits & unstages changes (left in the working tree)
* `git reset ({commit}) --hard` = uncommits & unstages & delete changes (**warning**: nothing left)
* `git reset --soft HEAD~1` = cancels the last commit (`HEAD~1` means commit one step before aka parent commit)
* `git reset --hard HEAD@{1}` = reverts repo to state before most recent changes (eg by a commit/branch switch/reset, where `HEAD@{1}` is a reflog reference à la JS `window.history.go(-1)`)
* `git restore {file}` (=== `git checkout {file}`) = restores a staged file to its last staged state, or an unstaged file to its HEAD state (**warning** its content is immediately replaced & unstaged changes are lost)
* `git restore {file} --staged` = unstages file (similar to `git reset {file}`)
* `git revert HEAD` = cancels very last commit
* `git revert {commit}` = cancels specific commit
* `git rm {file}` = deletes a (tracked) file (both from Git & physically on disk) during next commit
* `git rm {file} --cached` = un-tracks a file during next commit
* `git rm {directory} --r` = deletes a a directory during next commit
* `git tag (-l(ist))` = lists all tags
* `git tag -n` = lists tags with messages
* `git tag {tag}` = creates a new lightweight tag at the latest commit (eg a version/release name `git tag v1.0.0`) with an optional message (`-m {message}`)
* `git tag {tag} -a -m "{message}` = creates an annotated tag with a (required) message
* `git tag {tag} -d` = deletes tag

### Config

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

* `git log {branch}` = lists commits history for that branch (if a tag has same name, use full branch namespace eg `refs/heads/{branch}`)
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
* `git reflog {reference}` = display reflog of a reference (eg `git reflog HEAD` for HEAD)
* `git status` = information about the working tree state (staged changes, unstaged changes, untracked files)

### Remote

* `git clone {url}` = creates a local copy of remote repo (with _origin_ default name remote) including all branches & commits, and adds an (_upstream_) remote if _origin_ is a forked repo (keeping track of the original)
* `git fetch` = fetches zero or one remote (the only one, or the one named _origin_, otherwise none)
* `git fetch {remote}` = fetches remote (saved in the `.git/refs/remotes` folder, necessary after removing/re-adding a remote)
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
* `git push -u {remote} {branch}` (or `--set-upstream-to`) = links current local branch to a remote branch, then pushes changes to it

## Eco-system

* `gitk` = commit history, branches and tags GUI visualizer
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
