unit grafik2F;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    PaintBox1: TPaintBox;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
Elr=4;
N=20;
Accur=250;
X1=200;
X2=600;
Y1=48;
Y2=300;
Xr=5;
Yr:array [0..4] of integer = (50,100,150,200,250);
ValR=5;
XTxt=40;


var
  Form1: TForm1;
  Number,MaxNumb,NumbToNextGr:longint;
  XCord:integer;
  Koef:integer;
  ArNumb:array[1..N] of LongInt;
  i,j:integer;
  Zn:array[0..4] of longint;



implementation

{$R *.dfm}


Procedure NextCh(Var Ch:longint);
begin
  if Odd(Ch) then
  Ch:=3*Ch+1
  else
  Ch:=Ch div 2;
end;

Procedure CleanForm(Const X1,Y1,X2,Y2:integer);
begin
  Form1.Canvas.FillRect(Bounds(x1-20,y1-60,x2,y2+60));
end;


Procedure BuildGr;
begin

  i:=2;

  while (Number<>1) and (i<=N) do
  begin
    NextCh(Number);
    ArNumb[i]:=Number;
    if MaxNumb<Number then MaxNumb:=Number;
    if (Number=1) or (i=N) then   j:=i;
    Inc(i);
  end;

  if j=N then
  begin
    Form1.Button2.Visible:=true;
    NumbToNextGr:=ArNumb[N];
  end
  else Form1.Button2.Visible:=false;


  if MaxNumb>Accur then
    begin
      i:=1;
      while (MaxNumb div i)>Accur do
        Inc(i);
      koef:=i;

      for i := 1 to j do
      begin
        ArNumb[i]:=Round(ArNumb[i] / koef);
      end;

      for i := 0 to ValR do
      begin
        Zn[i]:=Yr[i] * koef;
      end;
    end
  else
    if MaxNumb<(Accur div 2) then
    begin
      i:=1;
      while (MaxNumb * i)<Accur do
        Inc(i);
      Dec(I);
      koef:=i;

      for i := 1 to j do
      begin
        ArNumb[i]:=ArNumb[i] * koef;
      end;


      for i := 0 to ValR do
      begin
        Zn[i]:=Round(Yr[i] / koef);
      end;
    end
    else
    begin
       for i := 0 to ValR do
      begin
        Zn[i]:=Yr[i];
      end;
    end;



  Form1.Canvas.Pen.Color:=clBlack;
  for i := 0 to Valr do
  begin
    Form1.Canvas.MoveTo(X1,Y2-Yr[i]);
    Form1.Canvas.LineTo(X1+Xr,Y2-Yr[i]);
    Form1.Canvas.LineTo(X1-Xr,Y2-Yr[i]);
    Form1.Canvas.TextOut(X1-XTxt, Y2-Yr[i]-6,IntToStr(Zn[i]));
  end;

  Form1.Canvas.Pen.Color:=clRed;



  Form1.Canvas.MoveTo(XCord+1,Y2-ArNumb[1]);
  for i := 2 to j do
  begin
    Inc(XCord,20);
    Form1.Canvas.LineTo(XCord,Y2-ArNumb[i]);
    Form1.Canvas.Ellipse(XCord-ElR,Y2-ArNumb[i]-ElR,XCord+ElR,Y2-ArNumb[i]+ElR);
    Form1.Canvas.MoveTo(XCord,Y2-ArNumb[i]);
  end;

end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  CleanForm(X1-60,Y1,X2,Y2);
  canvas.Pen.color := clBlack;
  Form1.Canvas.MoveTo(X1,Y2);
  Form1.Canvas.LineTo(X2,Y2);
  Form1.Canvas.MoveTo(X1,Y2);
  Form1.Canvas.LineTo(X1,Y1);
  Number:=StrToInt(Edit1.Text);
  MaxNumb:=Number;
  ArNumb[1]:=Number;
  XCord:=200;
  canvas.Pen.color := clRed;
  BuildGr;

end;

Procedure TForm1.Button2Click(Sender: TObject);
begin
  CleanForm(X1-60,Y1,X2,Y2);
  canvas.Pen.color := clBlack;
  Form1.Canvas.MoveTo(200,300);
  Form1.Canvas.LineTo(600,300);
  Form1.Canvas.MoveTo(200,300);
  Form1.Canvas.LineTo(200,50);
  Number:=NumbToNextGr;;
  MaxNumb:=Number;
  ArNumb[1]:=Number;
  XCord:=200;
  canvas.Pen.color := clRed;
  BuildGr;

end;

end.
