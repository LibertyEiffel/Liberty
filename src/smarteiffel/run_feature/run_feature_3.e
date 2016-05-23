-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUN_FEATURE_3

inherit
   RUN_FEATURE
      redefine base_feature
      end

create {E_PROCEDURE}
   for

feature {ANY}
   accept (visitor: RUN_FEATURE_3_VISITOR)
      do
         visitor.visit_run_feature_3(Current)
      end

feature {ANY}
   base_feature: E_PROCEDURE

   arguments: FORMAL_ARG_LIST

   require_assertion: REQUIRE_ASSERTION

   local_vars: LOCAL_VAR_LIST

   routine_body: INSTRUCTION

   rescue_compound: INSTRUCTION

   ensure_assertion: ENSURE_ASSERTION

   is_deferred: BOOLEAN False

   is_once_procedure: BOOLEAN False

   is_once_function: BOOLEAN False

   has_closures: BOOLEAN
      do
         Result := base_feature.has_closures
      end

   result_type: TYPE_MARK
      do
      end

   side_effect_free: BOOLEAN
      do
         if side_effect_free_flag then
            Result := False
         else
            side_effect_free_flag := True
            Result := (routine_body = Void or else routine_body.side_effect_free(type_of_current)) and then (local_vars = Void or else local_vars.side_effect_free(type_of_current)) and then (rescue_compound = Void or else rescue_compound.side_effect_free(type_of_current)) and then (require_assertion = Void or else require_assertion.side_effect_free(type_of_current)) and then (ensure_assertion = Void or else ensure_assertion.side_effect_free(type_of_current))
            side_effect_free_flag := False
         end
      end

feature {C_PRETTY_PRINTER}
   set_is_root: BOOLEAN
         -- This function is called via a require. This way, no extra memory is used for a production
         -- compiler (i.e. it is actually dead code.).
      once
         Result := True
         is_root := True
      ensure
         is_root
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
      end

   set_result_type
      do
      end

feature {RUN_FEATURE_3}
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

   is_empty_or_null_body: BOOLEAN
         -- The body is empty or has only unreachable code.
      local
         rb: INSTRUCTION
      do
         rb := routine_body
         Result := rb = Void or else rb.side_effect_free(type_of_current)
      end

feature {LIVE_TYPE}
   memory_dispose: like Current
         -- Non Void when there is actually a non-empty `dispose' feature to call.
      do
         if not smart_eiffel.is_ready or else not is_empty_or_null_body then
            Result := Current
         end
      end

feature {RUN_FEATURE_3_VISITOR}
   empty_body_side_effect_free_in_boost: BOOLEAN
      require
         ace.boost
      do
         Result := (routine_body = Void and then
                    (local_vars = Void or else local_vars.side_effect_free(type_of_current)) and then
                    rescue_compound = Void)
      end

feature {}
   side_effect_free_flag: BOOLEAN

end -- class RUN_FEATURE_3
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
