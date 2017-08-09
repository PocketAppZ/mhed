;
;  Micro Hosts Editor (standalone application).
;  
;  Copyright 2011 - 2017 EasyCoding Team (ECTeam).
;  Copyright 2005 - 2017 EasyCoding Team.
;  
;  This program is free software: you can redistribute it and/or modify
;  it under the terms of the GNU General Public License as published by
;  the Free Software Foundation, either version 3 of the License, or
;  (at your option) any later version.
;  
;  This program is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;  GNU General Public License for more details.
;  
;  You should have received a copy of the GNU General Public License
;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
;  
;  EasyCoding Team's official site: https://www.easycoding.org/
;  Official project homepage: https://www.easycoding.org/projects/mhed
;
[Setup]
AppId={{1A3295AB-919E-4E58-B2A3-1B8B9BF8E29D}
AppName=Micro Hosts Editor
AppVerName=Micro Hosts Editor
AppPublisher=EasyCoding Team
AppPublisherURL=https://www.easycoding.org/
AppVersion=0.8.0.315
AppSupportURL=https://www.easycoding.org/projects/mhed
AppUpdatesURL=https://www.easycoding.org/projects/mhed
DefaultDirName={code:GetDefRoot}\Micro Hosts Editor
DefaultGroupName=Micro Hosts Editor
AllowNoIcons=yes
LicenseFile=COPYING.txt
OutputBaseFilename=mhed_v08
SetupIconFile=mhed.ico
UninstallDisplayIcon={app}\mhed.exe
InfoBeforeFile=readme.rtf
Compression=lzma2
SolidCompression=yes
PrivilegesRequired=lowest
ArchitecturesInstallIn64BitMode=x64
MinVersion=6.1.7601

VersionInfoVersion=0.8.0.315
VersionInfoDescription=Micro Hosts Editor Setup
VersionInfoCopyright=(c) 2005-2017 EasyCoding Team. All rights reserved.
VersionInfoCompany=EasyCoding Team

[CustomMessages]
OptNetStatus=Optimizing MSIL binary...
OptNetUninstallStatus=Removing optimized MSIL binaries...
russian.OptNetStatus=��� ����������� MSIL ����������...
russian.OptNetUninstallStatus=��� �������� �������� ������ MSIL...

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "mhed.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "mhed.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "mhed.exe.sig"; DestDir: "{app}"; Flags: ignoreversion
Source: "mhed.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "ru\*"; DestDir: "{app}\ru\"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Micro Hosts Editor"; Filename: "{app}\mhed.exe"
Name: "{group}\{cm:ProgramOnTheWeb,Micro Hosts Editor}"; Filename: "https://www.easycoding.org/projects/mhed"
Name: "{userdesktop}\Micro Hosts Editor"; Filename: "{app}\mhed.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Micro Hosts Editor"; Filename: "{app}\mhed.exe"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\mhed.exe"; Description: "{cm:LaunchProgram,Micro Hosts Editor}"; Flags: nowait postinstall skipifsilent
Filename: "{dotnet40}\ngen.exe"; Parameters: "install ""{app}\mhed.exe"""; StatusMsg: {cm:OptNetStatus}; Flags: runhidden; Check: IsAdminLoggedOn()

[UninstallRun]
Filename: "{dotnet40}\ngen.exe"; Parameters: "uninstall ""{app}\mhed.exe"""; StatusMsg: {cm:OptNetUninstallStatus}; Flags: runhidden; Check: IsAdminLoggedOn()

[Code]
function GetDefRoot(Param: String): String;
begin
  if not IsAdminLoggedOn then
    Result := ExpandConstant('{localappdata}')
  else
    Result := ExpandConstant('{pf}')
end;
