{
    description = "MEOW!";
    inputs = {

        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
        # disko.inputs.nixpkgs.follows = "nixpkgs";

#        zen-browser = {
#        url = "github:0xc000022070/zen-browser-flake";
#        inputs.nixpkgs.follows = "nixpkgs";
#        };

    };

    outputs = inputs@{self, nix-flatpak, nixpkgs-stable, nixpkgs}: {
        nixosConfigurations.flake = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
           nix-flatpak.nixosModules.nix-flatpak
           
           # disko.nixosModules.disko
           # {
           #   _module.args.disks = [ "/dev/xxx" ];
           # }
           # disko-config.nix
          ./imports.nix
      ];
    };
  };
}
