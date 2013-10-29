deferred class PARSER_TOKEN

inherit PARSER_PARSEABLE

feature {ANY}
   expr: REGULAR_EXPRESSION_ROOT

   make (exp: like expr) is
      do
         expr := exp
      end

   parse (parser: PARSER) is
      do
         if parser.match(expr)
         then
            parser.continue
         else
            parser.backtrack
         end
      end

end
