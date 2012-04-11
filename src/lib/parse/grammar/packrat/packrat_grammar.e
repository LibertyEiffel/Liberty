-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PACKRAT_GRAMMAR
   --
   -- The packrat grammar written using the packrat parser :-)
   --

insert
   PACKRAT
   PACKRAT_INTERNAL

create {ANY}
   make

feature {}
   make (a_reducer: like reducer) is
      require
         a_reducer /= Void
      do
         reducer := a_reducer
         last_image := ""
         last_nonterminal_def := ""
         reset
      ensure
         reducer = a_reducer
      end

   the_table: PARSE_TABLE[PACKRAT_PARSE_CONTEXT] is
      once
         Result := {PARSE_TABLE[PACKRAT_PARSE_CONTEXT] <<
            -- ----------------------------------------------------------------------
            -- THE GRAMMAR

            "grammar", create {PACKRAT_NON_TERMINAL}
            .make(seq(<< seq(<< ref("nonterminal") >>, one, agent reduce_nonterminal_def), ref("'<-'"), ref("sp"), ref("pattern") >>,
                         one_or_more, agent reduce_grammar));

            "pattern",     create {PACKRAT_NON_TERMINAL}
            .make(seq(<< ref("alternative"), seq(<< ref("'/'"), ref("sp"), ref("alternative") >>,
                                                    zero_or_more, agent reduce_pattern_alternative) >>,
                         one, agent reduce_pattern));

            "alternative", create {PACKRAT_NON_TERMINAL}
            .make(seq(<< seq(<< ref("[!&]") >>,
                                zero_or_one, agent reduce_lookahead_symbol), ref("sp"), ref("suffix") >>,
                         one_or_more, agent reduce_alternative));

            "suffix",      create {PACKRAT_NON_TERMINAL}
            .make(seq(<< ref("primary"), seq(<< ref("[*+?]"), ref("sp") >>,
                                                zero_or_one, agent reduce_quantifier) >>,
                         one, agent reduce_suffix));

            "primary",     create {PACKRAT_NON_TERMINAL}
            .make(seq(<< ref("'('"), ref("sp"), ref("pattern"), ref("')'"), ref("sp") >>,
                         one, agent reduce_primary_as_nested_pattern)
                  /
                  seq(<< ref("'.'"), ref("sp") >>,
                         one, agent reduce_primary_as_any)
                  /
                  seq(<< ref("literal") >>,
                         one, agent reduce_primary_as_literal)
                  /
                  seq(<< ref("charclass") >>,
                         one, agent reduce_primay_as_charclass)
                  /
                  seq(<< ref("nonterminal"), ~ref("'<-'") >>,
                         one, agent reduce_primary_as_nonterminal));

            "literal",     create {PACKRAT_NON_TERMINAL}
            .make(seq(<< ref("[']"), seq(<< ~ref("[']"), ref(".") >>,
                                            zero_or_more, agent reduce_literal_string), ref("[']"), ref("sp") >>,
                         one, agent reduce_literal));

            "charclass",   create {PACKRAT_NON_TERMINAL}
            .make(seq(<< ref("'['"), seq(<< ~ref("']'"), seq(<< ref("."), ref("'-'"), ref(".") >>,
                                                            one, agent reduce_charclass_range)
                                                     /
                                                     seq(<< ref(".") >>,
                                                            one, agent reduce_charclass_char) >>,
                                          zero_or_more, agent reduce_charclass_class), ref("']'"), ref("sp") >>,
                          one, agent reduce_charclass));

            "nonterminal", create {PACKRAT_NON_TERMINAL}
            .make(seq(<< seq(<< ref("[a-zA-Z]") >>,
                                one_or_more, agent reduce_nonterminal_name), ref("sp") >>,
                         one, agent reduce_nonterminal));

            "sp",          create {PACKRAT_NON_TERMINAL}
            .make(seq(<< ref("[ \t\n]") >>,
                         zero_or_more, agent reduce_space));

            -- ----------------------------------------------------------------------
            -- THE LOW-LEVEL PATTERNS (hardcoded)

            "'<-'",        create {PACKRAT_TERMINAL}.make(agent parse_string(?, "<-"), agent reduce_image_left_arrow);
            "'/'",         create {PACKRAT_TERMINAL}.make(agent parse_string(?, "/"),  agent reduce_image_slash);
            "[!&]",        create {PACKRAT_TERMINAL}.make(agent parse_lookahead,       agent reduce_image_not_and);
            "[*+?]",       create {PACKRAT_TERMINAL}.make(agent parse_quantifier,      agent reduce_image_star_plus_why);
            "'('",         create {PACKRAT_TERMINAL}.make(agent parse_string(?, "("),  agent reduce_image_open_paren);
            "')'",         create {PACKRAT_TERMINAL}.make(agent parse_string(?, ")"),  agent reduce_image_close_paren);
            ".",           create {PACKRAT_TERMINAL}.make(agent parse_any,             agent reduce_image_anychar);
            "[']",         create {PACKRAT_TERMINAL}.make(agent parse_string(?, "%'"), agent reduce_image_quote);
            "'-'",         create {PACKRAT_TERMINAL}.make(agent parse_string(?, "-"),  agent reduce_image_hyphen);
            "'.'",         create {PACKRAT_TERMINAL}.make(agent parse_string(?, "."),  agent reduce_image_hyphen);
            "'['",         create {PACKRAT_TERMINAL}.make(agent parse_string(?, "["),  agent reduce_image_open_bracket);
            "']'",         create {PACKRAT_TERMINAL}.make(agent parse_string(?, "]"),  agent reduce_image_close_bracket);
            "[a-zA-Z]",    create {PACKRAT_TERMINAL}.make(agent parse_character,       agent reduce_image_letter);
            "[ \t\n]",     create {PACKRAT_TERMINAL}.make(agent parse_space,           agent reduce_image_space);
         >> }
      end

   table_memory: PARSE_TABLE[PACKRAT_PARSE_CONTEXT]

