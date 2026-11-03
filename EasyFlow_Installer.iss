#define MyAppName "EasyFlow"
#define MyAppVersion "1.0.0-rc"
[Setup]
AppId={{C3A72D1E-1137-4EA9-B314-5C6F48D332AC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
DefaultDirName={localappdata}\Programs\EasyFlow
DefaultGroupName=EasyFlow
PrivilegesRequired=lowest
OutputDir=installer_output
OutputBaseFilename=EasyFlow_Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
[Files]
Source: "dist\EasyFlow\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
[Icons]
Name: "{autoprograms}\EasyFlow"; Filename: "{app}\EasyFlow.exe"
Name: "{autodesktop}\EasyFlow"; Filename: "{app}\EasyFlow.exe"; Tasks: desktopicon
[Tasks]
Name: "desktopicon"; Description: "Create desktop shortcut"; GroupDescription: "Additional icons:"
[Run]
Filename: "{app}\EasyFlow.exe"; Description: "Launch EasyFlow"; Flags: nowait postinstall skipifsilent
