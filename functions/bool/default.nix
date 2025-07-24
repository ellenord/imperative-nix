{
  lib,
  ...
}:
rec {
  isValidBool = import ./is-valid-bool.nix {
    inherit lib;
  };
  tryParseBool = import ./try-parse-bool.nix {
    inherit lib;
  };
  parseBool = import ./parse-bool.nix {
    inherit tryParseBool;
  };
}
