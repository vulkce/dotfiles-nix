{ config, lib, pkgs, ... }: {

   users.users.vulkce = {
     isNormalUser = true;
     extraGroups = [ "wheel" "vboxusers" ];
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
