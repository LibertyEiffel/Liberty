-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LOOP_INSTRUCTION
   --
   -- The Eiffel instruction : "from ... until ... loop ... end".
   --

inherit
   INSTRUCTION

creation {ANY}
   make

feature {ANY}
   start_position: POSITION
         -- Of letter 'f' of keyword "from".

   initialize: INSTRUCTION

   loop_invariant: ASSERTION_LIST

   loop_variant: EXPRESSION

   until_expression: EXPRESSION

   loop_body: INSTRUCTION

   side_effect_free (type: TYPE): BOOLEAN is
      do
         --|*** Could be better. ***
      end

   end_mark_comment: BOOLEAN is True

   safety_check (type: TYPE) is
      do
         --|*** VARIANT *** INVARIANT ***
         if initialize /= Void then
            initialize.safety_check(type)
         end
         until_expression.safety_check(type)
         if loop_body /= Void then
            loop_body.safety_check(type)
         end
      end

   simplify (type: TYPE): INSTRUCTION is
      local
         bc: BOOLEAN_CONSTANT; it: like initialize; lv: like loop_variant; ue: like until_expression; lb: like loop_body
      do
         if initialize /= Void then
            it := initialize.simplify(type)
         end
         ue := until_expression.simplify(type)
         bc ?= ue
         if bc /= Void and then bc.value then
            smart_eiffel.magic_count_increment
            Result := it
         else
            if loop_variant /= Void then
               lv := loop_variant.simplify(type)
            end
            if loop_body /= Void then
               lb := loop_body.simplify(type)
            end
            if it = initialize and then lv = loop_variant and then ue = until_expression and then lb = loop_body then
               Result := Current
            else
               smart_eiffel.magic_count_increment
               create {LOOP_INSTRUCTION} Result.make(start_position, it, loop_invariant, lv, ue, lb)
            end
         end
      end

   compile_to_c (type: TYPE) is
      local
         loop_check_flag, variant_flag, invariant_flag: BOOLEAN; compound_expression: COMPOUND_EXPRESSION
      do
         loop_check_flag := loop_check(type)
         if loop_check_flag and then loop_variant /= Void then
            cpp.pending_c_function_body.append(once "{int c=0;int v=0;%N")
            variant_flag := True
         end
         if initialize /= Void then
            initialize.compile_to_c(type)
         end
         if loop_check_flag and then loop_invariant /= Void then
            loop_invariant.compile_to_c_as_loop_invariant(type)
            invariant_flag := True
         end
         if {COMPOUND_EXPRESSION} ?:= until_expression then
            compound_expression ::= until_expression
            cpp.pending_c_function_body.append(once "while(1){%N")
            compound_expression.compound_compile_to_c(type)
            cpp.pending_c_function_body.append(once "if(")
            compound_expression.last.to_expression.compile_to_c(type)
            cpp.pending_c_function_body.append(once "){%Nbreak;%N}%N")
         else
            cpp.pending_c_function_body.append(once "while(!(")
            until_expression.compile_to_c(type)
            cpp.pending_c_function_body.append(once "))%N{%N")
         end
         if variant_flag then
            cpp.variant_check(type, loop_variant)
         end
         if loop_body /= Void then
            loop_body.compile_to_c(type)
         end
         if invariant_flag then
            loop_invariant.compile_to_c_as_loop_invariant(type)
         end
         cpp.pending_c_function_body.append(once "}%N")
         if variant_flag then
            cpp.pending_c_function_body.append(once "}%N")
         end
      end

   compile_to_jvm (type: TYPE) is
      do
         not_yet_implemented
      end

   use_current (type: TYPE): BOOLEAN is
      local
         loop_check_flag: BOOLEAN
      do
         loop_check_flag := loop_check(type)
         if loop_check_flag and then loop_variant /= Void then
            Result := loop_variant.use_current(type)
         end
         if initialize /= Void then
            Result := Result or else initialize.use_current(type)
         end
         Result := Result or else until_expression.use_current(type)
         if loop_check_flag and then loop_invariant /= Void then
            Result := Result or else loop_invariant.use_current(type)
         end
         if loop_body /= Void then
            Result := Result or else loop_body.use_current(type)
         end
      end

   specialize_in (type: TYPE): like Current is
      local
         it: like initialize; li: like loop_invariant; lv: like loop_variant; ue: like until_expression
         lb: like loop_body
      do
         if initialize /= Void then
            it := initialize.specialize_in(type)
         end
         if loop_invariant /= Void then
            li := loop_invariant.specialize_in(type)
         end
         if loop_variant /= Void then
            lv := loop_variant.specialize_in(type)
         end
         ue := until_expression.specialize_in(type)
         if loop_body /= Void then
            lb := loop_body.specialize_in(type)
         end
         if it = initialize and then li = loop_invariant and then lv = loop_variant and then ue = until_expression and then lb = loop_body then
            Result := Current
         else
            create Result.make(start_position, it, li, lv, ue, lb)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         it: like initialize; li: like loop_invariant; lv: like loop_variant; ue: like until_expression
         lb: like loop_body
      do
         if initialize /= Void then
            it := initialize.specialize_thru(parent_type, parent_edge, new_type)
         end
         if loop_invariant /= Void then
            li := loop_invariant.specialize_thru(parent_type, parent_edge, new_type)
         end
         if loop_variant /= Void then
            lv := loop_variant.specialize_thru(parent_type, parent_edge, new_type)
         end
         ue := until_expression.specialize_thru(parent_type, parent_edge, new_type)
         if loop_body /= Void then
            lb := loop_body.specialize_thru(parent_type, parent_edge, new_type)
         end
         if it /= initialize or else li /= loop_invariant or else lv /= loop_variant or else ue /= until_expression or else lb /= loop_body then
            create Result.make(start_position, it, li, lv, ue, lb)
         else
            Result := Current
         end
      end

   specialize_2 (type: TYPE): like Current is
      local
         it: like initialize; li: like loop_invariant; lv: like loop_variant; ue: like until_expression
         lb: like loop_body
      do
         if initialize /= Void then
            it := initialize.specialize_2(type)
         end
         if loop_invariant /= Void then
            li := loop_invariant.specialize_2(type)
         end
         if loop_variant /= Void then
            lv := loop_variant.specialize_2(type)
         end
         ue := until_expression.specialize_2(type)
         if loop_body /= Void then
            lb := loop_body.specialize_2(type)
         end
         if it /= initialize or else li /= loop_invariant or else lv /= loop_variant or else ue /= until_expression or else lb /= loop_body then
            create Result.make(start_position, it, li, lv, ue, lb)
         else
            Result := Current
         end
         Result.specialize_2_check(type)
      end

   has_been_specialized: BOOLEAN is
      do
         Result := initialize /= Void implies initialize.has_been_specialized
         if Result and loop_invariant /= Void then
            Result := loop_invariant.has_been_specialized
         end
         if Result and loop_variant /= Void then
            Result := loop_variant.has_been_specialized
         end
         Result := Result and until_expression.has_been_specialized
         if Result and loop_body /= Void then
            Result := loop_body.has_been_specialized
         end
      end

   accept (visitor: LOOP_INSTRUCTION_VISITOR) is
      do
         visitor.visit_loop_instruction(Current)
      end

   pretty (indent_level: INTEGER) is
      local
         semi_colon_flag: BOOLEAN
      do
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.put_string(once "from")
         pretty_printer.set_indent_level(0)
         if initialize /= Void then
            initialize.pretty(indent_level + 1)
         end
         if loop_invariant /= Void then
            loop_invariant.pretty_as_loop_invariant(indent_level)
         end
         if loop_variant /= Void then
            pretty_printer.set_indent_level(indent_level)
            pretty_printer.put_string(once "variant")
            pretty_printer.set_indent_level(indent_level + 1)
            semi_colon_flag := pretty_printer.semi_colon_flag
            pretty_printer.set_semi_colon_flag(False)
            loop_variant.pretty(indent_level + 1)
            pretty_printer.set_semi_colon_flag(semi_colon_flag)
         end
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.put_string(once "until")
         pretty_printer.set_indent_level(indent_level + 1)
         pretty_printer.set_semi_colon_flag(False)
         until_expression.pretty(indent_level + 1)
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.put_string(once "loop")
         if loop_body /= Void then
            loop_body.pretty(indent_level + 1)
         end
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.keyword(once "end")
         if pretty_printer.print_end_of_statement then
            pretty_printer.put_end_of(once "loop")
         end
         pretty_printer.set_indent_level(0)
      end

   collect (type: TYPE): TYPE is
      local
         dummy: TYPE; loop_check_flag: BOOLEAN
      do
         loop_check_flag := loop_check(type)
         if initialize /= Void then
            dummy := initialize.collect(type)
         end
         if loop_invariant /= Void then
            dummy := loop_invariant.collect(type)
         end
         if loop_variant /= Void then
            dummy := loop_variant.collect(type)
            check
               dummy.is_integer
            end
         end
         if until_expression.collect(type) = Void then
            check
               False
            end
         end
         if loop_body /= Void then
            dummy := loop_body.collect(type)
         end
      end

   adapt_for (t: TYPE): like Current is
      local
         it: like initialize; li: like loop_invariant; lv: like loop_variant; ue: like until_expression
         lb: like loop_body
      do
         if initialize /= Void then
            it := initialize.adapt_for(t)
         end
         if loop_invariant /= Void then
            li := loop_invariant.adapt_for(t)
         end
         if loop_variant /= Void then
            lv := loop_variant.adapt_for(t)
         end
         ue := until_expression.adapt_for(t)
         if loop_body /= Void then
            lb := loop_body.adapt_for(t)
         end
         if it /= initialize or else li /= loop_invariant or else lv /= loop_variant or else ue /= until_expression or else lb /= loop_body then
            create Result.make(start_position, it, li, lv, ue, lb)
         else
            Result := Current
         end
      end

