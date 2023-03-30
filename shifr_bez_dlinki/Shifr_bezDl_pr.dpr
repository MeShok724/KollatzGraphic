program Shifr_bezDl_pr;

uses
  Vcl.Forms,
  Shifr_F in '..\shifr\Shifr_F.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
