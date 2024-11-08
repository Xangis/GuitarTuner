; InnoSetup installer creation script for Guitar Tuner.
; Change all references to C:\Users\Xangis\code to match your working directory.
;
; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Guitar-Tuner"
#define MyAppVersion "1.03"
#define MyAppPublisher "Jason Champion"
#define MyAppURL "https://zetacentauri.com/software_guitartuner.htm"
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
LicenseFile=E:\code\GuitarTuner\LICENSE.TXT
OutputDir=E:\code\GuitarTuner\installer
OutputBaseFilename=GuitarTuner1.03Setup
SetupIconFile=E:\code\GuitarTuner\Release\Guitar32.ico
UninstallDisplayIcon={app}\Guitar32.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "E:\code\GuitarTuner\Release\Guitar32.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\code\GuitarTuner\Release\GuitarTuner.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\code\GuitarTuner\LICENSE.TXT"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\Guitar Tuner"; Filename: "{app}\GuitarTuner.exe"; WorkingDir: "{app}"
Name: "{commondesktop}\Guitar Tuner"; Filename: "{app}\GuitarTuner.exe"; Tasks: desktopicon; WorkingDir: "{app}"

[Run]
Filename: "{app}\GuitarTuner.exe"; Description: "{cm:LaunchProgram,Guitar Tuner}"; Flags: nowait postinstall skipifsilent

