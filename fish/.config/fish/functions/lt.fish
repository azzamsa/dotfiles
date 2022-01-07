# Show tree of the current directory
# with gitignore respecting feature

function lt
    set level $argv[1]

    if set -q $level
        set level 2
    end

    # using `tree` to respect .gitignore is painful
    exa --git-ignore --icons --tree --level=$level
end