feature {ANY}
   table: PARSE_TABLE[PACKRAT_PARSE_CONTEXT] is
      do
         Result := table_memory
         if Result = Void then
            Result := the_table
            table_memory := Result
         end
      end

   reset is
      do
         create position
         reset_build_data
      end

feature {} -- low-level parsers
   parse_string (buffer: MINI_PARSER_BUFFER; string: STRING): PACKRAT_IMAGE is
      local
         old_position: like position; i: INTEGER; valid: BOOLEAN
      do
         old_position := position
         from
            valid := not buffer.end_reached
            i := string.lower
         until
            not valid or else i > string.upper
         loop
            if buffer.end_reached or else buffer.current_character /= string.item(i) then
               valid := False
            else
               next_character(buffer)
               i := i + 1
            end
         end
         if valid then
            create Result.make(string, old_position)
         else
            restore(buffer, old_position)
         end
         buffer.clear_mark
      end

   parse_lookahead (buffer: MINI_PARSER_BUFFER): PACKRAT_IMAGE is
      do
         if not buffer.end_reached then
            inspect
               buffer.current_character
            when '&', '!' then
               Result := new_image(buffer.current_character)
               next_character(buffer)
            else
            end
            buffer.clear_mark
         end
      end

   parse_quantifier (buffer: MINI_PARSER_BUFFER): PACKRAT_IMAGE is
      do
         if not buffer.end_reached then
            inspect
               buffer.current_character
            when '*', '+', '?' then
               Result := new_image(buffer.current_character)
               next_character(buffer)
            else
            end
            buffer.clear_mark
         end
      end

   parse_any (buffer: MINI_PARSER_BUFFER): PACKRAT_IMAGE is
      do
         if not buffer.end_reached then
            Result := new_image(buffer.current_character)
            next_character(buffer)
            buffer.clear_mark
         end
      end

   parse_character (buffer: MINI_PARSER_BUFFER): PACKRAT_IMAGE is
      do
         if not buffer.end_reached then
            inspect
               buffer.current_character
            when 'a'..'z', 'A'..'Z' then
               Result := new_image(buffer.current_character)
               next_character(buffer)
            else
            end
            buffer.clear_mark
         end
      end

   parse_space (buffer: MINI_PARSER_BUFFER): PACKRAT_IMAGE is
      do
         if not buffer.end_reached then
            inspect
               buffer.current_character
            when ' ', '%T', '%N' then
               Result := new_image(buffer.current_character)
               next_character(buffer)
            else
            end
            buffer.clear_mark
         end
      end

   parse_regex (buffer: MINI_PARSER_BUFFER; regex: REGULAR_EXPRESSION): PACKRAT_IMAGE is
         -- the regex must parse exactly one character
      local
         string: STRING
      do
         if not buffer.end_reached then
            string.clear_count
            string.extend(buffer.current_character)
            if regex.match(string) then
               Result := new_image(buffer.current_character)
               next_character(buffer)
            end
         end
      end

