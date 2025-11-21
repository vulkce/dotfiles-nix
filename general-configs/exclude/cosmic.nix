{ config, lib, pkgs, ... }: {

 # remover o bloatware do cosmic
 environment.cosmic.excludePackages = (with pkgs; [
    celluloid
    cosmic-player
 ]);

}
