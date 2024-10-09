unit UClassificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, FMTBcd, DB, SqlExpr, DBClient, Provider, StdCtrls, Buttons,
  PngBitBtn, pngimage, ExtCtrls, Mask, DBCtrls, rxToolEdit, RXDBCtrl;

type
  TfrmClassificacao = class(TfrmPadrao)
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label7: TLabel;
    cdsTabCOD_CLASS: TIntegerField;
    cdsTabDAT_CAD: TDateField;
    cdsTabDESCRICAO: TStringField;
    cdsTabACIMA_DE: TStringField;
    cdsTabIDADE_MIN: TIntegerField;
    cdsTabIDADE_MAX: TIntegerField;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    lblMaxima: TLabel;
    txtMaxima: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    cdsTabABAIXO_DE: TStringField;
    procedure btNovoClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClassificacao: TfrmClassificacao;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TfrmClassificacao.btGravarClick(Sender: TObject);
begin
if Vazio(DBEdit2.Text) then begin
   application.MessageBox('Informe o Nome do Agente.', 'Atenção', MB_IconQuestion);
   DBEdit2.SetFocus;
   Exit;
end;

  inherited;
end;

procedure TfrmClassificacao.btNovoClick(Sender: TObject);
begin
  inherited;
  cdsTabCOD_CLASS.AsInteger := PegaSequencia('GEN_CLASSIFICACAO_ID');
  cdsTabDAT_CAD.AsDateTime := Date;
  cdsTabACIMA_DE.AsString := 'N';
  DBEdit2.SetFocus;
end;

end.
