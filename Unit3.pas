unit Unit3;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  Mask, Windows,
{$ELSE}
  MaskEdit, LCLIntf, LCLType, LMessages, EditBtn,
{$ENDIF}
  SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ComCtrls, ExtCtrls, RXSpin, ToolEdit, IniFiles, Dialogs;

type
  TSetDia = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    MatBox: TCheckBox;
    TPOSpin: TRxSpinEdit;
    DecBox: TCheckBox;
    RetBox: TCheckBox;
    NegBox: TCheckBox;
    PointFilePath: TFilenameEdit;
    SpeedButton1: TSpeedButton;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function CanCreateFile(FilePath: String): Boolean;

var
  SetDia: TSetDia;

implementation

uses BlindMain, Unit2;

{$R *.dfm}

function CanCreateFile(FilePath: String): Boolean;
var
 F: File;
begin
 Result := True;
 try
  AssignFile(F, FilePath);
  Reset(F);
 except
  Result := False;
  try
   CloseFile(F);
  except
  end;
 end;
end;

procedure TSetDia.OKBtnClick(Sender: TObject);
begin
 Close;
 with Form1 do begin
  OldValue := '';
  CharNumber := 0;
  Edit1.Clear;
  RxLabel1.Caption := '0123456789'#13;
  RxLabel2.Caption := TimeToStr(0);
  with StatDia do begin
   TidLabel.Caption := TimeToStr(0);
   FejlLabel.Caption := '0';
   OpgLabel.Caption := '0';
  end;
  OldTime := 0;
  NewTime := 0;
 end;
 with TIniFile.Create(Form1.IniPath) do
 begin
  if RetBox.Checked then
   Form1.MaxValue := TPOSpin.AsInteger +1
  else
   Form1.MaxValue := TPOSpin.AsInteger ;
  StatDia.MVLabel.Caption := TPOSpin.Text;
  Form1.AllowChars := [];
  if MatBox.Checked then
   Form1.AllowChars := [acMat];
  WriteBool('Global', 'AllowMat', acMat in Form1.AllowChars);
  if DecBox.Checked then
   Form1.AllowChars := Form1.AllowChars + [acDec];
  WriteBool('Global', 'AllowDec', acDec in Form1.AllowChars);
  if RetBox.Checked then
   Form1.AllowChars := Form1.AllowChars + [acRet];
  WriteBool('Global', 'AllowRet', acRet in Form1.AllowChars);   
  if NegBox.Checked then
   Form1.AllowChars := Form1.AllowChars + [acNeg];
  WriteBool('Global', 'AllowNeg', acNeg in Form1.AllowChars);
  if CanCreateFile(PointFilePath.Text) then begin
   if PointFilePath.Text = ExtractFilePath(Application.ExeName)+'Save.bts' then
    DeleteKey('Global', 'PointFile')
   else
    WriteString('Global', 'PointFile', PointFilePath.Text);
  Form1.PointFile := PointFilePath.Text;
  end
  else begin
   Beep;
   MessageDlg('Ugyldig sti!', mtError, [mbOK], 0);
  end;
  Free;
 end;
end;

procedure TSetDia.CancelBtnClick(Sender: TObject);
begin
 Close;
end;

procedure TSetDia.FormShow(Sender: TObject);
begin
 PointFilePath.Text := Form1.PointFile;
 MatBox.Checked := acMat in Form1.AllowChars;
 DecBox.Checked := acDec in Form1.AllowChars;
 RetBox.Checked := acRet in Form1.AllowChars;
 NegBox.Checked := acNeg in Form1.AllowChars;
 if not (acRet in Form1.AllowChars) then
  TPOSpin.AsInteger := Form1.MaxValue
 else
  TPOSpin.AsInteger := Form1.MaxValue -1;
end;

procedure TSetDia.SpeedButton1Click(Sender: TObject);
begin
 PointFilePath.Text := ExtractFilePath(Application.ExeName)+'Save.bts';
end;

end.

