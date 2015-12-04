unit MainFrm;

interface

uses
  Windows,SysUtils,Controls,Forms,Dialogs,StdCtrls,Classes,RadKeygen,AnsiStrings;
type
  TFrmMain = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}


procedure TFrmMain.Button1Click(Sender: TObject);
var
  FileName:string;
begin
  Edit1.Text:= RadKeygen.GenerateSerialNumber;
  if Edit2.Text='' then Edit2.Text:= RadKeygen.GetRegistrationCode;
  if Trim(Edit2.Text)<>'' then
  begin
    if RadKeygen.GenerateActiveFile(Edit1.Text,Edit2.Text,FileName) then
    begin
      MessageBox(Handle,PChar('Slip files have been saved successfully!'#10+FileName),PChar(Application.Title),MB_OK+MB_ICONINFORMATION);
    end
    else
    begin
      MessageBox(Handle,PChar('An error has occured while save the slip file!'),PChar(Application.Title),MB_OK+MB_ICONWARNING);
    end;  
  end;
end;

procedure TFrmMain.Button2Click(Sender: TObject);
var
  FileName:string;
begin
  if RadKeygen.PatchFile(FileName) then
  begin
    MessageBox(Handle,PChar('path files have been saved successfully!'#10+FileName),PChar(Application.Title),MB_OK+MB_ICONINFORMATION);
  end
  else
  begin
    MessageBox(Handle,PChar('An error has occured while patch file!'),PChar(Application.Title),MB_OK+MB_ICONWARNING);
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  Edit1.Text:= RadKeygen.GenerateSerialNumber;
  Edit2.Text:= RadKeygen.GetRegistrationCode;
end;

end.
