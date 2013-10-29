class PARSER_RULE

inherit PARSER_PARSEABLE

create {ANY}
   make

feature {ANY}
   name: STRING

   item: PARSER_PARSEABLE

   parse (parser: PARSER) is
      do
         parser.goto_inside(item)
      end

   set_alternative (alt: FAST_ARRAY[BACKTRACKING_NODE]) is
      do
      end

   set_sequence (seq: FAST_ARRAY[BACKTRACKING_NODE]) is
      do
      end

   set_item (a_item: like item) is
      do
         item := a_item
      end

   make (a_name: like name) is
      do
         name := a_name
      end

end
