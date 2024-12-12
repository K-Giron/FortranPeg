Gramatica = Regla (nl Regla)*

Regla = nl Identificador nl Cadenas? nl "=" _ Escoger FinCadena
      / Comentario (nl Comentario)*

FinCadena = ";"
          / nl

Escoger = Camino (nl "/" nl Camino)*

Camino = pluck (_ pluck)*

pluck = "@"? _ etiqueta

etiqueta = (Identificador _ ":")? _ Expresiones

Expresiones =[$&!]? _ Expresion _ Cuantificador?

Cuantificador = [?+*]
  / "|" _ ( numero/Identificador ) _ "|"
  / "|" _ ( numero/ Identificador )? _ ".." _ (numero / Identificador)? _ "|"
  / "|" _ ( numero/ Identificador)? _ "," _ Escoger _ "|"
  / "|" _ ( numero/ Identificador )? _ ".." _ (numero / Identificador)? _ "," _ Escoger _ "|"

Expresion = Cadenas [i]?
          / Identificador
          / ExpRegular [i]?
          / "("Escoger")"
          / "."

Cadenas = '"' [^"]* '"'
/ "'" [^']* "'"

ExpRegular = rango
/conjunto

conjunto
  = "[" caracteres:([a-zA-ZáéíóúÁÉÍÓÚñÑ0-9\s!"#$%&'()*+,-./:;<=>?@[\\^_`{|}~]+) "]" {
      return { tipo: "conjunto", caracteres };
    }

rango
  = "[" desde:caracter "-" hasta:caracter "]" {
      if (desde.charCodeAt(0) > hasta.charCodeAt(0)) {
        throw new Error("El rango es inválido: el carácter de inicio no puede ser mayor que el de fin.");
      }
      return { tipo: "rango", desde, hasta };
    }

caracter
  = letra
  / digito
  / simbolo
  / caracter_unico

ComentarioSimple = "//" (!"\n" .)* {return {tipo: "ComentarioSimple"};}
ComentarioMultiLinea = "/*" (!"*/" .)* "*/" {return {tipo: "ComentarioMultiLinea"};}
Comentario = ComentarioSimple 
           / ComentarioMultiLinea

letra
  = [a-zA-ZáéíóúÁÉÍÓÚñÑ]

digito
  = [0-9]

numero
  = [0-9]+

simbolo
  = [\s!"#$%&'()*+,-./:;<=>?@[\\^_`{|}~]  // Permite espacio, signos de puntuación, y símbolos

caracter_unico
  = .  // Cualquier otro carácter Unicode


Identificador = [_a-z]i[_a-z0-9]i*


_ "espacios en blanco" = [ \t]*

nl "nueva linea" = [ \t\n\r]*