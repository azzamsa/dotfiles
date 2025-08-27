# Optionals

## Wireguard

On Arch:

```bash
$ sudo paru -S wireguard-tools

sudo systemctl start  systemd-resolved.service
sudo systemctl enable systemd-resolved.service
sudo wg-quick up wg0
```
