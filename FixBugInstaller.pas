// Fix bugs RAD installer from Russian language
// by MotoArhangel ;)
unit FixBugInstaller;

interface
uses
  registry, SysUtils, Windows;

  procedure Installlanguage(status:integer);

implementation

procedure Installlanguage(status:integer);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    begin
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.openkey('SYSTEM\CurrentControlSet\Control\Nls\Language',false) then
        case status of
          //0419 - Russian language
          //0409 - English language
          0: if strtoint(reg.ReadString('InstallLanguage'))=0419
               then reg.WriteString('InstallLanguage','0409');
          1: reg.WriteString('InstallLanguage',strtoint(reg.ReadString('Default')));
        end;
    end;
  finally
    Reg.Free;
  end;
end;

end.
