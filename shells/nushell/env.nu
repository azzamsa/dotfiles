#
# Aliases
#

alias c = clear
alias j = just

alias in = {{ install }}
alias out = {{ uninstall }}

#
# Apps
#

mkdir ~/.cache/starship
mkdir ~/.local/share/atuin
mkdir ~/.cache/carapace

starship init nu | save -f ~/.cache/starship/init.nu
atuin init nu | save -f ~/.local/share/atuin/init.nu
zoxide init nushell --cmd cd | save -f ~/.local/share/zoxide/init.nu
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

#
# Themes
#
source themes/{{ theme }}.nu

#
# Extras
#
source extras/pwds.nu

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
def --env x [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}
