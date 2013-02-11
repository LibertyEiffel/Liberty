-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MAKE_RELEASE_JOB_BUILD

inherit
   MAKE_RELEASE_JOB
      redefine
         generate_default_config
      end

creation {MAKE_RELEASE}
   make

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET) is
      local
         t: TIME_EVENTS
      do
         if agent_prepare = Void then
            events.expect(t.timeout(0))
         else
            agent_prepare.call([events])
         end
      end

   is_ready (events: EVENTS_SET): BOOLEAN is
      do
         if agent_is_ready = Void then
            Result := True
         else
            Result := agent_is_ready.item([events])
         end
      end

   continue is
      do
         agent_continue.call([])
         done := agent_continue = Void
      end

   done: BOOLEAN

   restart is
      do
         check
            agent_continue /= Void
         end
         done := False
      end

feature {}
   make (a_gui: like gui; a_cc: like cc) is
      require
         a_gui /= Void
         a_cc /= Void
      local
         msg: STRING
      do -- once
         init_globals

         gui := a_gui
         cc := a_cc

         msg := "Liberty Eiffel " + smart_eiffel.release_number
         gui.set_title(msg)

         lib_path := basic_directory.current_working_directory.twin
         doc_path := lib_path.twin

         agent_continue := agent generate_default_config
      ensure
         gui = a_gui
         cc = a_cc
      end

   gui: MAKE_RELEASE_GUI
   cc: STRING

   agent_prepare: PROCEDURE[TUPLE[EVENTS_SET]]
   agent_is_ready: PREDICATE[TUPLE[EVENTS_SET]]
   agent_continue: PROCEDURE[TUPLE]

