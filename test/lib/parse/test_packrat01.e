class TEST_PACKRAT01

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
         parser: PACKRAT_PARSER
         buffer: MINI_PARSER_BUFFER
      do
         create grammar.make(Current)
         create parser

         -- this one is the original one (to keep it somewhere)

         create buffer.initialize_with("[
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

]")

         assert(parser.eval(buffer, grammar.table, "grammar"))
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
      end

end
