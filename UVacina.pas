unit UVacina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPadrao, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Datasnap.DBClient, Datasnap.Provider, Vcl.StdCtrls, Vcl.Buttons,
  PngBitBtn, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmVacina = class(TfrmPadrao)
    cdsTabCOD_VACINA: TIntegerField;
    cdsTabNOME_VACINA: TStringField;
    cdsTabMES_PARA_APLICACAO: TIntegerField;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    cdsTabIDADE: TStringField;
    cdsTabDETALHES_VACINA: TStringField;
    cdsTabDOSE: TStringField;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    procedure btNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVacina: TfrmVacina;

implementation

{$R *.dfm}

uses UFuncoes;

procedure TfrmVacina.btNovoClick(Sender: TObject);
begin
  inherited;
  cdsTabCOD_VACINA.AsInteger := PegaSequencia('GEN_VACINA_ID');
  DBEdit1.SetFocus;
end;

end.
