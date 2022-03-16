-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class WHEN_CLAUSE
   --
   -- To store a when clause of an inspect instruction. Even if a WHEN_CLAUSE is not an ordinary
   -- INSTRUCTION, it is convenient to inherit INSTRUCTION (contracts an exports).
   --

inherit
   INSTRUCTION

create {EIFFEL_PARSER}
   parser_make

create {ANY}
   make

create {INTROSPECTION_HANDLER}
   make_strippable

create {PROCEDURE_CALL, FUNCTION_CALL}
   make_dynamic_dispatch

feature {ANY}
   start_position: POSITION
         -- Of the first character of keyword "when".

   header_comment: COMMENT
         -- Of the when clause.

   compound: INSTRUCTION
         -- Of the when clause if any.

   end_mark_comment: BOOLEAN
      do
         check
            False -- Current is not really an INSTRUCTION.
         end
      end

   use_current (type: TYPE): BOOLEAN
      do
         if compound /= Void then
            Result := compound.use_current(type)
         end
      end

   specialize_in (new_type: TYPE): like Current
      local
         i: INTEGER; c: like compound; l: like list; wi1, wi2: WHEN_ITEM
      do
         if compound /= Void then
            c := compound.specialize_in(new_type)
         end
         from
            i := list.lower
         until
            wi1 /= wi2 or else i > list.upper
         loop
            wi1 := list.item(i)
            wi2 := wi1.specialize_in(new_type)
            i := i + 1
         end
         if c = compound and then wi1 = wi2 then
            Result := Current
         else
            Result := twin
            if wi1 = wi2 then
               Result.set_compound(c)
            else
               -- ***
               not_yet_implemented
               -- ***
               -- My guess is that specialize_in must be procedure in WHEN_ITEM !!!
               -- If the compiler does not crash... I am right.
               -- *** DOM April 23 th 2008 ***
               from
                  l := list.twin
                  l.put(wi2, i - 1)
               until
                  i > l.upper
               loop
                  l.put(list.item(i).specialize_in(new_type), i)
                  i := i + 1
               end
               Result.init(c, l)
            end
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         i: INTEGER; c: like compound; l: like list; wi1, wi2: WHEN_ITEM
      do
         if compound /= Void then
            c := compound.specialize_thru(parent_type, parent_edge, new_type)
         end
         from
            i := list.lower
         until
            wi1 /= wi2 or else i > list.upper
         loop
            wi1 := list.item(i)
            wi2 := wi1.specialize_thru(parent_type, parent_edge, new_type)
            i := i + 1
         end
         if c = compound and then wi1 = wi2 then
            Result := Current
         else
            Result := twin
            if wi1 = wi2 then
               Result.set_compound(c)
            else
               -- ***
               not_yet_implemented
               -- ***
               -- My guess is that specialize_thru must be procedure in WHEN_ITEM !!!
               -- If the compiler does not crash... I am right.
               -- *** DOM April 23 th 2008 ***
               from
                  l := list.twin
                  l.put(wi2, i - 1)
               until
                  i > l.upper
               loop
                  l.put(list.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
                  i := i + 1
               end
               Result.init(c, l)
            end
         end
      end

   specialize_and_check (type: TYPE): INSTRUCTION
      do
         check
            False -- *** Why is the work done in INSPECT_STATEMENT ?? *** DOM April 20th 2008 ***
         end
         not_yet_implemented -- To be warned even in -boost mode.
      end

   has_been_specialized: BOOLEAN
      local
         i: INTEGER
      do
         Result := compound /= Void implies compound.has_been_specialized
         from
            i := list.lower
         until
            not Result or else i > list.upper
         loop
            Result := list.item(i).has_been_specialized
            i := i + 1
         end
      end

   side_effect_free (type: TYPE): BOOLEAN
      local
         i: INTEGER
      do
         if compound.side_effect_free(type) then
            from
               Result := True
               i := list.lower
            until
               i > list.upper
            loop
               Result := list.item(i).side_effect_free(type)
               i := i + 1
            end
         end
      end

   accept (visitor: WHEN_CLAUSE_VISITOR)
      do
         visitor.visit_when_clause(Current)
      end

feature {INSPECT_STATEMENT}
   create_merged_with (other: like Current): like Current
         -- Assuming that `Current' has the same compound as `other', the `Result' is the merged.
      require
         values_not_yet_computed: values = Void
      local
         l: like list
      do
         Result := twin
         l := list.twin
         l.append_traversable(other.list)
         Result.set_list(l)
      end

feature {WHEN_CLAUSE_VISITOR}
   is_more_complex_than (other: like Current): BOOLEAN
      do
         Result := list.count > other.list.count
      end

feature {INSPECT_STATEMENT}
   condition_live_type: LIVE_TYPE

   set_condition_live_type (clt: like condition_live_type)
      do
         condition_live_type := clt
      ensure
         condition_live_type = clt
      end

feature {ANY}
   collect (type: TYPE): TYPE
      local
         i: INTEGER; dummy: TYPE
      do
         if compound /= Void then
            if strip_condition /= Void then
               condition_live_type.forbid_collecting(strip_condition)
            end
            dummy := compound.collect(type)
            if strip_condition /= Void then
               condition_live_type.allow_collecting(strip_condition)
            end
         end
         from
            i := list.lower
         until
            i > list.upper
         loop
            list.item(i).collect(type)
            i := i + 1
         end
      end

   simplify (type: TYPE): like Current
      local
         c: like compound
      do
         if compound /= Void then
            c := compound.simplify(type)
         end
         if c = compound then
            Result := Current
         else
            Result := twin
            Result.set_compound(c)
         end
      end

   pretty (indent_level: INTEGER)
      local
         i: INTEGER
      do
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.keyword(once "when")
         if header_comment /= Void then
            header_comment.pretty(indent_level + 1)
         end
         if list /= Void then
            from
               i := list.lower
            until
               i > list.upper
            loop
               list.item(i).pretty(indent_level + 1)
               i := i + 1
               if i <= list.upper then
                  pretty_printer.put_character(',')
                  if not pretty_printer.zen_mode then
                     pretty_printer.put_character(' ')
                  end
               end
            end
         end
         pretty_printer.keyword(once "then")
         pretty_printer.set_indent_level(indent_level + 1)
         if compound /= Void then
            compound.pretty(indent_level + 1)
         end
         pretty_printer.set_indent_level(0)
      end

   safety_check (type: TYPE)
      do
         if compound /= Void then
            compound.safety_check(type)
         end
      end

   adapt_for (t: TYPE): like Current
      local
         i: INTEGER; c: like compound; l: like list; wi1, wi2: WHEN_ITEM
      do
         if compound /= Void then
            c := compound.adapt_for(t)
         end
         from
            i := list.lower
         until
            wi1 /= wi2 or else i > list.upper
         loop
            wi1 := list.item(i)
            wi2 := wi1.adapt_for(t)
            i := i + 1
         end
         if c = compound and then wi1 = wi2 then
            Result := Current
         else
            Result := twin
            if wi1 = wi2 then
               Result.set_compound(c)
            else
               from
                  l := list.twin
                  l.put(wi2, i - 1)
               until
                  i > l.upper
               loop
                  l.put(list.item(i).adapt_for(t), i)
                  i := i + 1
               end
               Result.init(c, l)
            end
         end
      end

feature {}
   parser_make (sp: like start_position; hc: like header_comment)
      require
         not sp.is_unknown
      do
         start_position := sp
         header_comment := hc
         create list.with_capacity(4)
      ensure
         start_position = sp
      end

   make (inspect_statement: INSPECT_STATEMENT; sp: like start_position; hc: like header_comment)
      require
         inspect_statement /= Void
         not sp.is_unknown
      do
         inspect_statement.add_when(Current)
         start_position := sp
         header_comment := hc
         create list.with_capacity(4)
      ensure
         start_position = sp
      end

   make_strippable (inspect_statement: INSPECT_STATEMENT; condition: like strip_condition)
      require
         inspect_statement /= Void
         condition /= Void
         inspect_statement.condition_type /= Void
      do
         strip_condition := condition
         make(inspect_statement, inspect_statement.start_position, Void)
      ensure
         strip_condition = condition
      end

   make_dynamic_dispatch (inspect_statement: INSPECT_STATEMENT; sp: like start_position; lt: like dispatch_live_type)
      require
         inspect_statement /= Void
         lt /= Void
      local
         integer_constant: INTEGER_CONSTANT
      do
         make(inspect_statement, sp, Void)
         create integer_constant.make(lt.id, sp)
         add_value(integer_constant)
         dispatch_live_type := lt
      end

feature {INSPECT_STATEMENT}
   validity_check (type, expression_type: TYPE; container: INSPECT_STATEMENT)
      require
         type /= Void
         expression_type /= Void
         container /= Void
      local
         i: INTEGER
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            list.item(i).validity_check(type, expression_type, container)
            i := i + 1
         end
      end

   validity_check_continued (type, expression_type: TYPE; occurrence_1: WHEN_ITEM): BOOLEAN
      require
         type /= Void
         expression_type /= Void
         occurrence_1 /= Void
      local
         i: INTEGER
      do
         from
            i := list.lower
         until
            i > list.upper
               or else
            list.item(i).validity_check_continued(type, expression_type, occurrence_1)
         loop
            i := i + 1
         end
      end

feature {INSPECT_STATEMENT}
   includes_integer (v: INTEGER): BOOLEAN
      local
         i: INTEGER
      do
         if values /= Void and then v >= values.item(values.lower) and then v <= values.item(values.upper) then
            from
               i := values.lower
            until
               Result or else i > values.upper
            loop
               Result := values.item(i) <= v and then v <= values.item(i + 1)
               i := i + 2
            end
         end
      end

   includes_integer_between (l, u: INTEGER): BOOLEAN
      require
         invalid_range: l < u
      local
         i: INTEGER
      do
         if values /= Void and then u >= values.item(values.lower) and then l <= values.item(values.upper) then
            from
               i := values.lower
            until
               Result or else i > values.upper
            loop
               Result := values.item(i) <= u and then l <= values.item(i + 1)
               i := i + 2
            end
         end
      end

   largest_range_of_values: INTEGER
         -- The largest number of consecutive values - returns 0 if none
      local
         i, range: INTEGER
      do
         if values /= Void then
            from
               i := values.lower
            until
               i > values.upper
            loop
               range := values.item(i + 1) - values.item(i) + 1
               if range > Result then
                  Result := range
               end
               i := i + 2
            end
         end
      end

feature {INSPECT_STATEMENT, WHEN_CLAUSE}
   specialize_and_check_character (type: TYPE): like Current
      require
         has_been_specialized
         not smart_eiffel.status.is_specializing
      local
         i: INTEGER; c: like compound; l: like list; wi1, wi2: WHEN_ITEM
      do
         if compound /= Void then
            c := compound.specialize_and_check(type)
         end
         from
            i := list.lower
         until
            wi1 /= wi2 or else i > list.upper
         loop
            wi1 := list.item(i)
            wi2 := wi1.specialize_and_check_character(type)
            i := i + 1
         end
         if c = compound and then wi1 = wi2 then
            Result := Current
         else
            Result := twin
            if wi1 = wi2 then
               Result.set_compound(c)
            else
               from
                  l := list.twin
                  l.put(wi2, i - 1)
               until
                  i > l.upper
               loop
                  l.put(list.item(i).specialize_and_check_character(type), i)
                  i := i + 1
               end
               Result.init(c, l)
            end
         end
      ensure
         has_been_specialized
         Result.has_been_specialized
      end

   specialize_and_check_integer (type: TYPE): like Current
      require
         has_been_specialized
         not smart_eiffel.status.is_specializing
      local
         c: like compound
      do
         if compound /= Void then
            c := compound.specialize_and_check(type)
         end
         Result := specialize_and_check_when_items_integer(type, c)
      ensure
         has_been_specialized
         Result.has_been_specialized
      end

   specialize_and_check_when_items_integer (type: TYPE; c: like compound): like Current
      require
         has_been_specialized
         not smart_eiffel.status.is_specializing
      local
         i: INTEGER; l: like list; wi1, wi2: WHEN_ITEM
      do
         from
            i := list.lower
         until
            wi1 /= wi2 or else i > list.upper
         loop
            wi1 := list.item(i)
            wi2 := wi1.specialize_and_check_integer(type)
            i := i + 1
         end
         if c = compound and then wi1 = wi2 then
            Result := Current
         else
            Result := twin
            if wi1 = wi2 then
               Result.set_compound(c)
            else
               from
                  l := list.twin
                  l.put(wi2, i - 1)
               until
                  i > list.upper
               loop
                  l.put(list.item(i).specialize_and_check_integer(type), i)
                  i := i + 1
               end
               Result.init(c, l)
            end
         end
      ensure
         has_been_specialized
         Result.has_been_specialized
      end

   specialize_and_check_string (type: TYPE): like Current
      require
         has_been_specialized
         not smart_eiffel.status.is_specializing
      local
         c: like compound
      do
         if compound /= Void then
            c := compound.specialize_and_check(type)
         end
         if c = compound then
            Result := Current
         else
            Result := twin
            Result.set_compound(c)
         end
      ensure
         has_been_specialized
         Result.has_been_specialized
      end

feature {INSPECT_STATEMENT}
   compute_values (type: TYPE)
      local
         i: INTEGER; debug_values: like values
      do
         if values /= Void then
            -- Well, `values' are already computed and the inspect has only static values.
            -- Let's check that in the following debug to be really sure:
            debug
               debug_values := values
               values := Void
               compute_values(type)
               check
                  values.is_equal(debug_values)
               end
            end
         elseif list.is_empty then
            create values.make(1, 0)
         else
            from
               i := list.lower
            until
               i > list.upper
            loop
               values := list.item(i).compute_values(type, values)
               i := i + 1
            end
         end
      end

   force_internal_integer_values (type: TYPE)
      local
         i: INTEGER
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            list.item(i).force_internal_integer_values(type, Current)
            i := i + 1
         end
      end

   force_internal_character_values (type: TYPE)
      local
         i: INTEGER
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            list.item(i).force_internal_character_values(type, Current)
            i := i + 1
         end
      end

   match_value (v: INTEGER): BOOLEAN
      local
         i: INTEGER
      do
         from
            i := list.lower
         until
            Result or else i > list.upper
         loop
            Result := list.item(i).match_value(v)
            i := i + 1
         end
      end

   strip_or_set_value (v: INTEGER; specialize_type, condition_type: TYPE): like Current
      local
         l: like list; ic: INTEGER_CONSTANT
      do
         if condition_type = Void then
            if dispatch_live_type = Void or else dispatch_live_type.at_run_time then
               Result := Current
            end
         elseif is_live(condition_type) then
            create ic.make(v, start_position)
            if list.is_empty then
               add_value(ic)
               Result := Current
            else
               create l.with_capacity(1)
               Result := twin
               Result.init(compound, l)
               Result.add_value(ic)
            end
            Result := Result.specialize_and_check_when_items_integer(specialize_type, compound)
         end
      end

feature {}
   is_live (condition_type: TYPE): BOOLEAN
      local
         af: ANONYMOUS_FEATURE; tm: TYPE_MARK
      do
         if strip_condition = Void then
            Result := True
         elseif condition_type.live_type.collected(strip_condition) then
            af := strip_condition.anonymous_feature(condition_type)
            tm := af.result_type.to_static(condition_type, False)
            Result := tm.type.live_type /= Void
               and then tm.type.live_type.at_run_time -- and then tm.type.live_type.run_time_set.has(tm.type.live_type)
         end
      end

feature {WHEN_CLAUSE, INTROSPECTION_HANDLER, MANIFEST_STRING_INSPECTOR, FEATURE_CALL}
   add_value (v: EXPRESSION)
      require
         v /= Void
      local
         element: WHEN_ITEM
      do
         create {WHEN_ITEM_1} element.make(v)
         list.add_last(element)
      end

feature {EIFFEL_PARSER, WHEN_CLAUSE, INTROSPECTION_HANDLER, MANIFEST_STRING_INSPECTOR}
   add_slice (min, max: EXPRESSION)
      require
         min /= Void
         max /= Void
      local
         element: WHEN_ITEM
      do
         no_manifest_string_slice_check(min)
         no_manifest_string_slice_check(max)
         create {WHEN_ITEM_2} element.make(min, max)
         list.add_last(element)
      end

feature {WHEN_CLAUSE, INTROSPECTION_HANDLER}
   init (c: like compound; l: like list)
      require
         l /= Void
      do
         compound := c
         list := l
      ensure
         compound = c
         list = l
      end

feature {WHEN_CLAUSE, CODE, EIFFEL_PARSER, INTROSPECTION_HANDLER, MANIFEST_STRING_INSPECTOR}
   set_compound (c: like compound)
      do
         compound := c
      ensure
         compound = c
      end

feature {WHEN_CLAUSE, MANIFEST_STRING_INSPECT_STATEMENT, MANIFEST_STRING_INSPECTOR, WHEN_CLAUSE_VISITOR}
   list: FAST_ARRAY[WHEN_ITEM]

feature {WHEN_CLAUSE, WHEN_CLAUSE_VISITOR}
   values: RING_ARRAY[INTEGER]
         -- To store pairs of range values in the canonical form as described below.
         -- The number of items is always pair. A WHEN_ITEM_2 is represented with two
         -- values but a WHEN_ITEM_1 is also represented with two values (the same one
         -- which is repeated). Area are merged. Index used in `values' are not meaningful.
         -- Examples:
         --      when   1..3, 5 then
         --      values 1,3,5,5
         --
         --      when   1..3, 4 then
         --      values 1,4

feature {WHEN_CLAUSE}
   set_list (l: like list)
      require
         l /= Void
      do
         list := l
      ensure
         list = l
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         c: like compound; when_clause: like Current
      do
         if compound /= Void then
            code_accumulator.open_new_context
            compound.inline_dynamic_dispatch_(code_accumulator, type)
            c := code_accumulator.current_context_to_instruction
            code_accumulator.close_current_context
         end
         if c = compound then
            code_accumulator.current_context.add_last(Current)
         else
            when_clause := twin
            when_clause.set_compound(c)
            code_accumulator.current_context.add_last(when_clause)
         end
      end

feature {EIFFEL_PARSER}
   parser_add_value (manifest_string_flag: INTEGER; allowed_constant: EXPRESSION): INTEGER
      require
         allowed_constant /= Void
      do
         add_value(allowed_constant)
         inspect
            manifest_string_flag
         when 0 then
            if {MANIFEST_STRING} ?:= allowed_constant then
               Result := 1
            else
               Result := -1
            end
         when -1 then
            if {MANIFEST_STRING} ?:= allowed_constant then
               error_handler.add_position(allowed_constant.start_position)
               error_handler.append(once "Cannot use here a manifest STRING because the previous one %
                %used in this %"inspect%" statement is not a manifest STRING.")
               error_handler.print_as_fatal_error
            else
               Result := -1
            end
         when 1 then
            if {MANIFEST_STRING} ?:= allowed_constant then
               Result := 1
            else
               error_handler.add_position(allowed_constant.start_position)
               error_handler.append(once "Must use here a manifest STRING because the previous one %
                %used in this %"inspect%" statement is a manifest STRING.")
               error_handler.print_as_fatal_error
            end
         end
      ensure
         (Result = -1) or else (Result = 1)
      end

feature {}
   strip_condition: FEATURE_STAMP
   dispatch_live_type: LIVE_TYPE

   no_manifest_string_slice_check (expression: EXPRESSION)
      do
         if expression.is_manifest_string then
            error_handler.add_position(expression.start_position)
            error_handler.append(once "Cannot use '..' with manifest strings.")
            error_handler.print_as_fatal_error
         end
      end

   em1: STRING "Bad when clause."

   em2: STRING "Empty when clause in inspect."

invariant
   list /= Void

end -- class WHEN_CLAUSE
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
