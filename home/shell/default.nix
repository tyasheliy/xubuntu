{ userConfig, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    package = pkgs.emptyDirectory;
    oh-my-zsh = {
      enable = true;
      theme = "eastwood";
    };
    autosuggestion.enable = true;
    initExtra = ''export PATH="$PATH:${userConfig.homeDir}/.config/composer/vendor/bin"'';
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
      dsr1 = "ollama run deepseek-r1:8b";
	  ds = "ollama run deepseek-coder-v2:16b";
  	};

  	sessionVariables = {
  	   EDITOR = "nvim";
  	};
  };
}
