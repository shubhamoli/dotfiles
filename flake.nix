{
  description = "Oli's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
          pkgs.vim
          pkgs.bash
          pkgs.bashInteractive
          pkgs.gcc
          pkgs.git
          pkgs.gnupg
          pkgs.tmux
          pkgs.neovim
          pkgs.go
          pkgs.kustomize
          pkgs.alacritty
        ];

      # Post migration changes
      # from v24.11 -> v25.11
      system.primaryUser = "shubham";

      # Auto upgrade nix package and the daemon service.
      nix = {
        enable = true; 
        # Necessary for using flakes on this system.
        settings = {
          experimental-features = "nix-command flakes";
        };
      };

      # Enable alternative shell support in nix-darwin.
      programs.bash.enable = true;

      users.users = {
        shubham = {
          shell = pkgs.bashInteractive;
          home = "/Users/shubham";
        };
      };

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;


      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Enable touch id for sudo
      security.pam.services.sudo_local.touchIdAuth = true;

      # System defaults
      system = {
        defaults = {
          dock.autohide = true;
          dock.tilesize = 64;
          trackpad.Clicking = true;
        };
        keyboard = {
          remapCapsLockToEscape = true;
        };
      };

      fonts.packages = with pkgs; [
        recursive
	      nerd-fonts.fira-code
      ];
      
      # Enable Homebrew
      homebrew = {
        enable = true;

        taps = [
          "hashicorp/tap"
          "confluentinc/tap"
          "cue-lang/tap"
        ];
        brews = [
          "bash"
          "curl"
          "fzf"
          "watch"
          "go@1.23"
          "jq"
          "kubectl"
          "node@22"
          "ripgrep"
          "hashicorp/tap/packer"
          "terraform"
          "terraform-docs"
          "terragrunt"
          "tpm"
          "wget"
          "confluentinc/tap/cli"
          "libpq"
          "yq"
          "helm"
          "podman"
          "ipcalc"
          "cue"
          "telnet"
          "tree"
          "jj"
        ];
        casks = [
          "1password-cli"
          "google-cloud-sdk"
        ];
      };
  };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#UP-Shubham
    darwinConfigurations."UP-Shubham" = nix-darwin.lib.darwinSystem {
      modules = [ 
       configuration
       home-manager.darwinModules.home-manager {
         home-manager.useGlobalPkgs = true;
         home-manager.useUserPackages = true;
         home-manager.backupFileExtension = "backup-nix";
         home-manager.users.shubham = import ./home.nix;
       }
     ];
    };
  };
}
