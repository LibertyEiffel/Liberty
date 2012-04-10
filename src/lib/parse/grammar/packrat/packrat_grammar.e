-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class PACKRAT_GRAMMAR
   --
   -- The packrat grammar written using the packrat parser :-)
   --

insert
   PACKRAT
      redefine
         default_create
      end
   PACKRAT_INTERNAL
      redefine
         default_create
      end

create {ANY}
   default_create

feature {}
   default_create is
      do
         reset
      end

   the_table: PARSE_TABLE[PACKRAT_PARSE_CONTEXT] is
      once
         Result := {PARSE_TABLE[PACKRAT_PARSE_CONTEXT] <<
                                                         -- ----------------------------------------------------------------------
                                                         -- THE GRAMMAR
                                                         "grammar", create {PACKRAT_NON_TERMINAL}
                                                         .make(seq(<< ref("nonterminal"), ref("'<-'"), ref("sp"), ref("pattern") >>,
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
                                                         -- THE LOW-LEVEL PATTERNS
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

feature {} -- build the grammar
   reduce_grammar is
      do
         log.trace.put_line(once "reduce_grammar")
      end

   reduce_pattern_alternative is
      do
         log.trace.put_line(once "reduce_pattern_alternative")
      end

   reduce_pattern is
      do
         log.trace.put_line(once "reduce_pattern")
      end

   reduce_lookahead_symbol is
      do
         log.trace.put_line(once "reduce_lookahead_symbol")
      end

   reduce_alternative is
      do
         log.trace.put_line(once "reduce_alternative")
      end

   reduce_quantifier is
      do
         log.trace.put_line(once "reduce_quantifier")
      end

   reduce_suffix is
      do
         log.trace.put_line(once "reduce_suffix")
      end

   reduce_primary_as_nested_pattern is
      do
         log.trace.put_line(once "reduce_primary_as_nested_pattern")
      end

   reduce_primary_as_any is
      do
         log.trace.put_line(once "reduce_primary_as_any")
      end

   reduce_primary_as_literal is
      do
         log.trace.put_line(once "reduce_primary_as_literal")
      end

   reduce_primay_as_charclass is
      do
         log.trace.put_line(once "reduce_primay_as_charclass")
      end

   reduce_primary_as_nonterminal is
      do
         log.trace.put_line(once "reduce_primary_as_nonterminal")
      end

   reduce_literal_string is
      do
         log.trace.put_line(once "reduce_literal_string")
      end

   reduce_literal is
      do
         log.trace.put_line(once "reduce_literal")
      end

   reduce_charclass_range is
      do
         log.trace.put_line(once "reduce_charclass_range")
      end

   reduce_charclass_char is
      do
         log.trace.put_line(once "reduce_charclass_char")
      end

   reduce_charclass_class is
      do
         log.trace.put_line(once "reduce_charclass_class")
      end

   reduce_charclass is
      do
         log.trace.put_line(once "reduce_charclass")
      end

   reduce_nonterminal_name is
      do
         log.trace.put_line(once "reduce_nonterminal_name")
      end

   reduce_nonterminal is
      do
         log.trace.put_line(once "reduce_nonterminal")
      end

   reduce_space is
      do
         log.trace.put_line(once "reduce_space")
      end

   reduce_image_left_arrow (image: PARSER_IMAGE) is
      do
      end

   reduce_image_slash (image: PARSER_IMAGE) is
      do
      end

   reduce_image_not_and (image: PARSER_IMAGE) is
      do
      end

   reduce_image_star_plus_why (image: PARSER_IMAGE) is
      do
      end

   reduce_image_open_paren (image: PARSER_IMAGE) is
      do
      end

   reduce_image_close_paren (image: PARSER_IMAGE) is
      do
      end

   reduce_image_anychar (image: PARSER_IMAGE) is
      do
      end

   reduce_image_quote (image: PARSER_IMAGE) is
      do
      end

   reduce_image_hyphen (image: PARSER_IMAGE) is
      do
      end

   reduce_image_open_bracket (image: PARSER_IMAGE) is
      do
      end

   reduce_image_close_bracket (image: PARSER_IMAGE) is
      do
      end

   reduce_image_letter (image: PARSER_IMAGE) is
      do
      end

   reduce_image_space (image: PARSER_IMAGE) is
      do
      end

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
