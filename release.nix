{ stdenv, lib, makeWrapper, gnused, hledger, chartsdir ? ".", datasetsdir ? chartsdir }:

stdenv.mkDerivation rec {
  pname = "hledger-vega";
  version = "0.0.2";
  src = ./.;
  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [ gnused hledger ];
  installPhase = ''
    mkdir -p $out/bin
    cp src/hledger-vega $out/bin
    sed -i -e "s|^datasetsdir=\.|datasetsdir=${datasetsdir}|" \
           -e "s|^chartsdir=\.|chartsdir=${chartsdir}|" $out/bin/hledger-vega
    wrapProgram $out/bin/hledger-vega \
      --prefix PATH : ${lib.makeBinPath [ hledger gnused ]}
  '';
  meta = {
    homepage = https://github.com/Xitian9/hledger-vega;
    description = "Create charts from your hledger journals";
    license = lib.licenses.mit;
  };
}
