unit Unit4;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  Windows,
{$ELSE}
  LCLIntf, LCLType, LMessages,
{$ENDIF}
  SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, BlindMain, Dialogs, ComCtrls;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Button2: TButton;
    ScoreView: TListView;
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click1(Sender: TObject);
    procedure ScoreViewCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure ScoreViewColumnClick(Sender: TObject; Column: TListColumn);
   public
    CompareCol: 0..3;
    CompareRev: Boolean;
  end;

function CompareAlpha(Str1, Str2: String; Reverse: Boolean = False): Integer;

var
  Form4: TForm4;

implementation

{$R *.dfm}

function CompareAlpha(Str1, Str2: String; Reverse: Boolean): Integer;
begin
 if not Reverse then
  Result := strcomp(PChar(Str1), PChar(Str2))
 else
  Result := strcomp(PChar(Str2), PChar(Str1));
end;

procedure TForm4.Button2Click(Sender: TObject);
var
 List: TStringList;
 I: Integer;
 Points: TPoints;
begin
 ScoreView.Items.Clear;
 List := BlindMain.GetPointsNames(Form1.PointFile);
 for I := 0 to List.Count -1 do
  if UpperCase(Copy(List[I], 1, Length(Edit1.Text)))
  {-}= UpperCase(Edit1.Text) then
   with ScoreView.Items.Add do begin
    Caption := List[I];
    Points := BlindMain.ReadPointsFromFile(Form1.PointFile,
    {-}Caption);
    SubItems.Add(IntToStr(Points.Opgaver));
    SubItems.Add(TimeToStr(Points.Tid));
    SubItems.Add(IntToStr(Points.Fejl));
   end;
 List.Free;
end;

procedure TForm4.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If Key = 13 then
  Button2Click(nil);
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
 Button2Click(nil);
end;

procedure TForm4.FormShow(Sender: TObject);
begin
 Edit1.Text := '';
 ScoreView.Items.Clear;
 Button2Click(nil);
end;

procedure TForm4.Button2Click1(Sender: TObject);
begin
 MessageDlg('Ikke implementeret!', mtError, [mbOK], 0);
end;

procedure TForm4.ScoreViewCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
begin
 if CompareCol = 0 then
  Compare := CompareAlpha(Item1.Caption, Item2.Caption, CompareRev)
 else
  Compare := CompareAlpha(Item1.Subitems[CompareCol-1],
  {-}Item2.Subitems[CompareCol-1], CompareRev);
end;

procedure TForm4.ScoreViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
 if Column.Index <> CompareCol then begin
  CompareRev := False;
  CompareCol := Column.Index;
 end else
  CompareRev := not CompareRev;
 ScoreView.AlphaSort;
end;

end.
