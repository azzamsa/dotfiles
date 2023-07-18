function box
    if test -z $argv
        toolbox enter daily
    else
        toolbox enter $argv[1]
    end
end
