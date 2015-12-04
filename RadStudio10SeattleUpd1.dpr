program RadStudio10SeattleUpd1;

{$R 'UAC.res' 'UAC.rc'}

uses
  Forms,
  MainFrm in 'MainFrm.pas' {FrmMain},
  FGInt in 'FGInt.pas',
  Sha1 in 'Sha1.pas',
  RadKeygen in 'RadKeygen.pas',
  DllData in 'DllData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'RADStudio 10 Seattle Update 1 Keygen';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
