
# if starship installed and accessible
if type -q starship
    starship init fish | source
    enable_transience # enables transient prompt
end

if set -q ZELLIJ
else if type -q zellij
    zellij
end

if type -q direnv
    direnv hook fish | source
end

set -xg IN_FISH_SHELL ""
