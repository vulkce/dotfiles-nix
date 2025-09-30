{ config, lib, inputs, pkgs, ... }: {

  # ssh
   services.openssh.enable = true;

  # flatpak
   services.flatpak.enable = false;

  # gerenciador bluetooth
   services.blueman.enable = true;

  # xserver
   services.xserver.enable = true;

}
