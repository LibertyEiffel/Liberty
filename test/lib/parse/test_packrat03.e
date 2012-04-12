class TEST_PACKRAT03

inherit
   PACKRAT_REDUCER

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         grammar: PACKRAT_GRAMMAR
         table: PARSE_TABLE[PACKRAT_PARSE_CONTEXT]
         source: STRING; dump: STRING_OUTPUT_STREAM
      do
         create grammar.make(Current)

         -- this one is the extended grammar (with tags),
         -- decorated with tags

         source := "[
grammar <- (nonterminal '<-' sp pattern {rule})+ {grammar}
pattern <- alternative ('/' sp alternative)*
alternative <- ([!&] sp suffix / suffix tag?)+
suffix <- primary ([*+?] sp)*
primary <- '(' sp pattern ')' sp / '.' sp / literal / charclass / nonterminal !'<-'
literal <- ['] (!['] .)* ['] sp
charclass <- '[' (!']' (. '-' . / .))* ']' sp
nonterminal <- [a-zA-Z]+ sp
sp <- [ \t\n]*
tag <- '{' (!'}' .)+ '}' sp

]"

         table := grammar.parse_table(source)
         assert(table /= Void)

         create dump.make
         table.pretty_print_on(dump)
         assert(source.is_equal(dump.to_string))
      end

feature {PACKRAT_GRAMMAR}
   reduce_alternative (nonterminal_name: FIXED_STRING) is
      do
      end

   reduce_pattern (nonterminal_name: FIXED_STRING) is
      do
      end

   reduce_positive_lookahead (nonterminal_name: FIXED_STRING) is
      do
      end

   reduce_negative_lookahead (nonterminal_name: FIXED_STRING) is
      do
      end

   reduce_loop (nonterminal_name: FIXED_STRING; quantifier: INTEGER_8) is
      do
      end

   reduce_with_tag (nonterminal_name, tag: FIXED_STRING) is
      do
         io.put_line("#### #(1) {#(2)}" # nonterminal_name # tag)
      end

end
