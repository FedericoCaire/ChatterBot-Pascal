unit ManejoListaDePalabras;
interface
uses crt, LISTAS, Comparaciones, SysUtils, Windows, Funciones, Archivos,
  LimpiezaLista;

Procedure EliminarCaracteresDeUsoFrecuente(var L:T_Lista);
Procedure GuardarPalabras(Var L:T_Lista; F:string);

implementation

Procedure EliminarCaracteresDeUsoFrecuente(var L:T_Lista);
var
  longitud:integer;
  i:integer;
begin
  L.act:=L.cab;
  while not FIN(L) do
  begin
    longitud:=length(L.act^.info);
    i:=1;
    while i<=longitud do
    begin
      if CaracterDeUsoFrecuente(L.act^.info[i])=true then
      begin
        Delete(L.act^.info,i,1);
        longitud:=longitud-1;
      end else inc(i);
    end;
    Siguiente(L);
  end;
end;

Procedure GuardarPalabras(Var L:T_Lista; F:string);
var
  i:integer;
  ant:char;
  aux:T_Punt;
begin
  F:=EliminarEspaciosIniFin(F);
  Agregar(L,'');
  L.act:=L.cab;
  for i:=1 to length(F) do
  begin
    if F[i]<>' ' then
    begin
      insert(SinAcento(lowercase(F[i])),L.act^.info,length(L.act^.info)+1);
    end else
    begin
      if ant<>' ' then //por si se ingresa mas de un espacio
      begin
        aux:=L.act;
        Agregar(L,'');
        L.act:=aux^.sig;
      end;
    end;
    ant:=F[i];
  end;
  EliminarCaracteresDeUsoFrecuente(L);
end;
end.

