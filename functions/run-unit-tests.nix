{ lib, ... }:

unitTests:
let
  name = unitTests.name;
  func = unitTests.function;
  tests = unitTests.tests;
  results = lib.attrValues (
    builtins.mapAttrs (
      input: expected:
      let
        output = func input;
      in
      {
        inherit
          input
          expected
          output
          ;
      }
    ) tests
  );
in
{
  inherit
    name
    func
    tests
    results
    ;
}
