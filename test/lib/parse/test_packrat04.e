class TEST_PACKRAT04

insert
   EIFFELTEST_TOOLS
   LOGGING

create {}
   make

feature {}
   make
      local
         grammar: PACKRAT_GRAMMAR
         table: PARSE_TABLE[PACKRAT_PARSE_CONTEXT]
         source: STRING; dump: STRING_OUTPUT_STREAM
         parser: PACKRAT_PARSER; buffer: MINI_PARSER_BUFFER
      do
         create grammar.make

         -- this one is the extended grammar (with tags),
         -- decorated with tags

         source := "[
grammar <- sp (nonterminal '<-' sp pattern {rule})+ {grammar}
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
         table.pretty_print_on(log.info)
         create dump.make
         table.pretty_print_on(dump)
         assert(source.is_equal(dump.to_string))

         table.set_default_tree_builders(agent reduce_non_terminal, agent reduce_terminal)

         create parser
         create buffer.initialize_with(source)
         assert(parser.eval(buffer, table, "grammar") and then parser.error = Void)
      end

feature {}
   reduce_non_terminal
      do
      end

   reduce_terminal
      do
      end

end
