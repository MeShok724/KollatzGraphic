program Deshifr_bezDl_pr;

uses
  Vcl.Forms,
  Deshifr_bezDl_F in 'Deshifr_bezDl_F.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
