## @file
#   Intel(r) UEFI Application Development Kit for EDK II.
#   This package contains applications which depend upon Standard Libraries
#   from the StdLib package.
#
#   See the comments in the [LibraryClasses.IA32] and [BuildOptions] sections
#   for important information about configuring this package for your
#   environment.
#
#   Copyright (c) 2010 - 2021, Intel Corporation. All rights reserved.<BR>
#   SPDX-License-Identifier: BSD-2-Clause-Patent
##

[Defines]
  PLATFORM_NAME                  = HcjPkg
  PLATFORM_GUID                  = e66a3197-e455-4d79-9122-92ba690aa64f
  PLATFORM_VERSION               = 0.01
  DSC_SPECIFICATION              = 0x00010006
  OUTPUT_DIRECTORY               = Build/HcjPkg
  SUPPORTED_ARCHITECTURES        = IA32|X64|ARM|AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE|NOOPT
  SKUID_IDENTIFIER               = DEFAULT

#

# [LibraryClasses]

#   BaseLib|MdePkg/Library/BaseLib/BaseLib.inf
#   BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
#   UefiLib|MdePkg/Library/UefiLib/UefiLib.inf
#   LibC|StdLib/LibC/LibC.inf
#   LibStdio|StdLib/LibC/Stdio/Stdio.inf


# [Components]
#   HcjPkg/Applications/Stdlib_Main/Stdlib_Main.inf


# ##############################################################################
# !include StdLib/StdLib.inc
# !include AppPkg/Applications/Sockets/Sockets.inc

#
#  Debug output control
#
  DEFINE DEBUG_ENABLE_OUTPUT      = FALSE       # Set to TRUE to enable debug output
  DEFINE DEBUG_PRINT_ERROR_LEVEL  = 0x80000040  # Flags to control amount of debug output
  DEFINE DEBUG_PROPERTY_MASK      = 0

!include MdePkg/MdeLibs.dsc.inc

[PcdsFeatureFlag]

[PcdsFixedAtBuild]
  gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|$(DEBUG_PROPERTY_MASK)
  gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|$(DEBUG_PRINT_ERROR_LEVEL)

[LibraryClasses]
  #
  # Entry Point Libraries
  #
  UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/UefiApplicationEntryPoint.inf
  ShellCEntryLib|ShellPkg/Library/UefiShellCEntryLib/UefiShellCEntryLib.inf
  UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntryPoint.inf
  #
  # Common Libraries
  #
  BaseLib|MdePkg/Library/BaseLib/BaseLib.inf
  BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
  UefiLib|MdePkg/Library/UefiLib/UefiLib.inf
  PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf
  PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
  MemoryAllocationLib|MdePkg/Library/UefiMemoryAllocationLib/UefiMemoryAllocationLib.inf
  UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  UefiRuntimeServicesTableLib|MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf
  !if $(DEBUG_ENABLE_OUTPUT)
    DebugLib|MdePkg/Library/UefiDebugLibConOut/UefiDebugLibConOut.inf
    DebugPrintErrorLevelLib|MdePkg/Library/BaseDebugPrintErrorLevelLib/BaseDebugPrintErrorLevelLib.inf
  !else   ## DEBUG_ENABLE_OUTPUT
    DebugLib|MdePkg/Library/BaseDebugLibNull/BaseDebugLibNull.inf
  !endif  ## DEBUG_ENABLE_OUTPUT
  ReportStatusCodeLib|MdePkg/Library/BaseReportStatusCodeLibNull/BaseReportStatusCodeLibNull.inf  
  UefiUsbLib|MdePkg/Library/UefiUsbLib/UefiUsbLib.inf
  TimerLib|MdePkg/Library/BaseTimerLibNullTemplate/BaseTimerLibNullTemplate.inf
  DevicePathLib|MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  PeCoffGetEntryPointLib|MdePkg/Library/BasePeCoffGetEntryPointLib/BasePeCoffGetEntryPointLib.inf
  IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf
  PciLib|MdePkg/Library/BasePciLibCf8/BasePciLibCf8.inf
  PciCf8Lib|MdePkg/Library/BasePciCf8Lib/BasePciCf8Lib.inf
  SynchronizationLib|MdePkg/Library/BaseSynchronizationLib/BaseSynchronizationLib.inf
  UefiRuntimeLib|MdePkg/Library/UefiRuntimeLib/UefiRuntimeLib.inf
  HiiLib|MdeModulePkg/Library/UefiHiiLib/UefiHiiLib.inf
  UefiHiiServicesLib|MdeModulePkg/Library/UefiHiiServicesLib/UefiHiiServicesLib.inf
  PerformanceLib|MdeModulePkg/Library/DxePerformanceLib/DxePerformanceLib.inf
  HobLib|MdePkg/Library/DxeHobLib/DxeHobLib.inf
  FileHandleLib|MdePkg/Library/UefiFileHandleLib/UefiFileHandleLib.inf
  SortLib|MdeModulePkg/Library/UefiSortLib/UefiSortLib.inf

  ShellLib|ShellPkg/Library/UefiShellLib/UefiShellLib.inf

  CacheMaintenanceLib|MdePkg/Library/BaseCacheMaintenanceLib/BaseCacheMaintenanceLib.inf

  #hb项目部分
  UefiShellDebug1CommandsLib|ShellPkg/Library/UefiShellDebug1CommandsLib/UefiShellDebug1CommandsLib.inf
  ShellCommandLib|ShellPkg/Library/UefiShellCommandLib/UefiShellCommandLib.inf
  BcfgCommandLib|ShellPkg/Library/UefiShellBcfgCommandLib/UefiShellBcfgCommandLib.inf
  UefiBootManagerLib|MdeModulePkg/Library/UefiBootManagerLib/UefiBootManagerLib.inf
  DxeServicesTableLib|MdePkg/Library/DxeServicesTableLib/DxeServicesTableLib.inf
  HandleParsingLib|ShellPkg/Library/UefiHandleParsingLib/UefiHandleParsingLib.inf
  OrderedCollectionLib|MdePkg/Library/BaseOrderedCollectionRedBlackTreeLib/BaseOrderedCollectionRedBlackTreeLib.inf



  #lbdebug
	DxeServicesLib|MdePkg/Library/DxeServicesLib/DxeServicesLib.inf


  #加密部分
  BaseCryptLib|CryptoPkg/Library/BaseCryptLib/BaseCryptLib.inf
  OpensslLib|CryptoPkg/Library/OpensslLib/OpensslLibCrypto.inf
  IntrinsicLib|CryptoPkg/Library/IntrinsicLib/IntrinsicLib.inf
  RngLib|MdePkg/Library/BaseRngLibTimerLib/BaseRngLibTimerLib.inf

  #C部分
  LibC|StdLib/LibC/LibC.inf
  LibStdio|StdLib/LibC/Stdio/Stdio.inf
  LibCType|StdLib/LibC/Ctype/Ctype.inf
  LibGdtoa|StdLib/LibC/gdtoa/gdtoa.inf
  LibLocale|StdLib/LibC/Locale/Locale.inf
  LibStdLib|StdLib/LibC/StdLib/StdLib.inf
  LibString|StdLib/LibC/String/String.inf
  LibTime|StdLib/LibC/Time/Time.inf
  LibUefi|StdLib/LibC/Uefi/Uefi.inf
  LibWchar|StdLib/LibC/Wchar/Wchar.inf
  LibGen|StdLib/PosixLib/Gen/LibGen.inf
  DevUtility|StdLib/LibC/Uefi/Devices/daUtility.inf
  LibSignal|StdLib/LibC/Signal/Signal.inf
  DevConsole|StdLib/LibC/Uefi/Devices/daConsole.inf
  LibIIO|StdLib/LibC/Uefi/InteractiveIO/IIO.inf
  LibContainer|StdLib/LibC/Containers/ContainerLib.inf
  DevShell|StdLib/LibC/Uefi/Devices/daShell.inf   
  BsdSocketLib|StdLib/BsdSocketLib/BsdSocketLib.inf
  EfiSocketLib|StdLib/EfiSocketLib/EfiSocketLib.inf
  LibNetUtil|StdLib/LibC/NetUtil/NetUtil.inf

