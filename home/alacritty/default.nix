{ pkgs, userConfig, ... }: {
	programs.alacritty = {
		enable = true;
		package = pkgs.emptyDirectory;
		settings = {
			env.term = "xterm-256color";
		};
	};

	home.activation.installAlacritty = userConfig.systemInstall "alacritty";
	home.activation.fixAlacrittyMissingLib = userConfig.systemInstall "libxkbcommon-x11-0";
}
