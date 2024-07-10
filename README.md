# An Opinionated _neovim_ Configuration

This is an opinionated _neovim_ configuration. It is also a work in 
progress and will be updated as I learn more about _neovim_ and how to 
configure it. 

<!-- vim-markdown-toc GFM -->

* [Setup](#setup)
    * [Common issues](#common-issues)
        * [`ripgrep` not found](#ripgrep-not-found)
        * [No Clipboard tool found](#no-clipboard-tool-found)
        * [Missing 'neovim' Node package](#missing-neovim-node-package)
        * [Missing Perl support](#missing-perl-support)
        * [Missing Python package](#missing-python-package)
* [Installation](#installation)
* [Included Plugins](#included-plugins)
* [Planned Plugins / Functionality](#planned-plugins--functionality)

<!-- vim-markdown-toc -->

## Setup

It is recommended to run `:checkhealth` in _neovim_ to see if there are any
issues that need to be resolved. Most likely there will, unless you have been
using _neovim_ for a while and have already resolved them.

### Common issues

There are a few common issues that you may encounter when running
`:checkhealth`, depending on your system and how you have installed _neovim_.

For several of these, you can disable the warning. It will be noted below if we
are using a plugin that actually requires the feature.

#### `ripgrep` not found

You will need to install `ripgrep` on your system. You can find it 
[here](https://github.com/BurntSushi/ripgrep)

#### No Clipboard tool found

This is a common issue on Linux systems. You will need to install a clipboard
tool. On most systems, `xclip` is available. You can install it with your
package manager. For more help, type `:help clipboard` in _neovim_.

#### Missing 'neovim' Node package

This package is required for some plugins to work. The warning message explains
how to install it globally.

#### Missing Perl support

This is optional since none of the plugins I use require Perl support. If you
want to enable it you can install the `Neovim::Ext` module from CPAN. Otherwise,
disable this warning.

#### Missing Python package

This one is useful if you are developing Python code. You can install the
`pynvim` package with `pip`. If you don't need it, you can disable this warning.

Note that it tells you to install 'neovim' package, but it is actually `pynvim` 
to install, which has replaced this. The `neovim` package will actually install 
the `pynvim`package anyway (it's a transition package).

## Installation

> [!NOTE]
> This section is a work in progress.

Generally, you can clone this repository into your Neovim configuiration folder.
On Linux/Mac this is usually `~/.config/nvim`. Check the Neovim documentation
for your specific system if you are unsure.

```bash
git clone https://github.com/seapagan/nvim-config.git ~/.config/nvim
```

> [!WARNING]
> Be aware this will overwrite any existing configuration you have in
> `~/.config/nvim`!

## Included Plugins

> [!NOTE]
> This section is a work in progress.

## Planned Plugins / Functionality

See [TODO.md](TODO.md) for a list of planned plugins.
