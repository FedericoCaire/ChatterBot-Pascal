unit Interacciones;
interface
uses crt, LISTAS, Comparaciones, SysUtils, Windows, Funciones, Archivos,
  LimpiezaLista, ManejoListaDePalabras;

Procedure Interaccion();

implementation
Procedure Interaccion();
var
  Preg:string;
  L:T_Lista;
  nombre:string[15];
  x:integer;
  C:T_Coincidencias;
  ArchPreg:T_ArchivoPreg;
  ArchResp:T_ArchivoResp;
  ArchLimpieza:T_ArchivoLimpieza;
  ArchClave:T_ArchivoClave;
begin
  Ini_Archivos(ArchClave,ArchPreg,ArchResp,ArchLimpieza);
  Crearlista(L);
  nombre:=PedirNombre();
  clrscr();
  writeln('ChatterBot: Hola ',nombre,'!',' Escribe "Salir" para finalizar la ejecucion');
  repeat
    InicializarVectorComparacion(C);
    Preg:=Preguntar(nombre);
    if length(Preg)>0 then
    begin
      x:=ComparacionDirecta(Preg,ArchPreg);
      if x<>0 then DarRespuesta(ArchResp,x)
      else begin
        GuardarPalabras(L,Preg);
        LimpiarLista(L,ArchLimpieza);
        x:=ComparacionIntermedia(L,ArchClave,C);
        if x<>0 then DarRespuesta(ArchResp,x)
        else begin
          Comparacion(L,ArchClave,C);
          x:=PreguntaMasCoincidente(C);
          if x>0 then DarRespuesta(ArchResp,x) else writeln('ChatterBot: No tengo respuesta para eso');
        end;
      end
    end else writeln('ChatterBot: No tengo respuesta para eso');
    VaciarLista(L);
  until Preg='Salir';
  Cerrar_Archivos(ArchClave,ArchPreg,ArchResp,ArchLimpieza);
end;
end.

