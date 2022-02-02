{ pkgs ? import <nixpkgs> { }, chartsdir ? ".", datasetsdir ? chartsdir }:

pkgs.callPackage ./release.nix { inherit chartsdir datasetsdir; }
