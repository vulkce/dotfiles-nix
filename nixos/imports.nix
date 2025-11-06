{ config, lib, inputs, pkgs, ... }: {  

 imports = [
   ./hardware-configuration.nix
   
   # a lista é separada considerando sua pasta!
   
   ./configs/tools/tools.nix
#  ./configs/tools/virtualbox.nix
   ./configs/tools/docker.nix
   ./configs/tools/steam.nix
   
   ./configs/interfaces/DEs.nix
   ./configs/interfaces/WMs.nix
   
   ./configs/users/vulkce.nix
   
   ./configs/packages/packages.nix
   ./configs/packages/flatpak.nix

   ./configs/system/system.nix
   ./configs/system/optimization.nix

   ./configs/exclude/gnome.nix
   ./configs/exclude/cosmic.nix
 ];

} 
