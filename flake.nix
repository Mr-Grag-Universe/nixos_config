{
	description = "My system configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
		
		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		stylix = {
			url = "github:danth/stylix/release-24.11";
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
                neovim-config, nil, nixvim, ... }@inputs: let
		system = "x86_64-linux";
		homeStateVersion = "24.11";
		user = "stepan";
		hosts = [
			{ hostname = "nixos"; stateVersion = "24.11"; }
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
			extraSpecialArgs = { inherit inputs homeStateVersion user; inherit nixvim; };
			modules = [ 
				./home-manager/home.nix 
                nixvim.homeManagerModules.nixvim
			];
		};
	};
}
