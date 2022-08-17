source ~/.cache/starship/init.nu
zoxide init nushell --hook prompt | save ~/.zoxide.nu

let new_paths = ["~/.nodebin/node_modules/.bin"]
for path in $new_paths {
    let-env PATH = ($env.PATH | append $path)
}

# Alias
alias in = sudo apt install
alias inn = sudo apt-get --no-install-recommends install
alias inb = sudo apt install -t bullseye-backports

alias c = clear
alias g = git
alias la = ls -a
alias rrepl = evcxr # I can't remember evcxr

# List all history
def history_all [] {
  let history_ = (history | get command | uniq | reverse | to text | sk)
  xdotool type $history_
}

# List previous history in current directory
def history_in_pwd [] {
  let history_ = (history | where cwd == $env.PWD | get command | uniq | reverse | to text | sk)
  xdotool type $history_
}
alias hh = history_in_pwd

def-env br_cmd [] {
  let cmd_file = (^mktemp | str trim);
  ^broot --outcmd $cmd_file;
  let-env cmd = ((open $cmd_file) | str trim);
  ^rm $cmd_file;
}
# Broot file manager
alias br = (br_cmd | cd ($env.cmd | str replace "cd" "" | str trim))

# The default config record. This is where much of your global configuration is setup.
let-env config = {
  show_banner: false, # No greeting
  history_file_format: "sqlite" # "sqlite" or "plaintext"

  keybindings: [
    {
      name: "all history"
      modifier: control
      keycode: char_h
      mode: emacs
      event: [
        { edit: Clear }
        {
          edit: insertString
          value: "history_all"
        }
        { send: enter }
      ]
   },
  ]
}
