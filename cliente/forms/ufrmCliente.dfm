inherited frmCliente: TfrmCliente
  Caption = 'Clientes'
  ClientHeight = 495
  ClientWidth = 758
  OnCreate = FormCreate
  ExplicitWidth = 774
  ExplicitHeight = 534
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Left = 614
    Height = 422
    ExplicitLeft = 614
    ExplicitHeight = 422
    inherited btnInserir: TButton
      OnClick = btnInserirClick
    end
    inherited btnEditar: TButton
      OnClick = btnEditarClick
    end
  end
  inherited Panel3: TPanel
    Width = 614
    Height = 422
    ExplicitWidth = 614
    ExplicitHeight = 422
    inherited grid: TDBGrid
      Width = 612
      Height = 420
    end
  end
  inherited Panel2: TPanel
    Width = 758
    ExplicitWidth = 758
    inherited btnPesquisar: TButton
      OnClick = btnPesquisarClick
    end
  end
end
