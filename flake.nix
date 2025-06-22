{
	description = "My system configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
		
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		stylix = {
			url = "github:danth/stylix/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hyprland = {
			url = "github:hyprwm/Hyprland";
			# inputs.nixpkgs.follows = "nixpkgs";
		};
		neovim-config = {
			url = "github:Gako358/neovim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
        nil = {
            url = "github:oxalica/nil";
        };
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };
	};

	outputs = { self, nixpkgs, home-manager, 
                nil, nixvim, ... }@inputs: let
		system = "x86_64-linux";
		homeStateVersion = "25.05";
		user = "stepan";
		hosts = [
			{ hostname = "nixos"; stateVersion = "25.05"; }
		];

		makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
			system = system;
			specialArgs = {
				inherit inputs stateVersion hostname user;
			};

			modules = [
				./hosts/${hostname}/configuration.nix
                home-manager.nixosModules.home-manager
                # {
                #     home-manager.useGlobalPkgs = true;
                #     home-manager.useUserPackages = true
                #     home-manager.sharedModules = [
                #         nixvim.homeManagerModules.nixvim
                #     ];
                #     home-manager.users.user = ./user.nix;
                # }
            ];
		};

	in {
		nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
			configs // {
				"${host.hostname}" = makeSystem { inherit (host) hostname stateVersion; };
			}) {} hosts;

		homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			extraSpecialArgs = { inherit inputs homeStateVersion user nixvim; };
			modules = [ 
				./home-manager/home.nix 
			];
		};
	};
}
