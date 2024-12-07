grammar
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
  = [ \t\n\r]*