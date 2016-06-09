-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SE
   --
   -- The `se' command. This command is a front-end to all the Liberty Eiffel tools.
   --

insert
   GLOBALS
   COMMAND_LINE_TOOLS

create {}
   make

feature {ANY}
   command_line_name: STRING "se"

feature {}
   plugins: FAST_ARRAY[STRING]
   plugin_commands: FAST_ARRAY[STRING]

   make
      local
         plugin: STRING
      do
         set_verbose
         set_launcher
         if search_for_echo_redirect_flag /= Void then
            echo.redirect_output_on_dev_null
         end
         if system_tools /= Void then
         end
         load_plugins
         if argument_count < 1 then
            system_tools.bad_use_exit(argument(0), command_line_help_summary)
         else
            plugin := argument(1)
            if plugins.has(plugin) then
               call_plugin(plugin)
            elseif plugin_commands.has(plugin) then
               call_plugin(plugins.item(plugin_commands.first_index_of(plugin)))
            elseif is_version_flag_no_exit(plugin) then
               print_all_version_numbers(plugin)
            elseif is_help_flag(plugin) then
            elseif flag_match(once "environment", plugin) then
               if argument_count = 1 then
                  show_environment(Void)
               else
                  show_environment(argument(2))
               end
            else
               system_tools.bad_use_exit(argument(0), command_line_help_summary)
            end
         end
      end

   load_plugins
      local
         t: AVL_DICTIONARY[STRING, STRING]
         i: INTEGER
      do
         create plugins.with_capacity(16)
         create plugin_commands.with_capacity(16)
         from
            create t.make
            system_tools.load_tools_in(t)
            i := t.lower
         until
            i > t.upper
         loop
            plugins.add_last(t.key(i))
            plugin_commands.add_last(t.item(i))
            i := i + 1
         end
      end

   call_plugin (plugin: STRING)
      require
         plugins.has(plugin)
      local
         i, status: INTEGER; cmd: STRING; arg: FAST_ARRAY[STRING]
      do
         i := plugins.first_index_of(plugin)
         cmd := plugin_commands.item(i)
         create arg.with_capacity(argument_count - 1)
         from
            i := 2
         until
            i > argument_count
         loop
            arg.add_last(argument(i))
            i := i + 1
         end
         status := do_plugin_call(cmd, arg)
         if status /= 0 then
            die_with_code(status)
         end
      end

   do_plugin_call (plugin: STRING; arguments: FAST_ARRAY[STRING]): INTEGER
         -- synchronous call. Waits for the plugin to terminate before going on.
      local
         i: INTEGER; cmd: STRING
      do
         cmd := once ""
         cmd.clear_count
         system_tools.append_command_path_to(cmd, plugin)
         from
            i := arguments.lower
         until
            i > arguments.upper
         loop
            cmd.extend(' ')
            cmd.append(arguments.item(i))
            i := i + 1
         end
         Result := echo.system_call(cmd)
      end

   command_line_help_summary: STRING
      local
         i, n, c: INTEGER
      once
         Result := "[
            Usage: se <command> [<args>]
                   se -environment {<c_mode>}
                   se -version
                   se -help

            se is the front-end to all Liberty Eiffel tools. It is usually followed by a
            command and the arguments of that command.

            In all tools, you can write your options either X style (single-dashed), GNU
            style (double-dashed) or Windows style (slashed). These three options are the
            same:
                              -verbose   --verbose   /verbose

            To get help on a particular command, type

               se <command> -help

            You already found out about this help:

               se -help

            To get a scriptable environment for Liberty Eiffel, type

               se -environment

            This will give you some variables that point to parts of the Liberty Eiffel
            distribution, along with all the known tools. You can also give a C mode as
            second argument; it will give details about the command lines of the given C
            mode.

            The available commands are:


         ]"
         from
            i := plugins.lower
         until
            i > plugins.upper
         loop
            c := plugins.item(i).count
            if n + c > 78 then
               Result.append(once ",%N")
               n := 0
            elseif n > 0 then
               Result.append(once ", ")
               n := n + 2
            end
            Result.append(plugins.item(i))
            n := n + c
            i := i + 1
         end
         if n > 0 then
            Result.extend('%N')
         end
         Result.append("[

            Should you have any question about Liberty Eiffel, feel free to contact us by
            e-mail:
                  liberty-eiffel@gnu.org

            You can also visit our web site:
                  http://www.liberty-eiffel.org

         ]")
      end

   print_all_version_numbers (version_arg: STRING)
      local
         arg: FAST_ARRAY[STRING]
         i, status: INTEGER
         plugin_name: STRING
         echo_verbose_status_save: BOOLEAN
         sys: SYSTEM
      do
         echo_verbose_status_save := echo.is_verbose
         echo.set_verbose
         plugin_name := command_line_name
         echo.put_string(plugin_name)
         echo.put_spaces(command_name_length - plugin_name.count + 2)
         echo.put_line(smart_eiffel.short_copyright)
         arg := {FAST_ARRAY[STRING]<<version_arg>>}
         -- We use an environment variable rather than a new argument (e.g. -short_version) so that a recent
         -- "se" degrades gracefully when used with an old plugin.
         sys.set_environment_variable("SMART_EIFFEL_SHORT_VERSION", "1")
         from
            i := plugins.lower
         until
            i > plugins.upper
         loop
            plugin_name := plugins.item(i)
            echo.put_string(plugin_name)
            echo.put_spaces(command_name_length - plugin_name.count + 2)
            echo.unset_verbose
            status := do_plugin_call(plugin_commands.item(i), arg)
            echo.set_verbose
            -- Do something if status /= 0 ?
            i := i + 1
         end
         echo.put_new_line
         echo.set_verbose_with(echo_verbose_status_save)
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
         check
            False
         end
      end

   valid_argument_for_ace_mode: STRING
      do
         check
            False
         end
      end

   set_verbose
      local
         i: INTEGER; ok: BOOLEAN
      do
         from
            i := 2
         until
            ok or else i > argument_count
         loop
            if flag_match(argument(i), fz_verbose) then
               echo.set_verbose
            end
            i := i + 1
         end
      end

   command_name_length: INTEGER
      local
         i: INTEGER
      once
         from
            i := plugins.lower
         until
            i > plugins.upper
         loop
            Result := Result.max(plugins.item(i).count)
            i := i + 1
         end
      ensure
         Result >=0
      end

feature {} -- Show env
   show_environment (a_c_mode: STRING)
      local
         i: INTEGER; tools, env, loadpath: AVL_DICTIONARY[STRING, STRING]
         c_modes: AVL_DICTIONARY[SE_C_MODE, STRING]; c_mode: SE_C_MODE
      do
         std_output.put_string(once "SE_BIN=")
         std_output.put_string(system_tools.config.bin)
         std_output.put_new_line
         std_output.put_string(once "SE_SYS=")
         std_output.put_string(system_tools.config.sys)
         std_output.put_new_line
         std_output.put_string(once "SE_SHORT=")
         std_output.put_string(system_tools.config.short)
         std_output.put_new_line

         std_output.put_line(once "# tools")
         create tools.make
         system_tools.config.tools_in(tools)
         from
            i := tools.lower
         until
            i > tools.upper
         loop
            std_output.put_string(once "SE_TOOL_")
            std_output.put_string(tools.key(i).as_upper)
            std_output.put_string(once "=${SE_BIN}")
            std_output.put_string(tools.item(i))
            std_output.put_new_line
            i := i + 1
         end

         std_output.put_line(once "# environment")
         create env.make
         system_tools.config.environment_in(env)
         from
            i := env.lower
         until
            i > env.upper
         loop
            std_output.put_string(env.key(i))
            std_output.put_character('=')
            std_output.put_string(env.item(i))
            std_output.put_new_line
            i := i + 1
         end

         std_output.put_line(once "# loadpath")
         create loadpath.make
         system_tools.config.loadpaths_in(loadpath)
         from
            i := loadpath.lower
         until
            i > loadpath.upper
         loop
            std_output.put_string(loadpath.key(i))
            std_output.put_character('=')
            std_output.put_string(loadpath.item(i))
            std_output.put_new_line
            i := i + 1
         end

         std_output.put_line(once "# C modes")
         create c_modes.make
         system_tools.config.c_modes_in(c_modes)
         std_output.put_string(once "SE_C_MODES=%"")
         from
            i := c_modes.lower
         until
            i > c_modes.upper
         loop
            if i > c_modes.lower then
               std_output.put_character(' ')
            end
            std_output.put_string(c_modes.key(i))
            i := i + 1
         end
         std_output.put_string(once "%"%N")

         if a_c_mode /= Void then
            std_output.put_string(once "# C mode: [")
            std_output.put_string(a_c_mode)
            std_output.put_string(once "]%N")
            c_mode := c_modes.reference_at(a_c_mode)
            if c_mode /= Void then
               std_output.put_string(once "SE_C_MODE=")
               std_output.put_string(a_c_mode)
               std_output.put_new_line

               if c_mode.c_compiler /= Void then
                  std_output.put_string(once "SE_C_MODE_C_COMPILER=")
                  std_output.put_string(c_mode.c_compiler)
                  std_output.put_new_line
               end
               if c_mode.c_compiler_path /= Void then
                  std_output.put_string(once "SE_C_MODE_C_COMPILER_PATH=")
                  std_output.put_string(c_mode.c_compiler_path)
                  std_output.put_new_line
               end
               if c_mode.c_linker_path /= Void then
                  std_output.put_string(once "SE_C_MODE_C_LINKER_PATH=")
                  std_output.put_string(c_mode.c_linker_path)
                  std_output.put_new_line
               end
               if c_mode.c_strip_path /= Void then
                  std_output.put_string(once "SE_C_MODE_C_STRIP_PATH=")
                  std_output.put_string(c_mode.c_strip_path)
                  std_output.put_new_line
               end
               if c_mode.c_compiler_options /= Void then
                  std_output.put_string(once "SE_C_MODE_C_COMPILER_OPTIONS=%"")
                  std_output.put_string(c_mode.c_compiler_options)
                  std_output.put_string(once "%"%N")
               end
               if c_mode.c_linker_options /= Void then
                  std_output.put_string(once "SE_C_MODE_C_LINKER_OPTIONS=")
                  std_output.put_string(c_mode.c_linker_options)
                  std_output.put_string(once "%"%N")
               end

               if c_mode.cpp_compiler /= Void then
                  std_output.put_string(once "SE_C_MODE_CPP_COMPILER=")
                  std_output.put_string(c_mode.cpp_compiler)
                  std_output.put_new_line
               end
               if c_mode.cpp_compiler_path /= Void then
                  std_output.put_string(once "SE_C_MODE_CPP_COMPILER_PATH=")
                  std_output.put_string(c_mode.cpp_compiler_path)
                  std_output.put_new_line
               end
               if c_mode.cpp_linker_path /= Void then
                  std_output.put_string(once "SE_C_MODE_CPP_LINKER_PATH=")
                  std_output.put_string(c_mode.cpp_linker_path)
                  std_output.put_new_line
               end
               if c_mode.cpp_strip_path /= Void then
                  std_output.put_string(once "SE_C_MODE_CPP_STRIP_PATH=")
                  std_output.put_string(c_mode.cpp_strip_path)
                  std_output.put_new_line
               end
               if c_mode.cpp_compiler_options /= Void then
                  std_output.put_string(once "SE_C_MODE_CPP_COMPILER_OPTIONS=%"")
                  std_output.put_string(c_mode.cpp_compiler_options)
                  std_output.put_string(once "%"%N")
               end
               if c_mode.cpp_linker_options /= Void then
                  std_output.put_string(once "SE_C_MODE_CPP_LINKER_OPTIONS=")
                  std_output.put_string(c_mode.cpp_linker_options)
                  std_output.put_string(once "%"%N")
               end

               if c_mode.smarteiffel_options /= Void then
                  std_output.put_string(once "SE_C_MODE_SMARTEIFFEL_OPTIONS=%"")
                  std_output.put_string(c_mode.smarteiffel_options)
                  std_output.put_string(once "%"%N")
               end
            end
         end
      end

invariant
   plugins.count = plugin_commands.count

end -- class SE
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
