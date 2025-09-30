{ config, lib, inputs, pkgs, ... }: {  
  
  # habilita zram
  zramSwap = {
    enable = true;
    memoryPercent = 75;
    algorithm = "lzo-rle"; # I love lzo-rle
    priority = 5; # preferencia pela zram
  };

  # swap normal
  swapDevices = [
    {
      device = "/dev/disk/by-uuid/d2b636cc-bf0e-4fb8-8448-ee032ebfdc8d"; # sempre usem UUIDs!!!
      priority = 0; # usa o swap quando a zram encher
    }
  ];


} 
