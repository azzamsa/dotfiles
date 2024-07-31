#
# Apps
#

use ~/.cache/starship/init.nu
source ~/.local/share/atuin/init.nu
source ~/.local/share/zoxide/init.nu

$env.config = {
    # disable the welcome banner at startup
    show_banner: false # default: true

    rm: {
        always_trash: true # default: false
    }

    history: {
        file_format: "sqlite" # default: plaintext
    }
}
