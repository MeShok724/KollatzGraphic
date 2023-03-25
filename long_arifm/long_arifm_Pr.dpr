program long_arifm_Pr;

uses
  Vcl.Forms,
  long_arifm_F in 'long_arifm_F.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
