object Form4: TForm4
  Left = 292
  Top = 203
  ActiveControl = Edit1
  BorderStyle = bsDialog
  Caption = 'Score'
  ClientHeight = 403
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 108
    Top = 8
    Width = 22
    Height = 13
    Caption = 'Søg:'
  end
  object Button1: TButton
    Left = 108
    Top = 357
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 144
    Top = 5
    Width = 121
    Height = 21
    TabOrder = 1
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object Button2: TButton
    Left = 191
    Top = 357
    Width = 75
    Height = 25
    Caption = 'Udskriv'
    TabOrder = 2
    OnClick = Button2Click1
  end
  object ScoreView: TListView
    Left = 28
    Top = 32
    Width = 319
    Height = 310
    Columns = <    
      item
        AutoSize = True
        Caption = 'Navn'
        MaxWidth = 79
      end    
      item
        AutoSize = True
        Caption = 'Opgaver'
        MaxWidth = 79
      end    
      item
        AutoSize = True
        Caption = 'Tid'
        MaxWidth = 78
      end    
      item
        AutoSize = True
        Caption = 'Fejl'
        MaxWidth = 79
      end>
    HideSelection = False
    RowSelect = True
    SortType = stText
    TabOrder = 3
    ViewStyle = vsReport
    OnColumnClick = ScoreViewColumnClick
    OnCompare = ScoreViewCompare
  end
end
