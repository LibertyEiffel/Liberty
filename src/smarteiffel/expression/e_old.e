-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class E_OLD
   --
   -- To store the "old foo" expression that can be used only in ensure assertions.
   --

inherit
   EXPRESSION
   TAGGED

creation {EIFFEL_PARSER}
   make

feature {ANY}
   start_position: POSITION
         -- Of the "old" keyword.

   expression: EXPRESSION
         -- The one after keyword "old".

   is_current: BOOLEAN is False

   is_implicit_current: BOOLEAN is False

   is_writable: BOOLEAN is False

   is_static: BOOLEAN is False

   is_manifest_string: BOOLEAN is False

   is_result: BOOLEAN is False

   is_void: BOOLEAN is False

   extra_bracket_flag: BOOLEAN is True

   safety_check (type: TYPE) is
      do
         expression.safety_check(type)
      end

   specialize_in (type: TYPE): like Current is
      local
         exp: like expression
      do
         if vaol_check_memory.item = Void then
            vaol_check_memory.set_item(Current)
         else
            error_handler.add_position(vaol_check_memory.item.start_position)
            error_handler.add_position(start_position)
            error_handler.append("Must not use old inside some old expression (VAOL.2).")
            error_handler.print_as_fatal_error
         end
         exp := expression.specialize_in(type)
         vaol_check_memory.clear
         Result := current_or_twin_init(exp)
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         exp: like expression
      do
         exp := expression.specialize_thru(parent_type, parent_edge, new_type)
         Result := current_or_twin_init(exp)
      end

   specialize_2 (type: TYPE): like Current is
      local
         exp: like expression
      do
         exp := expression.specialize_2(type)
         Result := current_or_twin_init(exp)
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
         -- As the `expression' is memorized and always evaluated once:
         Result := True
      end

   has_been_specialized: BOOLEAN is
      do
         Result := expression.has_been_specialized
      end

   declaration_type: TYPE is
      do
         Result := expression.declaration_type
      end

   resolve_in (type: TYPE): TYPE is
      do
         Result := expression.resolve_in(type)
      end

   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
         Result := expression.non_void_no_dispatch_type(type)
      end

   simplify (type: TYPE): EXPRESSION is
      do
         not_yet_implemented
         check
            False -- Because `simplify' is only made for -boost.
         end
      end

   bracketed_pretty (indent_level: INTEGER) is
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
      end

   pretty (indent_level: INTEGER) is
      do
         pretty_printer.keyword(once "old")
         if expression.precedence <= precedence then
            expression.bracketed_pretty(indent_level + 1)
         else
            expression.pretty(indent_level + 1)
         end
      end

   pretty_target (indent_level: INTEGER) is
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
         pretty_printer.put_character('.')
      end

   short (type: TYPE) is
      do
         short_printer.hook_or(once "old", once "old ")
         expression.short(type)
      end

   short_target (type: TYPE) is
      do
         bracketed_short(type)
         short_printer.put_dot
      end

   precedence: INTEGER is
      do
         Result := 11
      end

   compile_to_jvm_old (type: TYPE) is
      do
         not_yet_implemented
      end

   compile_to_jvm (type: TYPE) is
      do
         not_yet_implemented
      end

   compile_target_to_jvm (type: TYPE) is
      do
         not_yet_implemented
      end

   jvm_branch_if_false (type: TYPE): INTEGER is
      do
         not_yet_implemented
      end

   jvm_branch_if_true (type: TYPE): INTEGER is
      do
         not_yet_implemented
      end

   jvm_assign_creation, jvm_assign (type: TYPE) is
      do
         not_yet_implemented
      end

   use_current (type: TYPE): BOOLEAN is
      do
         Result := expression.use_current(type)
      end

   collect (type: TYPE): TYPE is
      do
         Result := expression.collect(type)
      end

   adapt_for (type: TYPE): like Current is
      do
         Result := current_or_twin_init(expression.adapt_for(type))
         smart_eiffel.register_old(Result)
      end

   accept (visitor: E_OLD_VISITOR) is
      do
         visitor.visit_e_old(Current)
      end

feature {E_OLD}
   init (exp: like expression) is
      require
         exp /= Void
      do
         expression := exp
      ensure
         expression = exp
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      local
         exp: like expression
      do
         code_accumulator.open_new_context
         expression.inline_dynamic_dispatch_(code_accumulator, type)
         exp := code_accumulator.current_context_to_expression
         code_accumulator.close_current_context
         code_accumulator.current_context.add_last(current_or_twin_init(exp))
      end

feature {}
   make (sp: like start_position; exp: like expression) is
      require
         not sp.is_unknown
         exp /= Void
      do
         start_position := sp
         expression := exp
      ensure
         start_position = sp
         expression = exp
      end

   current_or_twin_init (exp: like expression): like Current is
      require
         exp /= Void
      do
         if exp = expression then
            Result := Current
         else
            Result := twin
            Result.init(exp)
         end
      ensure
         Result.expression = exp
      end

   vaol_check_memory: REFERENCE[E_OLD] is
      once
         create Result
      end

invariant
   expression /= Void

end -- class E_OLD
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
