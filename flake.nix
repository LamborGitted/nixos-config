{

  description = "Lantxx Nixos Configura , lambor.lambda@gmail.com";

  inputs = {
    #nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    #home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = {self , nixpkgs ,home-manager , hyprland , ...}@inputs:
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; 

      modules = [
        ./configuration.nix 
        home-manager.nixosModules.home-manager
      ];

      specialArgs = {
        username = "lambor";
        userEmail = "lambor.lambda@gmail.com";
        inherit self;
      };
    };
  };

}