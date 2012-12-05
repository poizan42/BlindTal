program BlindTal;

uses
  Forms,
  BlindMain in 'BlindMain.pas' {Form1},
  Unit1 in 'Unit1.pas' {AboutBox},
  Unit2 in 'Unit2.pas' {StatDia},
  Unit3 in 'Unit3.pas' {SetDia},
  Unit4 in 'Unit4.pas' {Form4};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TStatDia, StatDia);
  Application.CreateForm(TSetDia, SetDia);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
