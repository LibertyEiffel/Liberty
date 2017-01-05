-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUN_FEATURE_1

inherit
   RUN_FEATURE
      redefine base_feature
      end

create {CST_ATT}
   for

feature {ANY}
   accept (visitor: RUN_FEATURE_1_VISITOR)
      do
         visitor.visit_run_feature_1(Current)
      end

feature {ANY}
   base_feature: CST_ATT

   value: EXPRESSION

   result_type: TYPE_MARK

   is_deferred: BOOLEAN False

   side_effect_free: BOOLEAN True

   is_once_procedure: BOOLEAN False

   is_once_function: BOOLEAN False

   has_closures: BOOLEAN False

   arguments: FORMAL_ARG_LIST
      do
      end

   require_assertion: REQUIRE_ASSERTION
      do
      end

   local_vars: LOCAL_VAR_LIST
      do
      end

   routine_body: INSTRUCTION
      do
      end

   ensure_assertion: ENSURE_ASSERTION
      do
      end

   rescue_compound: INSTRUCTION
      do
      end

   afd_check
      do
      end

feature {RUN_FEATURE}
   compute_use_current
      do
         use_current_state := False_state
      end

feature {}
   do_adapt
      do
      end

   set_result_type
      do
         result_type := base_feature.result_type
         check
            result_type.is_static
         end
         value := base_feature.value
      end

end -- class RUN_FEATURE_1
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
