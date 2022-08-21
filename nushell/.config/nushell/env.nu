# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
# Without this conversion, adding string path to Nushell won't work
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str collect (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str collect (char esep) }
  }
}

let-env PATH = ($env.PATH | append [
  # My public & private scripts
  "~/bin/private"
  "~/bin/public"
  "~/.cargo/bin"
  # Most python apps resides here
  "~/.local/bin"
  # Global nodejs applications
  "~/.nodebin/node_modules/.bin"
])

# Starship
mkdir ~/.cache/starship
starship init nu | save ~/.cache/starship/init.nu

# Zoxide
source ~/.zoxide.nu
