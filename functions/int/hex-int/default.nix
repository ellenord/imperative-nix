{
  lib,
  ...
}:
rec {
  isValidHex = import ./is-valid-hex.nix {
    inherit lib;
  };
  tryParseHex = import ./try-parse-hex.nix {
    inherit lib isValidHex;
  };
  parseHex = import ./parse-hex.nix {
    inherit tryParseHex;
  };
}
