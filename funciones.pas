unit Funciones;
interface

uses
  Classes, crt, SysUtils,Archivos;

function EliminarEspaciosIniFin(cadena:string):string;
Function PedirNombre():string;
Function Preguntar(nombre:string):string;
Function PalabrasIguales(a,b:string):boolean;
Function Minimo(a,b,c:integer):integer;
Function ErroresPermitidos(a,b:byte):byte;
Function SinAcento(S:string):string;
Function CaracterDeUsoFrecuente(S:string):boolean;
Function CaracterValido(S:string):boolean;
Procedure DarRespuesta(Var ArchResp:T_ArchivoResp;NumPreg:integer);

implementation

function EliminarEspaciosIniFin(cadena:string):string;
var
  inicio, fin: integer;
begin
  inicio:=1;
  fin:=Length(cadena);
  while (inicio<=Length(cadena)) and (cadena[inicio]=' ') do Inc(inicio);
  while (fin>=inicio) and (cadena[fin]=' ') do Dec(fin);
  EliminarEspaciosIniFin:=Copy(cadena,inicio,fin-inicio+1);
end;

Function PedirNombre():string;
begin
  repeat
    clrscr;
    write('Ingresa tu nombre: ');
    readln(PedirNombre);
    PedirNombre:=EliminarEspaciosIniFin(PedirNombre);
  until PedirNombre<>'';
end;

Function Preguntar(nombre:string):string;
begin
  writeln(' ');
  write(nombre, ': ');
  readln(Preguntar);
  writeln(' ');
end;

Function PalabrasIguales(a,b:string):boolean;
begin
  if length(a)=length(b) then PalabrasIguales:=(a=b) else PalabrasIguales:=false;
end;

Function Minimo(a,b,c:integer):integer;
begin
  if (a <= b) and (a <= c) then
    Minimo:= a
  else if (b <= a) and (b <= c) then
    Minimo:= b
  else
    Minimo:= c;
end;

Function ErroresPermitidos(a,b:byte):byte;
var
  x:byte;
begin
  x:=(a+b) div 2;
  ErroresPermitidos:= Trunc((3/11)*(x+2.5));
end;

Function SinAcento(S:string):string;
begin
  SinAcento:=S;
  case S of
  'á':SinAcento:='a';
  'é':SinAcento:='e';
  'í':SinAcento:='i';
  'ó':SinAcento:='o';
  'ú':SinAcento:='u';
  'Á':SinAcento:='A';
  'É':SinAcento:='E';
  'Í':SinAcento:='I';
  'Ó':SinAcento:='O';
  'Ú':SinAcento:='U';
  'à':SinAcento:='a';
  'è':SinAcento:='e';
  'ì':SinAcento:='i';
  'ò':SinAcento:='o';
  'ù':SinAcento:='u';
  'À':SinAcento:='A';
  'È':SinAcento:='E';
  'Ì':SinAcento:='I';
  'Ò':SinAcento:='O';
  'Ù':SinAcento:='U';
  end;
end;
Function CaracterDeUsoFrecuente(S:string):boolean;
begin
  CaracterDeUsoFrecuente:=false;
  case S of
  '!':CaracterDeUsoFrecuente:=true;
  '"':CaracterDeUsoFrecuente:=true;
  '(':CaracterDeUsoFrecuente:=true;
  ')':CaracterDeUsoFrecuente:=true;
  ';':CaracterDeUsoFrecuente:=true;
  ',':CaracterDeUsoFrecuente:=true;
  '.':CaracterDeUsoFrecuente:=true;
  '?':CaracterDeUsoFrecuente:=true;
  '¿':CaracterDeUsoFrecuente:=true;
  '¡':CaracterDeUsoFrecuente:=true;
  end;
end;

