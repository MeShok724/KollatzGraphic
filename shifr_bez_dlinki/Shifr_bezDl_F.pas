unit Shifr_bezDl_F;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Math;


Const N=100; ShifrStrMax=29;

Type
  TArray = array[1..N] of byte;

Var
  S:int64;
  A,B:TArray;
  I:integer;
  Str, ShifrStr,ShifrOutputStr:String;
  Step:LongInt;



type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
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
  Step:=0;
  Memo1.Lines.Clear;
  Str:=Edit1.Text;
  S:=StrToInt(Str);
  ShifrStr:='';


  while(S<>1) do
  begin
    if Odd(S) then
    begin
      S:=S*3+1;
      ShifrStr:=ShifrStr+'1';
    end
    else
    begin
      S:=S div 2;
      ShifrStr:=ShifrStr+'0';
    end;

    Str:='';
    Str:=IntToStr(S);
    Inc(Step);

    if length(ShifrStr)>ShifrStrMax then  //write a result
    begin
      Memo1.Lines.Add(ShifrStr);
      ShifrStr:='';
    end;

  end;
  Edit2.Text:=IntToStr(Step);
  Str:='';



   Memo1.Lines.Add(ShifrStr);
   ShifrStr:='';


end;

end.
