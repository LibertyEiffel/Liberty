class PARSER_SEQUENCE_MARK_END

inherit
   ABSTRACT_BACKTRACKING_SEQUENCE

feature {ANY}
   parseable: PARSER_PARSEABLE

   set_parseable (value: like parseable) is
      do
         parseable := value
      end

   next_sequence (parser: PARSER) is
      do
         parser.push_mark_end(parseable)
         parser.pop_sequence
         parser.continue
      end

end
