function bookmarks
    set -l selected_bookmark (echo $_META_BOOKMARKS | tr ',' '\n' | fzf --prompt="Select a bookmark: ")

    if test -n "$selected_bookmark"
        echo "Navigating to: $selected_bookmark"
        cd (string replace -r \~ $HOME $selected_bookmark)
    else
        echo "No bookmark selected."
    end
end
