# I'll annotate above each line that needs changing how to make this work in a configuration.nix for nixos
{config, pkgs, nixpkgs, ... }:
#{ nixpkgs ? import <nixpkgs> {} }:

let
  myVim = nixpkgs.vim_configurable.customize {
    name = "vim";
    vimrcConfig.customRC = builtins.readFile ./vimrc;

    vimrcConfig.packages.myVimPackage = with nixpkgs.vimPlugins; {
        start = [
          vim-colorschemes
          rainbow_parentheses
          vimproc
          ctrlp
          neocomplete
          The_NERD_Commenter
          The_NERD_tree
          supertab
          tabular
          tlib
          vim-addon-mw-utils
          vim-repeat
          snipmate
          surround
          rust-vim
          ghcmod
          neco-ghc
          vim-nix
          fugitive
          vim-airline
          vim-airline-themes
          ale
      ];
    };
  };
in
{
  #remove this line
  vim = myVim;
  environment.systemPackages = [ myVim ];
  environment.shellAliases.vi = "vim";
  environment.variables.EDITOR = "vim";
  programs.bash.shellAliases = {
    vi = "vim";
    svim = "sudoedit";
  };
  nixpkgs.config.vim.ftNix = false;
}
