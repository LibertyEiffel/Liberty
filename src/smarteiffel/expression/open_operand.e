-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class OPEN_OPERAND
   --
   -- An open operand (or open target as well) inside some AGENT_CREATION expression. Most often, an
   -- open  operand is a single question mark inside some agent creation expression like in:
   --    agent foo(?)
   -- But, keep in mind that an open operand can also be some type mark inside curly brackets like in:
   --    agent foo({INTEGER})
   -- Finally, an OPEN_OPERAND object can also be used when the target itself is open as in:
   --    agent {FOO}.bar
   --
   -- See also AGENT_CREATION and CLOSED_OPERAND.
   --

inherit
   EXPRESSION

creation {EIFFEL_PARSER, FORMAL_ARG_LIST}
   question_mark

creation {EIFFEL_PARSER}
   type_holder

feature {ANY}
   start_position: POSITION
         -- Of the `?' or of the '{' opening character.

   curly_type: TYPE_MARK
         -- If any, provided by the `eiffel_parser'. The one written between {} when the ? notation
         -- is not used.

   rank: INTEGER
         -- The `rank' of the corresponding open argument in the actual argument list. The `rank'
         -- is set to -1 to indicate that it is an open target. Initial 0 value indicate that
         -- `Current' is out of scope of its corresponding "agent" keyword.

   is_current: BOOLEAN is False

   is_implicit_current: BOOLEAN is False

   is_manifest_string: BOOLEAN is False

   is_void: BOOLEAN is False

   is_result: BOOLEAN is False

   is_writable: BOOLEAN is False

   is_static: BOOLEAN is False

   extra_bracket_flag: BOOLEAN is False

   specialize_in (type: TYPE): like Current is
      do
         Result := Current
         if rank = 0 then
            error_handler.add_position(start_position)
            error_handler.append("This ")
            error_handler.add_expression(Current)
            error_handler.append(" open operand expression is out of %"agent%" keyword scope.")
            error_handler.print_as_fatal_error
         end
         if curly_type /= Void then
            curly_type.specialize_in(type)
         elseif rank = -1 then
            error_handler.add_position(start_position)
            error_handler.append("This ")
            error_handler.add_expression(Current)
            error_handler.append(" open operand cannot be the target of an agent call.")
            error_handler.print_as_fatal_error
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         ct: like curly_type
      do
         Result := Current
         if curly_type /= Void then
            ct := curly_type.specialize_thru(parent_type, parent_edge, new_type)
            if ct = curly_type then
               Result := Current
            else
               -- *** ON FAIT COMMENT ?? on est passe avant
               sedb_breakpoint
               not_yet_implemented
            end
         end
      end

   specialize_2 (type: TYPE): like Current is
      do
         check
            rank /= 0 -- Already checked in `specialize_in'.
         end
         -- Actually, nothing to do, even for `curly_type'. Let's wait.
         Result := Current
      end

   declaration_type: TYPE is
      do
         Result := curly_type.declaration_type.type
      end

   collect (type: TYPE): TYPE is
      do
         Result := resolve_in(type)
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
         -- As it is always inside some wrapper, the answer is:
         Result := True
      end

   resolve_in (type: TYPE): TYPE is
      do
         if resolved_memory = Void then
            create resolved_memory.make
         else
            Result := resolved_memory.reference_at(type)
         end
         if Result = Void then
            Result := curly_type.resolve_in(type)
            resolved_memory.put(Result, type)
         end
      end

   has_been_specialized: BOOLEAN is
      do
         if curly_type = Void then
            Result := True
         else
            Result := curly_type.has_been_specialized
         end
      end

   adapt_for (t: TYPE): like Current is
      do
         Result := Current
      end

   bracketed_pretty, pretty (indent_level: INTEGER) is
      do
         if curly_type = Void then
            pretty_printer.put_character('?')
         else
            pretty_printer.put_character('{')
            pretty_printer.put_type_mark(curly_type)
            pretty_printer.put_character('}')
         end
      end

   pretty_target (indent_level: INTEGER) is
      do
         bracketed_pretty(indent_level)
         pretty_printer.put_character('.')
      end

   short (type: TYPE) is
      do
         if curly_type /= Void then
            short_printer.hook_or("open_curly_bracket", once "{")
            curly_type.short(type)
            short_printer.hook_or("close_curly_bracket", once "}")
         else
            short_printer.hook_or("question_mark", once "?")
         end
      end

   short_target (type: TYPE) is
      do
         check
            False
         end
         -- An OPEN_OPERAND is never a target !
      end

   precedence: INTEGER is
      do
         Result := atomic_precedence
      end

   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
      end

   simplify (type: TYPE): OPEN_OPERAND is
      do
         Result := Current
      end

   safety_check (type: TYPE) is
      do
      end

   use_current (type: TYPE): BOOLEAN is
      do
         check
            not Result
         end
      end

   jvm_assign_creation, jvm_assign (type: TYPE) is
      do
         check
            False
         end
      end

   compile_target_to_jvm, compile_to_jvm (type: TYPE) is
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

   accept (visitor: OPEN_OPERAND_VISITOR) is
      do
         visitor.visit_open_operand(Current)
      end

feature {OPEN_OPERAND}
   init (ct: like curly_type) is
      do
         curly_type := ct
      ensure
         curly_type = ct
      end

feature {AGENT_CREATION, FORMAL_ARG_LIST}
   set_rank (r: like rank) is
      require
         (r = -1) or else (r > 0)
      do
         rank := r
      ensure
         rank = r
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   resolved_memory: HASHED_DICTIONARY[TYPE, TYPE]

feature {EFFECTIVE_ARG_LIST, FORMAL_ARG_LIST}
   update_resolved_memory (type, resolved: TYPE) is
      require
         type /= Void
         resolved /= Void
      do
         if resolved_memory = Void then
            create resolved_memory.make
         end
         resolved_memory.put(resolved, type)
      end

feature {}
   current_or_twin_init (ct: like curly_type): like Current is
      do
         if ct = curly_type then
            Result := Current
         else
            Result := twin
            Result.init(ct)
         end
      ensure
         Result.curly_type = ct
      end

   question_mark (sp: like start_position) is
         -- To create the classic ? open operand.
      require
         not sp.is_unknown
      do
         start_position := sp
      ensure
         start_position = sp
         curly_type = Void
      end

   type_holder (sp: like start_position; ct: like curly_type) is
         -- To create the curly bracketed type-holder form.
      require
         not sp.is_unknown
         ct /= Void
      do
         start_position := sp
         curly_type := ct
      ensure
         start_position = sp
         curly_type = ct
      end

invariant
   rank >= -1
   curly_type = Void implies rank >= 0

end -- class OPEN_OPERAND
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
