{
  lib,
  ...
}:
let
  hexInt = import ./hex-int { inherit lib; };
  binaryInt = import ./binary-int { inherit lib; };
  decimalInt = import ./decimal-int { inherit lib; };
in
with hexInt // binaryInt // decimalInt;
{
  isValidInt = import ./is-valid-int.nix {
    inherit
      lib
      isValidHex
      isValidBinary
      isValidDecimal
      ;
  };
  tryParseInt = import ./try-parse-int.nix {
    inherit
      lib
      isValidHex
      isValidBinary
      isValidDecimal
      tryParseHex
      tryParseBinary
      tryParseDecimal
      ;
  };
  parseInt = import ./parse-int.nix {
    inherit tryParseInt;
  };
  inherit
    isValidHex
    isValidBinary
    isValidDecimal
    tryParseHex
    tryParseBinary
    tryParseDecimal
    parseHex
    parseBinary
    parseDecimal
    ;
}
