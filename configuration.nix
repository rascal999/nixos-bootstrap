# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  #boot.loader.grub.enable = true;
  #boot.loader.grub.version = 2;
  #boot.loader.grub.efiSupport = true;
  #boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "nodev"; # or "nodev" for efi only

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/London";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  #networking.useDHCP = false;
  #networking.interfaces.enp0s3.useDHCP = true;
  networking.networkmanager.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  # Configure keymap in X11
  services.xserver.layout = "dvorak";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
     isNormalUser = true;
     extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     acpi
     asciinema
     awscli
     chromium
     cifs-utils
     coreutils
     cutter
     dhcpcd
     docker
     docker-compose
     electrum
     enum4linux
     fcrackzip
     feh
     ffmpeg
     filezilla
     firefox
     gimp
     git
     gitleaks
     git-crypt
     gobuster
     googler
     helm
     hexedit
     hping
     htop
     i3
     i3status-rust
     inetutils
     ipcalc
     iwd
     jdk
     john
     jq
     jython
     keepassxc
     kubectl
     libreoffice-fresh
     lshw
     lynis
     mplayer
     mtr
     nethogs
     nmap
     ntfs3g
     obsidian
     openssh
     p7zip
     pwgen
     python3
     radare2
     rdesktop
     remmina
     rsync
     rxvt-unicode
     scrot
     sqlmap
     sshfs
     syncthing
     testssl
     thc-hydra
     tmux
     tor-browser-bundle-bin
     unzip
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     virtualbox
     vlc
     w3m
     wafw00f
     wapiti
     wget
     whois
     wireshark-qt
     wpscan
     x11vnc
     xlockmore
     xorg.xbacklight
     youtube-dl
     zip
     zoom-us
     zsh
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  # Enable zsh
  programs.zsh.enable = true;

  # Enable Oh-my-zsh
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "sudo" "docker" "kubectl" ];
    theme = "robbyrussell";
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  ### Custom
  # ntp
  services.ntp.enable = true;
  # syncthing
  services.syncthing.enable = true;
  services.syncthing.user = "user";
  services.syncthing.dataDir = "/home/user/syncthing";
  # For Obsidian
  nixpkgs.config.allowUnfree = true;
  # Start docker
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = true;
  networking.wireless.iwd.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}
