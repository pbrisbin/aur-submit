**ARCHIVED**: I no longer use this and won't be maintaining it.

# aur-submit

Submit source packages to the [AUR][] from the command-line.

[AUR]: https://aur.archlinux.org

## Installation

```
% git clone https://github.com/pbrisbin/aur-submit
% cd aur-submit
% rake install
```

Arch users: https://aur.archlinux.org/packages/aur-submit-git/

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
