{
  lib,
  fetchFromGitHub,
  python3Packages,
  qt6,
  copyDesktopItems,
  makeDesktopItem,
  jackify-engine,
  steam-run,
  protontricks,
  winetricks,
  cabextract,
  p7zip,
  unzip,
  xz,
  wget,
  curl,
  aria2,
  xdg-utils,
  desktop-file-utils,
}:

let
  vdf = python3Packages.vdf.overridePythonAttrs (old: {
    version = "4.0";
    src = fetchFromGitHub {
      owner = "solsticegamestudios";
      repo = "vdf";
      tag = "v4.0";
      hash = "sha256-MGhzIAy5uLulb57oz6OZ7pHFweHIDxi0WyjnPfGsA/k=";
    };
    patches = [ ];
  });
in
python3Packages.buildPythonApplication (finalAttrs: {
  pname = "jackify";
  version = "0.8.1.2";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "Omni-guides";
    repo = "Jackify";
    tag = "v${finalAttrs.version}";
    hash = "sha256-+t8nPOOCOL7mZYvg29YF6PatVa0QwHns99jk2qijvuE=";
  };

  patches = [
    ./exec-path.patch
  ];

  postPatch = ''
    rm jackify/tools/cabextract
    install -Dm644 assets/JackifyLogo_256.png jackify/assets/JackifyLogo_256.png

    substituteInPlace requirements.txt \
      --replace-fail "vdf @ git+https://github.com/solsticegamestudios/vdf.git" "vdf>=4.0"

    echo "recursive-include jackify *" > MANIFEST.in
  '';

  nativeBuildInputs = [
    qt6.wrapQtAppsHook
    copyDesktopItems
  ];

  buildInputs = [
    qt6.qtbase
    qt6.qtwayland
  ];

  build-system = with python3Packages; [ setuptools ];

  dependencies = with python3Packages; [
    packaging
    psutil
    pycryptodomex
    pyside6
    pyyaml
    requests
    tqdm
    vdf
    watchdog
    xxhash
  ];

  postInstall = ''
    rm $out/bin/jackify $out/bin/jackify-gui
    install -Dm755 ${./launcher.py} $out/bin/jackify
    substituteInPlace $out/bin/jackify \
      --replace-fail "@steamRun@" "${lib.getExe steam-run}"

    install -Dm644 assets/JackifyLogo_256.png \
      $out/share/icons/hicolor/256x256/apps/com.jackify.app.png
  '';

  desktopItems = [
    (makeDesktopItem {
      name = "com.jackify.app";
      desktopName = "Jackify";
      comment = "Wabbajack modlist manager for Linux";
      exec = "jackify %u";
      icon = "com.jackify.app";
      categories = [
        "Game"
        "Utility"
      ];
      mimeTypes = [
        "x-scheme-handler/jackify"
        "x-scheme-handler/nxm"
      ];
    })
  ];

  dontWrapQtApps = true;
  makeWrapperArgs = [
    "--prefix"
    "PATH"
    ":"
    (lib.makeBinPath [
      protontricks
      winetricks
      cabextract
      p7zip
      unzip
      xz
      wget
      curl
      aria2
      xdg-utils
      desktop-file-utils
    ])
    "--set"
    "JACKIFY_ENGINE_PATH"
    "${jackify-engine}/lib/jackify-engine/jackify-engine"
    "--set"
    "JACKIFY_EXEC_PATH"
    "${placeholder "out"}/bin/jackify"
  ];

  preFixup = ''
    makeWrapperArgs+=("''${qtWrapperArgs[@]}")
  '';

  pythonImportsCheck = [ "jackify" ];

  passthru.engine = jackify-engine;

  meta = {
    description = "Installer and configurator for Wabbajack modlists on Linux";
    homepage = "https://github.com/Omni-guides/Jackify";
    changelog = "https://github.com/Omni-guides/Jackify/blob/v${finalAttrs.version}/CHANGELOG.md";
    license = lib.licenses.gpl3Plus;
    platforms = [ "x86_64-linux" ];
    mainProgram = "jackify";
  };
})
