{ pkgs, userConfig, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    withNodeJs = true;
    withPython3 = true;
    extraPackages = with pkgs; [ fzf cargo xclip gomodifytags impl ];
  };

  home.activation.makeNeovimLink = userConfig.rnScript "make_neovim_link.sh";
}
