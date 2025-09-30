{
    description = "MEOW!";
    inputs = {

        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
        # disko.inputs.nixpkgs.follows = "nixpkgs"; desligado por conta de dualboot

        zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs = inputs@{self, nixpkgs-stable, nixpkgs, zen-browser}: {
        nixosConfigurations.flake = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
           # disko.nixosModules.disko
           # {
           #   _module.args.disks = [ "/dev/xxx" ];
           # }
           # disko-config.nix
          ./hardware-configuration.nix
          ./configs/tools/tools.nix
          ./configs/tools/virtualbox.nix
          ./configs/DEs/DEs.nix
          ./configs/WMs/WMs.nix
          ./configs/users/users.nix
          ./configs/packages/packages.nix
          ./configs/system/system.nix
          ./configs/exclude/exclude.nix
      ];
    };
  };
}
