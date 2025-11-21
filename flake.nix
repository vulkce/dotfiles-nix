{
    description = "MEOW!";
    inputs = {

        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest"; # flatpak declarativo
        impermanence.url = "github:nix-community/impermanence"; # impermanence
        home-manager.url = "github:nix-community/home-manager"; # home-manager
        home-manager.inputs.nixpkgs.follows = "nixpkgs"; # segue o nixpkgs

#         disko.inputs.nixpkgs.follows = "nixpkgs";

#        zen-browser = {
#        url = "github:0xc000022070/zen-browser-flake";
#        inputs.nixpkgs.follows = "nixpkgs";
#        };

    };

    outputs = inputs@{self, nix-flatpak, nixpkgs-stable, nixpkgs, impermanence, home-manager}: {
        nixosConfigurations.flake = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./imports.nix

          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager {

          # Configurações do Home Manager por usuário
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.vulkce = import ./home-manager/home.nix;

        }
      ];
    };
  };
}
