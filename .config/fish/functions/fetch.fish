function fetch --wraps=slowfetch --description 'alias fetch=slowfetch'
    if type -f slowfetch &>/dev/null
        slowfetch $argv
    else
        missing_package slowfetch
    end
end
