unit UFuncoes;

interface
  uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DBCtrls, DateUtils,
  Dialogs, Menus, ExtCtrls, StdCtrls, SqlExpr, IdHashMessageDigest, JPeg, DB, Math;

  procedure CentralizaPainel(Painel : TPanel; Altura : integer; Largura: integer);
  function PegaSequencia(Generator : String) : Integer;
  function Vazio(Texto : String):Boolean;
  function GetComputerNameFunc : string;
  function TestaCpfCgc(Dado: string): String;
  function TestaCGC(Dado : string) : boolean;
  function TestaCPF(Dado : string) : boolean;
  function DataToSql(Data: String) : String;
  procedure AbreTabela(Sql : String; objTabela :TSQLQuery);
  procedure AbreForm(Componete :  TComponentClass; Nome : TForm);
  Procedure GravaFoto( NomeCampo: TBlobField; FileName: String );
  Procedure ObtemFoto( NomeCampo: TBlobField; Var imgDestino: TImage );
  procedure CaixaAlta(Form: TForm);
  function DataValida(const S: string): boolean;
  function MD5(const texto:string):string;
  function TiraBarra(Texto : String):String;
  procedure ArredondarCanto(Componente: TWinControl; const Radius: SmallInt);
  function CentralizaTexto (wStr1: String; wTama: Integer): String;
  function PreencheTexto(wStr1, wStr2, wStr3: String; wTama: Integer): String;
  function ValorPorExtenso(vlr: real): string;
implementation

uses UDados;

function ValorPorExtenso(vlr: real): string;
const
  unidade: array[1..19] of string = ('um', 'dois', 'tres', 'quatro', 'cinco',
             'seis', 'sete', 'oito', 'nove', 'dez', 'onze',
             'doze', 'treze', 'quatorze', 'quinze', 'dezesseis',
             'dezessete', 'dezoito', 'dezenove');
  centena: array[1..9] of string = ('cento', 'duzentos', 'trezentos',
             'quatrocentos', 'quinhentos', 'seiscentos',
             'setecentos', 'oitocentos', 'novecentos');
  dezena: array[2..9] of string = ('vinte', 'trinta', 'quarenta', 'cinquenta',
             'sessenta', 'setenta', 'oitenta', 'noventa');
  qualificaS: array[0..4] of string = ('', 'mil', 'milhao', 'bilhao', 'trilhao');
  qualificaP: array[0..4] of string = ('', 'mil', 'milhoes', 'bilhoes', 'trilhoes');
var
                        inteiro: Int64;
                          resto: real;
  vlrS, s, saux, vlrP, centavos: string;
     n, unid, dez, cent, tam, i: integer;
                    umReal, tem: boolean;
begin
  if (vlr = 0)
     then begin
            valorPorExtenso := 'zero';
            exit;
          end;

  inteiro := trunc(vlr); // parte inteira do valor
  resto := vlr - inteiro; // parte fracionária do valor
  vlrS := inttostr(inteiro);
  if (length(vlrS) > 15)
     then begin
            valorPorExtenso := 'Erro: valor superior a 999 trilhões.';
            exit;
          end;

  s := '';
  centavos := inttostr(round(resto * 100));

// definindo o extenso da parte inteira do valor
  i := 0;
  umReal := false; tem := false;
  while (vlrS <> '0') do
  begin
    tam := length(vlrS);
// retira do valor a 1a. parte, 2a. parte, por exemplo, para 123456789:
// 1a. parte = 789 (centena)
// 2a. parte = 456 (mil)
// 3a. parte = 123 (milhões)
    if (tam > 3)
       then begin
              vlrP := copy(vlrS, tam-2, tam);
              vlrS := copy(vlrS, 1, tam-3);
            end
    else begin // última parte do valor
           vlrP := vlrS;
           vlrS := '0';
         end;
    if (vlrP <> '000')
       then begin
              saux := '';
              if (vlrP = '100')
                 then saux := 'cem'
              else begin
                     n := strtoint(vlrP);        // para n = 371, tem-se:
                     cent := n div 100;          // cent = 3 (centena trezentos)
                     dez := (n mod 100) div 10;  // dez  = 7 (dezena setenta)
                     unid := (n mod 100) mod 10; // unid = 1 (unidade um)
                     if (cent <> 0)
                        then saux := centena[cent];
                     if ((dez <> 0) or (unid <> 0))
                        then begin
                               if ((n mod 100) <= 19)
                                  then begin
                                         if (length(saux) <> 0)
                                            then saux := saux + ' e ' + unidade[n mod 100]
                                         else saux := unidade[n mod 100];
                                       end
                               else begin
                                      if (length(saux) <> 0)
                                         then saux := saux + ' e ' + dezena[dez]
                                      else saux := dezena[dez];
                                      if (unid <> 0)
                                         then if (length(saux) <> 0)
                                                 then saux := saux + ' e ' + unidade[unid]
                                              else saux := unidade[unid];
                                    end;
                             end;
                   end;
              if ((vlrP = '1') or (vlrP = '001'))
                 then begin
                        if (i = 0) // 1a. parte do valor (um real)
                           then umReal := true
                        else saux := saux + ' ' + qualificaS[i];
                      end
              else if (i <> 0)
                      then saux := saux + ' ' + qualificaP[i];
              if (length(s) <> 0)
                 then s := saux + ', ' + s
              else s := saux;
            end;
    if (((i = 0) or (i = 1)) and (length(s) <> 0))
       then tem := true; // tem centena ou mil no valor
    i := i + 1; // próximo qualificador: 1- mil, 2- milhão, 3- bilhão, ...
  end;

  if (length(s) <> 0)
     then begin
            if (umReal)
               then s := s + ' real'
            else if (tem)
                    then s := s + ' reais'
                 else s := s + ' de reais';
          end;
