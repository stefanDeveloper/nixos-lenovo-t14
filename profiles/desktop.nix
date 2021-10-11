{ inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    ./base.nix

    workspace

    virtualisation

    apps
    messaging
    web
    media
    dev
    office
    zsh
  ];
}
