unit Unit2;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TStatDia = class(TForm)
    OKBtn: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    TidLabel: TLabel;
    Label2: TLabel;
    OpgLabel: TLabel;
    Label3: TLabel;
    FejlLabel: TLabel;
    MVLabel: TLabel;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure OKBtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatDia: TStatDia;

implementation

uses BlindMain;

{$R *.DFM}

procedure TStatDia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Form1.SpeedButton3.Caption := 'Vis status >>';
 Form1.Status1.Checked := False;
end;

procedure TStatDia.FormClick(Sender: TObject);
begin
 Form1.BringToFront;
end;

procedure TStatDia.FormKeyPress(Sender: TObject; var Key: Char);
begin
 FormClick(Sender);
 Form1.Edit1KeyPress(Form1.Edit1, Key);
end;

procedure TStatDia.OKBtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 Close;
end;

end.

