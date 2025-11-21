{ config, lib, pkgs, ... }: {

  # montar meus hds automaticamente
  fileSystems."/home/vulkce/Documents/etc1" = {
    device = "/dev/disk/by-uuid/2896792c-503e-4e52-bbd6-05fc5ae67675";
    fsType = "btrfs";
    options = [ "users" "exec" "nofail" ];
 };

   fileSystems."/home/vulkce/Documents/HD1" = {
    device = "/dev/disk/by-uuid/2a01b06c-f29d-4375-9c18-f5d3733df8e7";
    fsType = "btrfs";
    options = [ "users" "exec" "nofail" ];
 };





}
