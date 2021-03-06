unit ufrmEditaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.ExtCtrls;

type
  TfrmEditaBase = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ds_tabela: TDataSource;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditaBase: TfrmEditaBase;

implementation

{$R *.dfm}

procedure TfrmEditaBase.btnCancelarClick(Sender: TObject);
begin
ds_tabela.DataSet.Cancel;
  close;
end;

procedure TfrmEditaBase.btnSalvarClick(Sender: TObject);
begin

  try
    if (ds_tabela.DataSet.State in [dsInsert, dsEdit]) then
    begin
      if MessageDlg('deseja confirmar?', mtConfirmation, mbYesNo, 0) = mrYes
      then
      begin
        if (ds_tabela.DataSet.State in [dsInsert, dsEdit]) then
        begin
          ds_tabela.DataSet.Post;
          close;
        end;
      end;
    end;
  except
    on e: Exception do
      raise Exception.Create(e.Message);
  end;

end;

procedure TfrmEditaBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

end.
