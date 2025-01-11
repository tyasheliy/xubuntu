{ 
	config, 
	userConfig,
	pkgs,
	inputs, 
	system, 
	... 
}: 
let
	# neovim = (inputs.neovim-flake.packages.${system}.default);

	importEntries = builtins.readDir ./home;
	importDirs = builtins.attrNames importEntries;
	importPaths = builtins.map (dir: ./home + "/${dir}") importDirs;
in {
  home.username = userConfig.username;
  home.homeDirectory = userConfig.homeDir;

  imports = importPaths;

  home.stateVersion = userConfig.stateVersion; 
  nixGL.packages = inputs.nixgl.packages;

  home.packages = (with pkgs; [
      htop
      (nerdfonts.override { fonts = ["JetBrainsMono"]; })
      # neovim
	  go
	  firefox
	  lazydocker
	  lazygit
  ]);

  targets.genericLinux.enable = true; # non-nixos support.

  xsession.enable = true;

  # place phpstorm flake and build it in /home/tyasheliy/phpstorm-flake.
  xdg = {
	  desktopEntries = {
		phpstorm = {
			name = "Phpstorm";
			genericName = "IDE";
			exec = "${userConfig.homeDir}/phpstorm-flake/result/bin/phpstorm";
			terminal = false;
		};
	  };
  };

  services.sxhkd = {
	enable = true;
	keybindings = {
		"alt + @space" = "rofi -show drun";
		"alt + Return" = "alacritty";
		"ctrl + alt + Return" = "firefox --browser";
		"alt + q" = "bspc node --kill";
		"alt + shift + {q,r}" = "bspc {quit,wm -r}";
		"alt + Escape" = "pkill -USR1 -x sxhkd";
		"alt + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
		"alt + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
		"XF86AudioRaiseVolume" = "pactl set-sink-volume 0 +5%";
		"XF86AudioLowerVolume" = "pactl set-sink-volume 0 -5%";
		"XF86AudioMute" = "pactl set-sink-mute 0 toggle";
		"XF86AudioMicMute" = "amixer set Capture toggle";
	};
  };

  programs.rofi = {
		enable = true;
  };

  programs.gpg.enable = true;
  services.gpg-agent = {
	enable = true;
	enableSshSupport = true;
	enableZshIntegration = true;
	pinentryPackage = pkgs.pinentry-curses;
  };

  programs.password-store = {
	enable = true;
	package = pkgs.pass.withExtensions (exts:
		with exts; [
		pass-otp
	]);
	settings = {
		PASSWORD_STORE_DIR = "$HOME/.password-store";
	};
  };

  programs.git = {
	enable = true;
	userName = "tyasheliy";
	userEmail = "egorgerasimov@tuta.io";
	extraConfig = {
		push = {
			autoSetupRemote = true;
		};
		core = {
			fileMode = false;
		};
	};
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # oe
  #
  #  /etc/profiles/per-user/tyasheliy/etc/profile.d/hm-session-vars.sh
  #

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
