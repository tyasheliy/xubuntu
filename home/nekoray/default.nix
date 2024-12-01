let 
	cfgRoot = ".config/nekoray/config";
in {
	home.file = {
		"${cfgRoot}/routes_box/Default" = {
			source = ./routes_box.json;
		};

		"${cfgRoot}/groups/nekobox.json" = {
			source = ./nekobox.json;
		};
	};
}
