inherited frmEditaCliente: TfrmEditaCliente
  Caption = 'Edita Cliente'
  ClientWidth = 256
  Position = poDesktopCenter
  ExplicitWidth = 272
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 256
    ExplicitWidth = 256
    ExplicitHeight = 204
    object Label1: TLabel
      Left = 48
      Top = 64
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 48
      Top = 104
      Width = 28
      Height = 13
      Caption = 'Idade'
    end
    object DBEdit1: TDBEdit
      Left = 96
      Top = 61
      Width = 145
      Height = 21
      DataField = 'descricao'
      DataSource = ds_tabela
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 96
      Top = 101
      Width = 121
      Height = 21
      DataField = 'idade'
      DataSource = ds_tabela
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Width = 256
    ExplicitWidth = 256
    inherited btnCancelar: TButton
      Left = 166
      ExplicitLeft = 166
    end
  end
  inherited ds_tabela: TDataSource
    Left = 40
    Top = 136
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 136
    Top = 144
  end
end
