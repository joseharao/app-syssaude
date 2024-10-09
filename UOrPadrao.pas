unit UOrPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PngBitBtn, pngimage, ExtCtrls;

type
  TfrmOrPadrao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Label1: TLabel;
    btImprimir: TPngBitBtn;
    btCancelar: TPngBitBtn;
    GroupBox1: TGroupBox;
    txtOrdernado: TRadioGroup;
    procedure btCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrPadrao: TfrmOrPadrao;
  SQL : String;
implementation

{$R *.dfm}

procedure TfrmOrPadrao.btCancelarClick(Sender: TObject);
begin
   close;
end;

procedure TfrmOrPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   release;
end;

procedure TfrmOrPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then begin
  Key := #0;
  Perform(WM_NEXTDLGCTL, 0, 0)
end;
end;

end.
