# aur-submit

Submit source packages to the [AUR][] from the command-line.

[AUR]: https://aur.archlinux.org

## Installation

```
% git clone https://github.com/pbrisbin/aur-submit
% cd aur-submit
% rake install
```

*TODO*: Arch PKGBUILD

## Usage

```
% aur-submit FILE
```

You will be prompted for Username, Password, and Category. If you're 
doing this in an automated fashion, you can avoid the prompting by 
setting `AUR_USERNAME`, `AUR_PASSWORD` and `AUR_CATEGORY` in the 
environment.

## Related

This was extracted out of [paur][] which handles that and more.

[paur]: https://github.com/pbrisbin/paur
