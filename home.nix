{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;

  home.username = "shubham";
  home.homeDirectory = "/Users/shubham";
  home.stateVersion = "22.05";

  # https://github.com/malob/nixpkgs/blob/master/home/default.nix

  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;

  home.packages = with pkgs; [];

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  # Only works with --impure flag
  home.file = {
    ".tmux.conf".source = /Users/shubham/oli/dotfiles/tmux.conf;
    ".bash_profile".source = /Users/shubham/oli/dotfiles/bash.rc;
    ".aliases".source = /Users/shubham/oli/dotfiles/aliases;

    # There was some permissions issue with nix
    # and for now I've solved this by running
    #
    # ln -sf $PWD/nvim/ $HOME/.config/
    #".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/Users/shubham/oli/dotfiles/nvim";
  };
  
}
