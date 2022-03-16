-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class IFTHENELSE_EXP
   --
   -- The most general form of the if-then-else EXPRESSION. Actually, if-then-else EXPRESSIONs are handled
   -- with IFTHENELSE_EXP but also with IFTHEN_EXP. Indeed, when we have a single if-then without else part, the
   -- parser creates only an IFTHEN_EXP object. When we have an "else" part or when there are at least one
   -- "elseif", the general IFTHENELSE_EXP is used.
   --

inherit
   EXPRESSION

insert
   IF_SUPPORT_EXP

create {ANY}
   with_else

create {EIFFEL_PARSER}
   with_elseif

create {IFTHENELSE_EXP}
   with_elseif_and_else

feature {ANY}
   elseif_list: FAST_ARRAY[IFTHEN_EXP]
         -- Non Void when there are "else if" items.

   else_part: EXPRESSION

   use_current (type: TYPE): BOOLEAN
      local
         i: INTEGER
      do
         Result := expression.use_current(type)
            or else then_expression.use_current(type)
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
         if not Result then
            Result := else_part.use_current(type)
         end
      end

   safety_check (type: TYPE)
      local
         i: INTEGER
      do
         expression.safety_check(type)
         then_expression.safety_check(type)
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
         else_part.safety_check(type)
      end

   specialize_in (type: TYPE): like Current
      local
         e: like expression; tc: like then_expression; eil: like elseif_list; it1, it2: IFTHEN_EXP; i: INTEGER
         ec: like else_part
      do
         e := expression.specialize_in(type)
         tc := then_expression.specialize_in(type)
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
         ec := else_part.specialize_in(type)
         Result := current_or_twin_init(e, tc, eil, ec)
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         e: like expression; tc: like then_expression; eil: like elseif_list; it1, it2: IFTHEN_EXP; i: INTEGER
         ec: like else_part
      do
         e := expression.specialize_thru(parent_type, parent_edge, new_type)
         tc := then_expression.specialize_thru(parent_type, parent_edge, new_type)
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
         ec := else_part.specialize_thru(parent_type, parent_edge, new_type)
         Result := current_or_twin_init(e, tc, eil, ec)
      end

   specialize_and_check (type: TYPE): like Current
      local
         e: like expression; tc: like then_expression; eil: like elseif_list; it1, it2: IFTHEN_EXP; i: INTEGER
         ec: like else_part
      do
         e := expression.specialize_and_check(type)
         tc := then_expression.specialize_and_check(type)
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
         ec := else_part.specialize_and_check(type)
         Result := current_or_twin_init(e, tc, eil, ec)
         Result.specialize_check(type)
      end

   has_been_specialized: BOOLEAN
      local
         i: INTEGER
      do
         Result := expression.has_been_specialized
            and then then_expression.has_been_specialized
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
         if Result then
            Result := else_part.has_been_specialized
         end
      end

   simplify (type: TYPE): EXPRESSION
      local
         e: like expression; tc: like then_expression; eil: like elseif_list; ifthen: IFTHEN_EXP
         ec: like else_part; bc: BOOLEAN_CONSTANT
      do
         e := expression.simplify(type)
         bc ?= e
         if bc /= Void then
            smart_eiffel.magic_count_increment
            if bc.value then
               Result := then_expression.simplify(type)
            elseif elseif_list = Void then
               Result := else_part.simplify(type)
            else
               ifthen := elseif_list.first
               e := ifthen.expression.simplify(type)
               tc := ifthen.then_expression
               if elseif_list.count >= 2 then
                  eil := elseif_list.twin
                  eil.remove_first
                  eil := simplify_elseif_list(type, True, eil)
               end
               ec := else_part
               if eil /= Void then
                  bc ?= eil.last.expression
                  if bc /= Void then
                     check bc.value end -- would have been removed if it was False
                     ec := eil.last.then_expression
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
                     create {IFTHEN_EXP} Result.make(ifthen.start_position, e, tc)
                  else
                     create {IFTHENELSE_EXP} Result.with_else(ifthen.start_position, e, tc, ec)
                  end
               else
                  create {IFTHENELSE_EXP} Result.with_elseif_and_else(ifthen.start_position, e, tc, eil, ec)
               end
            end
         else
            tc := then_expression.simplify(type)
            if elseif_list /= Void then
               eil := simplify_elseif_list(type, False, elseif_list)
            end
            ec := else_part
            if eil /= Void then
               bc ?= eil.last.expression
               if bc /= Void then
                  check
                     bc.value
                  end
                  -- would have been removed if it was False
                  smart_eiffel.magic_count_increment
                  ec := eil.last.then_expression
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
            if e = expression and then tc = then_expression and then eil = elseif_list and then ec = else_part then
               Result := Current
            elseif eil /= Void then
               create {IFTHENELSE_EXP} Result.with_elseif_and_else(start_position, e, tc, eil, ec)
            elseif ec /= Void then
               create {IFTHENELSE_EXP} Result.with_elseif_and_else(start_position, e, tc, eil, ec)
            else
               create {IFTHEN_EXP} Result.make(start_position, e, tc)
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
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.put_string(once "else")
         pretty_printer.set_indent_level(indent_level + 1)
         else_part.pretty(indent_level + 1)
         pretty_end_if(indent_level)
      end

   accept (visitor: IFTHENELSE_EXP_VISITOR)
      do
         visitor.visit_ifthenelse_exp(Current)
      end

   resolve_in (type: TYPE): TYPE
      local
         i: INTEGER
      do
         if resolve_map /= Void then
            Result := resolve_map.fast_reference_at(type)
         end
         if Result = Void then
            resolve_set.clear_count
            if not then_expression.is_void then
               resolve_set.add(then_expression.resolve_in(type))
            end
            if elseif_list /= Void then
               from
                  i := elseif_list.lower
               until
                  i > elseif_list.upper
               loop
                  if not elseif_list.item(i).is_void then
                     resolve_set.add(elseif_list.item(i).resolve_in(type))
                  end
                  i := i + 1
               end
            end
            if not else_part.is_void then
               resolve_set.add(else_part.resolve_in(type))
            end

            Result := resolve_resolve_set
            create resolve_map.make
            resolve_map.add(Result, type)
         end
      end

   collect (type: TYPE): TYPE
      local
         t: TYPE; i: INTEGER
      do
         if resolve_map /= Void then
            Result := resolve_map.fast_reference_at(type)
         end
         resolve_set.clear_count
         t := expression.collect(type)
         t := then_expression.collect(type)
         if Result = Void and then not then_expression.is_void then
            resolve_set.add(t)
         end
         if elseif_list /= Void then
            from
               i := elseif_list.lower
            until
               i > elseif_list.upper
            loop
               t := elseif_list.item(i).collect(type)
               if Result = Void and then not elseif_list.item(i).is_void then
                  resolve_set.add(t)
               end
               i := i + 1
            end
         end
         t := else_part.collect(type)
         if Result = Void and then not else_part.is_void then
            resolve_set.add(t)
         end
         if Result = Void then
            Result := resolve_resolve_set
            create resolve_map.make
            resolve_map.add(Result, type)
         end
      end

   adapt_for (type: TYPE): like Current
      local
         e: like expression; tc: like then_expression; eil: like elseif_list; it1, it2: IFTHEN_EXP; i: INTEGER
         ec: like else_part; bc: BOOLEAN_CONSTANT
      do
         e := expression.adapt_for(type)
         tc := then_expression.adapt_for(type)
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
         ec := else_part
         if eil /= Void then
            bc ?= eil.last.expression
            if bc /= Void and then bc.value then
               check False end --|*** PH 06/05/05
               -- Finally the `else_part' cannot be reached:
               ec := eil.last.then_expression
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

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         Result := resolve_in(type)
      end

   bracketed_pretty (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
      end

   pretty_target (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
         pretty_printer.put_character('.')
      end

   declaration_type: TYPE
      do
         Result := then_expression.declaration_type
      end

   written_declaration_type_mark: TYPE_MARK
      do
         Result := then_expression.written_declaration_type_mark
      end

   short (type: TYPE)
      do
         --| **** TODO
      end

   short_target (type: TYPE)
      do
         short(type)
         short_printer.put_dot
      end

feature {EIFFEL_PARSER}
   set_else (ec: like else_part)
      require
         ec /= Void
      do
         else_part := ec
      ensure
         else_part = ec
      end

   add_elseif (ifthen: IFTHEN_EXP)
      require
         ifthen /= Void
      do
         elseif_list.add_last(ifthen)
      end

feature {IFTHENELSE_EXP}
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

   init (e: like expression; tc: like then_expression; eil: like elseif_list; ec: like else_part)
      do
         expression := e
         then_expression := tc
         elseif_list := eil
         else_part := ec
      ensure
         expression = e
         then_expression = tc
         elseif_list = eil
         else_part = ec
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
         -- Because complex BOOLEAN expression may needs to let escape dynamic dispatch instructions,
         -- "elseif" constructions are removed and replaced by imbricated "else if then...". Thus,
         -- extra statements needed by dynamic dispatch have a place to go (between "else" and "if").
      local
         e: like expression; tc: like then_expression; ec: like else_part; i: EXPRESSION
      do
         expression.inline_dynamic_dispatch_(code_accumulator, type)
         e := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         then_expression.inline_dynamic_dispatch_(code_accumulator, type)
         tc := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         code_accumulator.open_new_context
         inline_dd(code_accumulator, type, elseif_list, 0)
         ec := code_accumulator.current_context_to_expression
         if ec /= Void then
            create {IFTHENELSE_EXP} i.with_else(start_position, e, tc, ec)
         else
            create {IFTHEN_EXP} i.make(start_position, e, tc)
         end
         code_accumulator.close_current_context
         code_accumulator.current_context.add_last(i)
      end

feature {}
   inline_dd (code_accumulator: CODE_ACCUMULATOR; type: TYPE; eil: FAST_ARRAY[IFTHEN_EXP]; eil_idx: INTEGER)
         -- Recursive continuation of `inline_dynamic_dispatch_'.
      local
         e: like expression; tc: like then_expression; eil_item: IFTHEN_EXP; ec: like else_part; i: EXPRESSION
      do
         if eil /= Void and then eil_idx < eil.upper then
            eil_item := eil.item(eil_idx)
            eil_item.expression.inline_dynamic_dispatch_(code_accumulator, type)
            e := code_accumulator.current_context.last.to_expression
            code_accumulator.current_context.remove_last
            eil_item.then_expression.inline_dynamic_dispatch_(code_accumulator, type)
            tc := code_accumulator.current_context.last.to_expression
            code_accumulator.current_context.remove_last
            code_accumulator.open_new_context
            inline_dd(code_accumulator, type, eil, eil_idx + 1)
            ec := code_accumulator.current_context_to_expression
            code_accumulator.close_current_context
            create {IFTHENELSE_EXP} i.with_else(eil_item.start_position, e, tc, ec)
            code_accumulator.current_context.add_last(i)
         elseif eil /= Void and then eil_idx = eil.upper then
            eil_item := eil.item(eil_idx)
            eil_item.expression.inline_dynamic_dispatch_(code_accumulator, type)
            e := code_accumulator.current_context.last.to_expression
            code_accumulator.current_context.remove_last
            eil_item.then_expression.inline_dynamic_dispatch_(code_accumulator, type)
            tc := code_accumulator.current_context.last.to_expression
            code_accumulator.current_context.remove_last
            code_accumulator.open_new_context
            else_part.inline_dynamic_dispatch_(code_accumulator, type)
            ec := code_accumulator.current_context_to_expression
            code_accumulator.close_current_context
            create {IFTHENELSE_EXP} i.with_else(eil_item.start_position, e, tc, ec)
            code_accumulator.current_context.add_last(i)
         else
            check
               eil = Void
            end
            else_part.inline_dynamic_dispatch_(code_accumulator, type)
         end
      end

