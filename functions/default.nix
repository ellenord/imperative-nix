{
  lib,
  pkgs,
  execSh,
  ...
}:
let
  int = import ./functions/int { inherit lib; };
  bool = import ./functions/bool { inherit lib; };
in
with int // bool;
{
  isNullOrWhitespace = import ./functions/is-null-or-whitespace.nix {
    inherit lib pkgs execSh;
  };
  getRandomSalt = import ./functions/get-random-salt.nix {
    inherit lib parseHex;
  };
  getHashedPassword = import ./functions/get-hashed-password.nix {
    inherit pkgs execSh;
  };
  runUnitTests = import ./functions/run-unit-tests.nix {
    inherit lib;
  };
  trace = lib.debug.traceSeq;
  inherit
    isValidHex
    tryParseHex
    parseHex
    isValidBinary
    tryParseBinary
    parseBinary
    isValidDecimal
    tryParseDecimal
    parseDecimal
    isValidInt
    tryParseInt
    parseInt
    isValidBool
    tryParseBool
    parseBool
    ;
}
