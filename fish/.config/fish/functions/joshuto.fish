function joshuto
    set ID (echo $fish_pid)
    mkdir -p /tmp/$USER
    set OUTPUT_FILE "/tmp/$USER/joshuto-cwd-$ID"
    env joshuto --output-file "$OUTPUT_FILE" $argv
    set exit_code $status

    switch $exit_code
        case 0
            # regular exit
            ;;
        case 101
            # output contains current directory
            set JOSHUTO_CWD (cat "$OUTPUT_FILE")
            cd "$JOSHUTO_CWD"
            ;;
        case 102
            # output selected files
            ;;
        case '*'
            echo "Exit code: $exit_code"
            ;;
    end
end
