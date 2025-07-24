{
  lib,
  ...
}:
rec {
  isValidBinary = import ./is-valid-binary.nix {
    inherit lib;
  };
  tryParseBinary = import ./try-parse-binary.nix {
    inherit lib isValidBinary;
  };
  parseBinary = import ./parse-binary.nix {
    inherit tryParseBinary;
  };
}
