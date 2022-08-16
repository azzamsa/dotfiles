use ~/code/forks/nu_scripts/prompt/zoxide-eq.nu [z, zi]

source ~/.cache/starship/init.nu
zoxide init nushell | save ~/.zoxide.nu

# Alias
alias in = sudo apt install
alias inn = sudo apt-get --no-install-recommends install
alias inb = sudo apt install -t bullseye-backports

alias c = clear
alias g = git
alias la = ls -a
alias rrepl = evcxr # I can't remember evcxr
alias h = (history | get command | uniq | reverse | to text | sk)
# List previous history in current directory
alias hh = (history | where cwd == $env.PWD | get command | uniq | reverse | to text | sk)
# Broot file manager
alias br = (br_cmd | cd ($env.cmd | str replace "cd" "" | str trim))

def-env br_cmd [] {
  let cmd_file = (^mktemp | str trim);
  ^broot --outcmd $cmd_file;
  let-env cmd = ((open $cmd_file) | str trim);
  ^rm $cmd_file;
}

# The default config record. This is where much of your global configuration is setup.
let-env config = {
  history_file_format: "sqlite" # "sqlite" or "plaintext"
}
