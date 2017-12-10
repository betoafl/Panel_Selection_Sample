unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    pnl1: TPanel;
    btn2: TButton;
    rg1: TRadioGroup;
    lbl1: TLabel;
    tmr1: TTimer;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure rg1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
   Unit2, Unit3;

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  pnl1.Left := btn1.Left;
  pnl1.Tag := 0;
  pnl1.Visible := True;
  rg1.SetFocus;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  pnl1.Left := btn2.Left;
  pnl1.Tag := 1;
  pnl1.Visible := True;
  rg1.SetFocus;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
  if pnl1.Tag = 0 then
     lbl1.Caption := ''
  else
  begin
     if lbl1.Tag <= 0 then
        lbl1.Tag := 10;
     lbl1.Caption := 'Fechando em ' + IntToStr(lbl1.Tag) + ' segundos';
     lbl1.Tag := lbl1.Tag - 1;
     if lbl1.Tag = 0 then
     begin
        pnl1.Tag := 0;
        rg1Click(rg1);
     end;
  end;
end;

procedure TForm1.rg1Click(Sender: TObject);
begin
  if pnl1.Tag = 0 then
    case rg1.ItemIndex of
      0:
      begin
        pnl1.Visible := False;
        Form2 := TForm2.Create(Self);
        Form2.ShowModal;
      end;
      1:
      begin
        pnl1.Visible := False;
        Form3 := TForm3.Create(Self);
        Form3.ShowModal;
      end;
    end;
end;

end.
