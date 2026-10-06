{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
  icu,
  libkrb5,
  openssl,
  zlib,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "jackify-engine";
  version = "0.5.10";

  src = fetchurl {
    url = "https://github.com/Omni-guides/dev-jackify-engine/releases/download/v${finalAttrs.version}/jackify-engine-${finalAttrs.version}-linux-x64.tar.gz";
    hash = "sha256-EEgKPUUvZhHSNiGaq0UOQ73NfqsvnFzelvtD5VzlYl0=";
  };

  unpackPhase = ''
    runHook preUnpack

    mkdir source
    tar -xzf $src -C source

    runHook postUnpack
  '';
  sourceRoot = "source";

  nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [
    stdenv.cc.cc.lib
    zlib
  ];

  appendRunpaths = map (p: "${lib.getLib p}/lib") [
    icu
    libkrb5
    openssl
    zlib
  ];

  dontConfigure = true;
  dontBuild = true;
  dontStrip = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/jackify-engine $out/bin
    cp -r . $out/lib/jackify-engine
    rm -r $out/lib/jackify-engine/Extractors/{mac,windows-x64}
    rm $out/lib/jackify-engine/libcoreclrtraceptprovider.so
    ln -s $out/lib/jackify-engine/jackify-engine $out/bin/jackify-engine

    runHook postInstall
  '';

  meta = {
    description = "Wabbajack CLI fork used by Jackify to install modlists";
    homepage = "https://github.com/Omni-guides/dev-jackify-engine";
    changelog = "https://github.com/Omni-guides/dev-jackify-engine/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.gpl3Only;
    sourceProvenance = with lib.sourceTypes; [
      binaryBytecode
      binaryNativeCode
    ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "jackify-engine";
  };
})
