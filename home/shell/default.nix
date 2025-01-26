{ userConfig, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "eastwood";
    };
    autosuggestion.enable = true;
  };

  home = {
  	shellAliases = 
    let
      scriptDir = "${userConfig.homeDir}/${userConfig.cfgDirName}/scripts";
    in {
      #vi = "nvim";
      docker = "sudo -E docker";
      lzd = "sudo $(which lazydocker)";
      hsw = "export NIXPKGS_ALLOW_UNFREE=1 && home-manager switch --flake ${userConfig.homeDir}/${userConfig.cfgDirName} --impure";
      rn = "(cd ${scriptDir} && bash $(ls ${scriptDir} | ${pkgs.fzf}/bin/fzf))";
  	};

  	sessionVariables = {
  	   EDITOR = "nvim";
  	};
  };
}
