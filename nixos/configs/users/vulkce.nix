{ config, lib, pkgs, ... }: {

   users.users.vulkce = {
     isNormalUser = true;
     extraGroups = [ "wheel" "vboxusers" "docker" ];
     # pacotes do usuário
     packages = with pkgs; [
       tree
       vscodium
       prismlauncher
       vesktop
       gnome-secrets
       mission-center
     ];
   };

}
