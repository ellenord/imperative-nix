{
  lib,
  ...
}:
rec {
  isValidDecimal = import ./is-valid-decimal.nix {
    inherit lib;
  };
  tryParseDecimal = import ./try-parse-decimal.nix {
    inherit lib isValidDecimal;
  };
  parseDecimal = import ./parse-decimal.nix {
    inherit tryParseDecimal;
  };
}
