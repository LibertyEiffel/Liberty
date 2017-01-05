-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class COMMENT
   --
   -- To store a comment (of one or more lines).
   --
   -- Note : for pretty printing, the original text source is stored.
   --

inherit
   INSTRUCTION

create {ANY}
   make

create {CLASS_CHECKER}
   from_string

feature {ANY}
   start_position: POSITION

   short (h1, r1, h2, r2: STRING)
      local
         i, j: INTEGER; l: STRING; c: CHARACTER; open_quote: BOOLEAN
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            short_printer.hook_or(h1, r1)
            short_printer.hook("BECL")
            l := list.item(i)
            from
               j := 1
            until
               j > l.count
            loop
               c := l.item(j)
               inspect
                  c
               when '_' then
                  short_printer.hook_or("Ucomment", "_")
               when '`' then
                  open_quote := True
                  short_printer.hook_or("op_quote", "`")
               when '%'' then
                  if open_quote then
                     open_quote := False
                     short_printer.hook_or("cl_quote", "'")
                  else
                     short_printer.put_character(c)
                  end
               else
                  short_printer.put_character(c)
               end
               j := j + 1
            end
            short_printer.hook("AECL")
            short_printer.hook_or(h2, r2)
            i := i + 1
         end
      end

   has_been_specialized: BOOLEAN True

   specialize_in (type: TYPE): like Current
      do
         Result := Current
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      do
         Result := Current
      end

   specialize_and_check (type: TYPE): like Current
      do
         Result := Current
      end

   collect (type: TYPE): TYPE
      do
      end

   simplify (type: TYPE): INSTRUCTION
      do
         smart_eiffel.magic_count_increment
      end

   adapt_for (type: TYPE): like Current
      do
         Result := Current
      end

   end_mark_comment: BOOLEAN False

   safety_check (type: TYPE)
      do
      end

   use_current (type: TYPE): BOOLEAN
      do
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := True
      end

   pretty (indent_level: INTEGER)
         -- Print the comment, and finish with '%N' output.
      require else
         True
      local
         i: INTEGER
      do
         if list.count = 1 then
            -- One-line comment:
            pretty_printer.put_one_line_comment(indent_level, list.first)
         else
            -- Multi-lines comment are better when left-aligned:
            pretty_printer.set_indent_level(indent_level)
            -- Because the first line of this multi-lines comment may be the end mark
            -- comment of the previous statement:
            pretty_printer.put_one_line_comment(indent_level, list.first)
            from
               i := list.lower + 1
            until
               i > list.upper
            loop
               pretty_printer.set_indent_level(indent_level)
               pretty_printer.put_string(once "--")
               pretty_printer.put_string(list.item(i))
               i := i + 1
            end
         end
         pretty_printer.set_indent_level(indent_level)
      end

   count: INTEGER
         -- Number of lines of the comment.
      do
         Result := list.count
      end

   accept (visitor: COMMENT_VISITOR)
      do
         visitor.visit_comment(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
      end

feature {ANONYMOUS_FEATURE}
   is_dummy_feature_end (e_feature: ANONYMOUS_FEATURE): BOOLEAN
         -- Is this comment a dummy en comment of the `e_feature'?
      local
         first_line, name: STRING
      do
         name := e_feature.first_name.to_string
         first_line := list.first
         if first_line.first_substring_index(name).in_range(1, 3) then
            Result := first_line.count < name.count + 5
         end
         if Result and then count > 1 then
            list.remove(list.lower)
            Result := False
         end
      end

feature {CLASS_TEXT, COMMENT_VISITOR}
   is_dummy_class_text_end (class_text: CLASS_TEXT): BOOLEAN
         -- Is this comment a dummy en comment of the `class_text'?
      require
         class_text /= Void
      local
         first_line, name: STRING
      do
         name := class_text.name.to_string
         first_line := list.first
         if first_line.first_substring_index(name).in_range(1, 9) then
            Result := True
         end
         if Result and then count > 1 then
            list.remove(list.lower)
            Result := False
         end
      end

   good_end_warning_check (name: CLASS_NAME)
      do
         if not list.item(1).has_substring(name.to_string) then
            error_handler.add_position(name.start_position)
            error_handler.add_position(start_position)
            error_handler.append(once "Bad comment to end a class.")
            error_handler.print_as_style_warning
         end
      end

feature {COMMENT, COMMENT_VISITOR}
   list: ARRAY[STRING]
         -- The contents of the comment.

feature {PARSER}
   add_last (line: STRING)
      require
         line.occurrences('%N') = 0
      do
         list.add_last(line)
         from
         until
            line.is_empty or else not (once "%T ").has(line.last)
         loop
            line.remove_last
         end
      ensure
         count = 1 + old count
      end

   append (other: like Current)
      require
         other /= Void
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > other.list.upper
         loop
            add_last(other.list.item(i))
            i := i + 1
         end
      end

feature {}
   make (sp: like start_position; first: STRING)
      require
         not sp.is_unknown
         first /= Void
      do
         start_position := sp
         create list.with_capacity(4, 1)
         list.add_last(first)
      ensure
         start_position = sp
         list.first = first
      end

   from_string (ct: CLASS_TEXT; multi_line: STRING)
         -- To create a multi-line comment for `ct' in a single step.
      require
         multi_line.has('%N')
      local
         one_line: STRING; i1, i2: INTEGER
      do
         start_position.set_class_text(ct)

         create list.with_capacity(1 + multi_line.occurrences('%N'), 1)
         from
            i1 := multi_line.lower
            i2 := multi_line.lower
         until
            i2 > multi_line.upper
         loop
            i2 := multi_line.index_of('%N', i1)
            if i2 > multi_line.upper then
               -- The very last line:
               one_line := multi_line.substring(i1, multi_line.upper)
            else
               one_line := multi_line.substring(i1, i2 - 1)
               i1 := i2 + 1
            end
            one_line.add_first(' ')
            list.add_last(one_line)
         end
      end

invariant
   not start_position.is_unknown

   not list.is_empty

   list.lower = 1

end -- class COMMENT
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
