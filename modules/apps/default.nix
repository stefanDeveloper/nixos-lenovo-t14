{ pkgs, config, lib, ... }: {
  #options.defaultApps = lib.mkOption {
  #  type = lib.types.attrs;
  #  description = "Preferred applications";
  #};

  config = rec {
    #defaultApps = {
      #browser = {
      #  cmd = "${pkgs.firefox}/bin/firefox";
      #  desktop = "firefox";
      #};
      #fm = {
      #  cmd = "${pkgs.gnome3.nautilus}/bin/nautilus";
      #  desktop = "org.gnome.Nautilus";
      #};
      #monitor = {
      #  cmd = "${pkgs.gnome3.gnome-system-monitor}/bin/gnome-system-monitor";
      #  desktop = "gnome-system-monitor";
      #};
      #archive = {
      #  cmd = "${pkgs.gnome3.file-roller}/bin/file-roller";
      #  desktop = "org.gnome.FileRoller";
      #};
    #};

    #environment.sessionVariables = {
    #  EDITOR = config.defaultApps.editor.cmd;
    #  VISUAL = config.defaultApps.editor.cmd;
    #};

    #home-manager.users.stefan.xdg.mimeApps = {
    #  enable = true;
    #  defaultApplications = with config.defaultApps;
    #    builtins.mapAttrs (name: value:
    #      if value ? desktop then [ "${value.desktop}.desktop" ] else value) {
    #        "text/html" = browser;
    #        "image/*" = { desktop = "org.gnome.eog"; };
    #        "application/zip" = archive;
    #        "application/rar" = archive;
    #        "application/7z" = archive;
    #        "application/*tar" = archive;

            # "application/pdf" = reader;

    #        "x-scheme-handler/http" = browser;
    #        "x-scheme-handler/https" = browser;
    #        "x-scheme-handler/about" = browser;
    #        "x-scheme-handler/unknown" = browser;

            # This actually makes Emacs an editor for everything... XDG is wierd
            #"text/plain" = editor;
    #      };
    #};
  };
}