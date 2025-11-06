{ config, lib, inputs, pkgs, ... }: {

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; 
      dedicatedServer.openFirewall = true; 
      localNetworkGameTransfers.openFirewall = true;
  };

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    
  ];
    
# de acordo com a wiki, ativar o gamescope manualmente não é preciso em GPUs amd!!! :)

}
