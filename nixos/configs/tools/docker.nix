{ config, lib, inputs, pkgs, ... }:
# irei adicionar mais coisas em breve :) 

  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      experimental = true;
      default-address-pools = [
        {
          base = "172.30.0.0/16";
          size = 24;
        }
      ];
    };
  };

} 
