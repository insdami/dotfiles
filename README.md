# Home Manager & Flakes

[Modules](./hosts/modules)

## Installation MacOS

1. Install [nix](https://nixos.org/download.html#nix-install-macos)
> Known issue: `Problem with the SSL CA cert (path? access rights?) (77)`
https://github.com/NixOS/nix/issues/3261#issuecomment-721466043

```bash
sudo rm /etc/ssl/certs/ca-certificates.crt
sudo ln -s /nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt /etc/ssl/certs/ca-certificates.crt
```

2. Enable [Flakes](https://nixos.wiki/wiki/Flakes#Permanent)
3. Install [Home Manager via Flakes](https://nix-community.github.io/home-manager/index.xhtml#ch-nix-flakes) by the [standalone installation](https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-standalone)
> Known issue: `error: creating statement 'insert or replace into Cache ...`

```bash
rm -rf $HOME/.cache/nix
```

> Known issue: `error: opening lock file '/nix/var/nix/profiles/per-user/dalbrunm/profile.lock': Permission denied` 

https://github.com/nix-community/home-manager/issues/3734

```bash
sudo chown -R $USER:nixbld /nix/var/nix/profiles/per-user/$USER
```


### Known issues
As of today, the latest nix version(2.14.0) has some [issues](https://github.com/NixOS/nix/issues/7937) and the workaround is to downgrade to the previous version.

```
sh <(curl -L https://releases.nixos.org/nix/nix-2.13.3/install)
```

### Uninstall
Follow the steps from the [guide](https://nixos.org/manual/nix/stable/installation/installing-binary.html#macos) and there is also a handy [uninstall script](https://github.com/jacix/nixbits/blob/main/nix-uninstall.sh) for multi-user installations.

### Re-install

```
1. sh <(curl -L https://raw.githubusercontent.com/jacix/nixbits/main/nix-uninstall.sh)
2. sh <(curl -L https://nixos.org/nix/install)
3. nix run home-manager/master -- init --switch
4. home-manager switch --flake .#<profile> # home-manager switch --flake .#dalbrunm-mac
```
