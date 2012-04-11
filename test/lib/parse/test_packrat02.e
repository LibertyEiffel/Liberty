class TEST_PACKRAT02

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
         source: STRING
      do
         create grammar.make(Current)

         source := "[
grammar     <- (nonterminal '<-' sp pattern)+
pattern     <- alternative ('/' sp alternative)*
alternative <- ([!&]? sp suffix)+
suffix      <- primary ([*+?] sp)*
primary     <- '(' sp pattern ')' sp / '.' sp / literal /
               charclass / nonterminal !'<-'
literal     <- ['] (!['] .)* ['] sp
charclass   <- '[' (!']' (. '-' . / .))* ']' sp
nonterminal <- [a-zA-Z]+ sp
sp          <- [ \t\n]*

]"

         table := grammar.parse_table(source)
         assert(table /= Void)
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

end
