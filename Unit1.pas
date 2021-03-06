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
    btn3: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
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

{Mensagem de dois botoes com caption definidos pelo programa
 fonte: https://www.devmedia.com.br/forum/botoes-personalizados-em-uma-messagedlg/348601}
function MensagemPersonalizada(Mensagem, Titulo, Butao_Sim, Butao_Nao: String): TModalResult;
var
 i:integer;
 f:Tform;
begin
  //aqui vc pode colocar mais botoes, basta colocar mbok, mbcancel, etc...
  f:= createmessagedialog(Mensagem, mtconfirmation,[mbyes,mbno]);
  try
    for i:=0 to f.componentCount -1 do
      if f.components[i] is tbutton then
        with tbutton(f.components[i]) do
          case modalresult of
             mryes: caption := Butao_Sim;
             mrno:  caption := Butao_Nao;
             //aqui vc personaliza os botoes a mais q vc colocou
          end;
      f.caption := Titulo;
      {� poss�vel, tamb�m, alteraro caption da janela}
      f.showmodal;
  finally
    f.free;
  end;
  Result:=f.ModalResult;
end;

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

procedure TForm1.btn3Click(Sender: TObject);
var resp: TModalResult;
begin
  //
  resp := MensagemPersonalizada('Qual op��o quer abrir?', 'Sele��o de op��o', 'Form2', 'Form3');
  if resp = mrYes then
  begin
    pnl1.Visible := False;
    Form2 := TForm2.Create(Self);
    Form2.ShowModal;
  end
  else
  if resp = mrNo then
  begin
    pnl1.Visible := False;
    Form3 := TForm3.Create(Self);
    Form3.ShowModal;
  end;
end;

end.
