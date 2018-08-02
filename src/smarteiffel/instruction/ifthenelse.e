-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class IFTHENELSE
   --
   -- The most general form of the if-then-else INSTRUCTION. Actually, if-then-else INSTRUCTIONs are handled
   -- with IFTHENELSE but also with IFTHEN. Indeed, when we have a single if-then without else part, the
   -- parser creates only an IFTHEN object. When we have an "else" part or when there are at least one
   -- "elseif", the general IFTHENELSE is used.
   --

inherit
   INSTRUCTION

insert
   IF_SUPPORT

create {ANY}
   with_else

create {EIFFEL_PARSER}
   with_elseif

create {IFTHENELSE}
   with_elseif_and_else

feature {ANY}
   elseif_list: FAST_ARRAY[IFTHEN]
         -- Non Void when there are "else if" items.

   else_compound: INSTRUCTION
         -- Not Void if any.

   use_current (type: TYPE): BOOLEAN
      local
         i: INTEGER
      do
         Result := expression.use_current(type)
         if not Result and then then_compound /= Void then
            Result := then_compound.use_current(type)
         end
         if not Result and then elseif_list /= Void then
            from
               i := elseif_list.lower
            until
               Result or else i > elseif_list.upper
            loop
               Result := elseif_list.item(i).use_current(type)
               i := i + 1
            end
         end
         if not Result and then else_compound /= Void then
            Result := else_compound.use_current(type)
         end
      end

   safety_check (type: TYPE)
      local
         i: INTEGER
      do
         expression.safety_check(type)
         if then_compound /= Void then
            then_compound.safety_check(type)
         end
         if elseif_list /= Void then
            from
               i := elseif_list.lower
            until
               i > elseif_list.upper
            loop
               elseif_list.item(i).safety_check(type)
               i := i + 1
            end
         end
         if else_compound /= Void then
            else_compound.safety_check(type)
         end
      end

   specialize_in (type: TYPE): like Current
      local
         e: like expression; tc: like then_compound; eil: like elseif_list; it1, it2: IFTHEN; i: INTEGER
         ec: like else_compound
      do
         e := expression.specialize_in(type)
         if then_compound /= Void then
            tc := then_compound.specialize_in(type)
         end
         if elseif_list /= Void then
            from
               i := elseif_list.lower
            until
               it1 /= it2 or else i > elseif_list.upper
            loop
               it1 := elseif_list.item(i)
               it2 := it1.specialize_in(type)
               i := i + 1
            end
            if it1 = it2 then
               eil := elseif_list
            else
               from
                  eil := elseif_list.twin
                  eil.put(it2, i - 1)
               until
                  i > eil.upper
               loop
                  eil.put(elseif_list.item(i).specialize_in(type), i)
                  i := i + 1
               end
            end
         end
         if else_compound /= Void then
            ec := else_compound.specialize_in(type)
         end
         Result := current_or_twin_init(e, tc, eil, ec)
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         e: like expression; tc: like then_compound; eil: like elseif_list; it1, it2: IFTHEN; i: INTEGER
         ec: like else_compound
      do
         e := expression.specialize_thru(parent_type, parent_edge, new_type)
         if then_compound /= Void then
            tc := then_compound.specialize_thru(parent_type, parent_edge, new_type)
         end
         if elseif_list /= Void then
            from
               i := elseif_list.lower
            until
               it1 /= it2 or else i > elseif_list.upper
            loop
               it1 := elseif_list.item(i)
               it2 := it1.specialize_thru(parent_type, parent_edge, new_type)
               i := i + 1
            end
            if it1 = it2 then
               eil := elseif_list
            else
               from
                  eil := elseif_list.twin
                  eil.put(it2, i - 1)
               until
                  i > eil.upper
               loop
                  eil.put(elseif_list.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
                  i := i + 1
               end
            end
         end
         if else_compound /= Void then
            ec := else_compound.specialize_thru(parent_type, parent_edge, new_type)
         end
         Result := current_or_twin_init(e, tc, eil, ec)
      end

   specialize_and_check (type: TYPE): like Current
      local
         e: like expression; tc: like then_compound; eil: like elseif_list; it1, it2: IFTHEN; i: INTEGER
         ec: like else_compound
      do
         e := expression.specialize_and_check(type)
         if then_compound /= Void then
            tc := then_compound.specialize_and_check(type)
         end
         if elseif_list /= Void then
            from
               i := elseif_list.lower
            until
               it1 /= it2 or else i > elseif_list.upper
            loop
               it1 := elseif_list.item(i)
               it2 := it1.specialize_and_check(type)
               i := i + 1
            end
            if it1 = it2 then
               eil := elseif_list
            else
               from
                  eil := elseif_list.twin
                  eil.put(it2, i - 1)
               until
                  i > eil.upper
               loop
                  eil.put(elseif_list.item(i).specialize_and_check(type), i)
                  i := i + 1
               end
            end
         end
         if else_compound /= Void then
            ec := else_compound.specialize_and_check(type)
         end
         Result := current_or_twin_init(e, tc, eil, ec)
         Result.specialize_check(type)
      end

   has_been_specialized: BOOLEAN
      local
         i: INTEGER
      do
         Result := expression.has_been_specialized
         if Result and then then_compound /= Void then
            Result := then_compound.has_been_specialized
         end
         if elseif_list /= Void then
            from
               i := elseif_list.lower
            until
               not Result or else i > elseif_list.upper
            loop
               Result := elseif_list.item(i).has_been_specialized
               i := i + 1
            end
         end
         if Result and then else_compound /= Void then
            Result := else_compound.has_been_specialized
         end
      end

   simplify (type: TYPE): INSTRUCTION
      local
         e: like expression; tc: like then_compound; eil: like elseif_list; ifthen: IFTHEN
         ec: like else_compound; bc: BOOLEAN_CONSTANT
      do
         e := expression.simplify(type)
         bc ?= e
         if bc /= Void then
            smart_eiffel.magic_count_increment
            if bc.value then
               if then_compound /= Void then
                  Result := then_compound.simplify(type)
               end
            elseif elseif_list = Void then
               if else_compound /= Void then
                  Result := else_compound.simplify(type)
               end
            else
               ifthen := elseif_list.first
               e := ifthen.expression.simplify(type)
               tc := ifthen.then_compound
               if elseif_list.count >= 2 then
                  eil := elseif_list.twin
                  eil.remove_first
                  eil := simplify_elseif_list(type, True, eil)
               end
               ec := else_compound
               if eil /= Void then
                  bc ?= eil.last.expression
                  if bc /= Void then
                     check bc.value end -- would have been removed if it was False
                     ec := eil.last.then_compound
                     if eil.count = 1 then
                        eil := Void
                     else
                        if eil = elseif_list then
                           eil := elseif_list.twin
                        end
                        eil.remove_last
                     end
                  end
               end
               if ec /= Void then
                  ec := ec.simplify(type)
               end
               if eil = Void then
                  if ec = Void then
                     create {IFTHEN} Result.make(ifthen.start_position, e, tc)
                  else
                     create {IFTHENELSE} Result.with_else(ifthen.start_position, e, tc, ec)
                  end
               else
                  create {IFTHENELSE} Result.with_elseif_and_else(ifthen.start_position, e, tc, eil, ec)
               end
            end
         else
            if then_compound /= Void then
               tc := then_compound.simplify(type)
            end
            if elseif_list /= Void then
               eil := simplify_elseif_list(type, False, elseif_list)
            end
            ec := else_compound
            if eil /= Void then
               bc ?= eil.last.expression
               if bc /= Void then
                  check
                     bc.value
                  end
                  -- would have been removed if it was False
                  smart_eiffel.magic_count_increment
                  ec := eil.last.then_compound
                  if eil.count = 1 then
                     eil := Void
                  else
                     if eil = elseif_list then
                        eil := elseif_list.twin
                     end
                     eil.remove_last
                  end
               end
            end
            if ec /= Void then
               ec := ec.simplify(type)
            end
            if e = expression and then tc = then_compound and then eil = elseif_list and then ec = else_compound then
               Result := Current
            elseif eil /= Void then
               create {IFTHENELSE} Result.with_elseif_and_else(start_position, e, tc, eil, ec)
            elseif ec /= Void then
               create {IFTHENELSE} Result.with_elseif_and_else(start_position, e, tc, eil, ec)
            else
               create {IFTHEN} Result.make(start_position, e, tc)
            end
         end
      end

   pretty (indent_level: INTEGER)
      local
         i: INTEGER
      do
         pretty_(indent_level, once "if")
         if elseif_list /= Void then
            from
               i := elseif_list.lower
            until
               i > elseif_list.upper
            loop
               elseif_list.item(i).pretty_(indent_level, once "elseif")
               i := i + 1
            end
         end
         if else_compound /= Void then
            pretty_printer.set_indent_level(indent_level)
            pretty_printer.put_string(once "else")
            pretty_printer.set_indent_level(indent_level + 1)
            else_compound.pretty(indent_level + 1)
         end
         pretty_end_if(indent_level)
      end

   accept (visitor: IFTHENELSE_VISITOR)
      do
         visitor.visit_ifthenelse(Current)
      end

   collect (type: TYPE): TYPE
      local
         dummy: TYPE; i: INTEGER
      do
         dummy := expression.collect(type)
         if then_compound /= Void then
            dummy := then_compound.collect(type)
         end
         if elseif_list /= Void then
            from
               i := elseif_list.lower
            until
               i > elseif_list.upper
            loop
               dummy := elseif_list.item(i).collect(type)
               i := i + 1
            end
         end
         if else_compound /= Void then
            dummy := else_compound.collect(type)
         end
      end

   adapt_for (type: TYPE): like Current
      local
         e: like expression; tc: like then_compound; eil: like elseif_list; it1, it2: IFTHEN; i: INTEGER
         ec: like else_compound; bc: BOOLEAN_CONSTANT
      do
         e := expression.adapt_for(type)
         if then_compound /= Void then
            tc := then_compound.adapt_for(type)
         end
         if elseif_list /= Void then
            from
               i := elseif_list.lower
            until
               it1 /= it2 or else i > elseif_list.upper
            loop
               it1 := elseif_list.item(i)
               it2 := it1.adapt_for(type)
               i := i + 1
            end
            if it1 = it2 then
               eil := elseif_list
            else
               from
                  eil := elseif_list.twin
                  eil.put(it2, i - 1)
               until
                  i > eil.upper
               loop
                  eil.put(elseif_list.item(i).adapt_for(type), i)
                  i := i + 1
               end
            end
         end
         ec := else_compound
         if eil /= Void then
            bc ?= eil.last.expression
            if bc /= Void and then bc.value then
               check False end --|*** PH 06/05/05
               -- Finally the `else_compound' cannot be reached:
               ec := eil.last.then_compound
               eil.remove_last
               if eil.is_empty then
                  eil := Void
               end
               -- Note: this simplification must not be done during simplify because the very first
               -- expression may be detected False in some inner `simplify' step.
               --|*** PH 05/05/05 I can't understand...
            end
         end
         if ec /= Void then
            ec := ec.adapt_for(type)
         end
         Result := current_or_twin_init(e, tc, eil, ec)
      end

feature {EIFFEL_PARSER}
   set_else (ec: like else_compound)
      require
         ec /= Void
      do
         else_compound := ec
      ensure
         else_compound = ec
      end

   add_elseif (ifthen: IFTHEN)
      require
         ifthen /= Void
      do
         elseif_list.add_last(ifthen)
      end

feature {IFTHENELSE}
   specialize_check (type: TYPE)
      local
         i: INTEGER
      do
         specialize_check_(type)
         if elseif_list /= Void then
            from
               i := elseif_list.lower
            until
               i > elseif_list.upper
            loop
               elseif_list.item(i).specialize_check_(type)
               i := i + 1
            end
         end
      end

   init (e: like expression; tc: like then_compound; eil: like elseif_list; ec: like else_compound)
      do
         expression := e
         then_compound := tc
         elseif_list := eil
         else_compound := ec
      ensure
         expression = e
         then_compound = tc
         elseif_list = eil
         else_compound = ec
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
         -- Because complex BOOLEAN expression may needs to let escape dynamic dispatch instructions,
         -- "elseif" constructions are removed and replaced by imbricated "else if then...". Thus,
         -- extra statements needed by dynamic dispatch have a place to go (between "else" and "if").
      local
         e: like expression; tc: like then_compound; ec: like else_compound; i: INSTRUCTION
      do
         expression.inline_dynamic_dispatch_(code_accumulator, type)
         e := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         if then_compound /= Void then
            code_accumulator.open_new_context
            then_compound.inline_dynamic_dispatch_(code_accumulator, type)
            tc := code_accumulator.current_context_to_instruction
            code_accumulator.close_current_context
         end
         code_accumulator.open_new_context
         inline_dd(code_accumulator, type, elseif_list, 0)
         ec := code_accumulator.current_context_to_instruction
         if ec /= Void then
            create {IFTHENELSE} i.with_else(start_position, e, tc, ec)
         else
            create {IFTHEN} i.make(start_position, e, tc)
         end
         code_accumulator.close_current_context
         code_accumulator.current_context.add_last(i)
      end

feature {}
   inline_dd (code_accumulator: CODE_ACCUMULATOR; type: TYPE; eil: FAST_ARRAY[IFTHEN]; eil_idx: INTEGER)
         -- Recursive continuation of `inline_dynamic_dispatch_'.
      local
         e: like expression; tc: like then_compound; eil_item: IFTHEN; ec: like else_compound; i: INSTRUCTION
      do
         if eil /= Void and then eil_idx < eil.upper then
            eil_item := eil.item(eil_idx)
            eil_item.expression.inline_dynamic_dispatch_(code_accumulator, type)
            e := code_accumulator.current_context.last.to_expression
            code_accumulator.current_context.remove_last
            if eil_item.then_compound /= Void then
               code_accumulator.open_new_context
               eil_item.then_compound.inline_dynamic_dispatch_(code_accumulator, type)
               tc := code_accumulator.current_context_to_instruction
               code_accumulator.close_current_context
            end
            code_accumulator.open_new_context
            inline_dd(code_accumulator, type, eil, eil_idx + 1)
            ec := code_accumulator.current_context_to_instruction
            code_accumulator.close_current_context
            create {IFTHENELSE} i.with_else(eil_item.start_position, e, tc, ec)
            code_accumulator.current_context.add_last(i)
         elseif eil /= Void and then eil_idx = eil.upper then
            eil_item := eil.item(eil_idx)
            eil_item.expression.inline_dynamic_dispatch_(code_accumulator, type)
            e := code_accumulator.current_context.last.to_expression
            code_accumulator.current_context.remove_last
            if eil_item.then_compound /= Void then
               code_accumulator.open_new_context
               eil_item.then_compound.inline_dynamic_dispatch_(code_accumulator, type)
               tc := code_accumulator.current_context_to_instruction
               code_accumulator.close_current_context
            end
            if else_compound /= Void then
               code_accumulator.open_new_context
               else_compound.inline_dynamic_dispatch_(code_accumulator, type)
               ec := code_accumulator.current_context_to_instruction
               code_accumulator.close_current_context
               if ec /= Void then
                  create {IFTHENELSE} i.with_else(eil_item.start_position, e, tc, ec)
               else
                  create {IFTHEN} i.make(eil_item.start_position, e, tc)
               end
               code_accumulator.current_context.add_last(i)
            else
               create {IFTHEN} i.make(eil_item.start_position, e, tc)
               code_accumulator.current_context.add_last(i)
            end
         else
            check
               eil = Void
            end
            else_compound.inline_dynamic_dispatch_(code_accumulator, type)
         end
      end

feature {}
   current_or_twin_init (e: like expression; tc: like then_compound; eil: like elseif_list; ec: like else_compound): like Current
      require
         e /= Void
      do
         if e = expression and then tc = then_compound and then eil = elseif_list and then ec = else_compound then
            Result := Current
         else
            Result := twin
            Result.init(e, tc, eil, ec)
         end
      ensure
         Result.expression = e
         Result.then_compound = tc
         Result.elseif_list = eil
         Result.else_compound = ec
      end

   with_else (sp: like start_position; e: like expression; tc: like then_compound; ec: like else_compound)
      require
         not sp.is_unknown
         e /= Void
         ec /= Void
      do
         start_position := sp
         expression := e
         then_compound := tc
         else_compound := ec
      ensure
         start_position = sp
         expression = e
         then_compound = tc
         else_compound = ec
      end

   with_elseif (sp: like start_position; e: like expression; tc: like then_compound; ifthen: IFTHEN)
      require
         not sp.is_unknown
         e /= Void
         ifthen /= Void
      do
         start_position := sp
         expression := e
         then_compound := tc
         create elseif_list.with_capacity(2)
         elseif_list.add_last(ifthen)
      ensure
         start_position = sp
         expression = e
         then_compound = tc
      end

   with_elseif_and_else (sp: like start_position; e: like expression; tc: like then_compound; eil: like elseif_list
                         ec: like else_compound)
      require
         not sp.is_unknown
         e /= Void
         eil /= Void or ec /= Void
      do
         start_position := sp
         expression := e
         then_compound := tc
         elseif_list := eil
         else_compound := ec
      ensure
         start_position = sp
         expression = e
         then_compound = tc
         elseif_list = eil
         else_compound = ec
      end

   simplify_elseif_list (type: TYPE; twin_already_done: BOOLEAN; eil: like elseif_list): like elseif_list
      require
         type /= Void
         eil.count >= 1
      local
         twin_done: BOOLEAN; e1, e2: EXPRESSION; inst1, inst2: INSTRUCTION; ifthen: IFTHEN; i: INTEGER
         bc: BOOLEAN_CONSTANT
      do
         from
            Result := eil
            twin_done := twin_already_done
            i := Result.lower
         until
            i > Result.upper
         loop
            ifthen := Result.item(i)
            e1 := ifthen.expression
            e2 := e1.simplify(type)
            inst1 := ifthen.then_compound
            if inst1 = Void then
               inst2 := Void
            else
               inst2 := inst1.simplify(type)
            end
            bc ?= e2
            if bc /= Void then
               if bc.value then
                  -- All items after the current one are not reachable:
                  if Result.upper > i then
                     smart_eiffel.magic_count_increment
                     if not twin_done then
                        Result := Result.twin
                        twin_done := True
                     end
                     Result.remove_tail(Result.upper - i)
                     check
                        Result.upper = i
                     end
                  end
                  if e1 /= e2 or else inst1 /= inst2 then
                     smart_eiffel.magic_count_increment
                     if not twin_done then
                        Result := Result.twin
                        twin_done := True
                     end
                     Result.put(create {IFTHEN}.make(ifthen.start_position, e2, inst2), i)
                  end
               else
                  -- The current item can be removed:
                  smart_eiffel.magic_count_increment
                  if not twin_done then
                     Result := Result.twin
                     twin_done := True
                  end
                  Result.remove(i)
                  i := i - 1
               end
            elseif e1 /= e2 or else inst1 /= inst2 then
               if not twin_done then
                  Result := Result.twin
                  twin_done := True
               end
               Result.put(create {IFTHEN}.make(ifthen.start_position, e2, inst2), i)
            end
            i := i + 1
         end
         if Result.is_empty then
            Result := Void
         end
      ensure
         (Result = elseif_list) = (smart_eiffel.magic_count = old smart_eiffel.magic_count)
      end

   canonical_form: BOOLEAN
      do
         if elseif_list = Void then
            Result := else_compound /= Void
         else
            Result := not elseif_list.is_empty
         end
      ensure
         assertion_check_only: Result
      end

invariant
   canonical_form

end -- class IFTHENELSE
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
