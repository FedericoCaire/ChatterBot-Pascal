unit Archivos;
interface
uses
  Classes, SysUtils;
const
  RutaClaves='.\Claves';
  RutaPreg='.\Preguntas';
  RutaResp='.\Respuestas';
  RutaLimpieza='.\Limpieza';

type
  T_DatoClave=record
    pal:string[255];
    numpreg:byte; //numero de pregunta a la que es palabra clave
  end;
  T_ArchivoClave=file of T_DatoClave;  //archivo con palabras claves

  T_DatoPreg=string[255];
  T_ArchivoPreg=file of T_DatoPreg; //archivo con preguntas

  T_DatoResp=string[255];
  T_ArchivoResp=file of T_DatoResp; //archivo con respuesta

  T_ArchivoLimpieza=file of string[30]; //archivo con palabras para limpiar de la lista

Procedure Ini_Archivos(Var ArchClave:T_ArchivoClave;Var ArchPreg:T_ArchivoPreg;Var ArchResp:T_ArchivoResp;Var ArchLimpieza:T_ArchivoLimpieza);
Procedure Cerrar_Archivos(Var ArchClave:T_ArchivoClave;Var ArchPreg:T_ArchivoPreg;Var ArchResp:T_ArchivoResp;Var ArchLimpieza:T_ArchivoLimpieza);
implementation

Procedure Ini_ArchivoClave(Var Arch:T_ArchivoClave);
begin
  assign(Arch,RutaClaves);
  reset(Arch);
end;
Procedure Ini_ArchivoPreg(Var Arch:T_ArchivoPreg);
begin
  assign(Arch,RutaPreg);
  reset(Arch);
end;

Procedure Ini_ArchivoResp(Var Arch:T_ArchivoResp);
begin
  assign(Arch,RutaResp);
  reset(Arch);
end;

Procedure Ini_ArchivoLimpieza(Var Arch:T_ArchivoLimpieza);
begin
  assign(Arch,RutaLimpieza);
  reset(Arch);
end;
Procedure Ini_Archivos(Var ArchClave:T_ArchivoClave;Var ArchPreg:T_ArchivoPreg;Var ArchResp:T_ArchivoResp;Var ArchLimpieza:T_ArchivoLimpieza);
begin
  Ini_ArchivoClave(ArchClave);
  Ini_ArchivoPreg(ArchPreg);
  Ini_ArchivoResp(ArchResp);
  Ini_ArchivoLimpieza(ArchLimpieza);
end;

Procedure Cerrar_Archivos(Var ArchClave:T_ArchivoClave;Var ArchPreg:T_ArchivoPreg;Var ArchResp:T_ArchivoResp;Var ArchLimpieza:T_ArchivoLimpieza);
begin
  Close(ArchClave);
  Close(ArchPreg);
  Close(ArchResp);
  Close(ArchLimpieza);
end;

end.

