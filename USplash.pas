unit USplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, pngimage;

type
  TfrmSplash = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    P: TProgressBar;
    lblProg: TLabel;
    Image1: TImage;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;
implementation

uses UDados;

{$R *.dfm}

procedure TfrmSplash.FormActivate(Sender: TObject);
begin
   Repaint;
   lblProg.Caption := 'Conectando ao Banco de Dados...';
   p.Position := p.Position + 10;
   application.ProcessMessages;
   sleep(300);
   lblProg.Caption := 'Verificando �ndices do Banco de Dados...';
   p.Position := p.Position + 20;
   application.ProcessMessages;
   sleep(500);
   lblProg.Caption := 'Abrindo Tabelas Necess�rios do Banco de Dados...';
   p.Position := p.Position + 10;
   application.ProcessMessages;
   sleep(400);
   lblProg.Caption := 'Verificando �ndices do Banco de Dados...';
   p.Position := p.Position + 15;
   application.ProcessMessages;
   sleep(300);
   lblProg.Caption := 'Carregando Par�mentros do Sistema...';
   p.Position := p.Position + 30;
   application.ProcessMessages;
   sleep(400);
   lblProg.Caption := 'Abrindo o Sistema...';
   p.Position := p.Position + 30;
   application.ProcessMessages;
   sleep(300);
end;

end.
