with import <nixpkgs> {};

let mcc-env = (callPackage mini_compile_commands/default.nix {}).wrap pkgs.llvmPackages_18.libcxxStdenv;

in (mkShell.override {stdenv = mcc-env;}) {
  buildInputs = [  ];
  nativeBuildInputs = [ ];

  shellHook = ''
      export libc_includes="${lib.getDev stdenv.cc.libc}/include"
      export libcpp_includes="${llvmPackages_18.libcxx}/include/c++/v1"
  '';
}
