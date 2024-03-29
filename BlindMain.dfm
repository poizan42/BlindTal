object Form1: TForm1
  Left = 240
  Height = 310
  Top = 110
  Width = 342
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'BlindTal'
  ClientHeight = 291
  ClientWidth = 342
  Color = clBtnFace
  Constraints.MaxHeight = 310
  Constraints.MaxWidth = 342
  Constraints.MinHeight = 310
  Constraints.MinWidth = 342
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Menu = RxMainMenu1
  OnCreate = FormCreate
  OnKeyPress = Edit1KeyPress
  OnShow = FormShow
  LCLVersion = '1.0.4.0'
  object RxLabel1: TLabel
    Left = 143
    Height = 27
    Top = 8
    Width = 61
    Alignment = taCenter
    Caption = '0123456789'#13
    ParentColor = False
  end
  object SpeedButton2: TSpeedButton
    Left = 31
    Height = 22
    Top = 208
    Width = 32
    Caption = 'Start'
    Flat = True
    NumGlyphs = 0
    OnClick = Start1Click
  end
  object SpeedButton1: TSpeedButton
    Left = 271
    Height = 22
    Top = 208
    Width = 32
    Caption = 'Stop'
    Flat = True
    NumGlyphs = 0
    OnClick = Stop1Click
  end
  object RxLabel2: TLabel
    Left = 149
    Height = 14
    Top = 69
    Width = 45
    Anchors = [akTop, akLeft, akRight, akBottom]
    ParentColor = False
  end
  object SpeedButton3: TSpeedButton
    Left = 252
    Height = 22
    Top = 169
    Width = 71
    Flat = True
    NumGlyphs = 0
    OnClick = SpeedButton3Click
  end
  object Label8: TLabel
    Left = 104
    Height = 14
    Top = 69
    Width = 19
    Caption = 'Tid:'
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 103
    Height = 165
    Top = 90
    Width = 128
    BevelOuter = bvNone
    ClientHeight = 165
    ClientWidth = 128
    Enabled = False
    TabOrder = 0
    object SubBtn: TSpeedButton
      Left = 96
      Height = 32
      Top = 0
      Width = 32
      Caption = '-'
      Font.CharSet = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Times New Roman'
      GroupIndex = 1
      NumGlyphs = 0
      Spacing = 0
      ParentFont = False
    end
    object AddBtn: TSpeedButton
      Left = 96
      Height = 64
      Top = 32
      Width = 32
      Caption = '+'
      GroupIndex = 1
      NumGlyphs = 0
      Spacing = 0
    end
    object RetBtn: TSpeedButton
      Left = 96
      Height = 64
      Top = 96
      Width = 32
      Caption = 'Enter'
      Down = True
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      GroupIndex = 1
      NumGlyphs = 0
      Spacing = 0
      Transparent = False
      ParentFont = False
    end
    object Btn6: TSpeedButton
      Left = 64
      Height = 32
      Top = 64
      Width = 32
      Caption = '6'
      Glyph.Data = {
        66000000424D66000000000000003E00000028000000190000000A0000000100
        01000000000028000000000B0000000B0000020000000200000000000000FFFF
        FF00FFFFEF80FFFFE780FFFFE38000000080000000000000000000000080FFFF
        E380FFFFE780FFFFEF80
      }
      GroupIndex = 1
      Layout = blGlyphBottom
      NumGlyphs = 0
      Spacing = 0
    end
    object Btn3: TSpeedButton
      Left = 64
      Height = 32
      Top = 96
      Width = 32
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      GroupIndex = 1
      NumGlyphs = 0
      Spacing = 0
      ParentFont = False
    end
    object ComBtn: TSpeedButton
      Left = 64
      Height = 32
      Top = 128
      Width = 32
      Font.CharSet = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      GroupIndex = 1
      NumGlyphs = 0
      Spacing = 0
      ParentFont = False
    end
    object Btn7: TSpeedButton
      Left = 0
      Height = 32
      Top = 32
      Width = 32
      GroupIndex = 1
      NumGlyphs = 0
      Spacing = 0
    end
    object Btn4: TSpeedButton
      Left = 0
      Height = 32
      Top = 64
      Width = 32
      Caption = '4'
      Glyph.Data = {
        66000000424D66000000000000003E00000028000000190000000A0000000100
        01000000000028000000000B0000000B0000020000000200000000000000FFFF
        FF00FBFFFF80F3FFFF80E3FFFF8080000000000000000000000080000000E3FF
        FF80F3FFFF80FBFFFF80
      }
      GroupIndex = 1
      Layout = blGlyphBottom
      NumGlyphs = 0
      Spacing = 0
    end
    object Btn1: TSpeedButton
      Left = 0
      Height = 32
      Top = 96
      Width = 32
      GroupIndex = 1
      NumGlyphs = 0
      Spacing = 0
    end
    object Btn0: TSpeedButton
      Left = 0
      Height = 32
      Top = 128
      Width = 64
      GroupIndex = 1
      NumGlyphs = 0
      Spacing = 0
    end
    object DivBtn: TSpeedButton
      Left = 32
      Height = 32
      Top = 0
      Width = 32
      Caption = '/'
      GroupIndex = 1
      NumGlyphs = 0
      Spacing = 0
    end
    object Btn8: TSpeedButton
      Left = 32
      Height = 32
      Top = 32
      Width = 32
      Caption = '8'
      Glyph.Data = {
        A2000000424DA2000000000000003E000000280000000A000000190000000100
        01000000000064000000000B0000000B0000020000000200000000000000FFFF
        FF00E1C00000E1C00000E1C00000E1C00000E1C00000E1C00000E1C00000E1C0
        0000E1C00000E1C00000E1C00000E1C00000E1C00000E1C00000E1C00000E1C0
        0000E1C00000E1C00000E1C000000000000080400000C0C00000E1C00000E1C0
        0000F3C00000
      }
      GroupIndex = 1
      Layout = blGlyphRight
      NumGlyphs = 0
      Spacing = 0
    end
    object Btn5: TSpeedButton
      Left = 32
      Height = 32
      Top = 64
      Width = 32
      Caption = '5'
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      GroupIndex = 1
      NumGlyphs = 0
      Spacing = 0
      ParentFont = False
    end
    object Btn2: TSpeedButton
      Left = 32
      Height = 32
      Top = 96
      Width = 32
      Caption = '2'
      Glyph.Data = {
        A2000000424DA2000000000000003E000000280000000A000000190000000100
        01000000000064000000F00A0000F00A0000020000000200000000000000FFFF
        FF00F3C00000E1C00000E1C00000C0C000008040000000000000E1C00000E1C0
        0000E1C00000E1C00000E1C00000E1C00000E1C00000E1C00000E1C00000E1C0
        0000E1C00000E1C00000E1C00000E1C00000E1C00000E1C00000E1C00000E1C0
        0000E1C00000
      }
      GroupIndex = 1
      Layout = blGlyphRight
      NumGlyphs = 0
      Spacing = 0
    end
    object MulBtn: TSpeedButton
      Left = 64
      Height = 32
      Top = 0
      Width = 32
      Caption = '*'
      GroupIndex = 1
      NumGlyphs = 0
      Spacing = 0
    end
    object Btn9: TSpeedButton
      Left = 64
      Height = 32
      Top = 32
      Width = 32
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      GroupIndex = 1
      NumGlyphs = 0
      Spacing = 0
      ParentFont = False
    end
    object RxSpeedButton1: TSpeedButton
      Left = 0
      Height = 32
      Top = 0
      Width = 32
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      GroupIndex = 1
      NumGlyphs = 0
      Spacing = 0
      ParentFont = False
    end
    object Label1: TLabel
      Left = 4
      Height = 27
      Top = 3
      Width = 25
      Caption = 'Num'#13#10'Lock'
      ParentColor = False
    end
    object Label2: TLabel
      Left = 3
      Height = 24
      Top = 36
      Width = 26
      AutoSize = False
      Caption = '7'#13#10'Home'
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 66
      Height = 27
      Top = 36
      Width = 29
      Caption = '9'#13#10'Pg Up'
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 66
      Height = 27
      Top = 98
      Width = 29
      Caption = '3'#13#10'Pg Dn'
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 3
      Height = 27
      Top = 98
      Width = 20
      Caption = '1'#13#10'End'
      ParentColor = False
    end
    object Label6: TLabel
      Left = 67
      Height = 27
      Top = 131
      Width = 17
      Caption = ','#13#10'Del'
      ParentColor = False
    end
    object Label7: TLabel
      Left = 3
      Height = 27
      Top = 130
      Width = 15
      Caption = '0'#13#10'Ins'
      ParentColor = False
    end
  end
  object Edit1: TEdit
    Left = 26
    Height = 21
    Top = 43
    Width = 283
    AutoSize = False
    OnKeyPress = Edit1KeyPress
    ReadOnly = True
    TabOrder = 1
  end
  object RxMainMenu1: TMainMenu
    left = 28
    top = 97
    object Filer1: TMenuItem
      Caption = 'Filer'
      object Start1: TMenuItem
        Caption = 'Start'
        OnClick = Start1Click
      end
      object Stop1: TMenuItem
        Caption = 'Stop'
        OnClick = Stop1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Score1: TMenuItem
        Caption = 'Score'
        OnClick = Score1Click
      end
      object Intillinger1: TMenuItem
        Caption = 'Indstillinger'
        OnClick = Intillinger1Click
      end
      object Status1: TMenuItem
        Caption = 'Status'
        Checked = True
        OnClick = Status1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Luk1: TMenuItem
        Caption = 'Luk'
        ShortCut = 16465
        OnClick = Luk1Click
      end
    end
    object Om1: TMenuItem
      Caption = 'Om'
      OnClick = Om1Click
    end
  end
end
