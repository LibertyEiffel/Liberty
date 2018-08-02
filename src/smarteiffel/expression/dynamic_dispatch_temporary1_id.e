-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
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

create {ANY}
   make

feature {ANY}
   dynamic_dispatch_temporary1: EXPRESSION
         -- Most often, it is a DYNAMIC_DISPATCH_TEMPORARY1 object or, in some other situation a
         -- `side_effect_free' EXPRESSION.

   is_static: BOOLEAN False

   is_result: BOOLEAN False

   is_writable: BOOLEAN True

   start_position: POSITION
      do
         Result := dynamic_dispatch_temporary1.start_position
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := True
      end

   simplify (type: TYPE): EXPRESSION
      do
         Result := Current
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         Result := resolve_in(type)
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := smart_eiffel.type_integer_32
      ensure then
         type_id_is_integer: Result.is_integer
      end

   collect (type: TYPE): TYPE
      local
         dummy: TYPE
      do
         dummy := dynamic_dispatch_temporary1.collect(type)
         Result := resolve_in(type)
      end

   declaration_type: TYPE
      do
         check
            False
            -- Because `Current' is created after `status.collecting_done', this information
            -- not available.
         end
      end

   written_declaration_type_mark: TYPE_MARK
      do
         check False end
      end

   safety_check (type: TYPE)
      do
         dynamic_dispatch_temporary1.safety_check(type)
      end

   adapt_for (type: TYPE): like Current
      do
         Result := Current
      end

   use_current (type: TYPE): BOOLEAN
      do
         Result := dynamic_dispatch_temporary1.use_current(type)
      end

   accept (visitor: DYNAMIC_DISPATCH_TEMPORARY1_ID_VISITOR)
      do
         visitor.visit_dynamic_dispatch_temporary1_id(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   make (side_effect_free_expression: EXPRESSION)
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
