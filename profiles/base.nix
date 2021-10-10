{ inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    inputs.home-manager.nixosModules.home-manager

    hardware
    boot
    system
    network
    nixpkgs
    services
    locale
    home
    users

    git
    zsh
  ];
}