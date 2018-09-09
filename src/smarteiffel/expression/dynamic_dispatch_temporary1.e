-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class DYNAMIC_DISPATCH_TEMPORARY1
   --
   -- Simple wrapper or add automatically an extra internal local in order to implement dynamic
   -- dispatch with an `inspect' statement. DYNAMIC_DISPATCH_TEMPORARY1 is used outside of the
   -- `inspect' instruction to wrap the target.
   --
   -- See also DYNAMIC_DISPATCH_TEMPORARY1_ID and DYNAMIC_DISPATCH_TEMPORARY2.
   --

inherit
   NON_WRITTEN_EXPRESSION
   TAGGED

create {FEATURE_CALL}
   make

feature {ANY}
   start_position: POSITION
      do
         Result := target.start_position
      end

   is_static: BOOLEAN
      do
         Result := target.is_static
      end

   is_writable: BOOLEAN
      do
         Result := target.is_writable
      end

   is_result: BOOLEAN
      do
         Result := target.is_result
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         check
            False
         end
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := True
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := target_type
      ensure then
         Result.can_be_assigned_to(target.resolve_in(type))
      end

   collect (type: TYPE): TYPE
      do
         Result := target.collect(type)
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
         target.safety_check(type)
      end

   simplify (type: TYPE): EXPRESSION
      do
         Result := Current
      end

   adapt_for (type: TYPE): like Current
      local
         t: like target
      do
         t := target.adapt_for(type)
         if t = target then
            Result := Current
         else
            Result := twin
            Result.set_target(t)
         end
      end

   use_current (type: TYPE): BOOLEAN
      do
         Result := target.use_current(type)
      end

   accept (visitor: DYNAMIC_DISPATCH_TEMPORARY1_VISITOR)
      do
         visitor.visit_dynamic_dispatch_temporary1(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1}
   set_target (t: like target)
      require
         t /= Void
      do
         target := t
      ensure
         target = t
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1_VISITOR}
   target: EXPRESSION

   target_type: TYPE

feature {}
   make (t: like target; tt: like target_type)
      require
         t /= Void
         tt /= Void
      do
         target := t
         target_type := tt
      ensure
         target = t
         target_type = tt
      end

invariant
   target /= Void

   target_type /= Void

end -- DYNAMIC_DISPATCH_TEMPORARY1
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
