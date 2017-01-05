-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ASSERTION_LIST
   --
   -- To store a list of assertions (see ASSERTION). Used as a basic element to represent
   -- class invariant, ensure, require, loop invariant, check compound, etc.
   --

inherit
   INSTRUCTION
      undefine out_in_tagged_out_memory
      end
   TRAVERSABLE[ASSERTION]

insert
   ASSERTION_PRINT_TOOLS
      undefine out_in_tagged_out_memory
      end

create {ANY}
   make

feature {ANY}
   start_position: POSITION
         -- The position of the corresponding keyword in the source code.

   header_comment: COMMENT

   specialize_in (type: TYPE): like Current
      local
         i: INTEGER; a1, a2: ASSERTION; l: like list
      do
         if list = Void then
            Result := Current
         else
            from
               i := list.lower
            until
               a1 /= a2 or else i > list.upper
            loop
               a1 := list.item(i)
               a2 := a1.specialize_in(type)
               i := i + 1
            end
            if a1 = a2 then
               Result := Current
            else
               from
                  l := list.twin
                  Result := twin
                  Result.set_list(l)
                  l.put(a2, i - 1)
               until
                  i > list.upper
               loop
                  l.put(list.item(i).specialize_in(type), i)
                  i := i + 1
               end
            end
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         i: INTEGER; a1, a2: ASSERTION; l: like list
      do
         if list = Void then
            Result := Current
         else
            from
               i := list.lower
            until
               a1 /= a2 or else i > list.upper
            loop
               a1 := list.item(i)
               a2 := a1.specialize_thru(parent_type, parent_edge, new_type)
               i := i + 1
            end
            if a1 = a2 then
               Result := Current
            else
               from
                  l := list.twin
                  Result := twin
                  Result.set_list(l)
                  l.put(a2, i - 1)
               until
                  i > list.upper
               loop
                  l.put(list.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
                  i := i + 1
               end
            end
         end
      end

   specialize_and_check (type: TYPE): like Current
      local
         i: INTEGER; a1, a2: ASSERTION; l: like list
      do
         if list = Void then
            Result := Current
         else
            from
               i := list.lower
            until
               a1 /= a2 or else i > list.upper
            loop
               a1 := list.item(i)
               a2 := a1.specialize_and_check(type)
               i := i + 1
            end
            if a1 = a2 then
               Result := Current
            else
               from
                  l := list.twin
                  Result := twin
                  Result.set_list(l)
                  l.put(a2, i - 1)
               until
                  i > list.upper
               loop
                  l.put(list.item(i).specialize_and_check(type), i)
                  i := i + 1
               end
            end
         end
      end

   has_been_specialized: BOOLEAN
      local
         i: INTEGER
      do
         Result := True
         if list /= Void then
            from
               i := list.lower
            until
               not Result or else i > list.upper
            loop
               Result := list.item(i).has_been_specialized
               i := i + 1
            end
         end
      end

   side_effect_free (type: TYPE): BOOLEAN
      local
         i: INTEGER
      do
         Result := True
         if list /= Void then
            from
               i := list.lower
            until
               not Result or else i > list.upper
            loop
               Result := list.item(i).side_effect_free(type)
               i := i + 1
            end
         end
      end

   is_always_true (type: TYPE): BOOLEAN
      local
         i: INTEGER; assertion: ASSERTION
      do
         Result := True
         if list /= Void then
            from
               i := list.lower
            until
               not Result or else i > list.upper
            loop
               assertion := list.item(i)
               Result := assertion.is_always_true(type)
               i := i + 1
            end
         end
      end

   collect (type: TYPE): TYPE
      local
         i: INTEGER; dummy: TYPE
      do
         if list /= Void then
            from
               i := list.lower
            until
               i > list.upper
            loop
               dummy := list.item(i).collect(type)
               i := i + 1
            end
         end
      end

   safety_check (type: TYPE)
      local
         i: INTEGER
      do
         if list /= Void then
            from
               i := list.lower
            until
               i > list.upper
            loop
               list.item(i).safety_check(type)
               i := i + 1
            end
         end
      end

   simplify (type: TYPE): like Current
      do
         check
            simplify_is_only_made_for_boost: False
         end
         not_yet_implemented -- To be warned as well in -boost mode.
      end

   adapt_for (type: TYPE): like Current
      local
         i: INTEGER; a1, a2: ASSERTION; l: like list
      do
         if list = Void then
            Result := Current
         else
            from
               i := list.lower
            until
               a1 /= a2 or else i > list.upper
            loop
               a1 := list.item(i)
               a2 := a1.adapt_for(type)
               i := i + 1
            end
            if a1 = a2 then
               Result := Current
            else
               from
                  l := list.twin
                  Result := twin
                  Result.set_list(l)
                  l.put(a2, i - 1)
               until
                  i > l.upper
               loop
                  l.put(list.item(i).adapt_for(type), i)
                  i := i + 1
               end
            end
         end
      end

   accept (visitor: ASSERTION_LIST_VISITOR)
      do
         visitor.visit_assertion_list(Current)
      end

   use_current (type: TYPE): BOOLEAN
      local
         i: INTEGER
      do
         if list /= Void then
            from
               i := list.lower
            until
               Result or else i > list.upper
            loop
               Result := list.item(i).use_current(type)
               i := i + 1
            end
         end
      end

   set_header_comment (hc: like header_comment)
      do
         header_comment := hc
      end

   pretty (indent_level: INTEGER)
      do
         check
            False -- This one must never be called.
         end
         not_yet_implemented -- To be warned as well in -boost mode.
      end

   end_mark_comment: BOOLEAN
      do
         check
            False
         end
      end

feature {ANY} -- Implementation of TRAVERSABLE:
   lower: INTEGER
      do
         if not is_empty then
            Result := list.lower
         end
      end

   upper: INTEGER
      do
         if is_empty then
            Result := -1
         else
            Result := list.upper
         end
      end

   count: INTEGER
      do
         if not is_empty then
            Result := list.count
         end
      end

   is_empty: BOOLEAN
      do
         Result := list = Void
      end

   item (i: INTEGER): ASSERTION
      do
         Result := list.item(i)
      end

   first: like item
      do
         Result := list.first
      end

   last: like item
      do
         Result := list.last
      end

   new_iterator: ITERATOR[ASSERTION]
      do
         Result := list.new_iterator
      end

feature {ASSERTION_LIST_VISITOR}
   list: FAST_ARRAY[ASSERTION]

feature {}
   make (sp: like start_position; hc: like header_comment; l: like list)
      require
         not sp.is_unknown
         l /= Void implies not l.is_empty
         hc /= Void or else l /= Void
      do
         start_position := sp
         header_comment := hc
         list := l
      ensure
         start_position = sp
         header_comment = hc
         list = l
      end

feature {CLASS_TEXT, REQUIRE_ASSERTION}
   pretty_print_with_tag (indent_level: INTEGER; name: STRING)
         -- Where `name' can be "require", "require else", "ensure", "ensure then" or "check" as well.
      local
         index_in_pretty_printer, i: INTEGER
      do
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.put_string(name)
         if header_comment /= Void then
            pretty_printer.set_indent_level(indent_level + 1)
            header_comment.pretty(indent_level)
         end
         if list /= Void then
            from
               i := list.lower
            until
               i > list.upper
            loop
               pretty_printer.set_semi_colon_flag(False)
               index_in_pretty_printer := pretty_printer.index_of_last_character
               list.item(i).pretty(indent_level + 1)
               if i > list.lower and then pretty_printer.is_opening_bracket_after(index_in_pretty_printer) then
                  pretty_printer.erase_everything_after(index_in_pretty_printer)
                  pretty_printer.set_indent_level(indent_level + 1)
                  pretty_printer.put_character(';')
                  index_in_pretty_printer := pretty_printer.index_of_last_character
                  pretty_printer.set_semi_colon_flag(False)
                  list.item(i).pretty(indent_level + 1)
                  pretty_printer.erase_separators_after(index_in_pretty_printer)
               end
               i := i + 1
            end
         end
      end

feature {TYPE, ANONYMOUS_FEATURE_MIXER}
   add_items_from (other_list: like Current): like Current
         -- Add inherited `other_list' to `Current' only if it is really new code (i.e. using
         -- `start_position' to decide.).
      require
         other_list /= Void
      local
         l: like list; i: INTEGER; assertion: ASSERTION
      do
         if start_position = other_list.start_position then
            Result := Current
         elseif other_list.is_empty then
            Result := Current
         else
            from
               i := other_list.lower
            until
               i > other_list.upper
            loop
               assertion := other_list.item(i)
               if not Current.has_assertion_located_at(assertion.start_position) then
                  if l = Void then
                     if list /= Void then
                        l := list.twin
                     else
                        create l.with_capacity(other_list.count)
                     end
                  end
                  l.add_last(assertion)
               end
               i := i + 1
            end
            if l = Void then
               Result := Current
            else
               Result := twin
               Result.set_list(l)
            end
         end
      ensure
         Result.start_position = start_position
         Result.count >= old count
      end

feature {ASSERTION_LIST}
   has_assertion_located_at (sp: POSITION): BOOLEAN
         -- Is there already the source code of the assertion located at `sp' ?
      require
         not sp.is_unknown
      local
         i: INTEGER
      do
         if list /= Void then
            from
               i := list.lower
            until
               Result or else i > list.upper
            loop
               Result := list.item(i).start_position = sp
               i := i + 1
            end
         end
      end

   set_list (l: like list)
      require
         l /= Void
      do
         list := l
      ensure
         list = l
      end

feature {LOOP_INSTRUCTION}
   pretty_as_loop_invariant (indent_level: INTEGER)
      do
         pretty_print_with_tag(indent_level, once "invariant")
      end

feature {CHECK_COMPOUND}
   pretty_as_check_compound (indent_level: INTEGER; chk: CHECK_COMPOUND)
      require
         chk /= Void
      do
         pretty_print_with_tag(indent_level, once "check")
         chk.pretty_index(indent_level, Void)
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.keyword(once "end")
         if pretty_printer.print_end_of_statement then
            pretty_printer.put_end_of(once "check")
         end
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         i: INTEGER; assertion1, assertion2: ASSERTION; l: like list; al: like Current
      do
         if list = Void then
            code_accumulator.current_context.add_last(Current)
         else
            from
               i := list.lower
            until
               i > list.upper or else assertion1 /= assertion2
            loop
               assertion1 := list.item(i)
               code_accumulator.open_new_context
               assertion1.inline_dynamic_dispatch_(code_accumulator, type)
               check
                  code_accumulator.current_context.count = 1
               end
               assertion2 ::= code_accumulator.current_context.last
               code_accumulator.close_current_context
               i := i + 1
            end
            if assertion1 = assertion2 then
               code_accumulator.current_context.add_last(Current)
            else
               from
                  l := list.twin
                  l.put(assertion2, i - 1)
               until
                  i > l.upper
               loop
                  code_accumulator.open_new_context
                  l.item(i).inline_dynamic_dispatch_(code_accumulator, type)
                  check
                     code_accumulator.current_context.count = 1
                  end
                  assertion1 ::= code_accumulator.current_context.last
                  code_accumulator.close_current_context
                  l.put(assertion1, i)
                  i := i + 1
               end
               al := twin
               al.set_list(l)
               code_accumulator.current_context.add_last(al)
            end
         end
      end

invariant
   not start_position.is_unknown

   list /= Void implies not list.is_empty

end -- class ASSERTION_LIST
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
