{
  description = "Reusable integer parsing and validation functions (hex, binary, decimal)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      lib = nixpkgs.lib;

      hexInt = import ./functions/int/hex-int { inherit lib; };
      binaryInt = import ./functions/int/binary-int { inherit lib; };
      decimalInt = import ./functions/int/decimal-int { inherit lib; };

      isValidInt = import ./functions/int/is-valid-int.nix {
        inherit lib;
        inherit (hexInt) isValidHex;
        inherit (binaryInt) isValidBinary;
        inherit (decimalInt) isValidDecimal;
      };

      tryParseInt = import ./functions/int/try-parse-int.nix {
        inherit lib;
        inherit (hexInt) isValidHex tryParseHex;
        inherit (binaryInt) isValidBinary tryParseBinary;
        inherit (decimalInt) isValidDecimal tryParseDecimal;
      };

      parseInt = import ./functions/int/parse-int.nix {
        inherit tryParseInt;
      };
    in
    {
      inherit
        isValidInt
        tryParseInt
        parseInt
        ;
      inherit (hexInt) isValidHex tryParseHex parseHex;
      inherit (binaryInt) isValidBinary tryParseBinary parseBinary;
      inherit (decimalInt) isValidDecimal tryParseDecimal parseDecimal;
    };
}
