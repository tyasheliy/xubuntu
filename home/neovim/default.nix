{ pkgs, ... }: {
  programs.neovim = {
  	enable = true;
	  viAlias = true;
    withNodeJs = true;
    withPython3 = true;
    extraPackages = with pkgs; [
      fzf
      cargo
    ];
  };

  home.file.".config/nvim".source = ./nvim;
}
