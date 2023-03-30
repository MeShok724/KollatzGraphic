unit Deshifr_bezDl_F;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Math;


Const N=100;

Type
  TArray = array[1..N] of byte;

Var
  S:int64;
  A,B:TArray;
  I,K:integer;
  Str, ShifrStr,ShifrOutputStr:String;
  Step:LongInt;
  IsNotCorrect:boolean;



type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);

begin
  ShifrStr:=Memo1.Text;
  Memo2.Lines.Clear;
  {try

  except
    Memo2.Lines.Add('Ошибка обработки ввода');
    IsNotCorrect:=true;
  end;

  for K := 1 to length(ShifrStr) do
    if (ShifrStr[i]<>'0') and (ShifrStr[i]<>'1') then
    begin
      Memo2.Lines.Add('Ошибка обработки ввода');
      IsNotCorrect:=true;
    end;}


  //if not isnotcorrect then
  S:=1;
  for k := length(ShifrStr) downto 1 do

  begin
    if ShifrStr[k]='1' then
      S:=(S-1) div 3
    else
      S:=S*2;


    Memo2.Lines.Add(IntToStr(S));
  end;




end;

end.
