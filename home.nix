{ config, pkgs, ... }: {
	home = {
		username = "mooments1";
		homeDirectory = "/home/mooments1";
		stateVersion = "26.05";

	packages = [
      		pkgs.helium
		pkgs.prismlauncher
    	];
  };

gtk = {
  enable = true;

  theme = {
    name = "adw-gtk3-dark";
  };


  iconTheme = {
    name = "Papirus";
  };
};

home.pointerCursor = {
  gtk.enable = true;
  x11.enable = true;
  name = "Bibata-Modern-Classic";
  package = pkgs.bibata-cursors;
  size = 24;
};

home.sessionVariables = {
  XCURSOR_THEME = "Bibata-Modern-Classic";
  XCURSOR_SIZE = "24";
};


}
