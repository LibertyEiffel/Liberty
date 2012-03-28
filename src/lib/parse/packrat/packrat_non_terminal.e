-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PACKRAT_NON_TERMINAL
   --
   -- A non-terminal meant to be put in a PARSE_TABLE.
   --
   -- The only way to create a non-terminal is to use SmartEiffel's manifest notation.
   --
   -- The structure of this notation is:
   --
   --    {PACKRAT_NON_TERMINAL << rule, agent;
   --                             rule, agent;
   --                               . . .
   --                             rule, agent
   --                          >>}
   --
   -- where each rule is a TRAVERSABLE[STRING] (with each String being the name of an atom of the
   -- PARSE_TABLE), and each agent may either be Void or a PROCEDURE[TUPLE] called when reducing the
   -- non-terminal.
   --

inherit
   PARSE_NON_TERMINAL

creation {ANY}
   manifest_creation

feature {ANY}
   out_in_tagged_out_memory is
      do
         tagged_out_memory.extend('{')
         not_yet_implemented
         tagged_out_memory.extend('}')
      end

   is_coherent: BOOLEAN is
      do
         not_yet_implemented
      end

feature {PARSER_FACET}
   parse (buffer: MINI_PARSER_BUFFER; actions_list: COLLECTION[PARSE_ACTION]): TRISTATE is
      do
      end

feature {PARSE_TABLE}
   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]]) is
      local
         i, j: INTEGER
      do
         from
            i := rules.lower
         until
            i > rules.upper
         loop
            if actions.item(i) = Void then
               actions.put(non_terminal_builder, i)
            end
            from
               j := rules.item(i).lower
            until
               j > rules.item(i).upper
            loop
               rules.item(i).item(j).set_default_tree_builders(non_terminal_builder, terminal_builder)
               j := j + 1
            end
            i := i + 1
         end
      end

feature {ANY}
   copy (other: like Current) is
      do
         name := other.name
         -- shallow copy should be enough
         rules := other.rules.twin
         actions := other.actions.twin
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result := name.is_equal(other.name) and then rules.is_equal(other.rules) and then actions.is_equal(other.actions)
      end

   add (rule: TRAVERSABLE[PACKRAT_ALTERNATIVE]; action: PROCEDURE[TUPLE]) is
      do
         rules.add_last(rule)
         actions.add_last(action)
      end

feature {}
   manifest_make (needed_capacity: INTEGER) is
      do
         create rules.with_capacity(needed_capacity)
         create actions.with_capacity(needed_capacity)
      ensure
         rules.is_empty
         actions.is_empty
      end

   manifest_put (index: INTEGER; rule: TRAVERSABLE[PACKRAT_ALTERNATIVE]; action: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]) is
      require
         rule /= Void
      do
         rules.add_last(rule)
         actions.add_last(action)
      ensure
         rules.count = 1 + old rules.count
         actions.count = 1 + old actions.count
         rules.last = rule
         actions.last = action
      end

   manifest_semicolon_check: INTEGER is 2

feature {PACKRAT_NON_TERMINAL}
   rules: FAST_ARRAY[TRAVERSABLE[PACKRAT_ALTERNATIVE]]
   actions: FAST_ARRAY[PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]]

invariant
   rules.count = actions.count
   rules.lower = actions.lower

end -- class PACKRAT_NON_TERMINAL
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
