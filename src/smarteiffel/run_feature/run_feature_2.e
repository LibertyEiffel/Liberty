-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUN_FEATURE_2

inherit
   RUN_FEATURE
      redefine base_feature
      end

create {WRITABLE_ATTRIBUTE}
   for

feature {ANY}
   accept (visitor: RUN_FEATURE_2_VISITOR)
      do
         visitor.visit_run_feature_2(Current)
      end

feature {ANY}
   base_feature: WRITABLE_ATTRIBUTE

   result_type: TYPE_MARK

   is_deferred: BOOLEAN False

   is_once_procedure: BOOLEAN False

   is_once_function: BOOLEAN False

   has_closures: BOOLEAN False

   order: INTEGER
         -- Used for special sorting of LIVE_TYPE.writable_attributes

   side_effect_free: BOOLEAN
      do
         if ace.ensure_check then
            Result := (require_assertion = Void or else require_assertion.side_effect_free(type_of_current)) and then (ensure_assertion = Void or else ensure_assertion.side_effect_free(type_of_current))
         elseif ace.require_check then
            Result := require_assertion = Void or else require_assertion.side_effect_free(type_of_current)
         else
            Result := True
         end
      end

   arguments: FORMAL_ARG_LIST
      do
      end

   require_assertion: REQUIRE_ASSERTION

   local_vars: LOCAL_VAR_LIST
      do
      end

   routine_body: INSTRUCTION
      do
      end

   rescue_compound: INSTRUCTION
      do
      end

   ensure_assertion: ENSURE_ASSERTION

feature {}
   do_adapt
      local
         class_text: CLASS_TEXT
      do
         class_text := type_of_current.class_text
         -- Adapt the assertions:
         if class_text.require_check and then base_feature.require_assertion /= Void then
            require_assertion := base_feature.require_assertion.adapt_for(type_of_current)
         end
         if class_text.ensure_check and then base_feature.ensure_assertion /= Void then
            smart_eiffel.old_list_stack_push
            ensure_assertion := base_feature.ensure_assertion.adapt_for(type_of_current)
            old_list := smart_eiffel.old_list_stack_pop
         end
      end

   set_result_type
      do
         -- Adapt the result type:
         result_type := base_feature.result_type.resolve_in(type_of_current).canonical_type_mark --|*** CAD: need of resolve_in?
      ensure
         result_type /= Void
      end

feature {LIVE_TYPE}
   set_order (o: like order)
      require
         o >= 0
      do
         order := o
      ensure
         order = o
      end

feature {}
   compute_use_current
      do
         use_current_state := True_state
      end

feature {RUN_FEATURE_2_VISITOR}
   need_c_function: BOOLEAN
      do
         if ace.ensure_check then
            Result := (require_assertion /= Void) or else (ensure_assertion /= Void)
         elseif ace.require_check then
            Result := require_assertion /= Void
         end
      end

invariant
   order >= 0
   has_result_type: result_type /= Void

end -- class RUN_FEATURE_2
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
