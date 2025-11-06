{ config, lib, inputs, pkgs, ... }: {

  # ssh
   services.openssh.enable = true;

  # gerenciador bluetooth
   services.blueman.enable = true;

  # xserver
   services.xserver.enable = true;

}
