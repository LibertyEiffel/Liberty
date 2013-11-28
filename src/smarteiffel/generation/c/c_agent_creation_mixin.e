-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class C_AGENT_CREATION_MIXIN

feature {}
   for_all_argument_names (agent_creation: AGENT_CREATION; type: TYPE; action: PROCEDURE[TUPLE[ARGUMENT_NAME_DEF, INTEGER]]) is
      local
         i, j: INTEGER; cf: E_ROUTINE; argument_name: ARGUMENT_NAME_DEF
      do
         cf ::= agent_creation.context_features.fast_at(type)
         if cf.arguments /= Void then
            from
               i := 1
            until
               i > cf.arguments.count
            loop
               argument_name := cf.arguments.name(i)
               if argument_name.is_outside(type) then
                  action.call([argument_name, 1])
               end
               i := i + 1
            end
         end
         if cf.closure_arguments /= Void then
            from
               j := cf.closure_arguments.lower
            until
               j > cf.closure_arguments.upper
            loop
               if cf.closure_arguments.item(j) /= Void then
                  from
                     i := 1
                  until
                     i > cf.closure_arguments.item(j).count
                  loop
                     argument_name := cf.closure_arguments.item(j).name(i)
                     if argument_name.is_outside(type) then
                        action.call([argument_name, j - cf.closure_arguments.lower + 2])
                     end
                     i := i + 1
                  end
               end
               j := j + 1
            end
         end
      end

   for_all_local_names (agent_creation: AGENT_CREATION; type: TYPE; action: PROCEDURE[TUPLE[LOCAL_NAME_DEF]]) is
      local
         i, j: INTEGER; cf: E_ROUTINE; local_name: LOCAL_NAME_DEF
      do
         cf ::= agent_creation.context_features.fast_at(type)
         if cf.local_vars /= Void then
            from
               i := 1
            until
               i > cf.local_vars.count
            loop
               local_name := cf.local_vars.name(i)
               if local_name.is_used(type) and then local_name.is_outside(type) then
                  action.call([local_name])
               end
               i := i + 1
            end
         end
         if cf.closure_local_vars /= Void then
            from
               j := cf.closure_local_vars.lower
            until
               j > cf.closure_local_vars.upper
            loop
               if cf.closure_local_vars.item(j) /= Void then
                  from
                     i := 1
                  until
                     i > cf.closure_local_vars.item(j).count
                  loop
                     local_name := cf.closure_local_vars.item(j).name(i)
                     if local_name.is_used(type) and then local_name.is_outside(type) then
                        action.call([local_name])
                     end
                     i := i + 1
                  end
               end
               j := j + 1
            end
         end
      end

end -- class C_AGENT_CREATION_MIXIN
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
