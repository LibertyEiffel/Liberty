-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EXTERNAL_PROCEDURE

inherit
   EXTERNAL_ROUTINE
      redefine hook_collect
      end

creation {FEATURE_TEXT}
   make

creation {CLASS_TEXT}
   non_written

feature {ANY}
   side_effect_free (target_type: TYPE): BOOLEAN is
      do
         -- As it is a procedure, there are side effects!
      end

   result_type: TYPE_MARK is
      do
      end

feature {}
   new_run_feature_for (t: TYPE; fn: FEATURE_NAME): RUN_FEATURE_7 is
      do
         create Result.for(t.live_type, Current, fn)
      end

feature {RUN_FEATURE}
   hook_collect (t: TYPE) is
      local
         n: STRING
      do
         n := first_name.to_string
         if as_raise_exception = n then
            exceptions_handler.set_used
         end
      end

feature {}
   collect_body (type: TYPE) is
      local
         dummy: TYPE
      do
         if routine_body /= Void and then not type.is_deferred then
            if local_vars /= Void then
               local_vars.collect(type)
            end
            dummy := routine_body.collect(type)
         end
         native.collect(type, Current)
      end

feature {ANY}
   accept (visitor: EXTERNAL_PROCEDURE_VISITOR) is
      do
         visitor.visit_external_procedure(Current)
      end

feature {}
   make (fa: like arguments; om: like obsolete_mark; hc: like header_comment; ra: like require_assertion
      l: like native; en: like alias_string) is
      require
         l /= Void
      do
         make_routine(fa, om, hc, ra)
         make_external_routine(l, en)
      end

   non_written (ct: CLASS_TEXT; fn: FEATURE_NAME; fa: like arguments; l: like native) is
      require
         ct /= Void
         fn /= Void
         fa /= Void
         l /= Void
      do
         feature_text := ct.non_written(fn, Current)
         make(fa, Void, Void, Void, l, Void)
      end

   try_to_undefine_aux (fn: FEATURE_NAME; bc: CLASS_TEXT): DEFERRED_ROUTINE is
      do
         create {DEFERRED_PROCEDURE} Result.from_effective(fn, arguments, require_assertion, ensure_assertion, bc, permissions)
      end

end -- class EXTERNAL_PROCEDURE
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
