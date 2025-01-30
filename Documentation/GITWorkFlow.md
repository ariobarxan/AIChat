# Table of contents
[What is this?](#What-is-this?) <br/>
[Meaningful commit messages](#meaningful-commit-messages)<br/>
[Meaningful commit history](#meaningful-commit-history)<br/>
[Git workflows](#git-workflows)<br/>
[Splitting one large commit into smaller logical commits](#splitting-one-large-commit-into-smaller-logical-commits)<br/>

# What is this?
This page holds guidelines and suggestions to help us get the most out of our git collaboration. It's an open, working document. Feel free to hit that 'Edit' button if you see something missing.

# Meaningful commit messages
Our pull request conventions are inspired by the [Deis contribution guidelines](https://github.com/deis/deis/blob/master/CONTRIBUTING.md) and [Conventional commits](https://www.conventionalcommits.org/en/v1.0.0/). We think they lay out a good standard that helps us communicate and maintain a tidy commit history. This is an example of a commit:

```
feat(scripts/test-cluster): add a cluster test command
 
this uses tmux to setup a test cluster that you can easily kill and
start for debugging.
```

Any commit message should be structured as follows:
```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

The commit should contains one of the following type(to communicate intent to the users of the source code):
1. `fix` : a commit of the type fix patches a bug in your codebase
2. `feat` : a commit of the type feat introduces a new feature to the codebase 
3. `build` : Changes that affect the build system or external dependencies
4. `ci` : Changes to our CI configuration files and scripts 
5. `docs` : Documentation only changes
6. `perf` : A code change that improves performance
7. `refactor` : A code change that neither fixes a bug nor adds a feature
8. `style` : Changes that do not affect the meaning of the code
9. `test` : Adding missing tests or correcting existing tests

# Meaningful commit history
The sequence of commits we make is an equally important, and even longer-lasting artefact than the instantaneous result at the end of a Pull Request.
The history can help make sense of how code came to be when it is looked at in the future, but also the act of producing a sensible sequence of changes can encourage more critical thinking about the overall change being made and how each part of the change contributes to that. Acording to [Kernel pull request guide lines](https://www.kernel.org/doc/html/v4.10/process/submitting-patches.html) and [Tech Talk: Linus Torvalds on git back in 2007](https://www.youtube.com/watch?v=4XpnKHJAok8) we decide to use present tense for the commit description as we look them as a command to implement the change that is specified in the commit description.

# Git workflows
Our git flow consists of two lasting branches, main and devlop branch, as their names imply main branch consists of the latest release of the app. The dev branch(develop branch) consits of the latest changes to the source code. Release candidates are created from the dev branch and after being checked and tested they will be merged to the main branch. Also feature branches are created from and merged to the dev branch. There is a git flod diagram provided bellow:

```mermaid
---
title: our git flow diagram in mermaid
---
gitGraph
   commit id: "Initial commit"
   branch develop
   commit id: "Commit 1"
   commit id: "Commit 2"
   checkout main
   commit id: "Commit 3"
   checkout develop
   branch featureA
   commit id: "Feature A commit 1"
   commit id: "Feature A commit 2"
   checkout develop
   merge featureA
   branch featureB
   commit id: "Feature B commit 1"
   commit id: "Feature B commit 2"
   checkout develop
   merge featureB
   branch rc
   commit id: "RC commit 1"
   commit id: "RC commit 2"
   checkout main
   merge rc
   checkout develop
   commit id: "Fix"
  ```

# Splitting one large commit into smaller logical commits
Depending on your personal workflow, or based on code review feedback, occasionally you'll need to split a larger commit into some smaller logical commits.  To do this you'll first want to identify logical hunks of code that should go together and probably write them down somewhere. After this, you'll do a git reset and then slowly stage hunks that logically make sense together and commit them. It's notable that interactive rebasing can be helpful, for more you can checkout this link: [How To Split A Git Commit Into Multiple Ones?
](https://dev.to/timmouskhelichvili/how-to-split-a-git-commit-into-multiple-ones-3g6f). 
