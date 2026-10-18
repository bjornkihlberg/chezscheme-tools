{ stdenv
, chez
, makeWrapper
}:

stdenv.mkDerivation {
  pname = "chezscheme-tools";
  version = "0.1.0";
  src = ./.;

  nativeBuildInputs = [ makeWrapper ];

  propagatedBuildInputs = [ chez ];

  installPhase = ''
    mkdir -p $out/share/chezcheme-tools
    mkdir -p $out/bin

    cp -r *.ss $out/share/chezcheme-tools/

    makeWrapper ${chez}/bin/scheme $out/bin/chez-pkg \
      --add-flags "--script $out/share/chezcheme-tools/chez-pkg.ss"
  '';
}