feature {}
   generate_default_config is
      do
         Precursor
         system_tools.set_bin_directory(config_bin_path)
         system_tools.set_sys_directory(config_sys_path)
         system_tools.set_short_directory(config_short_path)
         agent_continue := agent bootstrap_compiler
      end

   bootstrap_compiler is
      local
         germ_path, c2c_path, x_c2c, cmd: STRING
         germ_time, c2c_time: TIME
      do -- once
         germ_path := basic_directory.current_working_directory.twin
         c2c_path := germ_path.twin

         basic_directory.compute_subdirectory_with(germ_path, "work")
         germ_path.copy(basic_directory.last_entry)
         basic_directory.compute_subdirectory_with(germ_path, "germ")
         germ_path.copy(basic_directory.last_entry)
         basic_directory.compute_file_path_with(germ_path, "compile_to_c.c")
         germ_path.copy(basic_directory.last_entry)

         x_c2c := "compile_to_c"
         system_tools.add_x_suffix(x_c2c)
         basic_directory.compute_subdirectory_with(c2c_path, "bin")
         c2c_path.copy(basic_directory.last_entry)
         basic_directory.compute_file_path_with(c2c_path, x_c2c)
         c2c_path.copy(basic_directory.last_entry)

         germ_time := file_tools.last_change_of(germ_path)
         c2c_time := file_tools.last_change_of(c2c_path)

         if germ_time < c2c_time then
            gui.info("Using the existing " + x_c2c + " as a bootstrap compiler")
            agent_continue := agent compile_tools
         else
            gui.set_action("Bootstrapping " + x_c2c + " from the work germ")
            if cc = system_tools.gcc then
               cmd := "gcc -pipe -O0 -lm -o " + c2c_path + " " + germ_path
            elseif cc = system_tools.tcc then
               cmd := "tcc -lm -o " + c2c_path + " " + germ_path
            elseif cc = system_tools.lcc_win32 then
               cmd := "lcc -o " + c2c_path + " " + germ_path
            else
               gui.fatal("Unsupported bootstrap compiler: " + cc
                         + ".%N Please use either gcc, tcc or lcc.%NOr, bootstrap the germ compiler (" + germ_path
                         + ") by hand and copy the executable as " + c2c_path + ".", 1)
            end
            next := agent compile_tools
            if not execute_command(cmd) then
               gui.fatal("Could not bootstrap.", 1)
            end
         end
      end

   mode, index: INTEGER

   compile_tools is
      local
         tool: STRING
      do
         inspect mode
         when 0 then
            basic_directory.change_current_working_directory(config_bin_path)
            mode := 1
            index := first_pass_command_list.lower
         when 1 then
            tool := first_pass_command_list.item(index)
            if split_command_list.fast_has(tool) then
               c2c_split(tool)
            else
               c2c_no_split(tool)
            end
            index := index + 1
            if index > first_pass_command_list.upper then
               mode := 2
               index := first_pass_command_list.lower
            end
         when 2 then
            tool := first_pass_command_list.item(index)
            if not call_clean(tool) then
               gui.fatal("Cleaning " + tool + " failed.", 1)
            end
            index := index + 1
            if index > first_pass_command_list.upper then
               mode := 3
               index := split_command_list.lower
            end
         when 3 then
            tool := split_command_list.item(index)
            if not first_pass_command_list.fast_has(tool) then
               compile_split(tool)
            end
            index := index + 1
            if index > split_command_list.upper then
               mode := 4
               index := no_split_command_list.lower
            end
         when 4 then
            tool := no_split_command_list.item(index)
            if not first_pass_command_list.fast_has(tool) then
               compile_split(tool)
            end
            index := index + 1
            if index > no_split_command_list.upper then
               mode := 5
            end
         when 5 then
            agent_continue := Void
         end
      end

   c2c_split (tool: STRING) is
         -- call compile_to_c (split) and then call the C compiler
      local
         args: STRING
      do
         args := compile_arguments(once "-relax", tool.same_as(once "eiffeldoc"))
         if not call_compile_to_c(args, tool) then
            gui.fatal("Could not compile " + tool + " (Eiffel compilation failed)", 1)
         end
         if not split_mode_c_compile(tool) then
            gui.fatal("Could not compile " + tool + " (C compilation failed)", 1)
         end
      end

   c2c_no_split (tool: STRING) is
         -- call compile_to_c (no_split) and then call the C compiler
      local
         args: STRING
      do
         args := compile_arguments(once "-relax -no_split", tool.same_as(once "eiffeldoc"))
         if not call_compile_to_c(args, tool) then
            gui.fatal("Could not compile " + tool + " (Eiffel compilation failed)", 1)
         end
         if not no_split_mode_c_compile(tool) then
            gui.fatal("Could not compile " + tool + " (C compilation failed)", 1)
         end
      end

   compile_split (tool: STRING) is
         -- call compile (clean, split)
      local
         args: STRING
      do
         args := compile_arguments(once "-relax -clean", tool.same_as(once "eiffeldoc"))
         if not call_compile(args, tool) then
            gui.fatal("Could not compile " + tool + ".", 1)
         end
      end

   compile_no_split (tool: STRING) is
         -- call compile (clean, no_split)
      local
         args: STRING
      do
         args := compile_arguments(once "-relax -clean -no_split", tool.same_as(once "eiffeldoc"))
         if not call_compile(args, tool) then
            gui.fatal("Could not compile " + tool + ".", 1)
         end
      end

   compile_arguments (extra_args: STRING; with_gc: BOOLEAN): STRING is
      do
         Result := once "                        "
         if with_gc or else cc = system_tools.lcc_win32 then
            Result.copy(once "-boost")
            -- Because the bad/slow Microsoft malloc is used, we get better results when the GC is on (thus
            -- the -no_gc flag is not used).
         else
            Result.copy(once "-boost -no_gc")
         end
         Result.append(once " -verbose")
         if extra_args /= Void then
            Result.extend(' ')
            Result.append(extra_args)
         end
      end

   compile_feedback (name: STRING; slice, max: INTEGER) is
      local
         msg: STRING
      do
         msg := once ""
         if max = 0 then
            msg.copy(once "Compiling ")
            msg.append(name)
            gui.set_action(msg)
         else
            if slice = max then
               msg.copy(once "Linking ")
            else
               msg.copy(once "Compiling ")
            end
            msg.append(name)
            gui.set_progress(slice, max, msg)
         end
      end

   next: like agent_continue

   execute_command (command: STRING): BOOLEAN is
      local
         p, i: INTEGER
         cmd: STRING
      do
         cmd := once ""
         from
            i := command.first_index_of('%N')
         until
            not command.valid_index(i)
         loop
            cmd.copy(command)
            cmd.shrink(p+1, i)
            if gui.run_command(cmd) /= 0 then
               gui.fatal("Command failed: " + cmd, 1)
            end
            p := i
            i := command.index_of('%N', p+1)
         end
         if p = 0 then
            if gui.run_command(command) /= 0 then
               gui.fatal("Command failed: " + command, 1)
            end
         else
            cmd.copy(command)
            cmd.shrink(p+1, command.count)
            if gui.run_command(cmd) /= 0 then
               gui.fatal("Command failed: " + cmd, 1)
            end
         end
         agent_continue := next
         Result := True
      end

invariant
   (agent_prepare = Void) = (agent_is_ready = Void)

end -- class MAKE_RELEASE_JOB_BUILD
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
