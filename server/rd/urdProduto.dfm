object RDProduto: TRDProduto
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  Height = 380
  Width = 496
  object qry: TSQLQuery
    Params = <>
    Left = 16
    Top = 16
  end
  object qry_produto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from produto')
    Left = 88
    Top = 16
    object qry_produtoid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qry_produtodescricao: TStringField
      FieldName = 'descricao'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object dsp_produto: TDataSetProvider
    DataSet = qry_produto
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    OnDataRequest = dsp_produtoDataRequest
    AfterUpdateRecord = dsp_produtoAfterUpdateRecord
    Left = 184
    Top = 16
  end
end
