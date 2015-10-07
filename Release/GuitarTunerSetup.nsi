;Include Modern UI

  !include "MUI2.nsh"
  !include "FileAssociation.nsh"

Name "Guitar Tuner 1.01"
OutFile "GuitarTuner1.01Setup.exe"
InstallDir "$PROGRAMFILES\Zeta Centauri\Guitar Tuner"
InstallDirRegKey HKLM "Software\Guitar Tuner" "Install_Dir"
RequestExecutionLevel admin
!define MUI_ICON "Guitar32.ico"
!define MUI_UNICON "Guitar32.ico"

;Version Information

  VIProductVersion "1.0.1.0"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "Guitar Tuner"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "Zeta Centauri"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "Copyright 2007-2012 Zeta Centauri"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "Guitar Tuner Installer"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "1.0.1.0"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "1.0.1.0"

;Interface Settings

  !define MUI_ABORTWARNING

;Pages

  !insertmacro MUI_PAGE_LICENSE "License.txt"
;  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
      !define MUI_FINISHPAGE_NOAUTOCLOSE
      !define MUI_FINISHPAGE_RUN
      !define MUI_FINISHPAGE_RUN_CHECKED
      !define MUI_FINISHPAGE_RUN_TEXT "Launch Guitar Tuner"
      !define MUI_FINISHPAGE_RUN_FUNCTION "LaunchProgram"
      !define MUI_FINISHPAGE_SHOWREADME ""
      !define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
      !define MUI_FINISHPAGE_SHOWREADME_TEXT "Create Desktop Shortcut"
      !define MUI_FINISHPAGE_SHOWREADME_FUNCTION finishpageaction
  !insertmacro MUI_PAGE_FINISH
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

;Languages
 
  !insertmacro MUI_LANGUAGE "English"

; The stuff to install
Section "Guitar Tuner"

  SectionIn RO
  
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File "GuitarTuner.exe"
  File "License.txt"
  File "Guitar32.ico"

  ; Write the installation path into the registry
  WriteRegStr HKLM SOFTWARE\GuitarTuner "Install_Dir" "$INSTDIR"
  
  ; Write the uninstall keys for Windows
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\GuitarTuner" "DisplayName" "Guitar Tuner"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\GuitarTuner" "DisplayVersion" "1.01"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\GuitarTuner" "Publisher" "Zeta Centauri"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\GuitarTuner" "DisplayIcon" "$INSTDIR\Guitar32.ico"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\GuitarTuner" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\GuitarTuner" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\GuitarTuner" "NoRepair" 1
  WriteUninstaller "uninstall.exe"

SectionEnd

; Optional section (can be disabled by the user)
Section "Start Menu Shortcuts"

  CreateDirectory "$SMPROGRAMS\Zeta Centauri\Guitar Tuner"
  CreateShortCut "$SMPROGRAMS\Zeta Centauri\Guitar Tuner\Guitar Tuner.lnk" "$INSTDIR\GuitarTuner.exe" "" "" 0
  ;CreateShortCut "$SMPROGRAMS\Zeta Centauri\Guitar Tuner\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  WriteINIStr "$SMPROGRAMS\Zeta Centauri\Guitar Tuner\Guitar Tuner Website.url" "InternetShortcut" "URL" "http://zetacentauri.com/software_guitartuner.htm"
 
SectionEnd

; Uninstaller

Section "Uninstall"
  
  ; Remove registry keys
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\GuitarTuner"
  DeleteRegKey HKLM SOFTWARE\GuitarTuner

  ; Remove files and uninstaller
  Delete $INSTDIR\GuitarTuner.exe
  Delete $INSTDIR\License.txt
  Delete $INSTDIR\Guitar32.ico
  Delete $INSTDIR\uninstall.exe

  ; Remove shortcuts, if any
  Delete "$SMPROGRAMS\Zeta Centauri\Guitar Tuner\*.*"
  Delete "$DESKTOP\Guitar Tuner.lnk"
  Delete "$SMPROGRAMS\Zeta Centauri\Guitar Tuner\Guitar Tuner Website.url"
  ;DeleteINISec "$SMPROGRAMS\Zeta Centauri\Guitar Tuner\Guitar Tuner Website.url" "InternetShortcut"

  ; Remove directories used
  RMDir "$SMPROGRAMS\Zeta Centauri\Guitar Tuner"
  RMDir "$SMPROGRAMS\Zeta Centauri"
  RMDir "$INSTDIR"

SectionEnd

Function LaunchProgram
  ExecShell "" "$SMPROGRAMS\Zeta Centauri\Guitar Tuner\Guitar Tuner.lnk"
FunctionEnd

Function finishpageaction
  CreateShortcut "$DESKTOP\Guitar Tuner.lnk" "$INSTDIR\GuitarTuner.exe"
FunctionEnd