feature {} -- low-level image memory
   flyweight: AVL_DICTIONARY[STRING, CHARACTER] is
      once
         Result := {AVL_DICTIONARY[STRING, CHARACTER] <<
                                                        "a", 'a';
                                                        "b", 'b';
                                                        "c", 'c';
                                                        "d", 'd';
                                                        "e", 'e';
                                                        "f", 'f';
                                                        "g", 'g';
                                                        "h", 'h';
                                                        "i", 'i';
                                                        "j", 'j';
                                                        "k", 'k';
                                                        "l", 'l';
                                                        "m", 'm';
                                                        "n", 'n';
                                                        "o", 'o';
                                                        "p", 'p';
                                                        "q", 'q';
                                                        "r", 'r';
                                                        "s", 's';
                                                        "t", 't';
                                                        "u", 'u';
                                                        "v", 'v';
                                                        "w", 'w';
                                                        "x", 'x';
                                                        "y", 'y';
                                                        "z", 'z';

                                                        "(", '(';
                                                        ")", ')';
                                                        "[", '[';
                                                        "]", ']';
                                                        "*", '*';
                                                        "+", '+';
                                                        "?", '?';
                                                        "!", '!';
                                                        "&", '&';
                                                        "/", '/';
                                                        "%'", '%'';
                                                        " ", ' ';
                                                        "%N", '%N';
                                                        "%T", '%T';
                                                        >> }
      end

feature {} -- buffer moves
   next_character (buffer: MINI_PARSER_BUFFER) is
      do
         position := position.next(buffer)
      end

   restore (buffer: MINI_PARSER_BUFFER; a_position: like position) is
      do
         position := a_position
         buffer.set_current_index(position.index)
      end

   position: PACKRAT_POSITION

   new_image (char: CHARACTER): PACKRAT_IMAGE is
      local
         image: STRING
      do
         image := flyweight.reference_at(char)
         if image = Void then
            image := "."
            image.put(char, image.lower)
            flyweight.put(image, char)
         end
         create Result.make(image, position)
      end

feature {ANY}
   parse_table (a_source: ABSTRACT_STRING): like the_table is
      require
         a_source /= Void
      local
         parser: PACKRAT_PARSER
         buffer: MINI_PARSER_BUFFER
         i: INTEGER
      do
         create parser
         create buffer.initialize_with(a_source)

         if parser.eval(buffer, table, once "grammar") then
            create Result.with_capacity(last_atoms.count)
            from
               i := last_atoms.lower
            until
               i > last_atoms.upper
            loop
               Result.add(last_atoms.key(i), last_atoms.item(i))
               i := i + 1
            end
         end
      end