// definindo o extenso dos centavos do valor
  if (centavos <> '0') // valor com centavos
     then begin
            if (length(s) <> 0) // se não é valor somente com centavos
               then s := s + ' e ';
            if (centavos = '1')
               then s := s + 'um centavo'
            else begin
                   n := strtoint(centavos);
                   if (n <= 19)
                      then s := s + unidade[n]
                   else begin                 // para n = 37, tem-se:
                          unid := n mod 10;   // unid = 37 % 10 = 7 (unidade sete)
                          dez := n div 10;    // dez  = 37 / 10 = 3 (dezena trinta)
                          s := s + dezena[dez];
                          if (unid <> 0)
                             then s := s + ' e ' + unidade[unid];
                       end;
                   s := s + ' centavos';
                 end;
          end;
  valorPorExtenso := s;
end;


function PreencheTexto(wStr1, wStr2, wStr3: String; wTama: Integer): String;
var v : Integer;
begin

  wStr1 := Trim(wStr1);

  Result := '';
  for v:=1 to wTama-Length(wStr1) do Result := Result + wStr2;

  if wStr3 = 'E' then
     Result := Result + wStr1
  else
     Result := wStr1 + Result;

end;

function CentralizaTexto (wStr1: String; wTama: Integer): String;
var i: Integer;
     wSpac: String;
begin

  wSpac := '';
  For i:=1 to wTama do wSpac := wSpac + ' ';

  wStr1 := Trim(wStr1);

 Result := Copy(wSpac,1,(wTama div 2)-(Length(wStr1) div 2))+
               wStr1                                            +
               Copy(wSpac,1,(wTama div 2)-(Length(wStr1) div 2));

end;

procedure ArredondarCanto(Componente: TWinControl; const Radius: SmallInt);
var
  R : TRect;
  Rgn : HRGN;
begin
  with Componente do
  begin
    R := ClientRect;
    Rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, Radius, Radius);
    Perform(EM_GETRECT, 0, lParam(@R));
    InflateRect(R, -5, -5);
    Perform(EM_SETRECTNP, 0, lParam(@R));
    SetWindowRgn(Handle, Rgn, True);
    Invalidate;
  end;
end;

function TiraBarra(Texto : String):string;
     var
       i : integer;
       str : string;
    begin
     //procedimento para verificação
      if Length(Texto) > 0  then begin
         for I := 0 to Length(Texto) - 1 do begin
           if (copy(texto, i, 1) <> '/') and (copy(texto, i, 1) <> ':') then begin
              str := str + Copy(texto, i, 1);
           end;
         end;
         Result := str;
      end else begin
         Result := '';
      end;
    end;

//Procedimento para colocar todos os edits em maiusculas
procedure CaixaAlta(Form: TForm);
var
  i: integer;
begin
   for I := 0 to Form.ComponentCount - 1 do begin
      if ((Form.Components[i]) is TDBEdit) then begin
          ((Form.Components[i]) as TDBEdit).CharCase := ecUpperCase;
      end;
      if ((Form.Components[i]) is TEdit) then begin
          ((Form.Components[i]) as TEdit).CharCase := ecUpperCase;
      end;
   end;
end;

function DataValida(const S: string): boolean;
 var TestDate : tdatetime;
begin
 Result := False;
 if (LastDelimiter('/',S) >= 4) and (Length(S)-LastDelimiter('/',S) >= 4) then begin
    Result := TryStrToDate(S,TestDate);
 end;
end;

Procedure ObtemFoto( NomeCampo: TBlobField; Var imgDestino: TImage );
Var
  jpgImg: TJPEGImage;
  stMem: TMemoryStream;
