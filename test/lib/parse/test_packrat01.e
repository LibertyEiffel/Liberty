class TEST_PACKRAT01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         grammar: PACKRAT_GRAMMAR
         parser: PACKRAT_PARSER
         buffer: MINI_PARSER_BUFFER
      do
         create grammar.make
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

end
