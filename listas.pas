UNIT LISTAS;
INTERFACE
const
  N=10000;
TYPE
T_DATO= string[30];
T_PUNT = ^T_NODO;
T_NODO = RECORD
INFO:T_DATO;
SIG:T_PUNT;
END;
T_LISTA= RECORD   //no esta ordenada por contenido
CAB,ACT: T_PUNT;
TAM: 1..N;
END;
PROCEDURE CREARLISTA (VAR L:T_LISTA);
PROCEDURE AGREGAR (VAR L:T_LISTA; X:T_DATO);
FUNCTION LISTA_LLENA (VAR L:T_LISTA): BOOLEAN;
FUNCTION LISTA_VACIA (VAR L:T_LISTA): BOOLEAN;
PROCEDURE ELIMINARLISTA (VAR L:T_LISTA;BUSCADO: STRING);
PROCEDURE SIGUIENTE(VAR L:T_LISTA);
Function PRIMERO (L:T_LISTA):boolean;
Function FIN (L:T_LISTA): BOOLEAN;
PROCEDURE VaciarLista(var L:T_Lista);
IMPLEMENTATION
PROCEDURE CREARLISTA (VAR L:T_LISTA);
BEGIN
L.TAM:=0;
L.CAB:=NIL;
END;
PROCEDURE SIGUIENTE(VAR L:T_LISTA);
BEGIN
L.ACT:= L.ACT^.SIG;
END;
PROCEDURE AGREGAR (VAR L:T_LISTA; X:T_DATO);
VAR DIR, ANT : T_PUNT;
BEGIN
NEW (DIR);
DIR^.INFO:= X;
DIR^.SIG:= Nil;
if L.cab=Nil then
begin
L.cab:=DIR;
end
else
begin
L.act:=L.cab;
while L.act^.sig<>Nil do
begin
  siguiente(L);
end;
L.act^.sig:=DIR;
end;
INC(L.TAM)
END;
PROCEDURE ELIMINARLISTA (VAR L:T_LISTA;BUSCADO: STRING);
VAR
DIR,ANT:T_PUNT;
BEGIN
IF L.CAB^.INFO = BUSCADO THEN
BEGIN
DIR:= L.CAB;
L. CAB:=DIR^.SIG;
DISPOSE (DIR);
END
ELSE
BEGIN
ANT:= L.CAB;
L.ACT:= L.CAB^.SIG;
WHILE (L.ACT^.INFO <>BUSCADO) and (L.act<>Nil) DO
BEGIN
ANT:= L.ACT;
L.ACT:= L.ACT^.SIG
END;
ANT^.SIG:= L.ACT^.SIG;
DISPOSE (L.ACT);
END;
DEC(L.TAM)
END;
Function PRIMERO(L:T_LISTA):boolean;
BEGIN
PRIMERO:= L.ACT = L.CAB;
END;
Function FIN (L:T_LISTA): BOOLEAN;
BEGIN
FIN:= L.ACT = NIL;
END;
FUNCTION LISTA_LLENA (VAR L:T_LISTA): BOOLEAN;
BEGIN
LISTA_LLENA:= GETHEAPSTATUS.TotalFree < SIZEOF(T_NODO) ;
END;
FUNCTION LISTA_VACIA (VAR L:T_LISTA): BOOLEAN;
BEGIN
LISTA_VACIA:= L.cab=nil;
END;
procedure VaciarLista(var L:T_Lista);
var
ant:T_Punt;
begin
if L.cab<>nil then
begin
ant:=L.cab;
L.act:=L.cab^.sig;
while not fin(L) do
begin
Dispose(ant);
ant:=L.act;
siguiente(L);
end;
end;
L.cab:=Nil;
L.tam:=0;
end;
end.

