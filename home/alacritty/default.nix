{ pkgs, ... }: {
	programs.alacritty = {
		enable = true;
    package = pkgs.emptyDirectory;
	};
}
