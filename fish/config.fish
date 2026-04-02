
<<<<<<< Updated upstream
# if starship installed and accessible
if type -q starship
    starship init fish | source
    enable_transience # enables transient prompt
end

if set -q ZELLIJ
else if type -q zellij
    zellij
||||||| Stash base
enable_transience # enables transient prompt


if set -q ZELLIJ
else
  zellij
=======
enable_transience # enables transient prompt

if status is-interactive
    # Configure auto-attach/exit to your likings (default is off).
    set ZELLIJ_AUTO_ATTACH true
    # set ZELLIJ_AUTO_EXIT true
    eval (zellij setup --generate-auto-start fish | string collect)
>>>>>>> Stashed changes
end
<<<<<<< Updated upstream

if type -q direnv
    direnv hook fish | source
end

set -xg IN_FISH_SHELL ""
||||||| Stash base
=======
if not set -q ZELLIJ
    # if test "$ZELLIJ_AUTO_ATTACH" = "true"
        # zellij attach -c $USER@(hostname)
        #    zellij attach
        # else
        zellij
        # end

    if test "$ZELLIJ_AUTO_EXIT" = "true"
        kill $fish_pid
    end
end

# if set -q ZELLIJ
# else
#   zellij -l welcome
# end

>>>>>>> Stashed changes
