# Lyph

Personal Bash and Zsh shell configuration, with a small set of Git helpers.

## Installation

```sh
git clone https://github.com/Lyphmeno/Lyph.git
cd Lyph
./SETUP.sh
```

Before running setup, note that it **replaces your existing `~/.bashrc` or
`~/.zshrc`** with the repository template and sets a global Git author name
and email. Back up your shell configuration and review `SETUP.sh` if you want
to keep or change those settings.

For Bash, setup installs `Templates/rcinput` as `~/.inputrc` only if you do
not already have one. It won't overwrite an existing Readline configuration.
These settings are Bash-specific; Zsh does not use `rcinput`.

Load the updated configuration in the current terminal:

```sh
source ~/.bashrc   # Bash
# or
source ~/.zshrc    # Zsh
```

After setup, `rsource` reloads the configuration for the current shell.

## Git helpers

- `gits` fetches from `origin` and displays the current branch and working-tree
  status. Pass extra arguments to forward them to `git status`.
- `gitl` shows a compact graph of the latest 20 commits across all refs.
  Additional arguments are forwarded to `git log`, for example `gitl -5`.
- `gitc`, `gitbr`, and `gitbra` wrap `git checkout`, `git branch`, and
  `git branch -a`.
- `gclyf <repo>` clones `git@github.com:Lyphmeno/<repo>.git`.
- `llog` displays a short recent commit summary.
- `cmtr <message>` amends the latest commit.
- `cmt <message>` stages all changes and creates a commit.
- `fullgit <message>` stages all changes, commits, and pushes.

Review the effects of commands such as `cmt` and `fullgit` before using them:
they stage **all** changes in the current repository.
