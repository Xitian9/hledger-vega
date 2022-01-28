{ pkgs ? import <nixpkgs> { }, reportdir ? ".", argsdir ? reportdir, outdir ? reportdir }:

pkgs.callPackage ./release.nix { inherit reportdir argsdir outdir; }
