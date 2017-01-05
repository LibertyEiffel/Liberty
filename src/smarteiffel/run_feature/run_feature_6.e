-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUN_FEATURE_6

inherit
   RUN_FEATURE
      redefine base_feature
      end

create {ONCE_FUNCTION}
   for

feature {ANY}
   accept (visitor: RUN_FEATURE_6_VISITOR)
      do
         visitor.visit_run_feature_6(Current)
      end

feature {ANY}
   base_feature: ONCE_FUNCTION

   arguments: FORMAL_ARG_LIST

   result_type: TYPE_MARK

   require_assertion: REQUIRE_ASSERTION

   local_vars: LOCAL_VAR_LIST

   routine_body: INSTRUCTION

   rescue_compound: INSTRUCTION

   ensure_assertion: ENSURE_ASSERTION

   is_deferred: BOOLEAN False

   is_once_procedure: BOOLEAN False

   is_once_function: BOOLEAN True

   has_closures: BOOLEAN
      do
         Result := base_feature.has_closures
      end

   is_precomputable_once: BOOLEAN
      do
         Result := once_routine_pool.is_precomputed(base_feature)
      end

   side_effect_free: BOOLEAN
      do
         Result := is_precomputable_once
      end

feature {}
   do_adapt
      local
         class_text: CLASS_TEXT
      do
         class_text := type_of_current.class_text
         -- Adapt the arguments --|*** CAD: need?
         arguments := base_feature.arguments
         if arguments /= Void then
            arguments := arguments.adapt_for(type_of_current)
         end
         -- Adapt the local variables --|*** CAD: need?
         local_vars := base_feature.local_vars
         if local_vars /= Void then
            local_vars := local_vars.adapt_for(type_of_current)
         end
         -- Adapt the routine body:
         routine_body := base_feature.routine_body
         if routine_body /= Void then
            routine_body := routine_body.adapt_for(type_of_current)
         end
         check
            specialized: base_feature.routine_then = Void
         end
         -- Adapt the assertions:
         if class_text.require_check and then base_feature.require_assertion /= Void then
            require_assertion := base_feature.require_assertion.adapt_for(type_of_current)
         end
         if class_text.ensure_check and then base_feature.ensure_assertion /= Void then
            smart_eiffel.old_list_stack_push
            ensure_assertion := base_feature.ensure_assertion.adapt_for(type_of_current)
            old_list := smart_eiffel.old_list_stack_pop
         end
         -- Adapt the rescue clause:
         rescue_compound := base_feature.rescue_compound_in(type_of_current)
         if rescue_compound /= Void then
            exceptions_handler.set_used
            rescue_compound := rescue_compound.adapt_for(type_of_current)
         end
         once_routine_pool.register_function(Current)
      end

   set_result_type
      do
         -- Adapt the result type:
         result_type := base_feature.result_type.resolve_in(type_of_current).canonical_type_mark --|*** CAD: need of resolve_in?
      ensure
         result_type /= Void
      end

feature {}
   compute_use_current
      do
         if type_of_current.is_reference then
            if ace.no_check then
               use_current_state := True_state
            else
               std_compute_use_current
            end
         else
            std_compute_use_current
         end
      end

invariant
   has_result_type: result_type /= Void
end -- class RUN_FEATURE_6
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
