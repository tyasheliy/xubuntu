{ userConfig, ... }: 
let
	external = userConfig.monitors.external;
	builtIn = userConfig.monitors.builtIn;
in {
	xsession.windowManager = {
		bspwm = {
			enable = true;
			extraConfigEarly = ''
			if xrandr -q | grep "${external} connected"; then
				xrandr --output ${builtIn} --off
			fi
			bspc monitor -d 1 2 3 4 5 6 7 8 9
			'';
			settings = {
				border_width = 2;
			};
		};
	};
}
