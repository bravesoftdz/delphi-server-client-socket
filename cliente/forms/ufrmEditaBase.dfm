object frmEditaBase: TfrmEditaBase
  Left = 0
  Top = 0
  Caption = 'edita base'
  ClientHeight = 257
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 307
    Height = 204
    Align = alClient
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 204
    Width = 307
    Height = 53
    Align = alBottom
    TabOrder = 1
    object btnSalvar: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 136
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object ds_tabela: TDataSource
    Left = 16
    Top = 336
  end
end
