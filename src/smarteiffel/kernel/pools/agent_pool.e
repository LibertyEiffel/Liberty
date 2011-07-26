-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
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

feature {AGENT_LAUNCHER, C_HEADER_PASS_1, C_EXPRESSION_COMPILATION_MIXIN}
   agent_creation_collected_flag: BOOLEAN

feature {AGENT_CREATION}
   agent_creation_collect (type: TYPE; agent_creation: AGENT_CREATION; agent_type: TYPE) is
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
            i := agent_creation_list.upper
         until
            i < agent_creation_list.lower
         loop
            ac := agent_creation_list.item(i)
            if agent_creation.same_mold_id_as(ac) then
               add_flag := False
               i := agent_creation_list.lower
            end
            i := i - 1
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
   agent_launcher_collect (launcher_type: TYPE): AGENT_ARGS is
      require
         launcher_type.canonical_type_mark.is_agent
      local
         i: INTEGER; signature: STRING; formal, ar: TYPE; open: ARRAY[TYPE]
      do
         -- Computation of the `signature' first:
         signature := once "..... unique buffer ....."
         signature.clear_count
         ar := launcher_type.agent_result
         if ar /= Void then
            signature_add_last(signature, ar)
            signature.extend('_')
         end
         signature.append(once "agent_launcher")
         open := launcher_type.open_arguments
         if open /= Void then
            from
               i := 1
            until
               i > open.count
            loop
               formal := open.item(i)
               signature.extend('_')
               signature_add_last(signature, formal)
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

feature {C_LIVE_TYPE_COMPILER}
   c_define_agent_creation_for (type: TYPE) is
      local
         agent_creation_list: FAST_ARRAY[AGENT_CREATION]; i: INTEGER
         agent_creation: AGENT_CREATION; buffer, mold_id: STRING
      do
         buffer := once "............................."
         agent_creation_list := creation_collected_memory.reference_at(type)
         if agent_creation_list /= Void then
            from
               i := agent_creation_list.lower
            until
               i > agent_creation_list.upper
            loop
               agent_creation := agent_creation_list.item(i)
               buffer.clear_count
               agent_creation.mold_id_in(type, buffer)
               mold_id := buffer.twin
               defined_agent_creation.add_last(mold_id)
               agent_creation.c_define_function(type, mold_id, defined_agent_creation.upper)
               i := i + 1
            end
         end
      end

feature {SMART_EIFFEL}
   reset is
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

feature {C_PRETTY_PRINTER}
   customize_c_runtime_1 is
      local
         boost: BOOLEAN
      do
         boost := ace.boost
         if agent_creation_collected_flag then
            cpp.out_h_buffer.copy(once "[
               /*The generic se_agent0 definition:*/
               struct _se_agent0{
               Tid id;
               Tid creation_mold_id;
               void(*afp)(
             ]")
            if not boost then
               cpp.out_h_buffer.append(once "se_dump_stack*,")
            end
            if ace.profile then
               cpp.out_h_buffer.append(once "se_local_profile_t*,")
            end
            cpp.out_h_buffer.append(once "[
             se_agent*);
             ]")

            if not cpp.gc_handler.is_off then
               cpp.out_h_buffer.append(once "[
             void(*gc_mark_agent_mold)(se_agent*);

             ]")
            end

            cpp.out_h_buffer.append(once "[
             int(*eq)(se_agent*,se_agent*);
             };

             ]")
            cpp.write_out_h_buffer
         end
      end

   customize_c_runtime_2 is
      require
         not cpp.pending_c_function
      local
         i: INTEGER; mold_id: STRING; agent_args: AGENT_ARGS
      do
         if agent_creation_collected_flag then
            echo.print_count(once "Agent call wrapper", launcher_collected_memory.count)
            from
               i := 1
            until
               i > launcher_collected_memory.count
            loop
               agent_args := launcher_collected_memory.item(i)
               agent_definition_set.add(agent_args.signature)
               agent_args.c_define_agent_launcher
               i := i + 1
            end

            cpp.out_h_buffer.copy(once "union _se_agent{T0 s0;se_agent0 u0;%N")
            from
               i := defined_agent_creation.upper
            until
               i < defined_agent_creation.lower
            loop
               mold_id := defined_agent_creation.item(i)
               cpp.out_h_buffer.append(once "se_")
               cpp.out_h_buffer.append(mold_id)
               cpp.out_h_buffer.append(once " u")
               cpp.out_h_buffer.append(mold_id)
               cpp.out_h_buffer.append(once ";%N")
               i := i - 1
            end
            cpp.out_h_buffer.append(once "};%N")
            cpp.write_out_h_buffer

            cpp.sys_runtime_h_and_c(once "agents")
         end
      end

feature {JVM}
   customize_jvm_runtime is
      do
         --|*** ???? ***
      end

   jvm_define_deferred_methods is
      local
         i: INTEGER
      do
         method_info.add_init(once "java/lang/Object")
         from
            i := 1
         until
            i > launcher_collected_memory.count
         loop
            launcher_collected_memory.item(i).jvm_define(False)
            i := i + 1
         end
         method_info.finish
      end

   ajout_call_full (i: INTEGER) is
         --|*** NOM MOCHE ***
      do
         method_info.add_init(once "java/lang/Object")
         launcher_collected_memory.item(i).jvm_define(True)
         method_info.finish
      end

feature {GC_HANDLER}
   gc_info is
         -- Produce C code to print GC information.
      require
         cpp.pending_c_function
      do
         if agent_creation_collected_flag then
            cpp.pending_c_function_body.append(once "[
               if(gc_info_nb_agent)
                  fprintf(SE_GCINFO,
                  "%d\tagent(s) created. (store_left=%d).\n",
                  gc_info_nb_agent,store_left_agent);

                              ]")
         end
      end

feature {AGENT_ARGS}
   c_switch_in (buffer: STRING; launcher_type, agent_result: TYPE) is
      require
         agent_result = launcher_type.agent_result
      local
         mold_id: STRING;
         type_idx, agent_creation_idx, arg_idx, open_count, idx: INTEGER
         open_args: ARRAY[TYPE]
         agent_creation_list: FAST_ARRAY[AGENT_CREATION]; agent_creation: AGENT_CREATION
         type, agent_creation_type: TYPE
      do
         mold_id := once "..........................."
         from
            type_idx := creation_collected_memory.lower
         until
            type_idx > creation_collected_memory.upper
         loop
            type := creation_collected_memory.key(type_idx)
            agent_creation_list := creation_collected_memory.item(type_idx)
            from
               agent_creation_idx := agent_creation_list.lower
            until
               agent_creation_idx > agent_creation_list.upper
            loop
               agent_creation := agent_creation_list.item(agent_creation_idx)
               agent_creation_type := agent_creation.resolve_in(type)
               if agent_creation_type.can_be_assigned_to(launcher_type) then
                  mold_id.clear_count
                  agent_creation.mold_id_in(type, mold_id)
                  idx := defined_agent_creation.first_index_of(mold_id)
                  if defined_agent_creation.valid_index(idx) then
                     buffer.append(once "case ")
                     idx.append_in(buffer)
                     buffer.append(once ":{%N")
                     if agent_result /= Void then
                        buffer.append(once "R=(")
                        agent_result.canonical_type_mark.c_type_for_result_in(buffer)
                        buffer.append(once ")(")
                     end
                     buffer.append(once "((se_")
                     buffer.append(mold_id)
                     buffer.append(once "*)a)->afp(")
                     if not ace.boost then
                        buffer.append(once "caller,")
                     end
                     if ace.profile then
                        buffer.append(once "&local_profile,")
                     end
                     buffer.append(once "((/*agent*/void*)a)")
                     open_args := agent_creation_type.open_arguments
                     if open_args /= Void then
                        open_count := open_args.count
                        from
                           arg_idx := 1
                        until
                           arg_idx > open_count
                        loop
                           buffer.append(once ",a")
                           arg_idx.append_in(buffer)
                           arg_idx := arg_idx + 1
                        end
                     end
                     buffer.extend(')')
                     if agent_result /= Void then
                        buffer.extend(')')
                     end
                     buffer.append(once ";%Nbreak;%N}%N")
                  end
               end
               agent_creation_idx := agent_creation_idx + 1
            end
            type_idx := type_idx + 1
         end
      end

feature {}
   notify_assignment_handler_with (agent_type, launcher_type: TYPE) is
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

   creation_collected_memory: HASHED_DICTIONARY[FAST_ARRAY[AGENT_CREATION], TYPE] is
         -- For each context TYPE, those which are collected.
      once
         create Result.make
      end

   launcher_memory: HASHED_DICTIONARY[AGENT_ARGS, STRING] is
         -- All ever created signatures for all encountered agent launcher.
      once
         create Result.make
      end

   launcher_collected_memory: SET[AGENT_ARGS] is
         -- A subset of `launcher_memory' (collected ones).
      once
         create {HASHED_SET[AGENT_ARGS]} Result.make
      end

   agent_definition_set: SET[STRING] is
      once
         create {HASHED_SET[STRING]} Result.make
      end

   signature_add_last (signature: STRING; type: TYPE) is
      require
         type /= Void
      local
         s: STRING; i: INTEGER; c: CHARACTER
      do
         from
            s := type.name.to_string
            i := 1
         until
            i > s.count
         loop
            c := s.item(i)
            inspect
               c
            when '[', ']', ',', ' ' then
               signature.append(once "__")
               -- It is not allowed to have 2 _ in the same
               -- identifier in Eiffel, but in C.
            else
               signature.extend(c)
            end
            i := i + 1
         end
      end

   defined_agent_creation: FAST_ARRAY[STRING] is
      once
         create Result.with_capacity(32)
      end

end -- class AGENT_POOL
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
