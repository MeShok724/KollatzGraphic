unit long_arifm_F;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Math;


Const N=100;

Type
  TArray = array[1..N] of byte;

Var
  A,B:TArray;
  S,I,SizeMax:integer;
  Str:String;
  Step:LongInt;
  MaxNum:TArray;
  Perepoln:boolean;



type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
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

Function FThreeXplusOne(Const Chislo: TArray;
                            Var Size:integer): TArray;
var
  Num : TArray;
  i: LongInt;
  DigigtsProd: Word;
  CarryProd: Byte;
  Carry:byte;
  Sum:Byte;
  //Num - intermediate calculations
  //i - cycle counter
  //DigigtsProd - product of the digits of the first and second number
  //CarryProd - сarry the digit (if there is) to the next element (for DigigtsProd)
begin

  //Reset carry
  CarryProd:= 0;

  //Multiply the digits of the first number by the second number

    for i := 1 to Size do
    begin

      //Starting to multiply the last digits of the numbers (in the mirrored view it is first)
      //and add the carry (if there is).
      DigigtsProd:= Chislo[i] * 3 + CarryProd;

      //The integer part of dividing by NS is the carry that will go to the next element
      CarryProd:= DigigtsProd div 10;

      //DigigtsSum mod NS is the digit in the ProductResult
      Num[i] := DigigtsProd mod 10;

      if (I=Size) and (CarryProd<>0) then
      begin
        Inc(Size);
        Num[i+1]:=CarryProd;
      end;
    end;


    Carry:=0;
    for i := 1 to Size do
    begin

      if I=1 then
       Sum:= Carry + Num[i] + 1
      else
        Sum:=Carry+Num[i];


      Num[i]:= Sum mod 10;


      Carry:= Sum div 10;


      if (i = Size) and (Carry <>0) then
      begin
        Size:= Size + 1;
        Num[i+1]:= Carry;
      end;
    end;
    Result:=Num;

end;

Function Division(Num: TArray; Var Size:integer): TArray;
var
  Devide:Int64;
  i: Integer;
  Curr,CommonNums,j:byte;
  ManyNumbers:boolean;

Label
  Missing;
  //CurrElInQuotient - the current element in the quotient
  //CurrPosInDividend - current position in the dividend (CurrPosInDividend..High(Dividend) - part of the dividend which will divide)
  //i - cycle counter
begin

  //Result check: numerator remainder must be < denominator
  i:=Size;
  Devide:=0;
  CommonNums:=0;
  ManyNumbers:=false;



  while i>=1 do
  begin              //число делитс€ перед ним все поделилось и(после него не 0 либо оно последнее)
    if (not odd(num[i]) ) and (not ManyNumbers) and ((num[i-1]<>0) or (i=1)) and (num[i]<>0) then
    begin
      num[i]:=num[i] div 2;
    end

    else             //чило нечетное или после него 0 или несколько чисел
      // if (odd(num[i]) ) or (num[i-1]=0) or ManyNumbers then
    begin
        ManyNumbers:=true;

        Devide:=devide*10+num[i];
        if High(Devide) div 11 <devide then
      begin
          Perepoln:=true;
          Goto missing;
      end;
      Inc(CommonNums);
    end;

      //≈сли несколько чисел и (после них не ноль либо последнее) и они четные
      if (manyNumbers) and ((num[i-1]<>0) or (i=1)) and (not (odd(Devide))) then
      begin
        Devide:=devide div 2;
        for j := i to i+commonNums-1 do
        begin
          num[j]:=Devide mod 10;
          devide:=devide div 10;
        end;
        ManyNumbers:=false;
        Devide:=0;
        CommonNums:=0;
      end;
      Dec(i);


  {
    if (not Odd(Num[i+1]) or (i=Size)) and ((Num[i]<>0)or (i=Size)) and (not Odd(Num[i])) and (not ManyNumbers) then
      Num[i]:=Num[i] div 2
    else
    begin
      ManyNumbers:=true;
      Devide:=Devide+Num[i]*Round(Power(10,CommonNums));
      Inc(CommonNums);
    end;

    if (ManyNumbers) and ((not Odd(Devide) and (not Odd(num[i+1])) or (i=Size))) then
    begin
      Devide:=Devide div 2;
      for j := 1 to CommonNums do
      begin
        Num[i-CommonNums+j]:=Devide mod 10;
        Devide:=Devide div 10;
      end;
      ManyNumbers:=false;
      Devide:=0;
      CommonNums:=0;

    end;
    Inc(i);
    }
  end;
  I:=Size;
  while (I=Size) and (Num[i]=0) do
  begin
    Dec(Size);
    Dec(I);
  end;

    Missing:
     if Perepoln then
     begin
        num[1]:=1;
        for i := 2 to Size do
          num[i]:=0;
        Size:=1;
     end;

  result:=Num;
end;


procedure TForm1.Button1Click(Sender: TObject);

begin
  Step:=0;
  Memo1.Lines.Clear;
  Str:=Edit1.Text;
  Memo1.Lines.Add(Str);
  S:=Length(Str);
  for i := S downto 1 do
    A[S-i+1]:=StrToInt(Str[i]);
  B:=A;
  MaxNum:=A;
  SizeMax:=S;
  while(B[1]<>1) or (S<>1) do
  begin
    if Odd(B[1]) then
      B:=FThreeXplusOne(B,S)
    else
      B:=Division(B,S);
    Str:='';
    for i := S downto 1 do
      Str:=Str+(IntToStr(B[i]));
    Inc(Step);
    Memo1.Lines.Add(Str);
    if S>SizeMax then
    begin
      SizeMax:=S;
      MaxNum:=B;
    end;

    if (S=SizeMax) then
    begin
      I:=S;
      while (i>=1) and (B[i]=MaxNum[i]) do
        Dec(i);
      if B[i]>MaxNum[i] then
      begin
        SizeMax:=S;
        MaxNum:=B;
      end;
    end;
  end;
  Edit2.Text:=IntToStr(Step);
  Str:='';
  for i := SizeMax downto 1 do
      Str:=Str+(IntToStr(MaxNum[i]));
  Edit3.Text:=Str;
  if Perepoln then
  begin
     Memo1.Lines.Add('ѕроизошло переполнение');
     Perepoln:=false;
  end;



end;

end.
