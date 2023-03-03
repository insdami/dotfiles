# Home Manager & Flakes

[Modules](./hosts/modules)

## Installation MacOS

1. Install [nix](https://nixos.org/download.html#nix-install-macos)
2. Enable [Flakes](https://nixos.wiki/wiki/Flakes#Permanent)
3. Install [Home Manager via Flakes](https://nix-community.github.io/home-manager/index.html#ch-nix-flakes) by the [standalone installation](https://nix-community.github.io/home-manager/index.html#sec-flakes-standalone)


### Known issues
As of today, the latest nix version(2.14.0) has some [issues](https://github.com/NixOS/nix/issues/7937) and the workaround is to downgrade to the previous version.

```
sh <(curl -L https://releases.nixos.org/nix/nix-2.13.3/install)
```

### Uninstall
Follow the steps from the [guide](https://nixos.org/manual/nix/stable/installation/installing-binary.html#macos) and there is also a handy [uninstall script](https://github.com/jacix/nixbits/blob/main/nix-uninstall.sh) for multi-user installations.
