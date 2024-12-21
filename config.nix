{
	system = "x86_64-linux";

	username = "tyasheliy";
	homeDir = "/home/tyasheliy";
	cfgDirName = "os"; # name of the repo dir.

	stateVersion = "24.11";

	# this is used in bspwm dual monitor setup.
	# run 'xrandr -q' to get names of display ports.
	monitors = { 		
		# name of built-in display port.
		builtIn = "eDP-1"; 			

		# name of external display port.
		external = "HDMI-2"; 			
	};
}
