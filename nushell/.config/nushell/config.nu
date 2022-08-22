source ~/.cache/starship/init.nu
zoxide init nushell --hook prompt | save ~/.zoxide.nu

# Alias
alias in = sudo apt install
alias inn = sudo apt-get --no-install-recommends install
alias inb = sudo apt install -t bullseye-backports

alias update = sudo apt-get -y update
alias upgrade = sudo apt-get -y upgrade

alias c = clear
alias g = git
alias la = ls -a
alias rrepl = evcxr # I can't remember evcxr


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
  show_banner: false # No greeting
  history_file_format: "sqlite" # "sqlite" or "plaintext"
  # Enables terminal markers and a workaround to arrow keys stop working issue.
  # This also enable Terminal to show the current PWD it its title.
  shell_integration: true
  rm_always_trash: true # Move `rm`-ed file to Trash

 menus: [
    {
        # List all unique successful commands
        name: all_history_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
        }
        source: { |buffer, position|
            history
            | where command =~ $buffer
            | reverse
            | where exit_status != 1
            | each { |it| {value: $it.command } }
            | uniq
        }
    }
    {
        # List all unique successful commands in the current directory
        name: pwd_history_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
        }
        source: { |buffer, position|
            history
            | where command =~ $buffer
            | reverse
            | where exit_status != 1
            | where cwd == $env.PWD
            | each { |it| {value: $it.command } }
            | uniq
        }
    }
]

  keybindings: [
    {
      name: "all history"
      modifier: control
      keycode: char_h
      mode: emacs
      event: { send: menu name: all_history_menu }
    }
    {
      name: "pwd history"
      modifier: control
      keycode: char_p
      mode: emacs
      event: { send: menu name: pwd_history_menu }
    }
  ]

}
