-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class COMPOUND
   --
   -- An ordered sequence of INSTRUCTIONs (natural indexing from 1 to `count').
   --

inherit
   INSTRUCTION
      undefine out_in_tagged_out_memory
      end

insert
   TRAVERSABLE[INSTRUCTION]

create {ANY}
   make_2, make_3, make_4, make_n

create {CODE_ACCUMULATOR}
   from_list

create {COMPOUND}
   set_list

feature {ANY}
   start_position: POSITION
      do
         Result := list.first.start_position
      end

   safety_check (type: TYPE)
      local
         i: INTEGER
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            list.item(i).safety_check(type)
            i := i + 1
         end
      end

   simplify (type: TYPE): INSTRUCTION
      local
         inst1, inst2: INSTRUCTION; i, i2: INTEGER; l: like list
      do
         from
            i := list.lower
         until
            i > list.upper or else inst1 /= inst2
         loop
            inst1 := list.item(i)
            inst2 := inst1.simplify(type)
            i := i + 1
         end
         if inst1 = inst2 then
            -- Nothing done by all `simplify' calls:
            Result := Current
         else
            create l.with_capacity(list.count)
            from
               i2 := list.lower
            until
               i2 = i - 1
            loop
               simplify_add(l, list.item(i2))
               i2 := i2 + 1
            end
            -- Add the one at i - 1:
            simplify_add(l, inst2)
            -- The remainder of the `list':
            from
            until
               i > list.upper
            loop
               simplify_add(l, list.item(i).simplify(type))
               i := i + 1
            end
            inspect
               l.count
            when 0 then
               check
                  Result = Void
               end
            when 1 then
               Result := l.first.to_instruction
            else
               create {COMPOUND} Result.set_list(l)
            end
         end
      end

   use_current (type: TYPE): BOOLEAN
      local
         i: INTEGER
      do
         from
            i := list.lower
         until
            Result or else i > list.upper
         loop
            Result := list.item(i).use_current(type)
            i := i + 1
         end
      end

   has_been_specialized: BOOLEAN
      local
         i: INTEGER
      do
         Result := True
         from
            i := list.lower
         until
            not Result or else i > list.upper
         loop
            Result := list.item(i).has_been_specialized
            i := i + 1
         end
      end

   specialize_in (type: TYPE): like Current
      local
         l: like list; inst1, inst2: INSTRUCTION; i: INTEGER
      do
         from
            i := list.lower
         until
            inst1 /= inst2 or else i > list.upper
         loop
            inst1 := list.item(i)
            inst2 := inst1.specialize_in(type)
            i := i + 1
         end
         if inst1 = inst2 then
            Result := Current
         else
            Result := twin
            l := list.twin
            Result.set_list(l)
            from
               l.put(inst2, i - 1)
            until
               i > l.upper
            loop
               l.put(l.item(i).specialize_in(type), i)
               i := i + 1
            end
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         l: like list; inst1, inst2: INSTRUCTION; i: INTEGER
      do
         from
            i := list.lower
         until
            inst1 /= inst2 or else i > list.upper
         loop
            inst1 := list.item(i)
            inst2 := inst1.specialize_thru(parent_type, parent_edge, new_type)
            i := i + 1
         end
         if inst1 = inst2 then
            Result := Current
         else
            Result := twin
            l := list.twin
            Result.set_list(l)
            from
               l.put(inst2, i - 1)
            until
               i > l.upper
            loop
               l.put(l.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
               i := i + 1
            end
         end
      end

   specialize_and_check (type: TYPE): like Current
      local
         l: like list; inst1, inst2: INSTRUCTION; i: INTEGER
      do
         from
            i := list.lower
         until
            inst1 /= inst2 or else i > list.upper
         loop
            inst1 := list.item(i)
            inst2 := inst1.specialize_and_check(type)
            i := i + 1
         end
         if inst1 = inst2 then
            Result := Current
         else
            Result := twin
            l := list.twin
            Result.set_list(l)
            from
               l.put(inst2, i - 1)
            until
               i > l.upper
            loop
               l.put(l.item(i).specialize_and_check(type), i)
               i := i + 1
            end
         end
      end

   adapt_for (type: TYPE): like Current
      local
         l: like list; inst1, inst2: INSTRUCTION; i: INTEGER
      do
         from
            i := list.lower
         until
            inst1 /= inst2 or else i > list.upper
         loop
            inst1 := list.item(i)
            inst2 := inst1.adapt_for(type)
            i := i + 1
         end
         if inst1 = inst2 then
            Result := Current
         else
            Result := twin
            l := list.twin
            Result.set_list(l)
            from
               l.put(inst2, i - 1)
            until
               i > l.upper
            loop
               l.put(l.item(i).adapt_for(type), i)
               i := i + 1
            end
         end
      end

   end_mark_comment: BOOLEAN False

   pretty (indent_level: INTEGER)
      local
         i: INTEGER; instruction, previous_instruction: INSTRUCTION; lnbc: CHARACTER
         extra_semicolon_flag: BOOLEAN; comment: COMMENT; index_in_pretty_printer: INTEGER
      do
         pretty_printer.set_semi_colon_flag(True)
         i := list.lower
         instruction := list.item(i)
         -- The first one never need to be preceded by an extra ';':
         pretty_printer.set_indent_level(indent_level)
         instruction.pretty(indent_level)
         from
            i := i + 1
         until
            i > list.upper
         loop
            if pretty_printer.zen_mode and then i = list.upper then
               pretty_printer.set_semi_colon_flag(False)
            end
            previous_instruction := instruction
            instruction := list.item(i)
            -- Computing `extra_semicolon_flag' first:
            lnbc := pretty_printer.last_non_blank_character
            if lnbc = ';' then
               -- The ';' is already there.
               extra_semicolon_flag := False
            elseif lnbc = ')' then
               -- The previous got arguments, so no risk of ambiguity.
               extra_semicolon_flag := False
            elseif previous_instruction.end_mark_comment then
               -- No need of extra ';' after such a statement.
               extra_semicolon_flag := False
            elseif is_a_comment(previous_instruction) then
               -- No need of extra ';' after a comment.
               extra_semicolon_flag := False
            else
               extra_semicolon_flag := True
            end
            -- To be sure that an INSTRUCTION comment is well indented:
            pretty_printer.set_indent_level(indent_level)
            if extra_semicolon_flag then
               index_in_pretty_printer := pretty_printer.index_of_last_character
            end
            instruction.pretty(indent_level)
            if extra_semicolon_flag and then
               pretty_printer.is_opening_bracket_after(index_in_pretty_printer)
             then
               pretty_printer.erase_everything_after(index_in_pretty_printer)
               pretty_printer.put_character(';')
               index_in_pretty_printer := pretty_printer.index_of_last_character
               instruction.pretty(indent_level)
               pretty_printer.erase_separators_after(index_in_pretty_printer)
            end
            -- Taking care of the following comment:
            i := i + 1
            if (not ({COMMENT} ?:= instruction)) and then i <= list.upper then
               comment ?= list.item(i)
               if comment /= Void and then
                  comment.start_position.line = instruction.start_position.line and then
                  comment.count = 1
                then
                  -- The following comment is associated to the current `instruction'.
                  pretty_printer.prepare_for_same_line_comment
                  comment.pretty(indent_level)
                  instruction := comment
                  i := i + 1
               end
            end

            if i <= list.upper then
               if list.item(i).start_position.line > instruction.start_position.line + 1 then
                  -- keep grouped lines together
                  pretty_printer.put_character('%N')
               end
            end
         end
      end

   side_effect_free (type: TYPE): BOOLEAN
      local
         i: INTEGER
      do
         from
            i := list.lower
            Result := True
         until
            not Result or else i > list.upper
         loop
            Result := list.item(i).side_effect_free(type)
            i := i + 1
         end
      end

   collect (type: TYPE): TYPE
      local
         i: INTEGER; dummy: TYPE
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            dummy := list.item(i).collect(type)
            i := i + 1
         end
      end

   accept (visitor: COMPOUND_VISITOR)
      do
         visitor.visit_compound(Current)
      end

feature {EIFFEL_PARSER, EFFECTIVE_ROUTINE, EFFECTIVE_ARG_LIST}
   add_last (instruction: INSTRUCTION)
      require
         instruction.is_not_a_compound
      do
         list.add_last(instruction)
      ensure
         list.count = 1 + old list.count
      end

feature {ANY} -- Implementation of TRAVERSABLE:
   lower: INTEGER
      do
         Result := list.lower
      end

   upper: INTEGER
      do
         Result := list.upper
      end

   count: INTEGER
      do
         Result := list.count
      end

   is_empty: BOOLEAN
      do
         check
            False
         end
      end

   item (i: INTEGER): INSTRUCTION
      do
         Result := list.item(i)
      end

   first: like item
      require else
         True
      do
         Result := list.first
      end

   last: like item
      require else
         True
      do
         Result := list.last
      end

feature {}
   new_iterator: ITERATOR[INSTRUCTION]
      do
         check
            False -- Just use the usual pattern instead please.
         end
      end

feature {COMPOUND, COMPOUND_VISITOR}
   list: FAST_ARRAY[INSTRUCTION]
         -- Contains at least 2 INSTRUCTIONs (just because this is the canonical form to be enforced).

feature {COMPOUND}
   set_list (l: like list)
      require
         l.count >= 2
      do
         list := l
      ensure
         list = l
      end

feature {ANONYMOUS_FEATURE}
   twin_remove_first: INSTRUCTION
      local
         l: like list
      do
         if count = 2 then
            Result := list.last
         else
            l := list.twin
            l.remove_first
            create {COMPOUND} Result.set_list(l)
         end
      ensure
         Result /= Void
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         i, stamp, code_accumulator_index: INTEGER; instruction: INSTRUCTION
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            instruction := list.item(i)
            code_accumulator_index := code_accumulator.current_context.upper
            instruction.inline_dynamic_dispatch_(code_accumulator, type)
            from
               stamp := instruction.eiffel_parser_stamp
               code_accumulator_index := code_accumulator_index + 1
            until
               code_accumulator_index > code_accumulator.current_context.upper
            loop
               code_accumulator.current_context.item(code_accumulator_index).to_instruction.set_eiffel_parser_stamp(stamp)
               code_accumulator_index := code_accumulator_index + 1
            end
            i := i + 1
         end
      end

feature {}
   make_2 (i1, i2: INSTRUCTION)
      require
         i1.is_not_a_compound
         i2.is_not_a_compound
      do
         create list.make(2)
         list.put(i1, 0)
         list.put(i2, 1)
      ensure
         list.count = 2
         list.count = list.capacity
      end

   make_3 (i1, i2, i3: INSTRUCTION)
      require
         i1.is_not_a_compound
         i2.is_not_a_compound
         i3.is_not_a_compound
      do
         create list.make(3)
         list.put(i1, 0)
         list.put(i2, 1)
         list.put(i3, 2)
      ensure
         list.count = 3
         list.count = list.capacity
      end

   make_4 (i1, i2, i3, i4: INSTRUCTION)
      require
         i1.is_not_a_compound
         i2.is_not_a_compound
         i3.is_not_a_compound
         i4.is_not_a_compound
      do
         create list.make(4)
         list.put(i1, 0)
         list.put(i2, 1)
         list.put(i3, 2)
         list.put(i4, 3)
      ensure
         list.count = 4
         list.count = list.capacity
      end

   make_n (i1, i2, i3, i4, i5: INSTRUCTION)
      require
         i1.is_not_a_compound
         i2.is_not_a_compound
         i3.is_not_a_compound
         i4.is_not_a_compound
         i5.is_not_a_compound
      do
         create list.with_capacity(8)
         list.add_last(i1)
         list.add_last(i2)
         list.add_last(i3)
         list.add_last(i4)
         list.add_last(i5)
      ensure
         list.count = 5
         list.count < list.capacity
      end

   from_list (l: FAST_ARRAY[CODE])
      require
         l.count >= 2
      local
         i: INTEGER
      do
         from
            create list.with_capacity(l.count)
            i := l.lower
         until
            list.count = l.count
         loop
            list.add_last(l.item(i).to_instruction)
            i := i + 1
         end
      ensure
         list /= l
         list.count = l.count
      end

   canonical_form (l: like list): BOOLEAN
      require
         canonical_form(l)
      local
         i: INTEGER
      do
         Result := True
         from
            i := l.lower
         until
            not Result or else i > l.upper
         loop
            Result := l.item(i).is_not_a_compound
            i := i + 1
         end
      ensure
         assertion_check_only: Result
      end

   simplify_add (l: like list; new_item: INSTRUCTION)
      require
         l /= Void
      local
         compound: COMPOUND; i: INTEGER
      do
         if new_item = Void then
            -- Well, sometimes, the simplified instruction does nothing.
         elseif {COMPOUND} ?:= new_item then
            from
               compound ::= new_item
               i := compound.lower
            until
               i > compound.upper
            loop
               simplify_add(l, compound.item(i))
               i := i + 1
            end
         else
            l.add_last(new_item)
         end
      ensure
         l.count >= old l.count
      end

   is_a_comment (instruction: INSTRUCTION): BOOLEAN
      local
         comment: COMMENT
      do
         comment ?= instruction
         Result := comment /= Void
      end

invariant
   list.count >= 2

   canonical_form(list)

end -- class COMPOUND
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
