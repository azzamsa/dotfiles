# source: https://github.com/nushell/nu_scripts/blob/main/sourced/cool-oneliners/git_gone.nu

# gently try to delete merged branches, excluding the checked out one
git branch --merged | lines | where $it !~ '\*' | str trim | where $it != 'master' and $it != 'main' | each { |it| git branch -d $it }
