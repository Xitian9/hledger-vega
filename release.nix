{ stdenv, lib, makeWrapper, gnused, hledger, reportdir ? ".", argsdir ? reportdir, outdir ? reportdir }:

stdenv.mkDerivation rec {
  pname = "hledger-vega";
  version = "0.0.1";
  src = ./.;
  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [ gnused hledger ];
  installPhase = ''
    mkdir -p $out/bin
    cp src/hledger-vega $out/bin
    sed -i -e "s|^argsdir=\.|argsdir=${argsdir}|" \
           -e "s|^reportdir=\.|reportdir=${reportdir}|" \
           -e "s|^outdir=\.|outdir=${outdir}|" $out/bin/hledger-vega
    wrapProgram $out/bin/hledger-vega \
      --prefix PATH : ${lib.makeBinPath [ hledger gnused ]}
  '';
  meta = {
    homepage = https://github.com/Xitian9/hledger-vega;
    description = "Create charts from your hledger journals";
    license = lib.licenses.mit;
  };
}
