object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Exemplo 01'
  ClientHeight = 609
  ClientWidth = 927
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 927
    Height = 49
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object pnlButton: TPanel
      Left = 1
      Top = 1
      Width = 456
      Height = 47
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object btnFirebird: TButton
        Left = 0
        Top = 0
        Width = 112
        Height = 47
        Align = alLeft
        Caption = 'Firebird'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = False
        OnClick = btnFirebirdClick
      end
      object btnSQLite: TButton
        Left = 112
        Top = 0
        Width = 112
        Height = 47
        Align = alLeft
        Caption = 'SQLite'
        TabOrder = 1
        TabStop = False
        OnClick = btnSQLiteClick
      end
      object btnUnion: TButton
        Left = 336
        Top = 0
        Width = 120
        Height = 47
        Align = alLeft
        Caption = 'Dados Agrupados'
        TabOrder = 2
        TabStop = False
        OnClick = btnUnionClick
      end
      object btnXML: TButton
        Left = 224
        Top = 0
        Width = 112
        Height = 47
        Align = alLeft
        Caption = 'XML'
        TabOrder = 3
        TabStop = False
        OnClick = btnXMLClick
      end
    end
    object pnlLabel: TPanel
      Left = 457
      Top = 1
      Width = 469
      Height = 47
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object lblSelection: TLabel
        Left = 60
        Top = 14
        Width = 337
        Height = 26
        Alignment = taCenter
        AutoSize = False
        Caption = 'lblSelection'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object pnlBody: TPanel
    Left = 0
    Top = 49
    Width = 927
    Height = 560
    Align = alClient
    TabOrder = 1
  end
end
