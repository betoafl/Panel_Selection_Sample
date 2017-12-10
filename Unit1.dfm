object Form1: TForm1
  Left = 1
  Top = 106
  Width = 714
  Height = 191
  Caption = 'Sele'#231#227'o por painel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 40
    Top = 24
    Width = 75
    Height = 25
    Caption = 'M'#233'todo 1'
    TabOrder = 0
    OnClick = btn1Click
  end
  object pnl1: TPanel
    Left = 40
    Top = 56
    Width = 305
    Height = 89
    TabOrder = 1
    Visible = False
    object lbl1: TLabel
      Left = 8
      Top = 70
      Width = 3
      Height = 13
    end
    object rg1: TRadioGroup
      Left = 8
      Top = 8
      Width = 289
      Height = 57
      Caption = '  Selecionar Form  '
      Columns = 2
      Items.Strings = (
        'Form2'
        'Form3')
      TabOrder = 0
      OnClick = rg1Click
    end
  end
  object btn2: TButton
    Left = 368
    Top = 24
    Width = 75
    Height = 25
    Caption = 'M'#233'todo 2'
    TabOrder = 2
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 616
    Top = 24
    Width = 75
    Height = 25
    Caption = 'M'#233'todo 3'
    TabOrder = 3
    OnClick = btn3Click
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 456
    Top = 24
  end
end
