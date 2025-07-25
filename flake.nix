{
  description = "imperative-nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" ] (
      with self.inputs;
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        lib = pkgs.lib;
        functions = import ./functions { inherit lib pkgs; };
      in
      with functions;
      {
        lib = {
          trace = lib.debug.traceSeq;
          inherit
            isNullOrWhitespace
            getRandomSalt
            getHashedPassword
            runUnitTests
            getRandomInt
            execSh
            breakpoint
            readline
            ;
          inherit (bool) isValidBool tryParseBool parseBool;
          inherit (int) isValidInt tryParseInt parseInt;
          inherit (hexInt) isValidHex tryParseHex parseHex;
          inherit (binaryInt) isValidBinary tryParseBinary parseBinary;
          inherit (decimalInt) isValidDecimal tryParseDecimal parseDecimal;
        };
      }
    );
}
