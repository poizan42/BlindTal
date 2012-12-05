unit BlindMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXCtrls, ExtCtrls, StdCtrls, Math, Menus, RxMenus, Buttons, Unit1, RXSwitch,
  RxGrdCpt, RxCombos, Unit2, IniFiles, Placemnt;

type
  TPoints = record
   Navn: String;
   Tid: TTime;
   Fejl: Integer;
   Opgaver: Integer;
  end;
  TForm1 = class(TForm)
    Panel1: TPanel;
    RxSpeedButton1: TSpeedButton;
    Btn7: TSpeedButton;
    Btn4: TSpeedButton;
    Btn1: TSpeedButton;
    Btn0: TSpeedButton;
    DivBtn: TSpeedButton;
    Btn8: TSpeedButton;
    Btn5: TSpeedButton;
    Btn2: TSpeedButton;
    MulBtn: TSpeedButton;
    Btn9: TSpeedButton;
    SubBtn: TSpeedButton;
    AddBtn: TSpeedButton;
    RetBtn: TSpeedButton;
    Btn6: TSpeedButton;
    Btn3: TSpeedButton;
    ComBtn: TSpeedButton;
    Edit1: TEdit;
    RxLabel1: TRxLabel;
    RxMainMenu1: TRxMainMenu;
    Filer1: TMenuItem;
    Start1: TMenuItem;
    N1: TMenuItem;
    Intillinger1: TMenuItem;
    N2: TMenuItem;
    Luk1: TMenuItem;
    Stop1: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Om1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    RxLabel2: TRxLabel;
    SpeedButton3: TSpeedButton;
    Label8: TLabel;
    Status1: TMenuItem;
    Score1: TMenuItem;
    FormStorage1: TFormStorage;
    procedure Luk1Click(Sender: TObject);
    procedure Start1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Stop1Click(Sender: TObject);
    procedure Om1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Intillinger1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Status1Click(Sender: TObject);
    procedure Score1Click(Sender: TObject);
   public
    OldValue, PointFile, IniPath: String;
    CharNumber: Byte;
    MaxValue: Integer;
    AllowChars: Set of (acMat, acRet, acNeg, acDec);
//    TimeEnable: Boolean;
    Tid, OldTime, NewTime: TTime;
    NullWord: Word;
    procedure SelectKey(Value: Char);
    procedure NextNumber;
  end;

function ReadLnStr(var Txt: Text): string;
function ReadStr(var Txt: Text): string;

Procedure WritePointsToFile(Fil, Navn: String; Tid: TTime; Fejl,
 Opgaver: Integer); overload;
Procedure WritePointsToFile(Fil: String;
 Value: TPoints); overload;

Procedure ReadPointsFromFile(const Fil: String;
 const Navn: String; out Tid: TTime; out Fejl,
 Opgaver: Integer); overload;
function ReadPointsFromFile(Fil, Navn: String): TPoints; overload;

function GetPointsNames(Fil: String): TStringList;

var
  Form1: TForm1;

implementation

uses Unit3, Unit4;

{$R *.DFM}

function ReadStr(var Txt: Text): string;
begin
 Read(Txt, Result);
end;

function ReadLnStr(var Txt: Text): string;
begin
 ReadLn(Txt, Result);
end;

function GetPointsNames(Fil: String): TStringList;
begin
 with TIniFile.Create(Fil) do begin
  Result := TStringList.Create;
  ReadSections(Result);
  Free;
 end;
end;

Procedure ReadPointsFromFile(const Fil: String;
 const Navn: String; out Tid: TTime; out Fejl,
 Opgaver: Integer); overload;
begin
 with TIniFile.Create(Fil) do begin
  Tid := ReadTime(Navn, 'Tid', 0);
  Fejl := ReadInteger(Navn, 'Fejl', 0);
  Opgaver := ReadInteger(Navn, 'Opgaver', 0);
  Free;
 end;
end;

function ReadPointsFromFile(Fil, Navn: String): TPoints; overload;
begin
 Result.Navn := Navn;
 with Result do begin
  ReadPointsFromFile(Fil, Navn, Tid, Fejl, Opgaver);
 end;
end;

Procedure WritePointsToFile(Fil, Navn: String; Tid: TTime; Fejl,
 Opgaver: Integer); overload;
begin
 with TIniFile.Create(Fil) do begin
 if ((Tid / Opgaver) * ReadInteger(Navn, 'Opgaver', 0))
 {-}<= ReadTime(Navn, 'Tid', 0) then
 begin
  WriteTime(Navn, 'Tid', Tid);
  WriteInteger(Navn, 'Fejl', Fejl);
  WriteInteger(Navn, 'Opgaver', Opgaver);
 end;
  Free;
 end;
end;

Procedure WritePointsToFile(Fil: String;
 Value: TPoints); overload;
begin
 with Value do begin
  WritePointsToFile(Fil, Navn, Tid, Fejl, Opgaver);
 end;
end;

procedure TForm1.SelectKey(Value: Char);
begin
 Case Value of
  #$30..#$39: (FindComponent('Btn'+Value) as
   TSpeedButton).Down := True;
  #13: RetBtn.Down := True;
  '-': SubBtn.Down := True;
  '+': AddBtn.Down := True;
  '/': DivBtn.Down := True;
  '*': MulBtn.Down := True;
  ',': ComBtn.Down := True;    
 end;
