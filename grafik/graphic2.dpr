program graphic2;

uses
  Vcl.Forms,
  grafik2F in 'grafik2F.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
