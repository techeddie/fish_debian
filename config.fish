# ---- PATH ----
# User binaries (fzf, zoxide, eza, fd/bat symlinks); -g keeps it out of universal vars
fish_add_path -g ~/.local/bin

# ---- Environment ----
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# fzf: use fd, show hidden files, skip .git
set -gx FZF_DEFAULT_COMMAND 'fd --hidden --strip-cwd-prefix --exclude .git'
set -gx FZF_DEFAULT_OPTS '--height=80% --layout=reverse'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always --line-range :50 {}'"
set -gx FZF_ALT_C_COMMAND 'fd --type=d --hidden --strip-cwd-prefix --exclude .git'
set -gx FZF_ALT_C_OPTS "--preview 'tree -C {} | head -50'"

# Non-interactive shells (scp, scripts) stop here
status is-interactive; or return

# ---- Interactive ----
# No greeting
set -g fish_greeting

# zoxide replaces cd (like alias cd='z' in bash), adds cdi for interactive selection
zoxide init fish --cmd cd | source

# fzf key bindings: Ctrl-T files, Ctrl-R history, Alt-C dirs
fzf --fish | source

# ---- Aliases (eza instead of exa) ----
if type -q eza
    alias ls 'eza'
    alias l 'eza'
    alias ll 'eza -l'
    alias la 'eza -a'
    alias lsr 'eza -l --tree'
    alias lss 'eza -l --sort=size'
end

# ---- Key bindings ----
# Defined in fish_user_key_bindings so they survive key binding resets
function fish_user_key_bindings
    # Alt-g / Ctrl-g: lazygit
    bind \eg 'lazygit; commandline -f repaint'
    bind \cg 'lazygit; commandline -f repaint'
    # Alt-l / Ctrl-l: lf (overrides clear-screen on Ctrl-l, same as in bash)
    bind \el 'lf; commandline -f repaint'
    bind \cl 'lf; commandline -f repaint'
end

# ---- Login banner ----
if status is-login; and type -q fastfetch
    fastfetch
end

# ---- tmux auto-attach (disabled) ----
# if not set -q TMUX; and not set -q LF_LEVEL
#     tmux attach 2>/dev/null; or tmux
# end

# ---- Host-specific config (not in git) ----
test -f ~/.config/fish/local.fish; and source ~/.config/fish/local.fish
