unit LimpiezaLista;

interface

uses
  Classes, SysUtils,Comparaciones, Funciones,crt, LISTAS,Archivos;
Function LimpiezaPalabraExtensa(S:string):boolean;
Function LimpiezaPalabraConCaracterEspecial(S:string):boolean;
Function LimpiezaPalabraBasura(S:string;var Arch:T_ArchivoLimpieza):boolean;
Function LimpiarPalabra(S:string;var Arch:T_ArchivoLimpieza):boolean;
Procedure LimpiarLista(Var L:T_Lista;var Arch:T_ArchivoLimpieza);
implementation

Function LimpiezaPalabraExtensa(S:string):boolean;
begin
  if length(S)>11 then LimpiezaPalabraExtensa:=true else LimpiezaPalabraExtensa:=false;
end;
Function LimpiezaPalabraConCaracterEspecial(S:string):boolean;
var
  i:integer;
begin
  LimpiezaPalabraConCaracterEspecial:=false;
  i:=1;
  while (i<=length(S))and (not LimpiezaPalabraConCaracterEspecial) do
  begin
    if CaracterValido(S[i])=false then LimpiezaPalabraConCaracterEspecial:=true;
    inc(i);
  end;
end;
Function LimpiezaPalabraBasura(S:string;var Arch:T_ArchivoLimpieza):boolean;
var
  pal:string[30];
begin
  Seek(Arch,0);
  LimpiezaPalabraBasura:=false;
  while  (not EOF(Arch)) and (not LimpiezaPalabraBasura) do
  begin
    read(Arch,pal);
    if PalabrasIguales(S,pal)=true then LimpiezaPalabraBasura:=true;
  end;
end;

Function LimpiarPalabra(S:string;var Arch:T_ArchivoLimpieza):boolean;
begin
  LimpiarPalabra:=false;
  if LimpiezaPalabraExtensa(S)=true then LimpiarPalabra:=true
  else if LimpiezaPalabraConCaracterEspecial(S)=true then LimpiarPalabra:=true
  else if LimpiezaPalabraBasura(S,Arch) then LimpiarPalabra:=true;
end;

Procedure LimpiarLista(Var L:T_Lista;var Arch:T_ArchivoLimpieza);
var
  ant,dir:T_Punt;
begin
  while (not Lista_Vacia(L)) and (LimpiarPalabra(L.cab^.info,Arch)=true) do
  begin
    New(Dir);
    Dir:=L.cab;
    L.CAB:=L.CAB^.sig;
    Dispose(Dir);
    Dec(L.tam);
  end;
  if L.cab<>Nil then
  begin
    ant:=L.cab;
    L.act:=L.cab^.sig;
    while (Not Fin(L)) do
    begin
      while (not Fin(L)) and (LimpiarPalabra(L.act^.info,Arch)=false) do
      begin
        ant:=L.act;
        siguiente(L);
      end;
      if (not  Fin(L)) and (LimpiarPalabra(L.act^.info,Arch)=true) then
      begin
        New(Dir);
        ant^.sig:=L.act^.sig;
        Siguiente(L);
        Dispose(Dir);
        Dec(L.tam);
      end;
    end;
  end;
end;
end.

