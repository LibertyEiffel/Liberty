class PARSER_POOL_OF_MARK_END

inherit
   ABSTRACT_BACKTRACKING_POOL[PARSER_SEQUENCE_MARK_END]

create {ANY}
   make

feature {ANY}
   get_fresh_instance: PARSER_SEQUENCE_MARK_END is
      do
         create Result
      end

end -- class PARSER_POOL_OF_MARK_END
