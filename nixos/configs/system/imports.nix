{ config, lib, inputs, pkgs, ... }:  

 imports = [
   ../../hardware-configuration.nix
   ./configs/tools/tools.nix
   ./configs/tools/virtualbox.nix
   ./configs/tools/docker.nix
   
   ./configs/DEs/DEs.nix
   ./configs/WMs/WMs.nix
   
   ./configs/users/vulkce.nix
   
   ./configs/packages/packages.nix
   ./configs/system/system.nix
   ./configs/exclude/exclude.nix
 ];

} 
