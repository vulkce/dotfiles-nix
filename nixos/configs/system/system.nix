{ config, lib, pkgs, ... }: {
  # será que esse arquivo tá ficando muito grande?
  
  # usa systemd-boot
  boot.loader.systemd-boot.enable = true;

  # define e configura o kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ ]; # modulos do kernel
  boot.kernelParams = [
    "idle=poll" # pode reduzir latencia
    "amd_pstate=active" # o hardware controla
    # "isolcpus=<cpus>" # isola cores.
  ];

  # nome do sistema
  networking.hostName = "flake";

  # usa o networkmanager
  networking.networkmanager.enable = true;

  # timezone
  time.timeZone = "America/Sao_Paulo";

  # habilita suporte ao openZFS
  networking.hostId = "8bec9fba";
  boot.supportedFilesystems = [ "zfs" ];

  # otimiza o /nix/store trocando arquivos duplicados por hardlinks
  nix.optimise = { 
    automatic = true;
    dates = [ "daily" ]; # otimiza diariamente 
  };

  # chama o caminhão de lixo pro nix
  nix.gc = {
    automatic = false; # nh já faz o trabalho
    dates = [ "weekly" ]; # chama semanalmente 
   # options = "--delete-older-than 30d"; # deleta todas a generations
  };

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

  # habilita zram
  zramSwap = {
    enable = true;
    memoryPercent = 75;
    algorithm = "lzo-rle"; # I love lzo-rle
    priority = 10; # preferencia alta pela zram
  };

  # swap normal
  swapDevices = [
    { 
      device = "/dev/disk/by-uuid/d2b636cc-bf0e-4fb8-8448-ee032ebfdc8d"; # sempre usem UUIDs!!!
      priority = 0; # usa o swap quando a zram encher
    }
  ];

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
