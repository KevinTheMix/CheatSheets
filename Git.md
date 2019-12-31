# Git

Git works by augmenting regular directories into Git repositories.
Only file deltas are stored from commit to commit, so the storage is minimal.

* Repository = Working folder that includes additional files used by Git to index/keep track of files and changes
* Refs = Branches and tags

## Config

On Windows, Command-line parameters must use double " instead of single '.
Several configuration files exist:

* Global = Git/etc/gitconfig
* User = ~/.gitconfig
* Repository  = {repo}/.git/config

Commands:

    git config --global user.email "a@b.c"
    git config --global user.name "Koko"
    git config core.safecrlf warn # Make Linux-Windows line endings non-blocking
    git config --edit --system # Opens Git Configuration file
      \[credential\]
        helper = manager # Remove this to prevent GIT Credential Manager (see <https://stackoverflow.com/questions/37182847/how-to-disable-git-credential-manager-for-windows#37185202>)
      \[core\]
        askpass = # To disable the OpenSSH credentials popup too

    C:\Program Files\Git\mingw64\libexec\git-core\git-credential-manager.exe uninstall # Uninstall Git Credential Manager

An Alias is a command with parameters (.gitconfig file in $HOME directory).
To define an alias, used the following command:

    {alias} = {command}

Example:

    hist = log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short

### Git-Credential-Manager-for-Windows

Stores logins in Windows Credential Store.

See [here]<https://github.com/Microsoft/Git-Credential-Manager-for-Windows>.

## Commands

### Init

Sets up the current directory as a GIT repository

    git init

### Add

Once a folder is setup to become a repository, the files witin can be registered into the repository index
This sets the files to be included in the next Commit transaction (aka they become staged)

    git add {FILE}
    git add . # All the files in the current directory and its subdirectories
    git add '*.txt' # All the files in the current directory and its subdirectories matching the pattern
    git add -i # Add interactively

### Reset

Oppositve of Add; Unregister one or all files staged for commit

    git reset \[FILE\]
    git reset --soft HEAD~1 # Cancels the last commit

### Commit

The Commit itself. All staged files are commited ("snapshot") to the repository
A Commit messageis expected. If it is not provided in the command line, the default text editor is launched and its result fed as message

    git commit
    git commit -m "Commit message"
    git commit -a # Also commit add first

### Revert

Opposit of commit; cancel a Commit transaction

    git revert HEAD # Reverts very last commit
    git revert HASH # Reverts specific commit

### Status

Status of the repository (OK, staged files, modifications not yet staged, etc.)

    git status

### Branch

Lists all branches

    git branch

Name a commit branch

    git branch NAME HASH

### Tag

    git tag TAG # Gives a name to currently checked-out Commit from which it'll be referrable
    git tag # Lists existing tags

### Log

Lists commits in anti-chronological order

    git log # Lists commits up to currently checked-out
    git log BRANCH # Lists commits up to provided commit
    git log TAG # Lists commits up to provided commit

#### Options (see 'man git-log' or 'git log --help')

    --pretty=oneline # Compact view
    --pretty=format:'' # %(ad = Author Date | an = Author | cd = Date | d = Branch | h = Hash | s = Comment)
                       # Using %d format, indicates where HEAD points, branchs names & Commit tags
    --max-count=10 # Limit
    --since="5 minutes ago" # After
    --until="5 minutes ago" # Before
    --date=short # Date format
    --author="Name"
    --graph # Draw Ascii tree of commits 
    --all # Includes all Commits, not just the ancestors of currently checked-out

#### Visual GUI log visualizer

    gitk

### Checkout

Replaces files in the working directory with repository Branch/Commit version
The currently checked out version is indicated by HEAD in the logs

Checks-out all files of specific Commit and switches to detached HEAD state

    git checkout HASH
    git checkout TAG
    git checkout TAG^ # Commit before the one given by its tag (aka TAG^1). On windows, use ~ instead of ^
    git checkout TAG^n # N-th Commit before the one given by its tag

Checks-out the latest version of a branch

    git checkout . # Current branch (see <https://stackoverflow.com/a/14075772>)
    git checkout BRANCH # E.g. default branch 'git checkout master'
    git checkout BRANCH^ # Second to last commit in the branch
    git checkout BRANCH^ # N-th to last commit in the branch
    git checkout -b BRANCH # Creates a branch and points to it

Reverts specific file to currently checked-out Commit version
A file that's been modified must be commited or reverted before we can checkout a version where it was different

    git checkout FILE

### Remote

Add a link to remote repository from local repository

    git remote add REMOTE_NAME REMOTE_URL # (REMOTE_NAME e.g. 'origin' or 'upstream')
    git remote remove NAME
    git remote set-url REMOTE_NAME git@github.com:username/repo.git
    git remote -v # Display dfined remotes of current repo
    git remote prune origin # Clean remote branches

### Clone

Downloads entire remote repository into current directory (creates a local repository including all branches).
Set URL as default 'origin' remote. If 'origin' is a forking repo, add an 'upstream' remote to keep track of forked original.

    git clone REMOTE_URL

### Push

Upload local repository onto remote existing repository

    git push REMOTE_NAME BRANCH

### Pull

Pull is a combination of fetch and merge

    git pull NAME BRANCH

### Fetch/Merge

    git fetch # Downloads/updates from remote repository into local repository
    git merge FETCH_HEAD # Joins development histories

## Github

Fork # Copy of an existing project to own user account
Pull Request # A request for integrating the changes of a forking repo into the forked original

### How to upload a local repo to GitHub

1. Create the repo on GitHub using the website interface (or API)
2. Add a remote using the URL provided by GitHub on creation (e.g. 'git remote add origin <https://github.com/User/repo.git>')
3. Push the local repo onto the remote repo (e.g. 'git push origin master')

### README

It's good practice to include a README file in each repository, whose content will be displayed on the repo page
Such a file can have different file extensions; only one is chosen by priority (README.md > README > README.txt)
README.md uses Markdown syntax language (text format editing à la wiki)