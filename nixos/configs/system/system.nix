{ config, lib, pkgs, ... }: {
  # será que esse arquivo tá ficando muito grande?
  
  # usa systemd-boot
  boot.loader.systemd-boot.enable = true;

  # define e configura o kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ ]; # modulos do kernel

  # nome do sistema
  networking.hostName = "flake";

  # usa o networkmanager
  networking.networkmanager.enable = true;

  # timezone
  time.timeZone = "America/Sao_Paulo";

  # habilita suporte ao openZFS
  networking.hostId = "8bec9fba";
  boot.supportedFilesystems = [ "zfs" ];

  # pipewire
  services.pipewire = {
    enable = true;
    pulse.enable = true; # ativa compatibilidade com pulseaudio
    jack.enable = true; # ativa compatibilidade com o jack
  };

  # habilita o bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; # inicia o bluetooth no boot
  };

  # habilita o nh 
  programs.nh = {
    enable = true;
    clean.enable = true; # faz o trabalho do cg
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/etc/nixos/"; # localização da minha flake 
  };

  # firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 4580 9090 ];
    allowedUDPPorts = [ ];
  };

  # experimental
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # unfree
  nixpkgs.config.allowUnfree = true;

  # versão no qual a primeira build foi feita!
  system.stateVersion = "25.05";

}
