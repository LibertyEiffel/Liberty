-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SYSTEM_TOOLS
   --
   -- Singleton object to handle system dependent information.
   -- This singleton is shared via the GLOBALS.`system_tools' once function.
   --
   -- Only this object is supposed to handle contents of the `Liberty'
   -- system environment variable.
   --
   -- You may also want to customize this class in order to support a
   -- new operating system (please let us know).
   --

insert
   GLOBALS
      undefine is_equal
      end
   DIRECTORY_NOTATION_HANDLER
      undefine is_equal
      end
   SINGLETON
   ACE_HANDLER
      undefine is_equal
      end
   SYSTEM_TOOLS_CONSTANTS
      undefine is_equal
      end

create {ANY}
   make

feature { SERC_FACTORY}
   system_list: FAST_ARRAY[STRING]
      once
         Result := {FAST_ARRAY[STRING] << unix_system, windows_system, cygwin_system, dos_system, open_vms_system >> }
      end

   compiler_list: FAST_ARRAY[STRING]
      once
         Result := {FAST_ARRAY[STRING] << gcc, gpp, lcc_win32, cc, wcl386, bcc32, cl, ccc, open_vms_cc, tcc, distcc >> }
      end

   c_plus_plus_compiler_list: FAST_ARRAY[STRING]
         -- Compilers (among `compiler_list') which can handle C++
      once
         Result := {FAST_ARRAY[STRING] << gpp, cc_pp, cl, bcc32, wcl386, distcc, fz_none -- special no-C++ compiler
                                       >> }
      end

   set_system_name (name: STRING)
      require
         system_list.fast_has(name)
      do
         system_name := name
         is_win_like := Void
         is_unix_like := Void
      end

   set_system_flavor (name: STRING)
      do
         system_flavor := name
      end

   add_x_suffix (cmd: STRING)
      local
         suffix: STRING
      do
         suffix := x_suffix
         if not cmd.has_suffix(suffix) then
            cmd.append(suffix)
         end
      end

   make
      local
         rcf: SERC_FACTORY
      do
         c_compiler_mode := c_compiler_none
         set_config
         if config = Void then
            if rcf.seconf_env /= Void then
               seconf := rcf.seconf_env
            else
               seconf := fz_conf_undefined
            end
            if is_install then
               set_automatic_system_name
            else
               if seconf /= fz_conf_undefined then
                  echo.w_put_string(once "The environment variable %"")
                  echo.w_put_string(fz_seconf)
                  echo.w_put_string(once "%" is not set to the name of a valid file.%N")
               end
               echo.w_put_string(once "No default configuration file for Liberty Eiffel was found.%N%
                                      %%N%
                                      %Please re-run the installation program.%N%
                                      %For Unix-like systems, %"cd%" to the Liberty Eiffel directory and then type %N%
                                      %%"./install.sh%".%N%
                                      %For Windows-like systems, run the %"install.exe%" program.%N%
                                      %%N%
                                      %Note: if you prefer, you can set the %"")
               echo.w_put_string(fz_seconf)
               echo.w_put_string(once "%" environment variable to the %N%
                                       %absolute path of a custom configuration file. %
                                       %This works on all operating systems.%N")
               if not is_install then
                  die_with_code(exit_failure_code)
               end
            end
         end
      end

feature {C_PLUGIN, C_SPLITTER}
   system_name: STRING
   system_flavor: STRING

feature {ECHO}
   environment (var: STRING): STRING
      do
         Result := config.environment(var)
      end

feature {}
   set_automatic_system_name
         -- Sets a "not very smart" default `system_name' value
      require
         basic_directory.system_notation_detected
      do
         if system_name = Void then
            if basic_directory.system_notation_detected then
               if basic_directory.unix_notation then
                  set_system_name(unix_system)
               elseif basic_directory.cygwin_notation then
                  set_system_name(cygwin_system)
               elseif basic_directory.windows_notation then
                  set_system_name(windows_system)
               elseif basic_directory.openvms_notation then
                  set_system_name(open_vms_system)
               end
            end
         end
         if system_flavor = Void then
            set_system_flavor(once "generic")
         end
         io.put_string(once "%NThe type of your operating system was %
                            %automatically computed. Please verify.%N")
      ensure
         system_name /= Void
         system_flavor /= Void
      end

feature {BDW_GC}
   add_bdwgc_lib
      do
         add_external_lib(once "gc")
      end

feature {C_PRETTY_PRINTER}
   add_pthread_lib
      do
         add_external_lib(once "pthread")
         add_external_lib(once "rt") -- used by timespec timeouts
      end

feature {}
   add_lib_math_do_it_again
      do
         if c_compiler = gcc or else c_compiler = gpp or else c_compiler = distcc then
            add_external_lib(libm)
         elseif c_compiler = bcc32 then
            -- add_external_lib(libm)
         elseif c_compiler = cl then
         elseif c_compiler = ccc then
            add_external_lib(libcpml)
         elseif c_compiler = tcc then
            add_external_lib(libm)
         elseif c_compiler = cc or else c_compiler = cc_pp then
            add_external_lib(libm)
         elseif c_compiler = lcc_win32 then
         end
      end

feature {}
   verify_system_name
      local
         i: INTEGER
      do
         i := system_list.first_index_of(system_name)
         if i > system_list.upper then
            echo.w_put_string(once "Unknown system name in file%N%"")
            echo.w_put_string(tmp_file_read.path)
            echo.w_put_string(once "%".%NCurrently handled system names:%N")
            from
               i := system_list.lower
            until
               i > system_list.upper
            loop
               echo.w_put_string(system_list.item(i))
               echo.w_put_character('%N')
               i := i + 1
            end
            die_with_code(exit_failure_code)
         else
            set_system_name(system_list.item(i))
            echo.put_string(once "System is %"")
            echo.put_string(system_name)
            echo.put_string(once "%", flavor %"")
            echo.put_string(system_flavor)
            echo.put_string(once "%".%N")
         end
      end

feature {}
   seconf: STRING
         -- Path to the configuration file. Non Void if the new environment
         -- variable is used; in that case, the informations for accessing
         -- data are retrieved from the `ini_file'.

feature {SE}
   load_tools_in (tools: DICTIONARY[STRING, STRING])
      require
         tools.is_empty
      do
         config.tools_in(tools)
      end

feature {ANY}
   config: SE_CONFIG

feature {}
   set_config
      local
         rcf: SERC_FACTORY
         s: STRING
      once
         config := rcf.config(Current)
         if config /= Void then
            if not is_install then
               bin_directory := config.bin
               if bin_directory = Void then
                  error_handler.append(once "%"[General] bin%" key is missing.")
                  error_handler.print_as_error
               else
                  environment_variable_substitution(Void, bin_directory)
               end
               sys_directory := config.sys
               if sys_directory = Void then
                  error_handler.append(once "%"[General] sys%" key is missing.")
                  error_handler.print_as_error
               else
                  environment_variable_substitution(Void, sys_directory)
               end
               short_directory := config.short
               if short_directory = Void then
                  error_handler.append(once "%"[General] short%" key is missing.")
                  error_handler.print_as_error
               else
                  environment_variable_substitution(Void, short_directory)
               end
               s := config.os
               if s = Void then
                  error_handler.append(once "%"[General] os%" key is missing.")
                  error_handler.print_as_error
               else
                  if not system_list.has(s) then
                     error_handler.append(once "Unknown os %"")
                     error_handler.append(s)
                     error_handler.append(once "%S: config file corrupted!")
                     error_handler.print_as_fatal_error
                  end
                  s := system_list.item(system_list.first_index_of(s))
                  set_system_name(s)
               end
               set_system_flavor(config.flavor)
               if system_flavor = Void then
                  error_handler.append(once "%"[General] flavor%" key is missing.")
                  error_handler.print_as_error
               end
               if nb_errors /= 0 then
                  error_handler.append(once "The configuration file seems invalid. %
                                       %Correct the above errors first.")
                  error_handler.print_as_fatal_error
               end
               verify_system_name
            end
            include_config_loadpaths
         end
      end

feature {}
   include_config_loadpaths
      local
         loadpaths: HASHED_DICTIONARY[STRING, STRING]; i: INTEGER
      once
         create loadpaths.make
         config.loadpaths_in(loadpaths)
         from
            i := loadpaths.lower
         until
            i > loadpaths.upper
         loop
            add_config_loadpath_file(loadpaths.item(i), loadpaths.key(i))
            i := i + 1
         end
      end

feature {}
   sys_directory: STRING
         -- The SmartEiffel/sys directory computed with the value of
         -- the environment variable `SmartEiffel'.
         -- For example, under UNIX: "/usr/lib/SmartEiffel/sys/"

   bin_directory: STRING
         -- For example, under UNIX: "/usr/lib/SmartEiffel/bin/"

   short_directory: STRING
         -- For example, under UNIX: "/usr/lib/SmartEiffel/short/"

feature {SE, COMPILE}
   set_sys_directory (sysdir: STRING)
      do
         sys_directory := sysdir
      end

   set_bin_directory (bindir: STRING)
      do
         bin_directory := bindir
      end

   set_short_directory (shortdir: STRING)
      do
         short_directory := shortdir
      end

   append_command_path_to (command, command_name: STRING)
         -- Append in `command' the correct path for `command_name'.
      local
         bd: BASIC_DIRECTORY; tmp_file: STRING
      do
         if system_name = open_vms_system then
            command.append(once "mcr ")
         end
         tmp_file := once "1234567890"
         tmp_file.copy(command_name)
         tmp_file.append(x_suffix)
         bd.compute_file_path_with(bin_directory, tmp_file)
         if system_name = windows_system or else system_name = cygwin_system then
            -- those systems often have spaces in path names; quote the command name
            command.extend('"')
            command.append(bd.last_entry)
            command.extend('"')
         else
            command.append(bd.last_entry)
         end
      end

   remove_other_extra_files (name: STRING)
         -- Remove some other extra file which may be created while
         -- compiling `name' root class in split mode.
      local
         n: STRING
      do
         if c_compiler = lcc_win32 then
            n := name + lnk_suffix
            echo.file_removing(n)
         end
      end

feature {COMPILE}
   remove_make_script_and_other_extra_files
         -- Remove the *.make file script and some other extra files.
      local
         name: STRING
      do
         name := path_make
         echo.file_removing(name)
         name.remove_suffix(make_suffix)
         remove_other_extra_files(name)
      end

   connect_make_file (make_file: TEXT_FILE_READ; make_script_name: STRING)
         -- Because of a bug in cygnus on windows 95/NT.
      local
         time_out: INTEGER
      do
         make_file.connect_to(make_script_name)
         from
            time_out := 2000
         until
            time_out = 0 or else make_file.is_connected
         loop
            make_file.connect_to(make_script_name)
            time_out := time_out - 1
         end
      end

feature {SHORT_PRINTER}
   format_directory (format: STRING): STRING
      require
         format /= Void
      do
         create Result.make(short_directory.count)
         Result.copy(short_directory)
         subdirectory(Result, format)
      end

feature {ANY}
   is_c_plus_plus_file_path (path: STRING): BOOLEAN
         -- True when there `path' has one of the following
         -- suffix: ".cpp", ".cc", or ".C".
      do
         if path.has_suffix(c_plus_plus_suffix) then
            Result := True
         elseif path.has_suffix(once ".cc") then
            Result := True
         elseif path.has_suffix(once ".C") then
            Result := True
         end
      end

feature {CLUSTER, ACE}
   file_path (parent_path, file_name: STRING)
         -- Use the `system_name' knowledge to call feature `compute_file_path_with'
         -- of BASIC_DIRECTORY. The `parent_path' is modified accordingly.
      do
         set_basic_directory_notation
         basic_directory.compute_file_path_with(parent_path, file_name)
         parent_path.copy(basic_directory.last_entry)
      end

feature {COMMAND_LINE_TOOLS}
   set_plugin_factory (factory: like plugin_factory)
      do
         plugin_factory := factory
      end

feature {ANY}
   make_suffix: STRING
         -- Suffix for make file produced by `compile_to_c'.
      once
         if dos_system = system_name then
            Result := once ".BAT"
         elseif windows_system = system_name then
            Result := once ".bat"
         elseif open_vms_system = system_name then
            Result := once ".com"
         else
            Result := once ".make"
         end
      end

   x_suffix: STRING
         -- Executable files suffix.
      once
         if dos_system = system_name then
            Result := exe_suffix
            Result.to_upper
         elseif open_vms_system = system_name then
            Result := exe_suffix
            Result.to_upper
         elseif windows_system = system_name then
            Result := exe_suffix
         elseif cygwin_system = system_name then
            Result := exe_suffix
         else
            create Result.make(4)
         end
      ensure
         Result /= Void
      end

   object_suffix: STRING
         -- Of object File produced by the C Compiler.
      once
         if c_compiler = gcc or else c_compiler = gpp or else c_compiler = distcc then
            Result := o_suffix
         elseif c_compiler = lcc_win32 then
            Result := obj_suffix
         elseif c_compiler = cc or else c_compiler = cc_pp then
            Result := o_suffix
         elseif c_compiler = wcl386 then
            Result := obj_suffix
         elseif c_compiler = bcc32 then
            Result := obj_suffix
         elseif c_compiler = cl then
            Result := obj_suffix
         elseif c_compiler = ccc then
            Result := o_suffix
         elseif c_compiler = open_vms_cc then
            Result := obj_suffix
            Result.to_upper
         elseif c_compiler = tcc then
            Result := o_suffix
         end
      end

   precompiled_header_suffix: STRING
         -- Suffix for precompiled header. Void if none.
      once
         if gcc = c_compiler or else gpp = c_compiler or else distcc = c_compiler then
            -- Although distcc doesn't support precompiled headers, it's good to remove any precompiler
            -- header that could by lying around to be sure not to confuse the underlying gcc.
            Result := once ".h.gch"
         end
      end

feature {C_PRETTY_PRINTER, C_COMPILATION_MIXIN}
   add_lib_math
      once
         add_lib_math_do_it_again
      end

feature {}
   root_class_wait_for_procedure: BOOLEAN

feature {COMPILE, COMPILE_TO_C}
   extra_arg (arg: STRING; argi: INTEGER; next_arg: STRING): INTEGER
      require
         arg /= Void
         argi >= 1
      do
         check
            c_compiler /= Void
         end
         if arg.item(1) /= '-' then
            if arg.has_suffix(object_suffix) then
               append_token(external_object_files, arg)
               Result := argi + 1
            elseif arg.has_suffix(c_suffix) then
               append_token(external_c_files, arg)
               Result := argi + 1
            elseif is_c_plus_plus_file_path(arg) then
               append_token(external_c_plus_plus_files, arg)
               Result := argi + 1
            elseif arg.has_suffix(once ".a") then
               add_external_lib(arg)
               Result := argi + 1
            elseif arg.has_suffix(once ".lib") then
               add_external_lib(arg)
               Result := argi + 1
            elseif arg.has_suffix(once ".res") then
               -- For lcc-win32 resource files:
               add_external_lib(arg)
               Result := argi + 1
            elseif root_class_wait_for_procedure then
               ace.set_root_procedure_name(arg)
               root_class_wait_for_procedure := False
               Result := argi + 1
            else -- root class name
               ace.set_root_class_name_using(arg)
               root_class_wait_for_procedure := True
               Result := argi + 1
            end
         elseif arg.is_equal(once "--") or else arg.is_equal(once "-") or else arg.is_equal(once "/") then
            root_class_wait_for_procedure := False
            Result := argi + 1
         elseif arg.has_prefix(once "-l") then
            append_if_not_already(external_lib, arg)
            Result := argi + 1
         elseif arg.has_prefix(l_flag) then
            if not l_flag.is_equal(arg) then
               add_external_lib_path(arg)
               Result := argi + 1
            elseif next_arg /= Void then
               add_external_lib_path(next_arg)
               Result := argi + 2
            end
         elseif (once "-subsystem").is_equal(arg) then
            append_c_linker_option(arg)
            if next_arg /= Void then
               append_c_linker_option(next_arg)
               Result := argi + 2
            else
               Result := argi + 1
            end
         elseif (once "-include").is_equal(arg) then
            if next_arg /= Void then
               append_token(c_compiler_options, arg)
               append_token(c_compiler_options, next_arg)
               Result := argi + 2
            else
               Result := argi + 1
            end
         else
            append_token(c_compiler_options, arg)
            append_c_linker_option(arg)
            Result := argi + 1
         end
      ensure
         Result > old argi
      end

feature {C_PLUGIN}
   append_c_linker_option (arg: STRING)
      require
         arg /= Void
      do
         append_token(c_linker_options, arg)
      end

   append_c_compiler_option (arg: STRING)
      require
         arg /= Void
      do
         append_token(c_plugin_compiler_options, arg)
      end

feature {ANY}
   environment_variable_substitution (path, line: STRING)
         -- The only accepted notation is:        ${...}. The substitution is performed in `line'.
         -- When given the `path'  information is used to emit an error message when the variable does not exists.
         -- If any, substitute in `line' some "system.se" well-known key (i.e. "sys", "bin" or "short").
         -- If case of unknown key, uses echo.getenv instead.
      require
         line /= Void
      local
         i, state, mem1, mem2: INTEGER; c: CHARACTER; value, variable: STRING
      do
         variable := once "... unique once buffer ..."
         from
            i := 1
         until
            i > line.count
         loop
            c := line.item(i)
            inspect
               state
            when 0 then
               -- Initial state.
               if c = '$' then
                  state := 1
                  mem1 := i
               end
            when 1 then
               -- "$" read.
               if c = '{' then
                  state := 2
                  variable.clear_count
               else
                  state := 0
               end
            when 2 then
               -- "${" read.
               if c = '}' then
                  state := 3
                  mem2 := i
               else
                  variable.extend(c)
               end
            else -- First correct variable found.
            end
            i := i + 1
         end
         if state = 3 then
            -- One variable found:
            if variable.is_equal(fz_conf_sys) then
               value := sys_directory
            elseif variable.is_equal(fz_conf_bin) then
               value := bin_directory
            elseif variable.is_equal(fz_conf_short) then
               value := short_directory
            end
            if value = Void then
               -- Looking for a true system variable:
               value := echo.getenv(variable, path)
            end
            if value /= Void then
               variable.copy(line)
               line.keep_head(mem1 - 1)
               line.append(value)
               variable.remove_head(mem2)
               line.append(variable)
               environment_variable_substitution(path, line)
            end
         end
      end

feature {SE, ACE, COMMAND_LINE_TOOLS}
   bad_use_exit (command_name, command_line_help_summary: STRING)
         -- Print the traditional `command_line_help_summary' as well as some extra information to find more help.
      require
         command_name /= Void
      do
         echo.w_put_string("Bad use of command `")
         echo.w_put_string(command_name)
         echo.w_put_string("'.%N")
         echo.w_put_string(command_line_help_summary)
         echo.w_put_character('%N')
         echo.w_put_string("Further information for this command can be found at:%N")
         echo.w_put_string("      http://wiki.liberty-eiffel.org/index.php/")
         echo.w_put_string(command_name)
         echo.w_put_character('%N')
         die_with_code(exit_failure_code)
      end

   set_c_compiler (cc_arg: STRING)
         -- If `cc_arg' is not Void, this `cc_arg' is used as the C compiler.
         -- Otherwise, when `cc_arg' is Void, do nothing (the C compiler will
         -- be set later).
      local
         i: INTEGER
      do
         if cc_arg /= Void then
            if c_compiler_mode = c_compiler_cmode then
               error_handler.append(once "You must choose either -cc or -c_mode, but %
                                    %you cannot use them both.")
               error_handler.print_as_fatal_error
            elseif c_compiler_mode = c_compiler_cc then
               echo.w_put_string(once "-cc specified more than once; last is used.%N")
            end
            i := compiler_list.first_index_of(cc_arg)
            if i > compiler_list.upper then
               echo.w_put_string(once "compile_to_c: %"")
               echo.w_put_string(cc_arg)
               echo.w_put_string(once "%": unknown C compiler name after -cc flag or in the ACE file.%N")
               show_compiler_list_then_exit(compiler_list)
            end
            c_compiler := compiler_list.item(i)
            c_compiler_path := compiler_path_of(c_compiler)
            c_linker_path := linker_path_of(c_compiler) -- Try to also set the C++ compiler:
            i := c_plus_plus_compiler_list.first_index_of(cc_arg)
            if i <= c_plus_plus_compiler_list.upper then
               cpp_compiler := c_plus_plus_compiler_list.item(i)
               cpp_compiler_path := compiler_path_of(cpp_compiler)
               cpp_linker_path := linker_path_of(cpp_compiler)
            end
            c_compiler_mode := c_compiler_cc
         else
            -- Do nothing: the compiler will be selected later.
            check
               c_compiler_mode = c_compiler_none
            end
         end
      ensure
         c_compiler_mode = c_compiler_cc implies compiler_list.fast_has(c_compiler)
      end

feature {}
   add_libraries_from_compiler_options
         -- Extract additional libs from c_compiler_options
      local
         i, j: INTEGER; lib_name: STRING
      do
         if c_compiler = lcc_win32 or else c_compiler = cl or else c_compiler = bcc32 then
            -- detect ".lib"
            from
               i := c_compiler_options.substring_index(once ".lib", 1)
            until
               i = 0
            loop
               if i + 4 > c_compiler_options.count or else c_compiler_options.item(i + 4).is_separator then
                  from
                     j := i
                  until
                     j = 1 or else c_compiler_options.item(j - 1).is_separator
                  loop
                     j := j - 1
                  end
                  lib_name := c_compiler_options.twin
                  lib_name.shrink(j, i + 3)
                  add_external_lib(lib_name)
                  c_compiler_options.remove_between(j, i + 3)
                  i := j
               else
                  i := i + 4
               end
               i := c_compiler_options.substring_index(once ".lib", i)
            end
         else
            -- detect "-l"
            from
               i := c_compiler_options.substring_index(once "-l", 1)
            until
               i = 0
            loop
               if i = 1 or else c_compiler_options.item(i - 1).is_separator then
                  from
                     j := i
                  until
                     j = c_compiler_options.count or else c_compiler_options.item(j + 1).is_separator
                  loop
                     j := j + 1
                  end
                  lib_name := c_compiler_options.twin
                  lib_name.shrink(i, j)
                  add_external_lib(lib_name)
                  c_compiler_options.remove_between(i, j)
               else
                  i := i + 2
               end
               i := c_compiler_options.substring_index(once ".lib", i)
            end
         end
      end

feature {ACE, COMPILE_TO_C, STRING_COMMAND_LINE}
   set_no_strip
      do
         no_strip := True
      end

feature {ACE, C_PRETTY_PRINTER}
   c_compiler_options: STRING ""
         -- C compiler options including extra include path,
         -- optimization flags, etc.

   c_linker_options: STRING ""
         -- Those options are only to be passed to the linker.

feature {}
   c_plugin_compiler_options: STRING ""

feature {C_PRETTY_PRINTER}
   main_function_return_type_in (pending_c_function_signature: STRING)
      do
         if open_vms_system = system_name then
            pending_c_function_signature.append(once "void")
         else
            pending_c_function_signature.append(once "int")
         end
      end

   main_function_exit_in (pending_c_function_body: STRING)
      do
         pending_c_function_body.append(once "exit(0);%N")
         if open_vms_system = system_name then
            pending_c_function_body.append(once "return;%N")
         else
            pending_c_function_body.append(once "return 0;%N")
         end
      end

   sys_runtime (name: STRING; suffix: CHARACTER)
         -- Prepare `tmp_file_read' to access the corresponding file of the
         -- Liberty Eiffel sys/runtime directory. The complete path is
         -- always available to the caller in `tmp_path' in order to emit an
         -- error message when the corresponding file is not found. (This
         -- routine does not emit errors message itself just because this
         -- may be normal. See also `mandatory_sys_runtime'.)
      require
         name /= Void
         suffix = 'c' or suffix = 'h'
      do
         sys_runtime_(name, suffix)
         echo.tfr_connect(tmp_file_read, tmp_path)
      end

   mandatory_sys_runtime (name: STRING; suffix: CHARACTER)
         -- Same as `sys_runtime', but emit an error message when the
         -- corresponding file does not exists.
      do
         sys_runtime_(name, suffix)
         echo.tfr_connect_or_exit(tmp_file_read, tmp_path)
      ensure
         tmp_file_read.is_connected
      end

   strip_executable: STRING
      local
         executable_name: STRING
      do
         if c_strip_path /= Void and then not no_strip then
            executable_name := ace.executable_name
            Result := once "...This is a local once buffer..."
            Result.copy(c_strip_path)
            Result.extend(' ')

            if executable_name /= Void then
               Result.append(executable_name)
               add_x_suffix(Result)
            elseif unix_system = system_name then
               Result.append(once "a.out")
            elseif c_compiler = gcc or else c_compiler = gpp or else c_compiler = distcc then
               Result.extend('a')
               add_x_suffix(Result)
            else
               --|*** can we be here???
               check
                  False
               end
            end
         end
      end

   add_c_plus_plus_file (f: STRING)
      require
         is_c_plus_plus_file_path(f)
      do
         append_token(external_c_plus_plus_files, f)
      end

   is_linking_mandatory: BOOLEAN
         -- Is it mandatory to link this executable again, even when
         -- nothing has changed in the generated C code ?
      do
         Result := not external_object_files.is_empty
         if not Result then
            Result := not external_c_files.is_empty
         end
         if not Result then
            Result := not external_c_plus_plus_files.is_empty
         end
      end

   add_lib_profile
      once
         if system_name = unix_system then
            add_external_lib("rt")
         end
      end

feature {C_PRETTY_PRINTER, COMPILE}
   path_h: STRING
         -- The name of the main *.h file.
      do
         Result := path_h_memory
         if Result.is_empty then
            fill_path(Result, h_suffix)
         end
      ensure
         Result.has_suffix(h_suffix)
      end

   path_c: STRING
         -- The name of the main *.h file.
      do
         Result := path_c_memory
         if Result.is_empty then
            fill_path(Result, c_suffix)
         end
      ensure
         Result.has_suffix(c_suffix)
      end

   path_make: STRING
         -- The name of the main *.h file.
      do
         Result := path_make_memory
         if Result.is_empty then
            fill_path(Result, make_suffix)
         end
      ensure
         Result.has_suffix(make_suffix)
      end

   reset_paths
      do
         path_id := 0
      end

   next_path
      do
         path_h_memory.clear_count
         path_c_memory.clear_count
         path_make_memory.clear_count
         path_id := path_id + 1
         if path_id > 99 then
            error_handler.append("Too many root classes")
            error_handler.print_as_fatal_error
         end
      end

feature {NATIVE_PLUG_IN}
   plugin (location, name: STRING; position: POSITION): PLUGIN
      local
         n, p: STRING
         location_plugins: DICTIONARY[PLUGIN, STRING]
      do
         if plugins = Void then
            create {HASHED_DICTIONARY[DICTIONARY[PLUGIN, STRING], STRING]} plugins.make
         end
         p := once ""
         p.copy(location)
         environment_variable_substitution(Void, p)
         p := absolute_path(position, p)
         location_plugins := plugins.reference_at(p)
         if location_plugins = Void then
            create {HASHED_DICTIONARY[PLUGIN, STRING]} location_plugins.make
            plugins.add(location_plugins, p.twin)
         end
         Result := location_plugins.reference_at(name)
         if Result = Void then
            n := name.twin
            Result := plugin_factory.new(position, n, p.twin)
            location_plugins.add(Result, n)
         end
      end

feature {}
   absolute_path (a_position: POSITION; a_path: STRING): STRING
      local
         bd: BASIC_DIRECTORY
      do
         Result := once ""
         bd.ensure_system_notation
         bd.compute_parent_directory_of(a_position.path)
         Result.copy(bd.last_entry)
         bd.system_notation.to_absolute_path_in(Result, a_path)
      end

feature {C_PRETTY_PRINTER}
   auto_init_plugins
      local
         i, j: INTEGER; done: BOOLEAN; p: PLUGIN
         location_plugins: DICTIONARY[PLUGIN, STRING]
      do
         from
            done := plugins = Void
         until
            done
         loop
            from
               done := True
               i := plugins.lower
            until
               i > plugins.upper
            loop
               location_plugins := plugins.item(i)
               from
                  j := location_plugins.lower
               until
                  j > location_plugins.upper
               loop
                  p := location_plugins.item(j)
                  if not p.auto_init_done then
                     p.try_auto_init
                     done := p.auto_init_done
                  end
                  j := j + 1
               end
               i := i + 1
            end
         end
      end

feature {PLUGIN}
   libraries_module: STRING
      do
         Result := once ""
         Result.copy(once "libraries_")
         Result.append(system_name)
      end

   loaded_plugin (location, name: STRING): PLUGIN
      local
         p: STRING; location_plugins: DICTIONARY[PLUGIN, STRING]
      do
         if plugins /= Void then
            p := once ""
            p.copy(location)
            environment_variable_substitution(Void, p)
            location_plugins := plugins.reference_at(p)
            if location_plugins /= Void then
               Result := location_plugins.reference_at(name)
            end
         end
      end

feature {ANY}
   precompile_header_supported: BOOLEAN
      require
         c_compiler /= Void
      do
         Result := c_compiler = gcc or else c_compiler = gpp
      end

feature {C_PRETTY_PRINTER, C_SPLITTER}
   h_precompiler_command (h_file_name: STRING): STRING
      require
         ace.precompile_header
      do
         Result := once "...This is a local once buffer..."
         Result.clear_count
         check_c_plus_plus
         Result.append(c_compiler_path)
         append_token(Result, c_compiler_options)
         append_token(Result, c_plugin_compiler_options)
         append_token(Result, external_header_path)
         append_token(Result, h_file_name)
      end

   c_compiler_command (c_file_name: STRING): STRING
         -- Where c_file_name is the name of one slice.
      do
         Result := once "...This is a local once buffer..."
         Result.clear_count
         check_c_plus_plus
         if c_compiler = gcc or else c_compiler = gpp or else c_compiler = distcc then
            Result.append(c_compiler_path)
            append_token(Result, c_compiler_options)
            append_token(Result, c_plugin_compiler_options)
            append_token(Result, external_header_path)
            append_token(Result, c_flag)
            append_token(Result, once "-x c")
            append_token(Result, c_file_name)
         elseif c_compiler = lcc_win32 then
            Result.append(c_compiler_path)
            append_token(Result, c_compiler_options)
            append_token(Result, c_plugin_compiler_options)
            append_token(Result, external_header_path)
            append_token(Result, c_file_name)
         elseif c_compiler = cc or else c_compiler = cc_pp then
            Result.append(c_compiler_path)
            append_token(Result, c_compiler_options)
            append_token(Result, c_plugin_compiler_options)
            append_token(Result, external_header_path)
            append_token(Result, c_flag)
            append_token(Result, c_file_name)
         elseif c_compiler = wcl386 then
            Result.append(c_compiler_path)
            append_token(Result, c_compiler_options)
            append_token(Result, c_plugin_compiler_options)
            append_token(Result, external_header_path)
            append_token(Result, once "/c")
            append_token(Result, c_file_name)
         elseif c_compiler = bcc32 then
            Result.append(c_compiler_path)
            append_token(Result, c_compiler_options)
            append_token(Result, c_plugin_compiler_options)
            append_token(Result, external_header_path)
            append_token(Result, c_flag)
            append_token(Result, c_file_name)
         elseif c_compiler = cl then
            Result.append(c_compiler_path)
            append_token(Result, c_compiler_options)
            append_token(Result, c_plugin_compiler_options)
            append_token(Result, external_header_path)
            append_token(Result, c_flag)
            append_token(Result, c_file_name)
         elseif c_compiler = ccc then
            Result.append(c_compiler_path)
            append_token(Result, c_compiler_options)
            append_token(Result, c_plugin_compiler_options)
            append_token(Result, external_header_path)
            append_token(Result, c_flag)
            append_token(Result, c_file_name)
         elseif c_compiler = open_vms_cc then
            -- BdB: external_header_path to be added here somehow
            Result.append(once "cc/warning=disable=(embedcomment,longextern) ")
            Result.append(c_file_name)
            Result.append(c_compiler_path)
            Result.remove_tail(2)
         elseif c_compiler = tcc then
            Result.append(c_compiler_path)
            append_token(Result, c_compiler_options)
            append_token(Result, c_plugin_compiler_options)
            append_token(Result, external_header_path)
            append_token(Result, c_flag)
            append_token(Result, o_flag)
            append_token(Result, c_file_name)
            Result.remove_tail(2)
            --|*** BAD STYLE
            Result.append(object_suffix)
            append_token(Result, c_file_name)
         end
      end

   linker_command (c_name: STRING; objects: FAST_ARRAY[STRING]): STRING
         -- Where `c_name' is only the prefix name (i.e. "compile_to_c")
         -- and `objects' is the list ob the objects to link
      require
         not objects.is_empty
      local
         script, lst: TEXT_FILE_WRITE; i: INTEGER; name: STRING
      do
         Result := once "...This is a local once buffer..."
         Result.clear_count
         check_c_plus_plus
         if c_compiler = gcc or else c_compiler = gpp or else c_compiler = distcc then
            Result.append(c_linker_path)
            append_token(Result, c_linker_options)
            add_executable_name(Result)
            append_tokens(Result, objects)
            if not external_c_files.is_empty then
               append_token(Result, once "-x c")
               append_token(Result, external_c_files)
            end
            if not external_c_plus_plus_files.is_empty then
               append_token(Result, once "-x %"c++%" -lstdc++")
               append_token(Result, external_c_plus_plus_files)
            end
            append_token(Result, once "-x none")
            append_token(Result, external_header_path)
            append_token(Result, external_lib_path)
            append_token(Result, external_object_files)
            append_token(Result, external_lib)
         elseif c_compiler = lcc_win32 then
            external_c_files_for_lcc_win32(Result)
            Result.append(c_linker_path)
            if not no_strip then
               append_token(Result, s_flag)
            end
            append_token(Result, c_linker_options)
            add_executable_name(Result)
            if objects.count < 4 then
               -- Object files are passed in the command line:
               append_tokens(Result, objects)
            else
               -- Object files are listed in a *.lnk file:
               name := c_name
               name.append(lnk_suffix)
               append_token(Result, "@" + name)
               create lst.make
               echo.tfw_connect(lst, name)
               from
                  name.remove_tail(4)
                  i := objects.lower
               until
                  i > objects.upper
               loop
                  lst.put_line(objects.item(i))
                  i := i + 1
               end
               lst.disconnect
            end
            append_token(Result, external_object_files)
            append_token(Result, external_lib)
         elseif c_compiler = cc or else c_compiler = cc_pp then
            Result.append(c_linker_path)
            append_token(Result, external_header_path)
            append_token(Result, c_linker_options)
            append_token(Result, external_lib_path)
            add_executable_name(Result)
            append_tokens(Result, objects)
            append_token(Result, external_c_files)
            append_token(Result, external_c_plus_plus_files)
            append_token(Result, external_object_files)
            append_token(Result, external_lib)
         elseif c_compiler = wcl386 then
            Result.append(c_linker_path)
            append_token(Result, external_header_path)
            append_token(Result, c_linker_options)
            append_token(Result, external_lib_path)
            add_executable_name(Result)
            append_tokens(Result, objects)
            append_token(Result, external_c_files)
            append_token(Result, external_c_plus_plus_files)
            append_token(Result, external_object_files)
            append_token(Result, external_lib)
         elseif c_compiler = bcc32 then
            Result.append(c_linker_path)
            append_token(Result, external_header_path)
            append_token(Result, c_linker_options)
            append_token(Result, external_lib_path)
            add_executable_name(Result)
            append_tokens(Result, objects)
            append_token(Result, external_c_files)
            append_token(Result, external_c_plus_plus_files)
            append_token(Result, external_object_files)
            append_token(Result, external_lib)
            add_lib_math
         elseif c_compiler = cl then
            Result.append(c_linker_path)
            append_token(Result, external_header_path)
            add_executable_name(Result)
            append_tokens(Result, objects)
            append_token(Result, external_c_files)
            append_token(Result, external_c_plus_plus_files)
            append_token(Result, external_object_files)
            append_token(Result, once " /link")
            append_token(Result, c_linker_options)
            append_token(Result, external_lib_path)
            append_token(Result, external_lib)
            add_lib_math
         elseif c_compiler = ccc then
            Result.append(c_linker_path)
            append_token(Result, external_header_path)
            append_token(Result, c_linker_options)
            append_token(Result, external_lib_path)
            add_executable_name(Result)
            append_tokens(Result, objects)
            append_token(Result, external_c_files)
            append_token(Result, external_c_plus_plus_files)
            append_token(Result, external_object_files)
            append_token(Result, external_lib)
         elseif c_compiler = open_vms_cc then
            --|*** CAD: DON'T UNDERSTAND!! SHOULD USE c_linker_path
            create script.make
            echo.tfw_connect(script, once "linkit.com")
            script.put_string(once "$ link/exe=")
            Result.clear_count
            add_executable_name(Result)
            script.put_string(Result)
            script.put_character(' ')
            from
               i := objects.lower
            until
               i >= objects.upper
            loop
               script.put_string(objects.item(i))
               script.put_string(once ",-%N")
               i := i + 1
            end
            script.put_string(objects.item(i))
            script.put_character('%N')
            script.disconnect
            Result.copy(once "@linkit.com%Ndelete linkit.com;")
         elseif c_compiler = tcc then
            Result.append(c_linker_path)
            append_token(Result, external_header_path)
            append_token(Result, c_linker_options)
            append_token(Result, external_lib_path)
            add_executable_name(Result)
            append_token(Result, external_lib)
            append_tokens(Result, objects)
            append_token(Result, external_c_files)
            append_token(Result, external_object_files)
         end
      end



feature {ACE}
   read_loadpath_files
         -- For command line mode only (no ACE file used). Reads the loadpath files given on the command line,
         -- then either the loadpath.se in the current directory or the current directory itself as a cluster,
         -- and finally the configuration loadpaths.
      require
         ace.file_path = Void
      local
         i: INTEGER; buffer, loadpath: STRING
         ft: FILE_TOOLS
         cluster_directory: DIRECTORY
      do
         echo.put_string(once "Reading loadpath files%N")
         buffer := once ".................................."
         buffer.clear_count
         -- read the loadpaths, if any, given on the command line
         if extra_loadpath_files /= Void then
            from
               i := extra_loadpath_files.lower
            until
               i > extra_loadpath_files.upper
            loop
               buffer.copy(extra_loadpath_files.item(i))
               environment_variable_substitution(Void, buffer)
               loadpath := string_aliaser.string(buffer)
               if ft.is_file(buffer) then
                  basic_directory.compute_parent_directory_of(buffer)
                  buffer.copy(basic_directory.last_entry)
               end
               create cluster_directory.scan(buffer)
               if cluster_directory.exists then
                  ace.add_loadpath(loadpath, loadpath, 1, False)
               end
               i := i + 1
            end
         end
         -- read the configuration loadpaths
         if config_loadpath_files /= Void then
            from
               i := config_loadpath_files.lower
            until
               i > config_loadpath_files.upper
            loop
               buffer.copy(config_loadpath_files.item(i))
               environment_variable_substitution(Void, buffer)
               loadpath := string_aliaser.string(buffer)
               if ft.is_file(buffer) then
                  basic_directory.compute_parent_directory_of(buffer)
                  buffer.copy(basic_directory.last_entry)
               end
               create cluster_directory.scan(buffer)
               if cluster_directory.exists then
                  ace.add_loadpath(config_loadpath_names.item(i), loadpath, 2, False)
               end
               i := i + 1
            end
         end
         -- add the current directory, if it is not already one of the existing directories
         basic_directory.connect_to_current_working_directory
         if basic_directory.is_connected then
            buffer.copy(basic_directory.last_entry)
            basic_directory.disconnect
            basic_directory.compute_file_path_with(buffer, once "loadpath.se")
            loadpath := once ""
            loadpath.copy(basic_directory.last_entry)
            if not loadpath.is_empty and then ft.is_readable(loadpath) then
               ace.add_loadpath(once "Local Loadpath", string_aliaser.string(loadpath), 1, True)
            else
               ace.add_loadpath(once "Local Cluster", string_aliaser.string(buffer), 1, True)
            end
         end
      end

   system_name_in (msg: STRING)
         -- Append in `msg' the current `system_name'.
      do
         if system_name /= Void then
            msg.append(once "The selected system name is %"")
            msg.append(system_name)
            msg.append(once "%".%N")
         else
            msg.append(once "No information available about the system used %
                       %(check your%NLiberty Eiffel installation).%N")
         end
      end

   set_external_header_path (a_paths: STRING)
         -- Set `external_header_path' to `a_paths', but format it according to rules
         -- for current C compiler.
      local
         paths: ARRAY[STRING]; i: INTEGER
      do
         paths := a_paths.split
         from
            i := paths.lower
         until
            i > paths.upper
         loop
            add_external_header_path(paths.item(i))
            i := i + 1
         end
      end

   set_external_lib_path (a_paths: STRING)
         -- Set `external_lib_path' to `a_paths', but format it according to rules for
         -- current C compiler and linker.
      local
         lib_paths: ARRAY[STRING]; i: INTEGER
      do
         lib_paths := a_paths.split
         from
            i := lib_paths.lower
         until
            i > lib_paths.upper
         loop
            add_external_lib_path(lib_paths.item(i))
            i := i + 1
         end
      end

   set_external_lib (a_libs: STRING)
         -- Set `external_lib' to `a_libs', but format it according to rules for
         -- current C compiler and linker.
      local
         lib_files: ARRAY[STRING]; i: INTEGER
      do
         lib_files := a_libs.split
         from
            i := lib_files.lower
         until
            i > lib_files.upper
         loop
            add_external_lib(lib_files.item(i))
            i := i + 1
         end
      end

   external_object_files: STRING ""
         -- External object files.

   external_c_files: STRING ""
         -- External C files.

   external_c_plus_plus_files: STRING ""
         -- External C++ files.

   no_strip: BOOLEAN

feature {ECHO}
   parent_directory (some_path: STRING)
         -- Use the `system_name' knowledge to call feature `compute_parent_directory_of'
         -- of BASIC_DIRECTORY. The `some_path' is modified accordingly.
      require
         some_path.count > 0
      do
         set_basic_directory_notation
         basic_directory.compute_parent_directory_of(some_path)
         some_path.copy(basic_directory.last_entry)
      end

feature {}
   is_absolute (path: STRING): BOOLEAN
         -- Always False on non-winlike and non-unixlike systems
      require
         set_likes_called: is_win_like /= Void
      local
         c: CHARACTER; s: STRING
      do
         if path.is_empty then
         else
            s := system_name
            if is_win_like.item then
               c := path.first.to_lower
               if path.item(2) = ':' and then c >= 'a' and then c <= 'z' then
                  c := path.item(3)
                  Result := c = '\' or else c = '/'
               else
                  c := path.first
                  Result := c = '\' or else c = '/'
                  if Result then
                     c := path.item(2)
                     Result := c = '\' or else c = '/'
                  end
               end
            elseif is_unix_like.item then
               Result := path.first = '/'
            end
         end
      end

   is_relative (path: STRING): BOOLEAN
         -- Always True on non-winlike and non-unixlike systems
      require
         set_likes_called: is_win_like /= Void
      do
         Result := not is_absolute(path)
      end

   is_win_like: REFERENCE[BOOLEAN]

   is_unix_like: REFERENCE[BOOLEAN]

   set_likes
         -- Just speed up repeated tests on system by setting `is_win_like'and `is_unix_like'
      local
         s: STRING
      do
         if is_win_like = Void then
            s := system_name
            create is_win_like.set_item(s = windows_system or else
                                        s = dos_system )

            create is_unix_like.set_item(s = unix_system or else
                                         s = cygwin_system)
         end
      end

feature {}
   basic_directory: BASIC_DIRECTORY

   set_basic_directory_notation
      local
         s: STRING; notation: DIRECTORY_NOTATION
      once
         s := system_name
         if s = Void then
         elseif s = unix_system then
            create {UNIX_DIRECTORY_NOTATION} notation
         elseif s = windows_system or else s = dos_system then
            create {WINDOWS_DIRECTORY_NOTATION} notation
         elseif s = open_vms_system then
            create {OPENVMS_DIRECTORY_NOTATION} notation
         elseif s = cygwin_system then
            create {CYGWIN_DIRECTORY_NOTATION} notation
         else
            check
               False
            end
         end
         if s /= Void then
            basic_directory.system_notation_buffer.set_item(notation)
         end
      end

   subdirectory (parent_path, entry_name: STRING)
         -- Use the `system_name' knowledge to call feature `compute_subdirectory_with'
         -- of BASIC_DIRECTORY. The `parent_path' is modified accordingly.
      require
         not parent_path.is_empty
         not entry_name.is_empty
      do
         set_basic_directory_notation
         basic_directory.compute_subdirectory_with(parent_path, entry_name)
         parent_path.copy(basic_directory.last_entry)
      end

   append_token (line, token: STRING)
      do
         if not token.is_empty then
            if token.first /= ' ' then
               if not line.is_empty then
                  line.extend_unless(' ')
               end
            end
            line.append(token)
         end
      end

   append_tokens (line: STRING; tokens: FAST_ARRAY[STRING])
      local
         i: INTEGER
      do
         from
            i := tokens.lower
         until
            i > tokens.upper
         loop
            append_token(line, tokens.item(i))
            i := i + 1
         end
      end

   external_c_files_for_lcc_win32 (cmd: STRING)
         -- Because lcc_win32 does not accept *.c file while linking as
         -- other C compiler do :-(
      local
         c_files: ARRAY[STRING]; c_file: STRING; i: INTEGER
      do
         if not external_c_files.is_empty then
            c_files := external_c_files.split
            external_c_files.clear_count
            if c_files /= Void then
               from
                  i := c_files.lower
               until
                  i > c_files.upper
               loop
                  c_file := c_files.item(i)
                  cmd.append(lcc)
                  append_token(cmd, c_compiler_options)
                  append_token(cmd, c_file)
                  cmd.extend('%N')
                  c_file.remove_suffix(c_suffix)
                  c_file.append(object_suffix)
                  append_token(external_object_files, c_file)
                  i := i + 1
               end
            end
         end
      end

feature {ID_PROVIDER}
   id_file_path: STRING
      once
         Result := path_id_memory
         Result.copy(path_h)
         Result.remove_suffix(h_suffix)
         Result.append(once ".id")
      end

feature {}
   check_c_plus_plus
         -- Check if we must use the C++ compiler; in that case, we switch to
         -- it if it is available
      once
         if not external_c_plus_plus_files.is_empty then
            -- There are C++ files; so we must switch
            if cpp_compiler /= Void then
               echo.put_string(once "Selecting C++ compiler: ")
               echo.put_string(cpp_compiler)
               c_compiler := cpp_compiler
               c_compiler_path := cpp_compiler_path
               c_linker_path := cpp_linker_path
               c_strip_path := cpp_strip_path
               if ace_compiler_options /= Void then
                  c_compiler_options.copy(ace_compiler_options)
               elseif not cpp_mode_compiler_options.is_empty then
                  c_compiler_options.copy(cpp_mode_compiler_options)
               end
               if ace_linker_options /= Void then
                  c_linker_options.copy(ace_linker_options)
               elseif not cpp_mode_linker_options.is_empty then
                  c_linker_options.copy(cpp_mode_linker_options)
               end
               echo.put_string(once ".%N")
            else
               error_handler.append(c_compiler)
               error_handler.append(once " is not supported as a C++ compiler. %
                                         %I will continue, but expect some problems.%N")
               error_handler.print_as_warning
            end
         end
      end

feature {}
   add_config_loadpath_file (loadpath_file, loadpath_name: STRING)
         -- This file will also be read by `read_loadpath_files', with the cluster name prefix
         -- `loadpath_name'.
      do
         if config_loadpath_files = Void then
            create config_loadpath_files.with_capacity(4)
            create config_loadpath_names.with_capacity(4)
         end
         config_loadpath_files.add_last(loadpath_file)
         config_loadpath_names.add_last(loadpath_name)
      end

feature {COMMAND_LINE_TOOLS}
   add_loadpath_file (loadpath_file: STRING)
         -- This file will also be read by `read_loadpath_files'
      do
         if extra_loadpath_files = Void then
            create extra_loadpath_files.with_capacity(2)
         end
         extra_loadpath_files.add_last(loadpath_file)
      end

   add_smarteiffel_c_mode_options
         -- Adds the Liberty Eiffel options for the chosen C mode; then add the
         -- libraries for the C compiler
      local
         string_command_line: STRING_COMMAND_LINE
      do
         if smarteiffel_options /= Void then
            string_command_line.parse(smarteiffel_options)
         end
         if ace_compiler_options /= Void then
            c_compiler_options.copy(ace_compiler_options)
         elseif not c_mode_compiler_options.is_empty then
            c_compiler_options.copy(c_mode_compiler_options)
         end
         if ace_linker_options /= Void then
            c_linker_options.copy(ace_linker_options)
         elseif not c_mode_linker_options.is_empty then
            c_linker_options.copy(c_mode_linker_options)
         end
         add_libraries_from_compiler_options
      end

feature {ACE, COMMAND_LINE_TOOLS}
   is_alternate_c_mode: BOOLEAN
         -- If False, then the C mode associated with the Liberty Eiffel level
         -- will be selected; otherwise, the user has explicitly used the
         -- -c_mode option; this one will be used.

   set_default_c_mode (c_mode: STRING)
         -- Sets the C mode to use. If an alternate C mode has been set, this
         -- feature does nothing.
      do
         if c_compiler_mode /= c_compiler_cc and then not is_alternate_c_mode then
            set_c_mode(c_mode)
         end
      end

   set_alternate_c_mode (c_mode: STRING)
         -- Sets an alternate C mode (the user explicitly used the -c_mode
         -- flag)
      do
         if c_compiler_mode = c_compiler_cc then
            error_handler.append(once "You must choose either -cc or -c_mode, but %
                                 %you cannot use them both.")
            error_handler.print_as_fatal_error
         end
         c_compiler_mode := c_compiler_cmode
         is_alternate_c_mode := True
         set_c_mode(c_mode)
      end

feature {C_PLUGIN}
   c_compiler: STRING
         -- One item of `compiler_list' or `c_plus_plus_compiler_list'

feature {}
   c_compiler_mode: INTEGER

   c_compiler_none: INTEGER unique
         -- Value of `c_compiler_none' indicating that neither -cc nor -c_mode
         -- were used (yet).

   c_compiler_cc: INTEGER unique
         -- Value of `c_compiler_mode' indicating that `set_c_compiler' was
         -- used with a non-Void value

   c_compiler_cmode: INTEGER unique
         -- Value of `c_compiler_mode' indicating that `set_alternate_c_mode'
         -- was used.

   compiler_path_of (compiler: STRING): STRING
      do
         if compiler = gcc then
            Result := gcc
         elseif compiler = gpp then
            Result := gpp
         elseif compiler = distcc then
            Result := distcc
         elseif compiler = lcc_win32 then
            Result := lcc
         elseif compiler = cc then
            Result := cc
         elseif compiler = cc_pp then
            Result := cc_pp
         elseif compiler = wcl386 then
            Result := once "wcc386"
         elseif compiler = bcc32 then
            Result := bcc32
         elseif compiler = cl then
            Result := cl
         elseif compiler = ccc then
            Result := ccc
         elseif compiler = open_vms_cc then
            Result := open_vms_cc
         elseif compiler = tcc then
            Result := tcc
         end
      end

   strip_path_or_default (explicit_strip_path: STRING): STRING
      do
         if explicit_strip_path /= Void then
            Result := explicit_strip_path
         elseif unix_system = system_name then
            Result := once "strip"
         elseif c_compiler = gcc or else c_compiler = gpp or else c_compiler = distcc then
            Result := once "strip"
         end
      ensure
         explicit_strip_path /= Void implies Result = explicit_strip_path
      end

   linker_path_of (compiler: STRING): STRING
      do
         if compiler = gcc then
            Result := gcc
         elseif compiler = gpp then
            Result := gpp
         elseif compiler = distcc then
            Result := distcc
         elseif compiler = lcc_win32 then
            Result := lcclnk
         elseif compiler = cc then
            Result := cc
         elseif compiler = cc_pp then
            Result := cc_pp
         elseif compiler = wcl386 then
            Result := once "wlink"
         elseif compiler = bcc32 then
            Result := bcc32
         elseif compiler = cl then
            Result := cl
         elseif compiler = ccc then
            Result := ccc
         elseif compiler = open_vms_cc then
            Result := open_vms_cc
         elseif compiler = tcc then
            Result := tcc
         end
      end

   set_c_mode (c_mode: STRING)
      local
         i: INTEGER; cmode: SE_C_MODE
      do
         if not c_mode_memory.is_equal(c_mode) then
            c_mode_memory.copy(c_mode)
            echo.put_string(once "C mode %"")
            echo.put_string(c_mode)
            if is_alternate_c_mode then
               echo.put_string(once "%" (alternate mode) selected.%N")
            else
               echo.put_string(once "%" (default mode) selected.%N")
            end
            -- Now gather info from the config file and populate the variables
            cmode := config.c_mode(c_mode)
            if cmode = Void then
               echo.w_put_string("Unknown C mode: ")
               echo.w_put_string(c_mode)
               echo.w_put_string(".%N")
               die_with_code(exit_failure_code)
            end

            c_compiler := cmode.c_compiler
            if c_compiler /= Void then
               i := compiler_list.first_index_of(c_compiler)
               if i > compiler_list.upper then
                  echo.w_put_string("Unknown compiler type %"")
                  echo.w_put_string(c_compiler)
                  echo.w_put_string("%"%N")
                  show_compiler_list_then_exit(compiler_list)
               end
               c_compiler := compiler_list.item(i)
            else
               error_handler.append(once "Unable to find the compiler type of %"")
               error_handler.append(c_mode)
               error_handler.append(once "%". Please fix your configuration file or %
                                    %choose another C mode.")
               error_handler.print_as_fatal_error
            end
            c_compiler_path := cmode.c_compiler_path
            if c_compiler_path = Void then
               c_compiler_path := compiler_path_of(c_compiler)
            end
            c_linker_path := cmode.c_linker_path
            if c_linker_path /= Void then
               c_mode_has_explicit_linker_path_or_option := True
            else
               c_linker_path := linker_path_of(c_compiler)
            end
            c_strip_path := strip_path_or_default(cmode.c_strip_path)
            if cmode.c_compiler_options /= Void then
               c_mode_compiler_options.copy(cmode.c_compiler_options)
            else
               c_mode_compiler_options.clear_count
            end
            if cmode.c_linker_options /= Void then
               c_mode_linker_options.copy(cmode.c_linker_options)
               c_mode_has_explicit_linker_path_or_option := True
            elseif c_compiler_path.same_as(c_linker_path) then
               c_mode_linker_options.copy(c_mode_compiler_options)
            end
            if cmode.cpp_compiler /= Void then
               cpp_compiler := cmode.cpp_compiler
               i := c_plus_plus_compiler_list.first_index_of(cpp_compiler)
               if i > c_plus_plus_compiler_list.upper then
                  echo.w_put_string("Unknown C++ compiler type %"")
                  echo.w_put_string(cpp_compiler)
                  echo.w_put_string("%"%N")
                  show_compiler_list_then_exit(c_plus_plus_compiler_list)
               end
               cpp_compiler := c_plus_plus_compiler_list.item(i)
               cpp_compiler_path := cmode.cpp_compiler_path
               if cpp_compiler_path = Void then
                  cpp_compiler_path := compiler_path_of(cpp_compiler)
               end
               cpp_linker_path := cmode.cpp_linker_path
               if cpp_linker_path /= Void then
                  c_mode_has_explicit_linker_path_or_option := True
               else
                  cpp_linker_path := linker_path_of(cpp_compiler)
               end
               cpp_strip_path := strip_path_or_default(cmode.cpp_strip_path)
               if cmode.cpp_compiler_options /= Void then
                  cpp_mode_compiler_options.copy(cmode.cpp_compiler_options)
               elseif cpp_compiler /= Void then
                  cpp_mode_compiler_options.copy(c_mode_compiler_options)
               end
               if cmode.cpp_linker_options /= Void then
                  cpp_mode_linker_options.copy(cmode.cpp_linker_options)
                  c_mode_has_explicit_linker_path_or_option := True
               else
                  cpp_mode_linker_options.copy(cpp_mode_compiler_options)
               end
            end
            if cmode.smarteiffel_options /= Void then
               if smarteiffel_options = Void then
                  create smarteiffel_options.copy(cmode.smarteiffel_options)
               else
                  smarteiffel_options.copy(cmode.smarteiffel_options)
               end
            end
         end
      ensure
         compiler_list.fast_has(c_compiler)
      end

   c_compiler_path: STRING
         -- The path to the real C compiler

   c_linker_path: STRING
         -- The path to the real C linker

   c_strip_path: STRING
         -- The path to the real C strip

   c_mode_compiler_options: STRING ""
         -- The compiler options set by the C mode

   c_mode_linker_options: STRING ""
         -- The linker options set by the C mode

   cpp_compiler: STRING
         -- One item of `c_plus_plus_compiler_list'.

   cpp_compiler_path: STRING
         -- The path to the real C++ compiler

   cpp_linker_path: STRING
         -- The path to the real C++ linker

   cpp_strip_path: STRING
         -- The path to the real C++ strip

   cpp_mode_compiler_options: STRING ""
         -- The C++ compiler options set by the C mode

   cpp_mode_linker_options: STRING ""
         -- The C++ linker options set by the C mode

   ace_compiler_options: STRING
         -- The options ACE can set

   ace_linker_options: STRING
         -- The options ACE can set

   smarteiffel_options: STRING
         -- The Liberty Eiffel options set by the chosen C mode

   c_mode_has_explicit_linker_path_or_option: BOOLEAN
         -- True if either c_linker_path or c_linker_options are set for the
         -- chosen C mode. Useful to emit warnings (e.g. when using no_split)

feature {ACE}
   set_ace_compiler_options (options: STRING)
      do
         ace_compiler_options := options
      end

   set_ace_linker_options (options: STRING)
      do
         ace_linker_options := options
      end

   set_ace_external_lib_path (extlibpath: STRING)
      do
         add_external_lib_path(extlibpath)
      end

   set_ace_external_lib (extlib: STRING)
      do
         add_external_lib(extlib)
      end

   external_libs: FAST_ARRAY[STRING]
         -- The external libs before being added to the `external_lib' (before
         -- the compiler is known, no such addition can take place)
      once
         create Result.with_capacity(2)
      end

   external_lib_paths: FAST_ARRAY[STRING]
         -- The external lib paths before being added to the
         -- `external_lib_path' (before the compiler is known, no such
         -- addition can take place)
      once
         create Result.with_capacity(2)
      end

   get_started
      local
         i: INTEGER
      do
         check
            c_compiler /= Void
         end
         from
            i := external_libs.lower
         until
            i > external_libs.upper
         loop
            add_external_lib(external_libs.item(i))
            i := i + 1
         end
         external_libs.clear_count
         from
            i := external_lib_paths.lower
         until
            i > external_lib_paths.upper
         loop
            add_external_lib(external_lib_paths.item(i))
            i := i + 1
         end
         external_lib_paths.clear_count
      end

feature {}
   external_header_path: STRING ""
         -- Additional paths where .h files can be found.

   external_lib_path: STRING ""
         -- External libraries path to be added at link time.

   external_lib: STRING ""
         -- External libraries to be added at link time.

   sys_runtime_ (name: STRING; suffix: CHARACTER)
         -- Common part to implement `sys_runtime' and `mandatory_sys_runtime'.
      require
         name /= Void
         suffix = 'c' or suffix = 'h'
      local
         bd: BASIC_DIRECTORY; tmp_file: STRING
      do
         tmp_path.copy(sys_directory)
         subdirectory(tmp_path, fz_runtime)
         subdirectory(tmp_path, once "c")
         tmp_file := once "1234567890"
         tmp_file.copy(name)
         tmp_file.extend('.')
         tmp_file.extend(suffix)
         bd.system_notation.to_file_path_with(tmp_path, tmp_file)
      end

   show_compiler_list_then_exit (list: like compiler_list)
      local
         i: INTEGER
      do
         echo.w_put_string(once "Currently handled compiler names:%N")
         from
            i := list.lower
         until
            i > list.upper
         loop
            echo.w_put_string(list.item(i))
            echo.w_put_character('%N')
            i := i + 1
         end
         die_with_code(exit_failure_code)
      end

   add_executable_name (cmd: STRING)
      local
         executable_name: STRING
      do
         executable_name := once ""
         if ace.executable_name = Void then
            executable_name.copy(ace.root_class_name.to_string.twin)
            executable_name.to_lower
            if c_compiler = lcc_win32 then
               append_token(cmd, o_flag)
               append_token(cmd, executable_name)
               add_x_suffix(cmd)
            elseif c_compiler = bcc32 then
               append_token(cmd, e_flag)
               cmd.append(executable_name)
               add_x_suffix(cmd)
            elseif c_compiler = wcl386 then
               append_token(cmd, once "/fe=")
               cmd.append(executable_name)
               add_x_suffix(cmd)
            elseif c_compiler = open_vms_cc then
               append_token(cmd, executable_name)
            elseif c_compiler = tcc then
               if system_name = unix_system then
                  append_token(cmd, o_flag)
                  append_token(cmd, once "a.out")
               else
                  append_token(cmd, o_flag)
                  append_token(cmd, executable_name)
                  add_x_suffix(cmd)
               end
            elseif c_compiler = cl then
               append_token(cmd, once "/Fe")
               cmd.append(executable_name)
               add_x_suffix(cmd)
            end
         else
            executable_name.copy(ace.executable_name)
            if c_compiler = gcc or else c_compiler = gpp or else c_compiler = distcc then
               append_token(cmd, o_flag)
               append_token(cmd, executable_name)
               add_x_suffix(cmd)
            elseif c_compiler = lcc_win32 then
               append_token(cmd, o_flag)
               append_token(cmd, executable_name)
               add_x_suffix(cmd)
            elseif c_compiler = cc or else c_compiler = cc_pp then
               append_token(cmd, o_flag)
               append_token(cmd, executable_name)
               add_x_suffix(cmd)
            elseif c_compiler = wcl386 then
               append_token(cmd, once "/fe=")
               cmd.append(executable_name)
               add_x_suffix(cmd)
            elseif c_compiler = bcc32 then
               append_token(cmd, e_flag)
               cmd.append(executable_name)
               add_x_suffix(cmd)
            elseif c_compiler = cl then
               append_token(cmd, once "/Fe")
               cmd.append(executable_name)
               add_x_suffix(cmd)
            elseif c_compiler = ccc then
               append_token(cmd, o_flag)
               append_token(cmd, executable_name)
               add_x_suffix(cmd)
            elseif c_compiler = open_vms_cc then
               cmd.append(executable_name)
            elseif c_compiler = tcc then
               append_token(cmd, o_flag)
               append_token(cmd, executable_name)
               add_x_suffix(cmd)
            end
         end
      end

feature {PLUGIN}
   add_external_header_path (path: STRING)
         -- Append `path' to `external_header_path' taking into account
         -- how the current linker likes it to get this path.
         -- If `path' appears to be already formatted, no formatting
         -- added by this routine.
      require
         not path.is_empty
      do
         token_buffer.clear_count
         -- everybody likes the Unix way
         if path.item(1) /= '-' then
            token_buffer.copy(once "-I")
         end
         token_buffer.append_string(path)
         append_if_not_already(external_header_path, token_buffer)
      end

   add_external_lib (lib: STRING)
         -- Append `lib' to `external_lib' taking into account
         -- how the current linker likes it to get an additional library.
         -- If `lib' appears to be already formatted, no formatting
         -- added by this routine.
      require
         not lib.is_empty
      do
         token_buffer.clear_count
         check
            compiler_list.fast_has(c_compiler) or else c_plus_plus_compiler_list.fast_has(c_compiler)
         end
         if c_compiler = lcc_win32 or else c_compiler = cl or else c_compiler = bcc32 then
            -- they don't need an option
         else
            -- the Unix way
            if lib.item(1) /= '-' then
               if not lib.has('/') and then not lib.has('\') then
                  token_buffer.copy(once "-l")
               end
            end
         end
         token_buffer.append_string(lib)
         token_buffer.extend_unless(' ')
         echo.put_string(once "Adding external library flag: ")
         echo.put_line(token_buffer)
         append_if_not_already(external_lib, token_buffer)
      end

   add_external_lib_path (path: STRING)
         -- Append `path' to `external_lib_path' taking into account
         -- how the current linker likes it to get this path.
         -- If `path' appears to be already formatted, no formatting
         -- added by this routine.
      require
         not path.is_empty
      do
         -- lcc_win32 doesn't support paths, do nothing in that case
         if c_compiler /= lcc_win32 then
            token_buffer.clear_count
            if c_compiler = cl then
               if path.has_prefix(l_flag) then
                  path.remove_prefix(l_flag)
               end
               -- Microsoft's own way of library searching
               if path.item(1) /= '/' then
                  token_buffer.copy(once "/LIBPATH:")
               end
            else
               -- the Unix way
               if path.item(1) /= '-' then
                  token_buffer.copy(l_flag)
               end
            end
            token_buffer.append_string(path)
            append_if_not_already(external_lib_path, token_buffer)
         end
      end

feature {}
   append_if_not_already (command_buffer, token: STRING)
         -- Append the `token' to the `command_buffer' if it is not already in
         -- the buffer.
         --| Patch proposed by Tim Wilson-Brown <twilsonb@mac.com>, enhanced by
         --| Cyril Adrian
         --|***PR (02/11/2004) I think such comment should go in THANKS.txt, not source file.
      local
         test_buffer: STRING
      do
         -- assumptions:
         -- ' ' is the character between tokens path will never contain ' '
         -- (anyone who tries this is insane anyway)
         -- this code uses test_buffer for memory management reasons
         test_buffer := once "                      "
         -- check that " " + token_buffer does not appear at the end of the
         -- string, " " + token_buffer + " " appears nowhere in the string,
         -- and token_buffer + " " does not appear at the beginning of the
         -- string
         -- construct " " + token_buffer (test at the end of the buffer)
         test_buffer.make_filled(' ', 1)
         test_buffer.append(token)
         if not command_buffer.has_suffix(test_buffer) then
            -- construct " " + token_buffer + " " (test at the middle of the buffer)
            test_buffer.extend(' ')
            if not command_buffer.has_substring(test_buffer) then
               -- construct token_buffer + " " (test at the beginning of the buffer)
               test_buffer.remove_first
               if not command_buffer.has_prefix(test_buffer) then
                  append_token(command_buffer, token)
               end
            end
         end
      end

feature {} -- Strings:
   exe_suffix: STRING ".exe"

   o_suffix: STRING ".o"

   obj_suffix: STRING ".obj"

   c_flag: STRING "-c"

   o_flag: STRING "-o"

   e_flag: STRING "-e"

   s_flag: STRING "-s"

   lcc: STRING "lcc"

   vc: STRING "vc"

   dcc: STRING "dcc"

   lcclnk: STRING "lcclnk"

   lnk_suffix: STRING ".lnk"

   libm: STRING "m"

   l_flag: STRING "-L"

   o2: STRING "-O2"

   libcpml: STRING "cpml"

feature {}
   extra_loadpath_files: FAST_ARRAY[STRING]

   config_loadpath_files: FAST_ARRAY[STRING]
   config_loadpath_names: FAST_ARRAY[STRING]

   plugins: DICTIONARY[DICTIONARY[PLUGIN, STRING], STRING]

   plugin_factory: PLUGIN_FACTORY

   path_id_memory: STRING ""
   path_h_memory: STRING ""
   path_c_memory: STRING ""
   path_make_memory: STRING ""

   path_id: INTEGER

   fill_path (path, suffix: STRING)
      require
         path.is_empty
         suffix /= Void
      do
         if ace.root_count > 1 and then (dos_system = system_name or else ace.need_path_id) then
            if path_id < 10 then
               path.extend('0')
            end
            path_id.append_in(path)
            path.extend('-')
         else
            -- compatibility mode for usual case
         end
         if dos_system = system_name then
            path.copy(once "se")
         else
            path.copy(ace.root_class_name.to_string)
         end
         path.to_lower
         path.append(suffix)
      ensure
         path.has_suffix(suffix)
      end

feature {} -- Buffers:
   token_buffer: STRING
      once
         create Result.make(128)
      end

   c_mode_memory: STRING
      once
         create Result.make(16)
      end

invariant
   config_loadpath_files /= Void implies (config_loadpath_files.count = config_loadpath_names.count)

end -- class SYSTEM_TOOLS
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
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://liberty-eiffel.blogspot.com - liberty-eiffel.blogspot.com
-- ------------------------------------------------------------------------------------------------------------------------------
