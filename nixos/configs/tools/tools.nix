{ config, lib, inputs, pkgs, ... }: {

  # ssh
   services.openssh.enable = true;

  # flatpak
   services.flatpak.enable = false;

  # gerenciador bluetooth
   services.blueman.enable = true;

  # xserver
   services.xserver.enable = true;

  # virtualbox (compilar isso é muito chato!!!)
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableKvm = true;
  virtualisation.virtualbox.host.addNetworkInterface = false;

}
