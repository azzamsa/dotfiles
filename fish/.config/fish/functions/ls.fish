function ls
    command ls --color $argv[1]
end

function la
    command ls -AltGhF --group-directories-first --color $argv[1]
end
