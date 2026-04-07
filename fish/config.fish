function starship_transient_rprompt_func
  # starship module cmd_duration
  # echo "<< took $CMD_DURATION ms"
end

# if starship installed and accessible
if type -q starship
    starship init fish | source
    enable_transience # enables transient prompt
end

if status is-interactive && type -q zellij
    eval (zellij setup --generate-auto-start fish | string collect)
end

if type -q direnv
    direnv hook fish | source
end

set -xg IN_FISH_SHELL ""
