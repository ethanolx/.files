# .files
My development environment configuration files

## Stability
The `main` branch of this repository contains stable configurations for various
applications and software.

Other branches contain development code/configurations for their corresponding applications.

## Structure
The file structure of this repository almost mirrors that of a typical home directory,
with the `.config` directory adhering to the XDG Base Directory Specification.

## Usage
There are sample installation scripts located under the `.scripts` directory. However, do note that these are specific to Fedora linux (or similar) and they are mostly untested.

An alternative would be to follow the scripts as references instead, manually installing and copying the corresponding configuration files for the desired applications.

* Neovim:
```console
nvim +PackerSync
```

## Credits
* Neovim: My Neovim configuration is derived from `siduck`'s [https://github.com/NvChad/NvChad](NvChad) framework.

## License
This project is licensed under the MIT [https://github.com/ethanolx/.files/blob/main/LICENSE](license).
