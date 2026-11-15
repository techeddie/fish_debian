# fish_debian

[fish shell](https://fishshell.com) config for Debian servers, with zoxide, fzf, eza and quick access to lazygit and lf.

Part of [dotfiles_debian](https://github.com/techeddie/dotfiles_debian). The installer there sets up this repo and all tools it needs.

## Features

- `cd` is [zoxide](https://github.com/ajeetdsouza/zoxide): jump to frequently used folders with a partial name
- [fzf](https://github.com/junegunn/fzf) key bindings with [fd](https://github.com/sharkdp/fd) as file source and previews via [bat](https://github.com/sharkdp/bat) and `tree`
- `ls` aliases via [eza](https://github.com/eza-community/eza) (only if eza is installed)
- One key for [lazygit](https://github.com/jesseduffield/lazygit) and [lf](https://github.com/gokcehan/lf)
- Man pages with syntax highlighting via bat
- Host-specific settings in a separate, untracked `local.fish`

## Requirements

| Tool | Version | Note |
|---|---|---|
| fish | 3.6+ | Debian 12 package is fine |
| fzf | 0.48+ | `fzf --fish` is missing in Debian 12's fzf 0.38, use upstream |
| zoxide | any recent | Debian 12 package is very old, use upstream |
| fd, bat, tree | | Debian names `fdfind` and `batcat` need a `fd`/`bat` symlink in `~/.local/bin` |
| eza, lazygit, lf, nvim | | optional, used by aliases and key bindings |

## Install

Recommended: use [dotfiles_debian](https://github.com/techeddie/dotfiles_debian).

Standalone:

```bash
# Clone and link into ~/.config
mkdir -p ~/opt/dotfiles_debian ~/.config
git clone https://github.com/techeddie/fish_debian.git ~/opt/dotfiles_debian/fish_debian
ln -sfn ~/opt/dotfiles_debian/fish_debian ~/.config/fish

# Make fish the login shell
sudo chsh -s "$(command -v fish)" "$(id -un)"
```

## Key bindings

| Key | Action |
|---|---|
| `Ctrl-g` / `Alt-g` | lazygit |
| `Ctrl-l` / `Alt-l` | lf (replaces clear-screen, use `clear` instead) |
| `Ctrl-t` | fzf: pick file, preview with bat |
| `Ctrl-r` | fzf: search history |
| `Alt-c` | fzf: jump to directory, preview with tree |

## Commands and aliases

| Command | Action |
|---|---|
| `cd <part>` | zoxide jump to best match |
| `cdi` | zoxide interactive selection with fzf |
| `ls`, `l` | `eza` |
| `ll` | `eza -l` |
| `la` | `eza -a` |
| `lsr` | `eza -l --tree` |
| `lss` | `eza -l --sort=size` |

## Environment

| Variable | Value |
|---|---|
| `EDITOR`, `VISUAL` | `nvim` |
| `PAGER` | `less` |
| `MANPAGER` | bat with man syntax |
| `FZF_DEFAULT_COMMAND` | `fd --hidden --strip-cwd-prefix --exclude .git` |

`~/.local/bin` is added to `PATH`.

## Host-specific settings

Anything that only applies to one server (aliases, network interfaces, credentials) goes into `local.fish`. It is gitignored and sourced at the end of `config.fish`.

```bash
# Start from the example
cp ~/.config/fish/local.fish.example ~/.config/fish/local.fish
```

## Files

| File | Purpose |
|---|---|
| `config.fish` | main config, same on all hosts |
| `local.fish.example` | template for host-specific settings |
| `.gitignore` | ignores `local.fish` and `fish_variables` |
