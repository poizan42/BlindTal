unit Unit1;

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
  SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    Label1: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

uses BlindMain;

{$R *.dfm}

procedure TAboutBox.FormKeyPress(Sender: TObject; var Key: Char);
begin
 Close;
 Form1.Edit1KeyPress(Form1.Edit1, Key);
end;

end.

