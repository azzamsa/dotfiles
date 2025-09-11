#!/usr/bin/env fish

#
# Setup Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default stable
rustup component add rust-analyzer
. "~/.local/share/cargo/env"

#
# Cargo
cargo install cargo-binstall

set -l pkgs \
    atuin dotter fnm starship just jj-cli \
    cargo-update cargo-edit cargo-outdated cargo-tarpaulin bacon dprint git-cliff hurl selene \
    stylua typos-cli watchexec-cli git-cliff dprint typos-cli jaq bandwhich bat dua-cli kondo \
    yazi-fm eza typstyle typst-cli lolcrab macchina tokei \
    # Text Editor
    toor emacs-lsp-booster

for pkg in $pkgs
    cargo binstall --no-confirm --no-symlinks --secure $pkg
end

# Optionals
# cargo install --locked cargo-nextest
