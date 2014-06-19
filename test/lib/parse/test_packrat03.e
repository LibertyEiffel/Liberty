class TEST_PACKRAT03

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         grammar: PACKRAT_GRAMMAR
         table: PARSE_TABLE[PACKRAT_PARSE_CONTEXT]
         source: STRING; dump: STRING_OUTPUT_STREAM
      do
         create grammar.make

         -- this one is the extended grammar (with tags),
         -- decorated with tags

         source := "[
grammar <- (nonterminal '<-' sp pattern {rule})+ {grammar}
pattern <- alternative {first_alternative} ('/' sp alternative {next_alternative})* {alternative}
alternative <- ([!&] sp suffix / suffix tag?)+
suffix <- primary ([*+?] sp)*
primary <- '(' sp pattern {nested} ')' sp / '.' sp / literal / charclass / nonterminal !'<-'
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

end
