unit urdProduto;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, PrjServer_TLB, StdVcl, Data.FMTBcd, Data.DBXMySQL, Data.DB,
  Data.SqlExpr, Datasnap.Provider;

type
  TRDProduto = class(TRemoteDataModule, IRDProduto)
    qry: TSQLQuery;
    qry_produto: TSQLQuery;
    dsp_produto: TDataSetProvider;
    qry_produtoid: TIntegerField;
    qry_produtodescricao: TStringField;
    procedure dsp_produtoAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure RemoteDataModuleCreate(Sender: TObject);
    function dsp_produtoDataRequest(Sender: TObject; Input: OleVariant)
      : OleVariant;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean;
      const ClassID, ProgID: string); override;
  public
    { Public declarations }
    function generator: integer;
  end;

implementation

{$R *.DFM}

uses udmConexao;

// #################################################################################
procedure TRDProduto.dsp_produtoAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  if UpdateKind = ukInsert then
    DeltaDS.FieldByName('id').newvalue := generator;
end;

// #################################################################################
function TRDProduto.dsp_produtoDataRequest(Sender: TObject; Input: OleVariant)
  : OleVariant;
var
  wsql: string;
begin
  wsql := 'select * from produto';
  if (Input[0] <> '') then
  begin
    wsql := wsql + ' where descricao like :nome';
  end
  else
    wsql := 'select * from produto';

  qry_produto.Close;
  qry_produto.SQL.Clear;
  qry_produto.SQL.Add(wsql);

  if (Input[0] <> '') then
  begin
    qry_produto.ParamByName('nome').AsString := '%' + Input[0] + '%';

  end;
  result := dsp_produto.Data;
end;

// #################################################################################
function TRDProduto.generator: integer;
begin
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('select max(id)+1 as sequenciador from produto');
  qry.Open;
  if qry.FieldByName('sequenciador').AsInteger = 1 then
    result := 1
  else
    result := qry.FieldByName('sequenciador').AsInteger;

end;

// #################################################################################
procedure TRDProduto.RemoteDataModuleCreate(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TSQLQuery) then
    begin
      (Components[i] as TSQLQuery).SQLConnection := dmConexao.conexao;
    end;
  end;
end;

// #################################################################################
class procedure TRDProduto.UpdateRegistry(Register: Boolean;
  const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end
  else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

initialization

TComponentFactory.Create(ComServer, TRDProduto, Class_RDProduto,
  ciMultiInstance, tmApartment);

end.
