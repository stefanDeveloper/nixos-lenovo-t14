{ pkgs, lib, config, inputs, ... }:

{
  # Whether core dumps should be processed by systemd-coredump.
  # If disabled, core dumps appear in the current directory of the crashing process
  systemd.coredump.enable = true;
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "lock" ''
      set -euo pipefail
      if [[ "$1" == this ]]
        then args="-s"
        else args="-san"
      fi
    '')
  ];

  environment.loginShellInit = lib.mkBefore ''
    [[ "$(tty)" == /dev/tty? ]] && sudo /run/current-system/sw/bin/lock this
  '';

  home-manager.users.stefan = {
    xdg = {
      enable = true;
      userDirs.enable = true;
      wlr.enable = true;
      # gtk portal needed to make gtk apps happy
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      gtkUsePortal = true;
    };

    # Use services.flameshot.enable = true instead
    # See: https://github.com/nix-community/home-manager/issues/2064
    home.packages = with pkgs; [ flameshot ];

    home.activation."mimeapps-remove" = {
      before = [ "linkGeneration" ];
      after = [ ];
      data = "rm -f /home/stefan/.config/mimeapps.list";
    };
  };
}
