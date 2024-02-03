unit Comparaciones;
interface

uses
  Classes,SysUtils,crt,Funciones,listas,Archivos,Windows;
const
  M=33;
type
  T_Coincidencias=Array[1..M] of integer;    //vector con coincidencias (M es el numero de preguntas)
  T_Matriz=Array[1..11,1..11] of byte;

Procedure InicializarVectorComparacion(var C:T_Coincidencias);
Function Distancia(x,y:string;m,n:integer):integer;
Function ComparacionDirecta(ingresado:string;var Arch:T_ArchivoPreg):integer;
Function ComparacionIntermedia(L:T_Lista;Var Arch:T_ArchivoClave;Var C:T_Coincidencias):byte;
Procedure Comparacion(L:T_Lista;Var Arch:T_ArchivoClave;Var C:T_Coincidencias);
Function PreguntaMasCoincidente(C:T_Coincidencias):integer;
implementation

Procedure InicializarVectorComparacion(var C:T_Coincidencias);
var
  i:integer;
begin
  for i:=1 to M do C[i]:=0;
end;

Function Distancia(x,y:string;m,n:integer):integer;
var
  cost:byte;
begin
  cost:=0;
  if m=0 then Distancia:=n;
  if n=0 then Distancia:=m;
  if (m<>0) and (n<>0) then
  begin
  if (x[m]=y[n]) then cost:=0 else cost:=1;
    Distancia:=Minimo(Distancia(x,y,m-1,n)+1,Distancia(x,y,m,n-1)+1,Distancia(x,y,m-1,n-1)+cost);
  end;
end;
Function ComparacionDirecta(ingresado:string;var Arch:T_ArchivoPreg):integer;
var
  a:T_DatoPreg;
  pos:byte;
begin
  seek(Arch,0);
  pos:=0;
  ComparacionDirecta:=0;
  ingresado:=EliminarEspaciosIniFin(ingresado);
  while ((not EOF(Arch)) and (ComparacionDirecta=0)) do
  begin
    Read(Arch,a);
    inc(pos);
    if PalabrasIguales(a,ingresado)=true then ComparacionDirecta:=pos;
  end;
end;

Function ComparacionIntermedia(L:T_Lista;Var Arch:T_ArchivoClave;Var C:T_Coincidencias):byte; //devuelve el numero de la pregunta/respuesta asociada o 0 si no coincide
var
  a:T_DatoClave;
begin
  L.act:=L.cab;
  while not Fin(L) do
  begin
    seek(Arch,0);
    while (not EOF(Arch))  do
    begin
      read(Arch,a);
      if PalabrasIguales(L.act^.info,a.pal)=true then Inc(C[a.numpreg]);
    end;
    siguiente(L);
  end;
  ComparacionIntermedia:=PreguntaMasCoincidente(C);
end;

Procedure Comparacion(L:T_Lista;Var Arch:T_ArchivoClave;Var C:T_Coincidencias);
var
  a:T_DatoClave;
  ErroresMax:byte;
  TiempoInicio, TiempoFin,TiempoTranscurrido: DWORD;
begin
  L.act:=L.cab;
  TiempoInicio:=GetTickCount;
  While (not Fin(L)) and (TiempoTranscurrido<45000) do
  begin
    Seek(Arch,0);
    while (not EOF(Arch)) do
    begin
      Read(Arch,a);
      ErroresMax:=ErroresPermitidos(length(L.act^.info),length(a.pal));
      if Distancia(L.act^.info,a.pal,length(L.act^.info),length(a.pal))<=ErroresMax then Inc(C[a.numpreg]); //si la distancia entre la palabra ingresada y la palabra clave es menos de lo permitdo se suma 1 a la coincidencia
    end;
    TiempoFin:= GetTickCount;
    TiempoTranscurrido:=TiempoFin-TiempoInicio;
    Siguiente(L);
  end;
end;

Function PreguntaMasCoincidente(C:T_Coincidencias):integer;
var
  i:1..M;
  MaxAnterior:byte;
begin
  MaxAnterior:=0;
  PreguntaMasCoincidente:=0;
  for i:=1 to M do
  begin
    if C[i]>MaxAnterior then
    begin
      PreguntaMasCoincidente:=i;
      MaxAnterior:=C[i];
    end;
  end;
end;
end.

