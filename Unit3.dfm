object SetDia: TSetDia
  Left = 194
  Height = 245
  Top = 114
  Width = 427
  BorderStyle = bsDialog
  Caption = 'Indstillinger'
  ClientHeight = 245
  ClientWidth = 427
  Color = clBtnFace
  OnShow = FormShow
  ParentFont = True
  Position = poScreenCenter
  LCLVersion = '1.0.4.0'
  object Panel1: TPanel
    Left = 0
    Height = 211
    Top = 0
    Width = 427
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    ClientHeight = 211
    ClientWidth = 427
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 20
      Height = 58
      Top = 7
      Width = 400
      Caption = 'Point Fil'
      ClientHeight = 40
      ClientWidth = 396
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 346
        Height = 21
        Top = 7
        Width = 43
        Caption = 'Nulstil'
        NumGlyphs = 0
        OnClick = SpeedButton1Click
      end
      object PointFilePath: TFileNameEdit
        Left = 10
        Height = 21
        Top = 7
        Width = 334
        DialogTitle = 'Point gemning fil'
        DialogOptions = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
        Filter = 'BlindTal Gemning (*.bts)|*.bts|Alle filer (*.*)|*.*'
        FilterIndex = 0
        DefaultExt = 'bts'
        HideDirectories = False
        ButtonWidth = 0
        NumGlyphs = 1
        MaxLength = 0
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 20
      Height = 125
      Top = 79
      Width = 400
      Caption = 'Taster'
      ClientHeight = 107
      ClientWidth = 396
      TabOrder = 1
      object MatBox: TCheckBox
        Left = 10
        Height = 17
        Top = 5
        Width = 170
        Caption = 'Brug matematiske taster (/*-+)'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object TPOSpin: TRxSpinEdit
        Left = 290
        Height = 21
        Top = 5
        Width = 80
        Value = 4
        TabOrder = 1
        Visible = False
      end
      object DecBox: TCheckBox
        Left = 10
        Height = 17
        Top = 29
        Width = 92
        Caption = 'Brug decimaltal'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object RetBox: TCheckBox
        Left = 10
        Height = 17
        Top = 54
        Width = 202
        Caption = 'Afslut hver opgave med Enter-tasten '
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object NegBox: TCheckBox
        Left = 10
        Height = 17
        Top = 78
        Width = 329
        Caption = 'Brug negative tal (oftere forekomst af minus-tegnet foran tallet)'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Height = 34
    Top = 211
    Width = 427
    Align = alBottom
    BevelOuter = bvNone
    ClientHeight = 34
    ClientWidth = 427
    TabOrder = 1
    object OKBtn: TButton
      Left = 265
      Height = 25
      Top = 2
      Width = 75
      Caption = 'OK'
      Default = True
      ModalResult = 1
      OnClick = OKBtnClick
      TabOrder = 0
    end
    object CancelBtn: TButton
      Left = 345
      Height = 25
      Top = 2
      Width = 75
      Cancel = True
      Caption = 'Annuller'
      ModalResult = 2
      OnClick = CancelBtnClick
      TabOrder = 1
    end
  end
end
