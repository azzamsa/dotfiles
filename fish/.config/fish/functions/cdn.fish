function cdn
    pushd .
    for i in (seq 1 $argv[1]); cd ..; end
    pwd
end
