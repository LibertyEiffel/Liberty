-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class E_VOID
   --
   -- Handling of the Eiffel special `Void' expression.
   --

inherit
   MANIFEST_EXPRESSION

creation {ANY}
   make

feature {ANY}
   start_position: POSITION

   is_void: BOOLEAN is True

   is_static: BOOLEAN is True

   extra_bracket_flag: BOOLEAN is False

   is_manifest_string: BOOLEAN is False

   side_effect_free (type: TYPE): BOOLEAN is
      do
         Result := True
      end

   bracketed_pretty, pretty (indent_level: INTEGER) is
      do
         pretty_printer.put_string(once "Void")
      end

   pretty_target (indent_level: INTEGER) is
      do
         check
            False
         end
      end

   to_string, to_key: STRING is
      do
         Result := as_void
      end

   safety_check (type: TYPE) is
      do
      end

   short (type: TYPE) is
      do
         short_printer.hook_or(as_void, as_void)
      end

   short_target (type: TYPE) is
      do
         short(type)
         short_printer.put_dot
      end

   compile_target_to_jvm, compile_to_jvm (type: TYPE) is
      do
         code_attribute.opcode_aconst_null
      end

   jvm_branch_if_false, jvm_branch_if_true (type: TYPE): INTEGER is
      do
         check
            False
         end
      end

   declaration_type: TYPE is
      do
         check
            -- The special treatement must be done before.
            False
         end
      end

   resolve_in (type: TYPE): TYPE is
      do
         error_handler.append(
            "Actually, `Void' has no accurate type. Keep in mind that `Void' is just a way to denote %
            %the default value for a type or to denote the lack of an object. %
            %One can use `Void' as the left-hand-side of an assignment or to replace some actual %
            %argument. (See %"http://liberty-eiffel.blogspot.com/wiki/en/index.php/Void%" for details.) %
            %At time being, the type ANY will be used for this occurrence `Void'. Please update %
            %your code with a more accurate expression, may be by adding an extra non-initialized %
            %local variable.")
         error_handler.add_position(start_position)
         error_handler.print_as_warning
         Result := smart_eiffel.type_any
      end

   collect (t: TYPE): TYPE is
      do
         sedb_breakpoint
         check
            False -- Just because Void has no type.
         end
      end

   specialize_in (type: TYPE): like Current is
      do
         Result := Current
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      do
         Result := Current
      end

   specialize_2 (type: TYPE): like Current is
      do
         Result := Current
      end

   has_been_specialized: BOOLEAN is True

   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
         -- Void is Void !
      end

   simplify (type: TYPE): E_VOID is
      do
         Result := Current
      end

   precedence: INTEGER is
      do
         Result := atomic_precedence
      end

   jvm_assign_creation, jvm_assign (type: TYPE) is
      do
         check
            False
         end
      end

   adapt_for (t: TYPE): like Current is
      do
         Result := Current
      end

   accept (visitor: E_VOID_VISITOR) is
      do
         visitor.visit_e_void(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   make (sp: like start_position) is
      require
         not sp.is_unknown
      do
         start_position := sp
      ensure
         sp = start_position
      end

end -- class E_VOID
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights blow)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
