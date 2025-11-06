{ config, lib, inputs, pkgs, ... }: {

  # SDDM
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # PLASMA
  services.desktopManager.plasma6.enable = true;

  # COSMIC
  services.desktopManager.cosmic.enable = true;

  # GNOME
  services.desktopManager.gnome.enable = false;

  # XFCE
  services.xserver.desktopManager.xfce.enable = false;

  # cinnamon
  services.xserver.desktopManager.cinnamon.enable = false;

  # evitar conflito entre gnome e kde
  programs.ssh.askPassword = lib.mkForce "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";

}
