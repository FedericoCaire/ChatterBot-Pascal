# ChatterBot-Pascal
El chatbot funciona en tres instancias donde si no encuentra una similitud pasa a la siguiente, caso contrario da la respuesta asociada a la similtud.
  1. la pregunta ingresada es igual a una pregunta cargada en su archivo correspondiente.
  Si no se encuentran similitudes se separan todas las palabras de la pregunta ingresada en una lista y posteriormente se limpian las palabras que no
  den contexto (ej: la, si, que, como..)
  2. Se comparan por distancia eucladiana las palabras de la lista con palabras claves asociadas a preguntas cargadas en un archivo
  Si no se encuentran similitudes continua con la ultima etapa
  3. Se comparan por distancia de levenshtein las palabras de la lista con palabras claves asociadas a preguntas cargadas en un archivo
  En caso de que no se haye ninguna similitud se devuelve una respuesta predetermina "No tengo respuesta para eso"

Este programa esta pensado para una charla de un tema especifico, en este caso los archivos estan cargados con tematica de seguridad vial, todos los
datos cargados en archivos se encuentran en esta tabla: https://docs.google.com/spreadsheets/d/13yHheaUmzd5LkpacCjfIbX9csxbsNOj0rhicNAvX9Tw/edit?usp=sharing
