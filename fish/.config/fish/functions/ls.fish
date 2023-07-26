function l
    exa --group-directories-first --git $argv
end

function ls
    exa --group-directories-first --git $argv
end

function la
    exa --group-directories-first --git --all $argv
end

function ll
    exa --all --binary --group --header --inode --long --modified --accessed $argv
end

function llm
    ll --sort=modified $argv
end

function tree
    exa --tree --git-ignore $argv
end