###################################################################################################
#
# Components Section - list of the modules and components that will be processed by compilation
#                      tools and the EDK II tools to generate PE32/PE32+/Coff image files.
#
# Note: The EDK II DSC file is not used to specify how compiled binary images get placed
#       into firmware volume images. This section is just a list of modules to compile from
#       source into UEFI-compliant binaries.
#       It is the FDF file that contains information on combining binary files into firmware
#       volume images, whose concept is beyond UEFI and is described in PI specification.
#       Binary modules do not need to be listed in this section, as they should be
#       specified in the FDF file. For example: Shell binary (Shell_Full.efi), FAT binary (Fat.efi),
#       Logo (Logo.bmp), and etc.
#       There may also be modules listed in this section that are not required in the FDF file,
#       When a module listed here is excluded from FDF file, then UEFI-compliant binary will be
#       generated for it, but the binary will not be put into any firmware volume.
#
###################################################################################################

[Components]
  HcjPkg/Applications/Stdlib_Main/Stdlib_Main.inf
  HcjPkg/Applications/TestProtocol/myTestProtocol.inf
  HcjPkg/Applications/HelloWorld/HelloWorld.inf
  HcjPkg/Applications/Exec/Exec.inf
  HcjPkg/Applications/Protocol/Protocol.inf
  HcjPkg/Applications/FilePath/FilePath.inf
  HcjPkg/Applications/DevicePath/DevicePath.inf
  HcjPkg/Applications/LoadImage/LoadImage.inf
  HcjPkg/Applications/Input/Input.inf
  HcjPkg/Applications/OSApp/OSApp.inf
  HcjPkg/Applications/Event/Event.inf
  HcjPkg/Applications/NetWork/NetWork.inf
  HcjPkg/Applications/SM3/SM3.inf
  HcjPkg/Applications/SM4/SM4.inf
  HcjPkg/Applications/Test/Test.inf
  HcjPkg/Applications/RSA/RSATest.inf
  HcjPkg/Applications/Gmssl/Gmssl.inf
  HcjPkg/Applications/Experiment_Test/Experiment_Test.inf
  HcjPkg/Applications/Security_lab/Security_lab.inf
  HcjPkg/Applications/stdEchoTcp4/stdEchoTcp4.inf
  HcjPkg/Applications/EchoTcp4/EchoTcp4.inf

  


##############################################################################
#
#  Include Boilerplate text required for building with the Standard Libraries.
#
##############################################################################
# !include StdLib/StdLib.inc
# !include AppPkg/Applications/Sockets/Sockets.inc
