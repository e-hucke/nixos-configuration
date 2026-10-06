{ lib, stdenv, kernel, kernelModuleMakeFlags }:

stdenv.mkDerivation
{
  pname = "rtw89-debugfs-modules";
  inherit (kernel) src version patches;

  postPatch =
  ''
    substituteInPlace drivers/net/wireless/realtek/rtw89/debug.c \
      --replace-warn '.write_reg = rtw89_debug_priv_set(write_reg),' '.write_reg = rtw89_debug_priv_set(write_reg, WLOCK),'
  '';

  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = kernelModuleMakeFlags ++
  [
    "-C" "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "M=$(PWD)/drivers/net/wireless/realtek/rtw89"
    "CONFIG_RTW89_DEBUG=y"
    "CONFIG_RTW89_DEBUGFS=y"
    "KCFLAGS=-DCONFIG_RTW89_DEBUGFS=1"
    "INSTALL_MOD_PATH=$(out)"
    "INSTALL_MOD_DIR=updates"
    "INSTALL_MOD_STRIP=1"
  ];

  buildFlags = [ "modules" ];
  installTargets = [ "modules_install" ];
  enableParallelBuilding = true;

  meta =
  {
    description = "In-tree rtw89 modules rebuilt with debugfs support";
    license = lib.licenses.gpl2Only;
    platforms = lib.platforms.linux;
  };
}
