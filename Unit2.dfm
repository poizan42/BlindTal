object StatDia: TStatDia
  Left = 541
  Top = 103
  BorderStyle = bsDialog
  Caption = 'Status dialog'
  ClientHeight = 214
  ClientWidth = 313
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClick = FormClick
  OnClose = FormClose
  OnDblClick = FormClick
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 9
    Width = 297
    Height = 161
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 23
    Top = 27
    Width = 18
    Height = 13
    Caption = 'Tid:'
  end
  object TidLabel: TLabel
    Left = 58
    Top = 27
    Width = 15
    Height = 13
    Caption = '0:0'
  end
  object Label2: TLabel
    Left = 23
    Top = 84
    Width = 44
    Height = 13
    Caption = 'Opgaver:'
  end
  object OpgLabel: TLabel
    Left = 76
    Top = 84
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label3: TLabel
    Left = 23
    Top = 140
    Width = 19
    Height = 13
    Caption = 'Fejl:'
  end
  object FejlLabel: TLabel
    Left = 53
    Top = 140
    Width = 6
    Height = 13
    Caption = '0'
  end
  object MVLabel: TLabel
    Left = 165
    Top = 64
    Width = 6
    Height = 13
    Caption = '4'
    Visible = False
  end
  object Label5: TLabel
    Left = 5
    Top = 3
    Width = 304
    Height = 174
    AutoSize = False
    Transparent = True
    OnClick = FormClick
    OnDblClick = FormClick
  end
  object OKBtn: TButton
    Left = 119
    Top = 180
    Width = 75
    Height = 25
    Caption = '<< Skjul status'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnKeyPress = FormKeyPress
    OnMouseUp = OKBtnMouseUp
  end
end
