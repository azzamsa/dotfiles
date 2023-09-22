function l
    eza --group-directories-first --git $argv
end

function ls
    eza --group-directories-first --git $argv
end

function la
    eza --group-directories-first --git --all $argv
end

function ll
    eza --all --binary --group --header --inode --long --modified --accessed $argv
end

function llm
    ll --sort=modified $argv
end

function tree
    eza --tree --git-ignore $argv
end
