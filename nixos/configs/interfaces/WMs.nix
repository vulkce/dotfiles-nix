{ config, lib, inputs, pkgs, ... }: {

  # hyprland
  programs.hyprland = {  
    enable = true;
    xwayland.enable = true;
  }; 

  # i3 WM
  services.xserver.windowManager.i3.enable = true;

  # sway
  programs.sway.enable = true;

  # openbox
  services.xserver.windowManager.openbox.enable = true;

}
