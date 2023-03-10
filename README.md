### Introduction

A starting point for Neovim that is:

* Small (~370 lines)
* Well-organized
* Documented
* Modular

neovim_init targets *only* the latest ['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest ['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim. If you are experiencing issues, please make sure you have the latest versions.

This repo is meant to be used as a starting point for a user's own configuration; remove the things you don't like and add what you do.

-----
### Installation

* Install Homebrew
  * https://brew.sh/
  * following installation instructions
* Install asdf
  * https://asdf-vm.com/
  * following installation instructions
* install elixir-ls language server
  * Download the latest release: [https://github.com/elixir-lsp/elixir-ls/releases/latest](https://github.com/elixir-lsp/elixir-ls/releases/latest) and unzip it into a directory of your choice
  * within the lua/core/plugin_config/lsp_config.lua file, update `"path_to_elixirls"` to point to the elixir-ls installation directory
  * for more information on the language server, https://github.com/elixir-lsp/elixir-ls
* install gnu-sed
  * ```brew install gnu-sed```
* install ripgrep
  * ```brew install ripgrep```
* install neovim
  * If you are currently using neovim, backup your previous configuration, additional info here -> [FAQ](#faq)
  * clone neovim_init from https://github.com/ddaugher/nvim_init into a directory of your choice, my recomendation would be, ```/Users/Shared/elixir-ls```. This will require no updates
  to the configuration
  * symbolically link your neovim_init directory to the neovim config location
    * ```ln -s [install directory]/nvim_init ~/.config/nvim```
  * ```
    asdf plugin add neovim
    asdf install neovim stable
    asdf global neovim stable
    ```
  * Start Neovim (`nvim`) from the command-line, installation will happen automatically
  * ignore any error message about missing plugins, `:PackerInstall` will fix that shortly
  * Restart Neovim
  * install TreeSitter vim parser, ```:TSInstall vim```
  * you can check the health of neovim by ```:checkhealth```
* install erlang and elixir
  * using `asdf` and the included `.tool-versions` file, the defined versions can be installed automatically (make sure you are sitting in `cloned directory` in order to take advantage of the `.tool-versions` file.)
  * ```
    asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
    asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
    asdf install
    ```
  * if you want to change the installed versions, you can update the .tool-versions file prior to installation

If there are language servers that you don't want to use, remove their configuration from your `luq/core/plugin_config/lsp_config.lua` after copy and pasting (for example, in the mason configuration).

-----
### Configuration

You could directly modify the `init.lua` file with your personal customizations. This option is the most straightforward, but if you update your config from this repo, you may need to reapply your changes.

An alternative approach is to create a separate `plugin_config` module to register each of your own plugins. Leveraging this technique should make upgrading to a newer version of this repo easier.

##### Example `nvim_tree.lua`

The following is an example of a `plugins lua` module (located at `$HOME/.config/nvim/lua/core/plugin_config/nvim_tree.lua`) where you can register your own plugins.

```
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

-- Keymap to Toggle NTree
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
```
-----
### Snippets
  * By default, [LauSnip](https://github.com/L3MON4D3/LuaSnip) will be installed as the  snippet library
  * The [friendly-snippets collection](https://github.com/rafamadriz/friendly-snippets) has been installed and provides a considerably large collection of community snippets, including elixir.
  * You can add personal snippets to the configuration utilizing the VSCode snippet format.  You can add your own snippets to 'language specific' json files or to the 'all' file, which will be available for all languages.

-----
### Default Keymaps
##### All Contexts
* `<leader>sf` - [S]earch [F]iles
* `<leader>sf` - [S]earch [F]iles
* `<cntrl>t` - Open Treesitter Explorer
* `<leader>?` - [?] Find recently opened files
* `<leader><leader>` - [ ] Find existing buffers
* `<leader>/` - [/] Fuzzily search in current buffer]

##### Language specific

-----
### FAQ
  * How do I find all of the available keymaps currently defined?
    * you can see available keymaps via ```:Telescope keymaps```
  * How do I config/instal/remove language servers?
    * you can install/manage available language servers via ```:Mason```
    * you will also need to add entry to ```servers section``` of `lua/core/plugin_config/lsp_config.lua` in order for neovim to recognize the LSP.
  * How are plugins managed?
    * plugins are managed via Packer, https://github.com/wbthomason/packer.nvim
  * What do I have to do if I make a change to the lua configuration?
    * changes to the lua configuration will be automatically detected and applied
    * you can use `:PackerSync` to synchronize your neovim install with current versions
  * What should I do if I already have a pre-existing neovim configuration?
     * You should back it up, then delete all files associated with it.
     * This includes your existing init.lua and the neovim files in `.local` which can be deleted with `rm -rf ~/.local/share/nvim/`
