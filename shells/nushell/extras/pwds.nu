# source: https://github.com/nushell/nu_scripts/blob/main/sourced/cool-oneliners/pwd-short.nu

# Print working directory but abbreviates the home dir as ~
def pwds [] {
  $env.PWD | str replace $nu.home-path '~'
}
