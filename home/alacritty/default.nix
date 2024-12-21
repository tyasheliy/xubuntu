{ pkgs, config, ... }: {
	programs.alacritty = {
		enable = true;
		package = config.lib.nixGL.wrap pkgs.alacritty;
	};
}
