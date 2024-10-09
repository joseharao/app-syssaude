program Sistema;

uses
  Forms,
  Midas,
  MidasLib,
  RLConsts,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  UDados in 'UDados.pas' {Dados: TDataModule},
  ULogin in 'ULogin.pas' {frmLogin},
  UFuncoes in 'UFuncoes.pas',
  UBD in 'UBD.pas' {frmBD},
  USplash in 'USplash.pas' {frmSplash},
  UAssistente in 'UAssistente.pas' {frmAssistente},
  UBackUp in 'UBackUp.pas' {frmBackup},
  USobre in 'USobre.pas' {frmSobre},
  ULUsuario in 'ULUsuario.pas' {frmLUsuario},
  UUsuario in 'UUsuario.pas' {frmUsuarios},
  ULClassificacao in 'ULClassificacao.pas' {frmLClassificacao},
  UClassificacao in 'UClassificacao.pas' {frmClassificacao},
  ULPosicao in 'ULPosicao.pas' {frmLPosicao},
  UPosicao in 'UPosicao.pas' {frmPosicao},
  ULAgravos in 'ULAgravos.pas' {frmLAgravos},
  UAgravo in 'UAgravo.pas' {frmAgravo},
  ULMedicamentos in 'ULMedicamentos.pas' {frmLMedicamento},
  UMedicamento in 'UMedicamento.pas' {frmMedicamento},
  ULPaciente in 'ULPaciente.pas' {frmLPacientes},
  UPessoa in 'UPessoa.pas' {frmPessoa},
  ULGenerico in 'ULGenerico.pas' {frmLGenerico},
  ULDeficiencia in 'ULDeficiencia.pas' {frmLDeficiencia},
  UDeficiencia in 'UDeficiencia.pas' {frmDeficiencia},
  UPadrao in 'UPadrao.pas' {frmPadrao},
  UParam in 'UParam.pas' {frmParam},
  UOrEntrega in 'UOrEntrega.pas' {frmOrEntrega},
  UREntrega in 'UREntrega.pas' {frmREntrega},
  URelFicha in 'URelFicha.pas' {frmRelFicha},
  ULVacina in 'ULVacina.pas' {frmLVacinas},
  UVacina in 'UVacina.pas' {frmVacina},
  UOrPadrao in 'UOrPadrao.pas' {frmOrPadrao},
  UOrCriancasVacinacaoExtra in 'UOrCriancasVacinacaoExtra.pas' {frmOrRVacinaExtra},
  URelPadrao in 'URelPadrao.pas' {frmRelPadrao},
  URVacinacaoExtra in 'URVacinacaoExtra.pas' {frmRVacinacaoExtra};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDados, Dados);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmSplash, frmSplash);
  frmSplash.Update;
   frmSplash.Show;
   frmSplash.Free;
   AbreForm(TfrmBD, frmBD);
   Application.Run;
end.
