-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class DYNAMIC_DISPATCH_TEMPORARY1_ID
   --
   -- Following DYNAMIC_DISPATCH_TEMPORARY1, DYNAMIC_DISPATCH_TEMPORARY1_ID is also used to implement
   -- dynamic dispatch with `inspect' statements. The DYNAMIC_DISPATCH_TEMPORARY1_ID wrapper is the
   -- access to the `id' field of some target EXPRESSION. Most often, the `target' is an object of
   -- class DYNAMIC_DISPATCH_TEMPORARY1 and is used as the main expression of the `inspect' statement
   -- which implements dynamic dispatch.
   --
   -- See also DYNAMIC_DISPATCH_TEMPORARY2.
   --

inherit
   NON_WRITTEN_EXPRESSION

creation
   make

feature {ANY}
   dynamic_dispatch_temporary1: EXPRESSION
         -- Most often, it is a DYNAMIC_DISPATCH_TEMPORARY1 object or, in some other situation a
         -- `side_effect_free' EXPRESSION.

   is_static: BOOLEAN is False

   is_result: BOOLEAN is False

   is_writable: BOOLEAN is True

   start_position: POSITION is
      do
         Result := dynamic_dispatch_temporary1.start_position
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
         Result := True
      end

   simplify (type: TYPE): EXPRESSION is
      do
         Result := Current
      end

   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
         Result := resolve_in(type)
      end

   resolve_in (type: TYPE): TYPE is
      do
         Result := smart_eiffel.type_integer_32
      ensure then
         type_id_is_integer: Result.is_integer
      end

   collect (type: TYPE): TYPE is
      local
         dummy: TYPE
      do
         dummy := dynamic_dispatch_temporary1.collect(type)
         Result := resolve_in(type)
      end

   declaration_type: TYPE is
      do
         check
            False
            -- Because `Current' is created after `status.collecting_done', this information is
            -- not available.
         end
      end

   safety_check (type: TYPE) is
      do
         dynamic_dispatch_temporary1.safety_check(type)
      end

   adapt_for (type: TYPE): like Current is
      do
         Result := Current
      end

   use_current (type: TYPE): BOOLEAN is
      do
         Result := dynamic_dispatch_temporary1.use_current(type)
      end

   accept (visitor: DYNAMIC_DISPATCH_TEMPORARY1_ID_VISITOR) is
      do
         visitor.visit_dynamic_dispatch_temporary1_id(Current)
      end

   compile_to_jvm (type: TYPE) is
      do
         not_yet_implemented
      end

   compile_target_to_jvm (type: TYPE) is
      do
         not_yet_implemented
      end

   jvm_assign_creation (type: TYPE) is
      do
         not_yet_implemented
      end

   jvm_assign (type: TYPE) is
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

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   make (side_effect_free_expression: EXPRESSION) is
      require
         side_effect_free_expression /= Void
      do
         dynamic_dispatch_temporary1 := side_effect_free_expression
      ensure
         dynamic_dispatch_temporary1 = side_effect_free_expression
      end

invariant
   dynamic_dispatch_temporary1 /= Void

end -- DYNAMIC_DISPATCH_TEMPORARY1_ID
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
