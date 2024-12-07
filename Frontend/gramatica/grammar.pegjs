Gramatica = Regla (nl Regla)*

Regla = Identificador nl "=" _ Escoger nl ";" 

Escoger = Camino (nl "/" nl Camino)*

Camino = Expresion (_ Expresion)*

Expresion = Cadenas
          / Identificador
          / ExpRegular

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

letra
  = [a-zA-ZáéíóúÁÉÍÓÚñÑ]

digito
  = [0-9]

simbolo
  = [\s!"#$%&'()*+,-./:;<=>?@[\\^_`{|}~]  // Permite espacio, signos de puntuación, y símbolos

caracter_unico
  = .  // Cualquier otro carácter Unicode


Identificador = [_a-z]i[_a-z0-9]i*

_ "espacios en blanco" = [ \t]*

nl "nueva linea" = [ \t\n\r]*
/* grammar
  = expressions

expressions
  = "(" _ expression _  ")"  
  / expression nl expressions+ nl

expression
  = parsingExpression [?+*]?

parsingExpression
  = name
  / string
  / range

string
	= ["] [^"]* ["]
    / ['] [^']* [']
    
range = "[" input_range+ "]"

input_range = [^[\]-] "-" [^[\]-]
			/ [^[\]]+

name "identificador"
  = [_a-z]i[_a-z0-9]i*

_ "espacios en blanco"
  = [ \t]*

nl "nueva linea"
  = [ \t\n\r]* */