; InnoSetup installer creation script for Guitar Tuner.
; Change all references to C:\Users\Xangis\code to match your working directory.
;
; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Guitar Tuner"
#define MyAppVersion "1.02"
#define MyAppPublisher "Jason Champion"
#define MyAppURL "https://github.com/Xangis"
#define MyAppExeName "GuitarTuner.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{5A3CCB0D-B8EC-4F75-9D5E-0B1B13A93C81}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\Guitar Tuner
DefaultGroupName=Guitar Tuner
LicenseFile=C:\Users\Xangis\code\GuitarTuner\Release\License.txt
OutputDir=C:\Users\Xangis\code\GuitarTuner\installer
OutputBaseFilename=GuitarTuner1.02Setup
SetupIconFile=C:\Users\Xangis\code\GuitarTuner\Release\Guitar32.ico
UninstallDisplayIcon={app}\Guitar32.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\Xangis\code\GuitarTuner\Release\Guitar32.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Xangis\code\GuitarTuner\Release\GuitarTuner.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Xangis\code\GuitarTuner\Release\License.txt"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "C:\Users\Xangis\code\GuitarTuner\installer\vcredist2010_x86.exe"; DestDir: "{app}"; Flags: ignoreversion deleteafterinstall

[Icons]
Name: "{group}\Guitar Tuner"; Filename: "{app}\GuitarTuner.exe"; WorkingDir: "{app}"
Name: "{commondesktop}\Guitar Tuner"; Filename: "{app}\GuitarTuner.exe"; Tasks: desktopicon; WorkingDir: "{app}"

[Run]
Filename: "{app}\vcredist2010_x86.exe"; Parameters: "/q"; WorkingDir: "{app}";  StatusMsg: "Installing Visual C++ 2010 Redistributable..."; Flags: waituntilterminated
Filename: "{app}\GuitarTuner.exe"; Description: "{cm:LaunchProgram,Guitar Tuner}"; Flags: nowait postinstall skipifsilent
