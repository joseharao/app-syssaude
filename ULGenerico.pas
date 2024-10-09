unit ULGenerico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, PngBitBtn, Grids, DBGrids, FMTBcd, DB,
  SqlExpr, Provider, DBClient;

type
  TfrmLGenerico = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    status: TPanel;
    GroupBox1: TGroupBox;
    btConsultar: TPngBitBtn;
    btEditar: TPngBitBtn;
    GroupBox2: TGroupBox;
    lblRegistro: TLabel;
    grdDados: TDBGrid;
    dsTab: TDataSource;
    cdsTab: TClientDataSet;
    dspTab: TDataSetProvider;
    sqlTab: TSQLQuery;
    procedure Consultar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdDadosTitleClick(Column: TColumn);
    procedure btConsultarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sql : String;
  end;

var
  frmLGenerico: TfrmLGenerico;

implementation

uses UDados, UPrincipal, UFuncoes;

{$R *.dfm}

procedure TfrmLGenerico.btConsultarClick(Sender: TObject);
begin
  Consultar;
end;

procedure TfrmLGenerico.Consultar;
begin
   //Processo para efetuar consulta padrão
   cdsTab.Close;
   sqlTab.Close;
   sqlTab.SQL.Clear;
   sqlTab.SQL.Add(sql);
   cdsTab.Open;
   if cdsTab.Eof then begin
      lblRegistro.Caption := 'Registro(s) Listado(s): 0';
   end else begin
      lblRegistro.Caption := 'Registro(s) Listado(s): ' + IntToStr(cdsTab.RecordCount);
   end;
end;

procedure TfrmLGenerico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 release;
end;

procedure TfrmLGenerico.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then begin
  Key := #0;
  Perform(WM_NEXTDLGCTL, 0, 0)
end;
end;

procedure TfrmLGenerico.FormShow(Sender: TObject);
begin
  status.Caption := frmPrincipal.sistema;
end;

procedure TfrmLGenerico.grdDadosTitleClick(Column: TColumn);
var
  i : integer;
begin
 for I := 0 to grdDados.Columns.Count - 1 do begin
      if (grdDados.Columns[i].Title.Font.Style = [fsBold]) then begin
         grdDados.Columns[i].Title.Font.Color := clBlack;
         grdDados.Columns[i].Title.Font.Style := [];
      end;
 end;
   cdsTab.IndexFieldNames := Column.FieldName;
   Column.Title.Font.Style := [fsBold];
 for I := 0 to grdDados.Columns.Count - 1 do begin
      if (grdDados.Columns[i].Title.Font.Style = [fsBold]) then begin
         grdDados.Columns[i].Title.Font.Color := clBlue;
         grdDados.Columns[i].Title.Font.Style := [fsBold];
      end else begin
         grdDados.Columns[i].Title.Font.Color := clBlack;
         grdDados.Columns[i].Title.Font.Style := [];
      end;
   end;
end;

end.
