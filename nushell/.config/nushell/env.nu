#
# Aliases
#

alias c = clear
alias j = just

alias in = sudo dnf install
alias out = sudo dnf remove

#
# Apps
#

mkdir ~/.cache/starship
mkdir ~/.local/share/atuin

starship init nu | save -f ~/.cache/starship/init.nu
atuin init nu | save -f ~/.local/share/atuin/init.nu
zoxide init nushell | save -f ~/.local/share/zoxide/init.nu

#
# Functions
#


# Toor (find project root)
def r [] {
    let project_root = (toor)
    print $project_root

    if $project_root != "" {
        # If successful, change to the project root directory
        cd $project_root
        print $"Changed to project root: ($project_root)"
    } else {
        print "Project root not found. I don't go anywhere 📍"
    }
}

# Yazi
#
# Changing working directory when exiting Yazi
# https://yazi-rs.github.io/docs/quick-start/#changing-working-directory-when-exiting-yazi
def --env x [] {
  let tmp = (mktemp -t "yazi-cwd.XXXXX")
	yazi --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -f $tmp
}
