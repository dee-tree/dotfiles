
function take --description "Create directory and go inside"
    mkdir -p "$argv[1]"; and cd "$argv[1]"
end

abbr --add gitlog 'git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)" --all'

funcsave take
