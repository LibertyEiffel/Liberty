-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class C_AGENT_CREATION_MIXIN

insert
   GLOBALS

feature {}
   for_all_arguments__ (fal: FORMAL_ARG_LIST; type: TYPE; action: PROCEDURE[TUPLE[ARGUMENT_NAME_DEF, INTEGER]]; closure_rank: INTEGER)
      require
         type /= Void
         action /= Void
      local
         i: INTEGER, argument_name: ARGUMENT_NAME_DEF
      do
         if fal /= Void then
            from
               i := 1
            until
               i > fal.count
            loop
               argument_name := fal.name(i)
               if argument_name.is_outside(type) then
                  action.call([argument_name, closure_rank])
               end
               i := i + 1
            end
         end
      end

   for_all_argument_names (agent_creation: AGENT_CREATION; type: TYPE; action: PROCEDURE[TUPLE[ARGUMENT_NAME_DEF, INTEGER]])
      require
         agent_creation /= Void
         type /= Void
         action /= Void
      local
         cf: E_ROUTINE; i: INTEGER
         fal: FORMAL_ARG_LIST; cfal: COLLECTION[FORMAL_ARG_LIST]
      do
         if agent_creation.context_features /= Void then
            cf ::= agent_creation.context_features.fast_reference_at(type)
         end
         if cf /= Void then
            fal := cf.arguments
            for_all_arguments__(fal, type, action, 0)
            cfal := cf.closure_arguments
            if cfal /= Void then
               from
                  i := cfal.lower
               until
                  i > cfal.upper
               loop
                  for_all_arguments__(cfal.item(i), type, action, i - cfal.lower + 1)
                  i := i + 1
               end
            end
         end
      end

   for_all_locals__ (lvl: LOCAL_VAR_LIST; type: TYPE; action: PROCEDURE[TUPLE[LOCAL_NAME_DEF]])
      require
         type /= Void
         action /= Void
      local
         i: INTEGER; local_name: LOCAL_NAME_DEF
      do
         if lvl /= Void then
            from
               i := 1
            until
               i > lvl.count
            loop
               local_name := lvl.name(i)
               if local_name.is_used(type) and then local_name.is_outside(type) then
                  action.call([local_name])
               end
               i := i + 1
            end
         end
      end

   for_all_local_names (agent_creation: AGENT_CREATION; type: TYPE; action: PROCEDURE[TUPLE[LOCAL_NAME_DEF]])
      require
         agent_creation /= Void
         type /= Void
         action /= Void
      local
         cf: E_ROUTINE; i: INTEGER
         lvl: LOCAL_VAR_LIST; clvl: COLLECTION[LOCAL_VAR_LIST]
      do
         if agent_creation.context_features /= Void then
            cf ::= agent_creation.context_features.fast_reference_at(type)
         end
         if cf /= Void then
            lvl := cf.local_vars
            for_all_locals__(lvl, type, action)
            clvl := cf.closure_local_vars
            if clvl /= Void then
               from
                  i := clvl.lower
               until
                  i > clvl.upper
               loop
                  for_all_locals__(clvl.item(i), type, action)
                  i := i + 1
               end
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
