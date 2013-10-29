class PARSER_RULE

inherit PARSER_PARSEABLE

feature {ANY}
   name: STRING

   item: PARSER_PARSEABLE

   parse (parser: PARSER) is
      do
         parser.goto_inside(item)
      end

end
