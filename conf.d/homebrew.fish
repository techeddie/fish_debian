# Homebrew PATH on macOS (Apple Silicon or Intel), no-op on Linux
for brew in /opt/homebrew/bin/brew /usr/local/bin/brew
    if test -x $brew
        $brew shellenv fish | source
        break
    end
end
