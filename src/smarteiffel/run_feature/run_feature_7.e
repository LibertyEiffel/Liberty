-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUN_FEATURE_7

inherit
   RUN_FEATURE
      redefine base_feature
      end

create {EXTERNAL_PROCEDURE}
   for

feature {ANY}
   accept (visitor: RUN_FEATURE_7_VISITOR)
      do
         visitor.visit_run_feature_7(Current)
      end

feature {ANY}
   base_feature: EXTERNAL_PROCEDURE

   arguments: FORMAL_ARG_LIST

   require_assertion: REQUIRE_ASSERTION

   ensure_assertion: ENSURE_ASSERTION

   local_vars: LOCAL_VAR_LIST

   routine_body: INSTRUCTION

   is_deferred: BOOLEAN False

   is_static: BOOLEAN False

   side_effect_free: BOOLEAN False

   is_once_procedure: BOOLEAN False

   is_once_function: BOOLEAN False

   has_closures: BOOLEAN False

   arg_count: INTEGER
      do
         if arguments /= Void then
            Result := arguments.count
         end
      end

   result_type: TYPE_MARK
      do
      end

   rescue_compound: INSTRUCTION
      do
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
         routine_body := base_feature.adapt_routine_body_for(type_of_current)
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
      end

   compute_use_current
      do
         if base_feature.use_current(type_of_current) then
            use_current_state := True_state
         else
            std_compute_use_current
         end
      end

end -- class RUN_FEATURE_7
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