feature {}
   current_or_twin_init (e: like expression; tc: like then_expression; eil: like elseif_list; ec: like else_part): like Current
      require
         e /= Void
      do
         if e = expression and then tc = then_expression and then eil = elseif_list and then ec = else_part then
            Result := Current
         else
            Result := twin
            Result.init(e, tc, eil, ec)
         end
      ensure
         Result.expression = e
         Result.then_expression = tc
         Result.elseif_list = eil
         Result.else_part = ec
      end

   with_else (sp: like start_position; e: like expression; tc: like then_expression; ec: like else_part)
      require
         not sp.is_unknown
         e /= Void
         ec /= Void
      do
         start_position := sp
         expression := e
         then_expression := tc
         else_part := ec
      ensure
         start_position = sp
         expression = e
         then_expression = tc
         else_part = ec
      end

   with_elseif (sp: like start_position; e: like expression; tc: like then_expression; ifthen: IFTHEN_EXP)
      require
         not sp.is_unknown
         e /= Void
         ifthen /= Void
      do
         start_position := sp
         expression := e
         then_expression := tc
         create elseif_list.with_capacity(2)
         elseif_list.add_last(ifthen)
      ensure
         start_position = sp
         expression = e
         then_expression = tc
      end

   with_elseif_and_else (sp: like start_position; e: like expression; tc: like then_expression; eil: like elseif_list
                         ec: like else_part)
      require
         not sp.is_unknown
         e /= Void
         ec /= Void
      do
         start_position := sp
         expression := e
         then_expression := tc
         elseif_list := eil
         else_part := ec
      ensure
         start_position = sp
         expression = e
         then_expression = tc
         elseif_list = eil
         else_part = ec
      end

   simplify_elseif_list (type: TYPE; twin_already_done: BOOLEAN; eil: like elseif_list): like elseif_list
      require
         type /= Void
         eil.count >= 1
      local
         twin_done: BOOLEAN; e1, e2: EXPRESSION; inst1, inst2: EXPRESSION; ifthen: IFTHEN_EXP; i: INTEGER
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
            inst1 := ifthen.then_expression
            inst2 := inst1.simplify(type)
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
                     Result.put(create {IFTHEN_EXP}.make(ifthen.start_position, e2, inst2), i)
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
               Result.put(create {IFTHEN_EXP}.make(ifthen.start_position, e2, inst2), i)
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
         if else_part /= Void then
            Result := elseif_list /= Void implies not elseif_list.is_empty
         end
      ensure
         assertion_check_only: Result
      end