Function CaracterValido(S:string):boolean;
begin
  CaracterValido:=true;
  case S of
  '#':CaracterValido:=false;
  '$':CaracterValido:=false;
  '%':CaracterValido:=false;
  '&':CaracterValido:=false;
  #39:CaracterValido:=false;
  '*':CaracterValido:=false;
  '+':CaracterValido:=false;
  '-':CaracterValido:=false;
  '/':CaracterValido:=false;
  ':':CaracterValido:=false;
  '<':CaracterValido:=false;
  '=':CaracterValido:=false;
  '>':CaracterValido:=false;
  '@':CaracterValido:=false;
  '[':CaracterValido:=false;
  '\':CaracterValido:=false;
  ']':CaracterValido:=false;
  '^':CaracterValido:=false;
  '_':CaracterValido:=false;
  '`':CaracterValido:=false;
  '{':CaracterValido:=false;
  '|':CaracterValido:=false;
  '}':CaracterValido:=false;
  '~':CaracterValido:=false;
  'Ç':CaracterValido:=false;
  'ü':CaracterValido:=false;
  'â':CaracterValido:=false;
  'ä':CaracterValido:=false;
  'å':CaracterValido:=false;
  'ç':CaracterValido:=false;
  'ê':CaracterValido:=false;
  'ë':CaracterValido:=false;
  'ï':CaracterValido:=false;
  'î':CaracterValido:=false;
  'Ä':CaracterValido:=false;
  'Å':CaracterValido:=false;
  'æ':CaracterValido:=false;
  'Æ':CaracterValido:=false;
  'ô':CaracterValido:=false;
  'ö':CaracterValido:=false;
  'û':CaracterValido:=false;
  'ÿ':CaracterValido:=false;
  'Ö':CaracterValido:=false;
  'Ü':CaracterValido:=false;
  'ø':CaracterValido:=false;
  '£':CaracterValido:=false;
  'Ø':CaracterValido:=false;
  '×':CaracterValido:=false;
  'ƒ':CaracterValido:=false;
  'ª':CaracterValido:=false;
  'º':CaracterValido:=false;
  '®':CaracterValido:=false;
  '¬':CaracterValido:=false;
  '½':CaracterValido:=false;
  '¼':CaracterValido:=false;
  '«':CaracterValido:=false;
  '»':CaracterValido:=false;
  '░':CaracterValido:=false;
  '▒':CaracterValido:=false;
  '▓':CaracterValido:=false;
  '│':CaracterValido:=false;
  '┤':CaracterValido:=false;
  '©':CaracterValido:=false;
  '╣':CaracterValido:=false;
  '║':CaracterValido:=false;
  '╗':CaracterValido:=false;
  '╝':CaracterValido:=false;
  '¢':CaracterValido:=false;
  '¥':CaracterValido:=false;
  '┐':CaracterValido:=false;
  '└':CaracterValido:=false;
  '┴':CaracterValido:=false;
  '┬':CaracterValido:=false;
  '├':CaracterValido:=false;
  '─':CaracterValido:=false;
  '┼':CaracterValido:=false;
  'ã':CaracterValido:=false;
  'Ã':CaracterValido:=false;
  '╚':CaracterValido:=false;
  '╔':CaracterValido:=false;
  '╩':CaracterValido:=false;
  '╦':CaracterValido:=false;
  '╠':CaracterValido:=false;
  '═':CaracterValido:=false;
  '╬':CaracterValido:=false;
  '¤':CaracterValido:=false;
  'ð':CaracterValido:=false;
  'Ð':CaracterValido:=false;
  'Ê':CaracterValido:=false;
  'Ë':CaracterValido:=false;
  'ı':CaracterValido:=false;
  'Î':CaracterValido:=false;
  'Ï':CaracterValido:=false;
  '┘':CaracterValido:=false;
  '┌':CaracterValido:=false;
  '█':CaracterValido:=false;
  '▄':CaracterValido:=false;
  '¦':CaracterValido:=false;
  '▀':CaracterValido:=false;
  'ß':CaracterValido:=false;
  'Ô':CaracterValido:=false;
  'õ':CaracterValido:=false;
  'Õ':CaracterValido:=false;
  'µ':CaracterValido:=false;
  'þ':CaracterValido:=false;
  'Þ':CaracterValido:=false;
  'Û':CaracterValido:=false;
  'ý':CaracterValido:=false;
  'Ý':CaracterValido:=false;
  '¯':CaracterValido:=false;
  '´':CaracterValido:=false;
  '≡':CaracterValido:=false;
  '±':CaracterValido:=false;
  '‗':CaracterValido:=false;
  '¾':CaracterValido:=false;
  '¶':CaracterValido:=false;
  '§':CaracterValido:=false;
  '÷':CaracterValido:=false;
  '¸':CaracterValido:=false;
  '°':CaracterValido:=false;
  '¨':CaracterValido:=false;
  '¹':CaracterValido:=false;
  '³':CaracterValido:=false;
  '²':CaracterValido:=false;
  '■':CaracterValido:=false;
  end;
end;

Procedure DarRespuesta(Var ArchResp:T_ArchivoResp;NumPreg:integer);
var
  Resp:T_DatoResp;
begin
  seek(ArchResp,NumPreg-1);
  read(ArchResp,Resp);
  writeln('ChatterBot: ', Resp);
end;

end.