begin
  If TBlobField( NomeCampo ).IsNull or (TBlobField(NomeCampo).BlobSize = 0) Then
  Begin
    imgDestino.Picture := Nil;
    Exit;
  End;
  jpgImg := TJPEGImage.Create;
  stMem := TMemoryStream.Create;
  try
    TBlobField( NomeCampo ).SaveToStream( stMem );
    stMem.Position := 0;
    jpgImg.LoadFromStream( stMem );
    imgDestino.Picture.Assign( jpgImg );
  finally
    stMem.Free;
    jpgImg.Free;
  end;
end;

Procedure GravaFoto( NomeCampo: TBlobField; FileName: String );
Var
  stImagem: TFileStream;
Begin
  stImagem := TFileStream.Create( FileName, fmOpenRead Or fmShareDenyWrite );
  Try
    TBlobField( NomeCampo ).LoadFromStream( stImagem );
  Finally
    stImagem.Free;
  End;
End;

//Função para criptografar senhas em md5
function MD5(const texto:string):string;
var
  idmd5 : TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := idmd5.HashStringAsHex(texto);
  finally
    idmd5.Free;
  end;
end;

//Função para retornar o valor do generator
  function PegaSequencia(Generator : String) : Integer;
  begin
     dados.sqlBusca.Close;
     dados.sqlBusca.SQL.Clear;
     dados.sqlBusca.SQL.Add('SELECT GEN_ID('+Generator+', 1) AS RESULTADO FROM RDB$DATABASE');
     dados.sqlBusca.Open;
     Result := dados.sqlBusca.FieldByName('RESULTADO').AsInteger;
  end;
//procedimento para abre formulario em uma linha so
procedure AbreForm(Componete :  TComponentClass; Nome : TForm);
begin
  Application.CreateForm(Componete, Nome);
  Nome.ShowModal;
end;
//procedimento para abre tabelas avulsas
procedure AbreTabela(Sql : String; objTabela :TSQLQuery);
begin
   objTabela.Close;
   objTabela.SQL.Clear;
   objTabela.SQL.Add(Sql);
   objTabela.Open;
end;
//Função para virar data para colocar em sql
function DataToSql(Data: String) : String;
var
  dia, mes, ano : String;
  Dt : String;
begin
  dia := Copy(Data, 0, 2);
  mes := Copy(Data, 4, 2);
  ano := Copy(Data, 7, 4);
  dt := ano + '/' + mes + '/' + dia;
  result := dt;
end;
//Função para testar cpf e cnpj se e válido
function TestaCpfCgc(Dado: string): String;
var
  i: integer;
