{ config, pkgs, ... }:
{
  services.flatpak.enable = true;

  # repo
  services.flatpak.remotes = [
    { name = "flathub"; location = "https://flathub.org/repo/flathub.flatpakrepo"; }
  ];

  services.flatpak.packages = [
    { appId = "app.zen_browser.zen"; origin = "flathub"; }
    "org.vinegarhq.Sober"
  ];

  # atualização automática:
  services.flatpak.update.onActivation = true;
  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "weekly";
  };
}
