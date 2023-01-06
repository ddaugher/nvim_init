### Introduction

A starting point for Neovim that is:

* Small (~370 lines)
* Well-organized
* Documented
* Modular

neovim_init targets *only* the latest ['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest ['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim. If you are experiencing issues, please make sure you have the latest versions.

This repo is meant to be used as a starting point for a user's own configuration; remove the things you don't like and add what you do.

### Installation

* Install Homebrew
  * https://brew.sh/
  * following installation instructions
* Install asdf
  * https://asdf-vm.com/
  * following installation instructions
* install erlang and elixir
  * using `asdf` and the included `.tool-versions` file, the defined versions can be installed
  * ```
    asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
    asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
    asdf install
    ```
  * if you want to change the installed versions, you can update the .tool-versions file prior to installation
* install elixir-ls language server
  * Download the latest release: [https://github.com/elixir-lsp/elixir-ls/releases/latest](https://github.com/elixir-lsp/elixir-ls/releases/latest) and unzip it into a directory of your choice
  * within the lsp_config.lua file, update `"path_to_elixirls"` to point to the elixir-ls installation directory
  * for more information on the language server, https://github.com/elixir-lsp/elixir-ls
* install gnu-sed
  * ```brew install gnu-sed```
* install ripgrep
  * ```brew install ripgrep```
* install neovim
  * If you are currently using neovim, backup your previous configuration, additional info here -> [FAQ](#faq)
  * clone neovim_init from https://github.com/ddaugher/nvim_init into a directory of your choice
  * symbolically link your neovim_init directory to the neovim config location
    * ```ln -s ~/.config/nvim [install location]/nvim_init```
  * Start Neovim (`nvim`) from the command-line, installation will happen automatically
  * run `:PackerInstall` - ignore any error message about missing plugins, `:PackerInstall` will fix that shortly
  * Restart Neovim

If there are language servers that you don't want to use, remove their configuration from your `core/plugin_config/lsp_config.lua` after copy and pasting (for example, in the mason configuration).

### Configuration

You could directly modify the `init.lua` file with your personal customizations. This option is the most straightforward, but if you update your config from this repo, you may need to reapply your changes.

An alternative approach is to create a separate `plugin_config` module to register your own plugins. Leveraging this technique should make upgrading to a newer version of this repo easier.

#### Example `nvim_tree.lua`

The following is an example of a `plugins.lua` module (located at `$HOME/.config/nvim/lua/core/plugin_config/plugins.lua`) where you can register your own plugins.

```
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

-- Keymap to Toggle NTree
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
```

### FAQ
  * How do I find all of the available keymaps currently defined?
    * you can see available keymaps via ```:Telescope keymaps```
  * How do I config/instal/remove language servers?
    * you can see/manage available language servers via ```:Mason```
  * How are plugins managed?
    * plugins are managed via Packer, https://github.com/wbthomason/packer.nvim
  * What do I have to do if I make a change to the lua configuration?
    * changes to the lua configuration will be automatically detected and applied
  * What should I do if I already have a pre-existing neovim configuration?
     * You should back it up, then delete all files associated with it.
     * This includes your existing init.lua and the neovim files in `.local` which can be deleted with `rm -rf ~/.local/share/nvim/`