end;

procedure TForm1.NextNumber;
var
 X, Y, Z1, Z2: Variant;
 I, I1, I2: integer;
 S1: String;
begin
 StatDia.OpgLabel.Caption := IntToStr(StrToInt(StatDia.OpgLabel.Caption)+1);
 CharNumber := 1;
 OldValue := '';
 Y := MaxValue;
 Z2 := '';
 Z1 := '';
 Randomize;
 if acNeg in AllowChars then begin // Skal tallet være
  X := Random(2);                  // negativt?
  if X then begin
   Dec(Y);
   Z1 := '-';
  end;
 end;
 if acRet in AllowChars then begin
  Z2 := #13;
  Dec(Y);
 end;

 for I := 1 to Y do begin
  if (acMat in AllowChars) or (acDec in AllowChars) then
   I2 := Random(11)
  else
   I2 := Random(10);
  case I2 of
   0..9: S1 := S1+IntToStr(I2);
   10:begin
       if acMat in AllowChars then begin
        Randomize;
        I1 := Random(5);
        case I1 of
         0: S1 := S1+'/';
         1: S1 := S1+'*';
         2: S1 := S1+'-';
         3: S1 := S1+'+';
         4: S1 := S1+',';
        end;
       end
       else
         S1 := S1+',';
      end;
  end;
 end;
 RxLabel1.Caption := Z1+S1+Z2;
 SelectKey(RxLabel1.Caption[CharNumber]);
end;

procedure TForm1.Luk1Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.Start1Click(Sender: TObject);
begin
 StatDia.OpgLabel.Caption := '-1';
 OldTime := Time;
 if MaxValue < 3 then
  MaxValue := 4;
 NextNumber;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
const
 AllowedChars = [#$30..#$39,#13,'/','*','-','+',','];
{var
 Min, Sec: Word;}
begin
 NewTime := Time;
 if (Key in AllowedChars) and (CharNumber > 0) then begin
  If (Key=RxLabel1.Caption[CharNumber])and
  {-}not(Key = #13) then begin
   OldValue := OldValue+Key;
   Inc(CharNumber);
   SelectKey(RxLabel1.Caption[CharNumber]);
  end
  else if OldValue+Key = RxLabel1.Caption then
   NextNumber
  else begin
   messagebeep(MB_ICONEXCLAMATION);
   StatDia.FejlLabel.Caption := IntToStr(StrToInt(StatDia.FejlLabel.Caption)+1)
  end;
  Tid := NewTime-OldTime;
  RxLabel2.Caption := TimeToStr(Tid);
  StatDia.TidLabel.Caption := RxLabel2.Caption;
 end
 else if (CharNumber = 0) and (Key in [#13,#$20]) then
  Start1Click(nil);
 if OldValue = RxLabel1.Caption then
  NextNumber;
 Edit1.Text := OldValue;
end;

procedure TForm1.Stop1Click(Sender: TObject);
begin
 WritePointsToFile(PointFile, InputBox('Navn', 'Skriv venligst dit navn:', ''),
 {-}StrToTime(StatDia.TidLabel.Caption),
 {-}StrToInt(StatDia.FejlLabel.Caption),
 {-}StrToInt(StatDia.OpgLabel.Caption));
 
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

procedure TForm1.Om1Click(Sender: TObject);
begin
 AboutBox.ShowModal;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
 StatDia.Visible := not StatDia.Visible;
 if StatDia.Visible then begin
  SpeedButton3.Caption := '<< Skjul status';
  Status1.Checked := True;
 end
 else
  StatDia.Close;
 StatDia.Left := Left + Width + 10; // Lad os flytte StatDia.
 StatDia.Top := Top;                // -||-
 BringToFront;
 StatDia.MVLabel.Caption := IntToStr(MaxValue);
end;

procedure TForm1.Intillinger1Click(Sender: TObject);
begin
 SetDia.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 TXT: TextFile;
begin
 if FileExists(ExtractFilePath(Application.ExeName)+'IniPath.txt') then begin
  AssignFile(TXT, ExtractFilePath(Application.ExeName)+'IniPath.txt');
  Reset(TXT);
  IniPath := ReadLnStr(TXT);
  FileExists(IniPath);
  CloseFile(TXT);
 end else
  IniPath := ExtractFilePath(Application.ExeName)+'BlindTal.ini';
 FormStorage1.IniFileName := IniPath;
 MaxValue := 4;
 AllowChars := [];
 with TIniFile.Create(IniPath) do
 begin
  if ReadBool('Global', 'AllowNeg', False) then
   AllowChars := [acNeg];
  if ReadBool('Global', 'AllowRet', True) then
   AllowChars := AllowChars + [acRet];
  if ReadBool('Global', 'AllowDec', True) then
   AllowChars := AllowChars + [acDec];
  if ReadBool('Global', 'AllowMat', True) then
   AllowChars := AllowChars + [acMat];
  PointFile := ReadString('Global', 'PointFile',
  {-}ExtractFilePath(Application.ExeName)+'Save.bts');
  Free;
 end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 SpeedButton3.Click;
end;

procedure TForm1.Status1Click(Sender: TObject);
begin
 SpeedButton3Click(SpeedButton3);
 Status1.Checked := StatDia.Visible;
end;

procedure TForm1.Score1Click(Sender: TObject);
begin
 Form4.ShowModal;
end;

end.

