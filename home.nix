{ 
	config, 
	userConfig,
	pkgs,
	inputs, 
	system, 
	... 
}: 
let
	importEntries = builtins.readDir ./home;
	importDirs = builtins.attrNames importEntries;
	importPaths = builtins.map (dir: ./home + "/${dir}") importDirs;
in {
	imports = importPaths;

	home = {
		username = userConfig.username;
		homeDirectory = userConfig.homeDir;
		stateVersion = userConfig.stateVersion; 
		packages = with pkgs; [
			htop
			(nerdfonts.override { fonts = ["JetBrainsMono"]; })
			lazydocker
			lazygit
			fzf
		];

		activation = {
			installSnaps = userConfig.rnScript "install_snaps.sh";
		};
	};

	targets.genericLinux.enable = true; # non-nixos support.

	xsession.enable = true;

	programs.home-manager.enable = true;
}
