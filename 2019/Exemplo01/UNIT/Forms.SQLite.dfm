object frmSQlite: TfrmSQlite
  Left = 0
  Top = 0
  Caption = 'frmSQlite'
  ClientHeight = 582
  ClientWidth = 909
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grdCliente: TDBGrid
    Left = 0
    Top = 0
    Width = 909
    Height = 541
    Align = alClient
    DataSource = dtsCliente
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 541
    Width = 909
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 855
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
  object ApplicationEvents: TApplicationEvents
    OnIdle = ApplicationEventsIdle
    Left = 720
    Top = 216
  end
  object dtsCliente: TDataSource
    DataSet = dmPrincipal.qrySQLCliente
    Left = 720
    Top = 152
  end
end
