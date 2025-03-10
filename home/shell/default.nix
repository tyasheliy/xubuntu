{ userConfig, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    package = pkgs.emptyDirectory;
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
      sail = "sudo ./vendor/bin/sail";
      lzd = "sudo $(which lazydocker)";
      hsw = "export NIXPKGS_ALLOW_UNFREE=1 && home-manager switch --flake ${userConfig.homeDir}/${userConfig.cfgDirName} --impure";
      rn = "(cd ${scriptDir} && bash $(ls ${scriptDir} | ${pkgs.fzf}/bin/fzf))";
      ds = "ollama run deepseek-r1:8b";
  	};

  	sessionVariables = {
  	   EDITOR = "nvim";
  	};
  };
}
