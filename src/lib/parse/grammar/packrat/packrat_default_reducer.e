-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PACKRAT_DEFAULT_REDUCER

inherit
   PACKRAT_REDUCER

insert
   PACKRAT_FEATURES
   LOGGING

create {PACKRAT_GRAMMAR}
   make

feature {}
   make
      do
         last_image := ""
         last_nonterminal_def := ""
         last_nonterminal_name := ""
         last_charclass := ""
         last_literal := ""
         last_tag := ""

         reset_build_data
      end

feature {PACKRAT_GRAMMAR}
   parsed_table: PARSE_TABLE[PACKRAT_PARSE_CONTEXT]
      local
         i: INTEGER
         key: FIXED_STRING; item: PARSE_ATOM[PACKRAT_PARSE_CONTEXT]
      do
         create Result.with_capacity(last_atoms.count)
         from
            i := last_atoms.lower
         until
            i > last_atoms.upper
         loop
            key := last_atoms.key(i)
            item := last_atoms.item(i)
            debug
               log.info.put_line("Adding atom #(1)" # key)
            end
            Result.add(key, item)
            i := i + 1
         end
      ensure
         useful: Result.is_coherent
      end

feature {PACKRAT_GRAMMAR}
   reduce_nonterminal_def
      do
         last_nonterminal_def.copy(last_nonterminal_name)
         reset_image
      end

   reduce_grammar
      do
         add_atom(last_nonterminal_def.intern, create {PACKRAT_NON_TERMINAL}.make(last_pattern))
         reset_pattern
         reset_nonterminal_def
      end

   reduce_pattern_first_alternative
      do
         first_alternative := last_alternative
         reset_alternative
      end

   reduce_pattern_alternative
      do
         last_choice.add_last(seq(last_alternative, one, Void, Void))
         reset_alternative
      end

   reduce_pattern
      do
         last_pattern := seq(first_alternative, one, Void, Void)
         last_choice.for_each(agent reduce_pattern_map(?))
         reset_choice
      end

   reduce_pattern_map (alt: PACKRAT_ALTERNATIVE)
      do
         last_pattern := last_pattern / alt
      end

   reduce_alternative_lookahead
      do
         check
            last_lookahead /= lookahead_none
         end
         inspect
            last_lookahead
         when lookahead_and then
            last_alternative.add_last(seq(<< last_primary >>, one, Void, Void).positive_lookahead)
         when lookahead_not then
            last_alternative.add_last(seq(<< last_primary >>, one, Void, Void).negative_lookahead)
         end
         reset_lookahead
      end

   reduce_alternative_suffix_tag
      do
      end

   reduce_alternative_tag
      do
         check
            last_lookahead = lookahead_none
         end
         if not last_tag.is_empty then
            last_primary := seq(<< last_primary >>, one, last_tag, Void)
            reset_tag
         end
         last_alternative.add_last(last_primary)
      end

   reduce_alternative
      do
      end

   reduce_quantifier
      do
      end

   reduce_suffix
      do
         if last_quantifier /= one then
            last_primary := seq(<< last_primary >>, last_quantifier, Void, Void)
            reset_quantifier
         end
      end

   reduce_primary_as_nested_pattern
      do
         last_primary := last_pattern
      end

   reduce_primary_as_any
      local
         terminal_name: FIXED_STRING; terminal: PACKRAT_TERMINAL
      do
         terminal_name := (once ".").intern
         terminal ::= atom(terminal_name)
         if terminal = Void then
            create terminal.make(agent parse_any(?), Void)
            add_atom(terminal_name, terminal)
         end
         last_primary := ref(terminal_name)
      end

   reduce_primary_as_literal
      local
         terminal_name: FIXED_STRING; terminal: PACKRAT_TERMINAL
      do
         terminal_name := ("'#(1)'" # last_literal).intern
         terminal ::= atom(terminal_name)
         if terminal = Void then
            create terminal.make(agent parse_string(?, last_literal.twin), Void)
            add_atom(terminal_name, terminal)
         end
         last_primary := ref(terminal_name)
      end

   reduce_primay_as_charclass
      local
         terminal_name: FIXED_STRING; terminal: PACKRAT_TERMINAL
         regex: REGULAR_EXPRESSION; regex_factory: REGULAR_EXPRESSION_BUILDER
      do
         terminal_name := ("[#(1)]" # last_charclass).intern
         terminal ::= atom(terminal_name)
         if terminal = Void then
            regex := regex_factory.convert_posix_pattern(terminal_name.out)
            create terminal.make(agent parse_regex(?, regex), Void)
            add_atom(terminal_name, terminal)
         end
         last_primary := ref(terminal_name)
      end

   reduce_primary_as_nonterminal
      do
         last_primary := ref(last_nonterminal_name)
         reset_image
      end

   reduce_literal_start
      do
         reset_image
      end

   reduce_literal_string
      do
      end

   reduce_literal
      do
         last_literal.copy(last_image)
         reset_image
      end

   reduce_tag_start
      do
         reset_image
      end

   reduce_tag_string
      do
      end

   reduce_tag
      do
         last_tag.copy(last_image)
         reset_image
      end

   reduce_charclass_start
      do
         reset_image
      end

   reduce_charclass_range
      do
      end

   reduce_charclass_char
      do
      end

   reduce_charclass_class
      do
      end

   reduce_charclass
      do
         last_charclass.copy(last_image)
         reset_image
      end

   reduce_nonterminal_name
      do
      end

   reduce_nonterminal
      do
         last_nonterminal_name.copy(last_image)
         reset_image
      end

   reduce_space
      do
      end

   reduce_image_left_arrow (image: PARSER_IMAGE)
      do
      end

   reduce_image_slash (image: PARSER_IMAGE)
      do
      end

   reduce_image_not_and (image: PARSER_IMAGE)
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

   reduce_image_star_plus_why (image: PARSER_IMAGE)
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

   reduce_image_open_paren (image: PARSER_IMAGE)
      do
         save_pattern
      end

   reduce_image_close_paren (image: PARSER_IMAGE)
      do
         last_pattern.set_paren(True)
         restore_pattern
      end

   reduce_image_anychar, reduce_image_letter, reduce_image_regex, reduce_image_string (image: PARSER_IMAGE)
      local
         pi: PACKRAT_IMAGE
      do
         pi ::= image
         last_image.append(pi.image)
      end

   reduce_image_quote (image: PARSER_IMAGE)
      do
      end

   reduce_image_hyphen (image: PARSER_IMAGE)
      do
         last_image.extend('-')
      end

   reduce_image_dot (image: PARSER_IMAGE)
      do
         last_image.extend('.')
      end

   reduce_image_open_bracket (image: PARSER_IMAGE)
      do
      end

   reduce_image_close_bracket (image: PARSER_IMAGE)
      do
      end

   reduce_image_open_curly (image: PARSER_IMAGE)
      do
      end

   reduce_image_close_curly (image: PARSER_IMAGE)
      do
      end

   reduce_image_space (image: PARSER_IMAGE)
      do
      end

feature {} -- build the grammar
   last_atoms: LINKED_HASHED_DICTIONARY[PARSE_ATOM[PACKRAT_PARSE_CONTEXT], FIXED_STRING]
   last_pattern: PACKRAT_PATTERN
   last_choice: FAST_ARRAY[PACKRAT_ALTERNATIVE]
   last_alternative, first_alternative: FAST_ARRAY[PACKRAT_PRIMARY]
   last_primary: PACKRAT_PRIMARY
   last_quantifier: INTEGER_8
   last_lookahead: INTEGER_8

   last_image, last_nonterminal_def, last_nonterminal_name, last_charclass, last_literal, last_tag: STRING

   lookahead_none: INTEGER_8 0
   lookahead_and: INTEGER_8 1
   lookahead_not: INTEGER_8 2

   add_atom (a_name: FIXED_STRING; a_atom: PARSE_ATOM[PACKRAT_PARSE_CONTEXT])
      require
         a_name /= Void
         a_atom /= Void
         atom(a_name) = Void
      do
         if last_atoms = Void then
            create last_atoms.make
         end
         debug
            log.info.put_line("Registering atom #(1)" # a_name)
         end
         last_atoms.add(a_atom, a_name)
      ensure
         atom(a_name) = a_atom
      end

   atom (a_name: FIXED_STRING): PARSE_ATOM[PACKRAT_PARSE_CONTEXT]
      require
         a_name /= Void
      do
         if last_atoms /= Void then
            Result := last_atoms.fast_reference_at(a_name)
         end
      end

   reset_nonterminal_def
      do
         last_nonterminal_def.clear_count
      end

   reset_image
      do
         last_image.clear_count
      end

   reset_quantifier
      do
         last_quantifier := one
      end

   reset_lookahead
      do
         last_lookahead := lookahead_none
      end

   reset_alternative
      do
         create last_alternative.make(0)
      end

   reset_choice
      do
         create last_choice.make(0)
      end

   reset_pattern
      do
         last_pattern := Void
      end

   reset_tag
      do
         last_tag.clear_count
      end

   reset_build_data
      do
         if last_atoms /= Void then
            last_atoms.clear_count
         end
         reset_nonterminal_def
         reset_image
         reset_quantifier
         reset_lookahead
         reset_alternative
         reset_choice
         reset_pattern
         reset_tag
         create position
      end

   last_patterns_stack: STACK[TUPLE[FAST_ARRAY[PACKRAT_ALTERNATIVE], FAST_ARRAY[PACKRAT_PRIMARY], FAST_ARRAY[PACKRAT_PRIMARY]]]

   save_pattern
      do
         if last_patterns_stack = Void then
            create last_patterns_stack.with_capacity(4)
         end
         last_patterns_stack.push([last_choice, last_alternative, first_alternative])
         reset_choice
         reset_alternative
      end

   restore_pattern
      do
         last_choice := last_patterns_stack.top.first
         last_alternative := last_patterns_stack.top.second
         first_alternative := last_patterns_stack.top.third
         last_patterns_stack.pop
      end

invariant
   last_nonterminal_def /= Void
   last_image /= Void

end -- class PACKRAT_DEFAULT_REDUCER
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