feature {LOOP_INSTRUCTION}
   specialize_2_check (type: TYPE) is
      local
         dt: TYPE
      do
         dt := until_expression.declaration_type
         if not dt.is_boolean then
            error_handler.add_position(until_expression.start_position)
            error_handler.append("Expression of until must be of BOOLEAN type. (The actual ")
            error_handler.append(dt.name.to_string)
            error_handler.append(" type is not allowed.)")
            error_handler.print_as_error
            error_handler.add_position(start_position)
            error_handler.add_position(until_expression.start_position)
            error_handler.append("Error in until part of loop definition.")
            error_handler.print_as_fatal_error
         end
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      local
         loop_instruction: like Current
         it: like initialize; li: like loop_invariant; lv: like loop_variant; ue: like until_expression
         lb: like loop_body; loop_check_flag: BOOLEAN
      do
         loop_check_flag := loop_check(type)         
         code_accumulator.open_new_context
         if initialize /= Void then
            initialize.inline_dynamic_dispatch_(code_accumulator, type)
            it := code_accumulator.current_context_to_instruction
         end
         if loop_check_flag and then loop_invariant /= Void then
            li ::= loop_invariant.inline_dynamic_dispatch(code_accumulator, type)
         end
         if loop_check_flag and then loop_variant /= Void then
            code_accumulator.open_new_context
            loop_variant.inline_dynamic_dispatch_(code_accumulator, type)
            lv := code_accumulator.current_context_to_expression
            code_accumulator.close_current_context
         end
         until_expression.inline_dynamic_dispatch_(code_accumulator, type)
         ue:= code_accumulator.current_context_to_expression
         if loop_body /= Void then
            code_accumulator.open_new_context
            loop_body.inline_dynamic_dispatch_(code_accumulator, type)
            lb := code_accumulator.current_context_to_instruction
            code_accumulator.close_current_context
         end
         code_accumulator.close_current_context
         create loop_instruction.make(start_position, it, li, lv, ue, lb)
         code_accumulator.current_context.add_last(loop_instruction)
      end
   
feature {}
   loop_check (type: TYPE): BOOLEAN is
      do
         Result := type.class_text.loop_check
      end

   make (sp: like start_position; i: like initialize; li: like loop_invariant; lv: like loop_variant
      ue: like until_expression; lb: like loop_body) is
      require
         not sp.is_unknown
         ue /= Void
      do
         start_position := sp
         initialize := i
         loop_invariant := li
         loop_variant := lv
         until_expression := ue
         loop_body := lb
      ensure
         start_position = sp
         initialize = i
         loop_invariant = li
         loop_variant = lv
         until_expression = ue
         loop_body = lb
      end

invariant
   not start_position.is_unknown

   until_expression /= Void

end -- class LOOP_INSTRUCTION
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
