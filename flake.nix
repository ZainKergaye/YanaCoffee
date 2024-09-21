{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let 
	pkgs = nixpkgs.legacyPackages."x86_64-linux";

  in {
    devShells."x86_64-linux".default = pkgs.mkShell {
      packages = with pkgs; [
		nodejs_22 # Don't use this, use it the nix way 
		nodePackages_latest.live-server
		nodePackages_latest.sass
		gimp
	  ];

	  shellHook = ''
		  #live-server &

		  #sass --watch ./scss/custom.scss ./css/custom.css -q &

		  echo "Welcome to the shell"
	  '';
	};
  };
}
