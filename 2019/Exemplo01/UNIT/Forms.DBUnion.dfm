object frmDBUnion: TfrmDBUnion
  Left = 0
  Top = 0
  Caption = 'frmDBUnion'
  ClientHeight = 642
  ClientWidth = 960
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlOptions: TPanel
    Left = 0
    Top = 0
    Width = 960
    Height = 49
    Align = alTop
    TabOrder = 0
    object rgpOptions: TRadioGroup
      Left = 328
      Top = 1
      Width = 631
      Height = 47
      Align = alRight
      Columns = 5
      Items.Strings = (
        'Todos os Registros'
        'Itens Duplicados'
        'Itens '#218'nicos'
        'Registros V'#225'lidos'
        'Registros Inv'#225'lidos')
      TabOrder = 0
      OnClick = rgpOptionsClick
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 601
    Width = 960
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object lblRecordCount: TLabel
      Left = 8
      Top = 11
      Width = 169
      Height = 22
      AutoSize = False
      Caption = 'Total de Registros:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object grdData: TDBGrid
    Left = 0
    Top = 49
    Width = 960
    Height = 552
    Align = alClient
    DataSource = dtsData
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dtsData: TDataSource
    Left = 768
    Top = 128
  end
  object ApplicationEvents: TApplicationEvents
    OnIdle = ApplicationEventsIdle
    Left = 768
    Top = 184
  end
end
