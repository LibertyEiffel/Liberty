class TEST_PACKRAT04

inherit
   PACKRAT_REDUCER

insert
   EIFFELTEST_TOOLS
   LOGGING

create {}
   make

feature {}
   make is
      local
         grammar: PACKRAT_GRAMMAR
         table: PARSE_TABLE[PACKRAT_PARSE_CONTEXT]
         source: STRING; dump: STRING_OUTPUT_STREAM
         parser: PACKRAT_PARSER; buffer: MINI_PARSER_BUFFER
      do
         create grammar.make(Current)

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

         create parser
         create buffer.initialize_with(source)
         assert(parser.eval(buffer, table, "grammar") and then parser.error = Void)
      end

feature {PACKRAT_GRAMMAR}
   reduce_alternative (nonterminal_name: FIXED_STRING) is
      do
         log.trace.put_line("#### reduce alternative: nonterminal %"#(1)%"" # nonterminal_name)
      end

   reduce_pattern (nonterminal_name: FIXED_STRING) is
      do
         log.trace.put_line("#### reduce pattern: nonterminal %"#(1)%"" # nonterminal_name)
      end

   reduce_positive_lookahead (nonterminal_name: FIXED_STRING) is
      do
         log.trace.put_line("#### reduce positive lookahead: nonterminal %"#(1)%"" # nonterminal_name)
      end

   reduce_negative_lookahead (nonterminal_name: FIXED_STRING) is
      do
         log.trace.put_line("#### reduce negative lookahead: nonterminal %"#(1)%"" # nonterminal_name)
      end

   reduce_loop (nonterminal_name: FIXED_STRING; quantifier: INTEGER_8) is
      do
         log.trace.put_line("#### reduce loop: nonterminal %"#(1)%", #(2)" # nonterminal_name # quantifier.out)
      end

   reduce_with_tag (nonterminal_name, tag: FIXED_STRING) is
      do
         log.trace.put_line("#### reduce tag: nonterminal %"#(1)%", tag {#(2)}" # nonterminal_name # tag)
      end

end