feature {} -- build the grammar
   reducer: PACKRAT_REDUCER
   last_atoms: HASHED_DICTIONARY[PARSE_ATOM[PACKRAT_PARSE_CONTEXT], FIXED_STRING]
   last_nonterminal_def: STRING
   last_pattern: PACKRAT_PATTERN
   last_choice: FAST_ARRAY[PACKRAT_ALTERNATIVE]
   last_alternative: FAST_ARRAY[PACKRAT_PRIMARY]
   last_primary: PACKRAT_PRIMARY
   last_image: STRING
   last_quantifier: INTEGER_8
   last_lookahead: INTEGER_8

   lookahead_none: INTEGER_8 is 0
   lookahead_and: INTEGER_8 is 1
   lookahead_not: INTEGER_8 is 2

   add_atom (a_name: FIXED_STRING; a_atom: PARSE_ATOM[PACKRAT_PARSE_CONTEXT]) is
      require
         a_name /= Void
         a_atom /= Void
         atom(a_name) = Void
      do
         if last_atoms = Void then
            create last_atoms.make
         end
         last_atoms.add(a_atom, a_name)
      ensure
         atom(a_name) = a_atom
      end

   atom (a_name: FIXED_STRING): PARSE_ATOM[PACKRAT_PARSE_CONTEXT] is
      require
         a_name /= Void
      do
         if last_atoms /= Void then
            Result := last_atoms.fast_reference_at(a_name)
         end
      end

   reset_nonterminal_def is
      do
         last_nonterminal_def.clear_count
      end

   reset_image is
      do
         last_image.clear_count
      end

   reset_quantifier is
      do
         last_quantifier := one
      end

   reset_lookahead is
      do
         last_lookahead := lookahead_none
      end

   reset_alternative is
      do
         create last_alternative.make(0)
      end

   reset_choice is
      do
         create last_choice.make(0)
      end

   reset_pattern is
      do
         last_pattern := Void
      end

   reset_build_data is
      do
         reset_nonterminal_def
         reset_image
         if last_atoms /= Void then
            last_atoms.clear_count
         end
         reset_image
         reset_quantifier
         reset_lookahead
         reset_alternative
         reset_choice
         reset_pattern
      end

   reduce_nonterminal_def is
      do
         last_nonterminal_def.copy(last_image)
      end

   reduce_grammar is
      do
         last_atoms.add(create {PACKRAT_NON_TERMINAL}.make(last_pattern), last_nonterminal_def.intern)
         reset_pattern
         reset_nonterminal_def
      end

   reduce_pattern_alternative is
      do
         last_choice.add_last(seq(last_alternative, one, agent reducer.reduce_alternative(last_nonterminal_def.intern)))
         reset_alternative
      end

   reduce_pattern is
      do
         last_pattern := seq(last_alternative, one, agent reducer.reduce_pattern(last_nonterminal_def.intern))
         reset_alternative
         last_choice.do_all(agent reduce_pattern_map)
         reset_choice
      end

   reduce_pattern_map (alt: PACKRAT_ALTERNATIVE) is
      do
         last_pattern := last_pattern / alt
      end

   reduce_lookahead_symbol is
      do
      end

   reduce_alternative is
      do
         inspect
            last_lookahead
         when lookahead_none then
            last_alternative.add_last(last_primary)
         when lookahead_and then
            last_alternative := {FAST_ARRAY[PACKRAT_PRIMARY] << seq(last_alternative, one, agent reducer.reduce_positive_lookahead(last_nonterminal_def.intern)).positive_lookahead >> }
         when lookahead_not then
            last_alternative := {FAST_ARRAY[PACKRAT_PRIMARY] << seq(last_alternative, one, agent reducer.reduce_negative_lookahead(last_nonterminal_def.intern)).negative_lookahead >> }
         end
      end

   reduce_quantifier is
      do
      end

   reduce_suffix is
      do
         if last_quantifier /= one then
            last_primary := seq(<< last_primary >>, last_quantifier, agent reducer.reduce_loop(last_nonterminal_def.intern, last_quantifier))
         end
         reset_quantifier
      end

   reduce_primary_as_nested_pattern is
      do
      end

   reduce_primary_as_any is
      local
         terminal_name: FIXED_STRING; terminal: PACKRAT_TERMINAL
      do
         terminal_name := (once "'.'").intern
         terminal ::= atom(terminal_name)
         if terminal = Void then
            create terminal.make(agent parse_any, agent reduce_image_anychar)
            add_atom(terminal_name, terminal)
         end
         last_primary := ref(terminal_name)
      end

   reduce_primary_as_literal is
      do
      end

   reduce_primay_as_charclass is
      do
      end

   reduce_primary_as_nonterminal is
      do
      end

   reduce_literal_string is
      do
      end

   reduce_literal is
      local
         terminal_name: FIXED_STRING; terminal: PACKRAT_TERMINAL
      do
         terminal_name := ("'#(1)'" # last_image).intern
         terminal ::= atom(terminal_name)
         if terminal = Void then
            create terminal.make(agent parse_string(?, last_image.twin), agent reduce_image_string)
            add_atom(terminal_name, terminal)
         end
         last_primary := ref(terminal_name)
      end

   reduce_charclass_range is
      do
      end

   reduce_charclass_char is
      do
      end

   reduce_charclass_class is
      do
      end

   reduce_charclass is
      local
         terminal_name: FIXED_STRING; terminal: PACKRAT_TERMINAL
         regex: REGULAR_EXPRESSION; regex_factory: REGULAR_EXPRESSION_BUILDER
      do
         terminal_name := last_image.intern
         terminal ::= atom(terminal_name)
         if terminal = Void then
            regex := regex_factory.convert_posix_pattern(last_image)
            create terminal.make(agent parse_regex(?, regex), agent reduce_image_regex)
            add_atom(terminal_name, terminal)
         end
         last_primary := ref(terminal_name)
      end

   reduce_nonterminal_name is
      do
      end

   reduce_nonterminal is
      do
         last_primary := ref(last_image)
         reset_image
      end

   reduce_space is
      do
      end

   reduce_image_left_arrow (image: PARSER_IMAGE) is
      do
      end

   reduce_image_slash (image: PARSER_IMAGE) is
      do
      end

   reduce_image_not_and (image: PARSER_IMAGE) is
      local
         pi: PACKRAT_IMAGE
      do
         pi ::= image
         inspect
            pi.image.first
         when '&' then
            last_lookahead := lookahead_and
         when '!' then
            last_lookahead := lookahead_not
         end
      end

   reduce_image_star_plus_why (image: PARSER_IMAGE) is
      local
         pi: PACKRAT_IMAGE
      do
         pi ::= image
         inspect
            pi.image.first
         when '*' then
            last_quantifier := zero_or_more
         when '+' then
            last_quantifier := one_or_more
         when '?' then
            last_quantifier := zero_or_one
         end
      end

   reduce_image_open_paren (image: PARSER_IMAGE) is
      do
      end

   reduce_image_close_paren (image: PARSER_IMAGE) is
      do
      end

   reduce_image_anychar, reduce_image_letter, reduce_image_regex, reduce_image_string (image: PARSER_IMAGE) is
      local
         pi: PACKRAT_IMAGE
      do
         pi ::= image
         last_image.append(pi.image)
      end

   reduce_image_quote (image: PARSER_IMAGE) is
      do
      end

   reduce_image_hyphen (image: PARSER_IMAGE) is
      do
         last_image.extend('-')
      end

   reduce_image_open_bracket (image: PARSER_IMAGE) is
      do
         last_image.extend('[')
      end

   reduce_image_close_bracket (image: PARSER_IMAGE) is
      do
         last_image.extend(']')
      end

   reduce_image_space (image: PARSER_IMAGE) is
      do
      end

invariant
   last_nonterminal_def /= Void
   last_image /= Void
   reducer /= Void

end -- class PACKRAT_GRAMMAR
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
