{
  lib,
  ...
}:
rec {
  hexInt = import ./hex-int { inherit lib; };
  binaryInt = import ./binary-int { inherit lib; };
  decimalInt = import ./decimal-int { inherit lib; };
  int = with hexInt // binaryInt // decimalInt; rec {
    isValidInt = import ./is-valid-int.nix {
      inherit
        lib
        isValidHex
        isValidBinary
        isValidDecimal
        ;
    };
    tryParseInt = import ./try-parse-int.nix ({
      inherit
        lib
        isValidHex
        isValidBinary
        isValidDecimal
        tryParseHex
        tryParseBinary
        tryParseDecimal
        ;
    });
    parseInt = import ./parse-int.nix {
      inherit tryParseInt;
    };
  };
}
