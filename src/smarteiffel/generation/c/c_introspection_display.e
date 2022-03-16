-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_INTROSPECTION_DISPLAY

inherit
   LIVE_TYPE_VISITOR
      undefine
         is_equal
      end
   RUN_FEATURE_VISITOR
      undefine
         is_equal
      end

insert
   C_COMPILATION_MIXIN
      undefine
         is_equal
      end
   SINGLETON

create {C_PRETTY_PRINTER}
   make

feature {C_PRETTY_PRINTER}
   compile (live_type: LIVE_TYPE)
         -- was prepare_introspection2
      require
         ace.no_check
         cpp.pending_c_function
      do
         live_type.accept(Current)
      end

feature {LIVE_TYPE}
   visit_live_type (visited: LIVE_TYPE)
      local
         i: INTEGER; ct: TYPE_MARK
      do
         if visited.at_run_time then
            ct := visited.canonical_type_mark
            function_body.append(once "se_atT[")
            ct.id.append_in(function_body)
            function_body.append(once "]=")
            from
               put_coma := False
               i := visited.live_features.lower
            until
               i > visited.live_features.upper
            loop
               visited.live_features.key(i).run_feature_for(visited.type).accept(Current)
               i := i + 1
            end
            --|*** PH: loop on precursors?
            if put_coma then
               function_body.extend('"')
            else
               function_body.append(once "NULL")
            end
            function_body.append(once ";%N")
         end
      end

feature {RUN_FEATURE_1}
   visit_run_feature_1 (visited: RUN_FEATURE_1)
      do
      end

feature {RUN_FEATURE_2}
   visit_run_feature_2 (visited: RUN_FEATURE_2)
      local
         lt: LIVE_TYPE
      do
         lt := visited.result_type.type.live_type
         if lt /= Void then
            if put_coma then
               function_body.append(once ", ")
            else
               function_body.extend('"')
            end
            function_body.append(visited.name.to_string)
            put_coma := True
         end
      end

feature {RUN_FEATURE_3}
   visit_run_feature_3 (visited: RUN_FEATURE_3)
      do
      end

feature {RUN_FEATURE_4}
   visit_run_feature_4 (visited: RUN_FEATURE_4)
      do
      end

feature {RUN_FEATURE_5}
   visit_run_feature_5 (visited: RUN_FEATURE_5)
      do
      end

feature {RUN_FEATURE_6}
   visit_run_feature_6 (visited: RUN_FEATURE_6)
      local
         lt: LIVE_TYPE
      do
         lt := visited.result_type.type.live_type
         if lt /= Void then
            if put_coma then
               function_body.append(once ", ")
            else
               function_body.extend('"')
            end
            function_body.append(visited.name.to_string)
            put_coma := True
         end
      end

feature {RUN_FEATURE_7}
   visit_run_feature_7 (visited: RUN_FEATURE_7)
      do
      end

feature {RUN_FEATURE_8}
   visit_run_feature_8 (visited: RUN_FEATURE_8)
      do
      end

feature {RUN_FEATURE_9}
   visit_run_feature_9 (visited: RUN_FEATURE_9)
      do
      end

feature {}
   make
      do
      end

   put_coma: BOOLEAN

end -- class C_INTROSPECTION_DISPLAY
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
