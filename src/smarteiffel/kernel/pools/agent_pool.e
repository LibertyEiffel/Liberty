-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AGENT_POOL
   --
   -- Singleton object in charge of agents.
   -- This singleton is shared via the GLOBALS.`agent_pool' once function.
   --

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

feature {ANY}
   agent_creation_collected_flag: BOOLEAN

feature {AGENT_CREATION}
   agent_creation_collect (type: TYPE; agent_creation: AGENT_CREATION; agent_type: TYPE)
      require
         agent_creation.resolve_in(type) = agent_type
      local
         agent_creation_list: FAST_ARRAY[AGENT_CREATION]; i: INTEGER; agent_args: AGENT_ARGS;
         launcher_type: TYPE; add_flag: BOOLEAN; ac: AGENT_CREATION
      do
         agent_creation_collected_flag := True
         agent_creation_list := creation_collected_memory.reference_at(type)
         if agent_creation_list = Void then
            create agent_creation_list.with_capacity(8)
            creation_collected_memory.add(agent_creation_list, type)
         end
         from
            add_flag := True
            i := agent_creation_list.lower
         until
            i > agent_creation_list.upper
         loop
            ac := agent_creation_list.item(i)
            if agent_creation.same_mold_id_as(ac) then
               add_flag := False
               i := agent_creation_list.upper
            end
            i := i + 1
         end
         if add_flag then
            agent_creation_list.add_last(agent_creation)
            smart_eiffel.magic_count_increment
         end
         -- Visit all already collected compatible launcher to update the assignment_handler accordingly:
         from
            i := launcher_collected_memory.lower
         until
            i > launcher_collected_memory.upper
         loop
            agent_args := launcher_collected_memory.item(i)
            launcher_type := agent_args.agent_type
            if agent_type /= launcher_type then
               inspect
                  agent_type.insert_inherit_test(launcher_type)
               when inserts_code, inherits_code then
                  notify_assignment_handler_with(agent_type, launcher_type)
               when unrelated_code then
               end
            end
            i := i + 1
         end
      end

feature {AGENT_LAUNCHER}
   agent_launcher_collect (launcher_type: TYPE): AGENT_ARGS
      require
         launcher_type.canonical_type_mark.is_agent
      local
         i: INTEGER; signature: STRING; formal, ar: TYPE; open: ARRAY[TYPE]
      do
         -- Computation of the `signature' first:
         signature := once "..... unique buffer ....."
         signature.copy(once "agent_launcher")

         ar := launcher_type.agent_result
         if ar /= Void then
            signature.append(once "_R")
            ar.id.append_in(signature)
         end

         open := launcher_type.open_arguments
         if open /= Void then
            signature.extend('_')
            from
               i := 1
            until
               i > open.count
            loop
               formal := open.item(i)
               signature.extend('o')
               formal.id.append_in(signature)
               i := i + 1
            end
         end
         Result := launcher_memory.reference_at(signature)
         if Result = Void then
            signature := signature.twin
            create Result.make(signature, launcher_type)
            launcher_memory.put(Result, signature)
            launcher_collected_memory.add(Result)
         elseif not launcher_collected_memory.has(Result) then
            launcher_collected_memory.add(Result)
         end
      ensure
         Result /= Void
      end

feature {SMART_EIFFEL}
   reset
      local
         i: INTEGER
      do
         agent_creation_collected_flag := False
         from
            i := creation_collected_memory.lower
         until
            i > creation_collected_memory.upper
         loop
            creation_collected_memory.item(i).clear_count
            i := i + 1
         end
         launcher_collected_memory.clear_count
      end

feature {CODE_PRINTER, C_LIVE_TYPE_COMPILER}
   creation_collected_memory: HASHED_DICTIONARY[FAST_ARRAY[AGENT_CREATION], TYPE]
         -- For each context TYPE, those which are collected.
      once
         create Result.make
      end

   launcher_collected_memory: SET[AGENT_ARGS]
         -- A subset of `launcher_memory' (collected ones).
      once
         create {HASHED_SET[AGENT_ARGS]} Result.make
      end

   agent_definition_set: SET[STRING]
      once
         create {HASHED_SET[STRING]} Result.make
      end

feature {}
   notify_assignment_handler_with (agent_type, launcher_type: TYPE)
      require
         agent_type.is_agent
         launcher_type.is_agent
         agent_type.insert_inherit_test(launcher_type) /= unrelated_code
      local
         arg_idx, open_agent_count, open_launcher_count: INTEGER
         agent_oa, launcher_oa, agent_result, launcher_result: TYPE; open_agent, open_launcher: ARRAY[TYPE]
      do
         open_agent := agent_type.open_arguments
         if open_agent /= Void then
            open_agent_count := open_agent.count
         end
         open_launcher := launcher_type.open_arguments
         if open_launcher /= Void then
            open_launcher_count := open_launcher.count
         end
         if open_agent_count >= open_launcher_count then
            -- (Because we allow to drop some actual args.)
            from
               arg_idx := open_launcher_count
            until
               arg_idx <= 0
            loop
               agent_oa := open_agent.item(arg_idx)
               launcher_oa := open_launcher.item(arg_idx)
               assignment_handler.collect_normal(launcher_oa, agent_oa)
               arg_idx := arg_idx - 1
            end
         end
         -- Finally the results:
         agent_result := agent_type.agent_result
         launcher_result := launcher_type.agent_result
         if agent_result /= Void and then launcher_result /= Void then
            assignment_handler.collect_normal(agent_result, launcher_result)
         end
      end

   launcher_memory: HASHED_DICTIONARY[AGENT_ARGS, STRING]
         -- All ever created signatures for all encountered agent launcher.
      once
         create Result.make
      end

end -- class AGENT_POOL
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
