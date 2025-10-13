function expand-dot-to-parent-directory-path -d 'expand ... to ../.. etc'
    # Get commandline up to cursor
    set -l cmd (commandline --cut-at-cursor)

    # Match last line
    switch $cmd[-1]
        case '*..'
            commandline --insert '/..'
        case '*'
            commandline --insert '.'
    end
end

function my_key_bindings
    fish_default_key_bindings
    bind . 'expand-dot-to-parent-directory-path'
end

set -g fish_key_bindings my_key_bindings
