unit Uerro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, pngimage, Buttons, PngBitBtn;

type
  TfrmErro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lblClasse: TLabel;
    lblErro: TMemo;
    Image1: TImage;
    btFechar: TPngBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmErro: TfrmErro;

implementation

{$R *.dfm}

procedure TfrmErro.btFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmErro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   release;
end;

end.
