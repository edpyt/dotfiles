function fx --wraps=fzf --description 'alias fx=felix'
    if type -f fzf &>/dev/null
        felix $argv
    else
        missing_package felix
    end
end