begin
  for i:= 1 to length(Dado) do begin
    if not (Dado[i] in ['0'..'9']) then
      delete(Dado,i,1);
  end;
  if ((length(Dado) <> 11) and (length(Dado) <> 14))then begin
     Application.MessageBox('ATENÇÃO: O número informado NÃO representa' + #13 +'um CPF ou CGC válido pelas regras da Receita Federal','CPF / CNPJ Inválido',MB_ICONWARNING);
    if length(Dado) = 14 then begin
     if TestaCGC(Dado) then begin
        insert('-',Dado,13);
        insert('/',Dado,9);
        insert('.',Dado,6);
        insert('.',Dado,3);
     end
  end else begin
     Application.MessageBox('O número informado NÃO representa um CGC' + #13 +'válido pelas regras da Receita Federal', 'CNPJ Inválido', MB_ICONWARNING);
  end;
  if length(Dado) = 11 then begin
     if TestaCPF(Dado) then begin
        insert('-',Dado,10);
        insert('.',Dado,7);
        insert('.',Dado,4);
     end
  end else begin
     application.MessageBox('O número informado NÃO representa um CPF' + #13 +'válido pelas regras da Receita Federal', 'CPF Inválido', MB_ICONWARNING);
  end;
  end;
  Result := Dado;

end;

function TestaCGC(Dado : string) : boolean;
  var  D1            : array[1..12] of byte;
     I,
     DF1,
     DF2,
     DF3,
     DF4,
     DF5,
     DF6,
     Resto1,
     Resto2,
     PrimeiroDigito,
     SegundoDigito : integer;
begin
     Result := true;
     if Vazio(Dado) then
        exit;
     if Length(Dado) = 14 then
     begin
          for I := 1 to 12 do
               if Dado[I] in ['0'..'9'] then
                    D1[I] := StrToInt(Dado[I])
               else
                    Result := false;
          if Result then
          begin
               DF1 := 0;
               DF2 := 0;
               DF3 := 0;
               DF4 := 0;
               DF5 := 0;
               DF6 := 0;
               Resto1 := 0;
               Resto2 := 0;
               PrimeiroDigito := 0;
               SegundoDigito := 0;
               DF1 := 5*D1[1] + 4*D1[2] + 3*D1[3] + 2*D1[4] + 9*D1[5] + 8*D1[6] +
                      7*D1[7] + 6*D1[8] + 5*D1[9] + 4*D1[10] + 3*D1[11] + 2*D1[12];
               DF2 := DF1 div 11;
               DF3 := DF2 * 11;
               Resto1 := DF1 - DF3;
               if (Resto1 = 0) or (Resto1 = 1) then
                    PrimeiroDigito := 0
               else
                    PrimeiroDigito := 11 - Resto1;
               DF4 := 6*D1[1] + 5*D1[2] + 4*D1[3] + 3*D1[4] + 2*D1[5] + 9*D1[6] +
                      8*D1[7] + 7*D1[8] + 6*D1[9] + 5*D1[10] + 4*D1[11] + 3*D1[12] +
                      2*PrimeiroDigito;
               DF5 := DF4 div 11;
               DF6 := DF5 * 11;
               Resto2 := DF4 - DF6;
                if (Resto2 = 0) or (Resto2 = 1) then
                     SegundoDigito := 0
                else
                     SegundoDigito := 11 - Resto2;
                if (PrimeiroDigito <> StrToInt(Dado[13])) or
                   (SegundoDigito <> StrToInt(Dado[14])) then
                     Result := false;
           end;
      end
  else
           if Length(Dado) <> 0 then
                 Result := false;
  end;
{Valida dígito verificador de CPF}
function TestaCPF(Dado : string) : boolean;
var  D1            : array[1..9] of byte;
     I,
     DF1,
     DF2,
     DF3,
     DF4,
     DF5,
     DF6,
     Resto1,
     Resto2,
     PrimeiroDigito,
     SegundoDigito : integer;
begin
     Result := true;
     if Vazio(Dado) then
        exit;
     if Length(Dado) = 11 then
     begin
          for I := 1 to 9 do
               if Dado[I] in ['0'..'9'] then
                    D1[I] := StrToInt(Dado[I])
               else
                    Result := false;
          if Result then
          begin
               DF1 := 0;
               DF2 := 0;
               DF3 := 0;
               DF4 := 0;
               DF5 := 0;
               DF6 := 0;
               Resto1 := 0;
               Resto2 := 0;
               PrimeiroDigito := 0;
               SegundoDigito := 0;
               DF1 := 10*D1[1] + 9*D1[2] + 8*D1[3] + 7*D1[4] + 6*D1[5] + 5*D1[6] +
                      4*D1[7] + 3*D1[8] + 2*D1[9];
               DF2 := DF1 div 11;
               DF3 := DF2 * 11;
               Resto1 := DF1 - DF3;
               if (Resto1 = 0) or (Resto1 = 1) then
                    PrimeiroDigito := 0
               else
                    PrimeiroDigito := 11 - Resto1;
               DF4 := 11*D1[1] + 10*D1[2] + 9*D1[3] + 8*D1[4] + 7*D1[5] + 6*D1[6] +
                      5*D1[7] + 4*D1[8] + 3*D1[9] + 2*PrimeiroDigito;
               DF5 := DF4 div 11;
               DF6 := DF5 * 11;
               Resto2 := DF4 - DF6;
               if (Resto2 = 0) or (Resto2 = 1) then
                    SegundoDigito := 0
               else
                    SegundoDigito := 11 - Resto2;
               if (PrimeiroDigito <> StrToInt(Dado[10])) or
                  (SegundoDigito <> StrToInt(Dado[11])) then
                     Result := false;
           end;
      end
      else
           if Length(Dado) <> 0 then
                Result := false;
 end;

   //procedimento para centralizar paineis em um formulario
  procedure CentralizaPainel(Painel : TPanel; Altura : integer; Largura: integer); begin
     //Centraliza Painel;
      painel.Left := Round((largura - Painel.Width)/2);
      painel.Top := Round((altura - painel.Height)/2);
  end;

  //Funcção para verificar se a string esta vazia
    function Vazio(Texto : String):Boolean;
     var
       i : integer;
       str : string;
    begin
     //procedimento para verificação
      if Length(Texto) > 0  then begin
         for I := 0 to Length(Texto) - 1 do begin
           if (copy(texto, i, 1) <> '') and (copy(texto, i, 1) <> ' ') then begin
              str := Copy(texto, i, 1);
           end;
         end;
         if Length(str) > 0 then begin
           result := false;
         end else begin
           result := true;
         end;
      end else begin
         Result := true;
      end;
    end;
  //PegaNome do Computador que está rodando o sistema
  function GetComputerNameFunc : string;
    var ipbuffer : string;
          nsize : dword;
    begin
       nsize := 255;
       SetLength(ipbuffer,nsize);
       if GetComputerName(pchar(ipbuffer),nsize) then
          result := ipbuffer;
    end;
end.
