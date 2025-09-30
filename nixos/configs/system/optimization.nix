{ config, lib, inputs, pkgs, ... }: {

  # otimiza o /nix/store trocando arquivos duplicados por hardlinks
  nix.optimise = {
    automatic = true;
    dates = [ "daily" ]; # otimiza diariamente
  };

  # chama o caminhão de lixo pro nix
  nix.gc = {
    automatic = false; # nh já faz o trabalho
    dates = [ "weekly" ]; # chama semanalmente
   # options = "--delete-older-than 30d"; # deleta todas a generations
  };

} 
