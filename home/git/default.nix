{
  programs.git = {
    enable = true;
    userName = "tyasheliy";
    userEmail = "egorgerasimov@tuta.io";
    extraConfig = {
      push = {
        autoSetupRemote = true;
      };
    };
  };
}