feature {}
   resolve_map: HASHED_DICTIONARY[TYPE, TYPE]

   resolve_set: HASHED_SET[TYPE]
      once
         create Result.make
      end

   resolve_resolve_set: TYPE
      do
         if resolve_set.is_empty then
            error_handler.add_position(start_position)
            error_handler.append("Could not find any conformant common type to those expressions because they are all Void.")
            error_handler.print_as_fatal_error
         elseif resolve_set.count = 1 then
            Result := resolve_set.first
         else
            Result := resolve_resolve_set_
            if Result = Void then
               --| **** TODO: check for INTEGER and co. for balancing rule, or wait for true conversion
               error_handler.add_position(start_position)
               error_handler.append("Could not find any conformant common type to those expressions.")
               error_handler.print_as_fatal_error
            end
         end
      end

   resolve_resolve_set_: TYPE
         -- see OLD_MANIFEST_ARRAY.smallest_ancestor_from_type_set_buffer
      require
         resolve_set.count >= 2
      local
         i: INTEGER; other_type: TYPE; expanded_flag: BOOLEAN
      do
         -- First loop to handle the simple situation where one TYPE of `resolve_set'
         -- can hold all other types:
         from
            i := resolve_set.lower + 1
            Result := resolve_set.first
         until
            Result = Void or else i > resolve_set.upper
         loop
            other_type := resolve_set.item(i)
            if Result.can_be_assigned_to(other_type) then
               Result := other_type
            elseif other_type.can_be_assigned_to(Result) then
               -- We stick to `Result'.
            else
               -- Not a simple situation.
               Result := Void
            end
            expanded_flag := expanded_flag or else other_type.is_expanded
            i := i + 1
         end
         if Result = Void and then not expanded_flag then
            -- Now trying to search for some TYPE with only one parent TYPE:
            -- Note: obviously if some type is expanded this search is not necessary because all the
            -- expressions must be of the same type.
            from
               i := resolve_set.lower
            until
               Result /= Void or else i > resolve_set.upper
            loop
               Result := resolve_set.item(i).has_only_one_conformant_parent
               if Result = Void then
                  i := i + 1
               end
            end
            if Result /= Void then
               resolve_set.remove(resolve_set.item(i))
               resolve_set.add(Result)
               Result := Void
               if resolve_set.count = 1 then
                  Result := resolve_set.item(1)
               else
                  Result := resolve_resolve_set_
               end
            end
         end
      end

invariant
   canonical_form

end -- class IFTHENELSE_EXP
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
