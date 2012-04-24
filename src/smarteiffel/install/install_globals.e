-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class INSTALL_GLOBALS
   --
   -- The parent of install classes (INSTALL and C_MODE)
   --

insert
   GLOBALS
      rename system_tools as dummy_system_tools
      end
   DIRECTORY_NOTATION_HANDLER
   ACE_HANDLER

feature {ANY}
   system_tools: SYSTEM_TOOLS is
      once
         create Result.make_install
      end

feature {}
   init_globals is
      do
         detect_os
         set_compiler_lists
      end

feature {} -- Operating system detection
   seconf: STRING
         -- The path to the configuration file

   seconf_dir: STRING
         -- The path to the configuration directory. In that case, `seconf' contains the path to "vanilla.se".

   detect_os is
         -- Auto-detection of the os; set the default variables accordingly
      local
         is_better_default_than_system_tools: BOOLEAN; tmp_seconf: like seconf
         rcf: SERC_FACTORY
      do
         basic_directory.connect_to_current_working_directory
         cwd := basic_directory.last_entry.twin
         basic_directory.disconnect

         if file_tools.is_readable(once "/sys/rc") then
            -- We're looking for a file unique to the new Amiga Digital
            -- Environment running on Taos.
            set_system_name(system_tools.elate_system)
            seconf := once "/lang/eiffel/.serc" -- contributed by Joseph R. Kiniry
            is_better_default_than_system_tools := True
         elseif file_tools.is_readable(once "s:startup-sequence") then
            -- This check has to be performed BEFORE the Unix check
            -- ("/bin/ls"), because the latter might be True if the user
            -- installed GeekGadgets and one of those perverted patches
            -- to handle Unix-style paths!
            set_system_name(system_tools.amiga_system)
            -- seconf not yet contributed
         elseif file_tools.is_readable(once "/boot/beos/system/Tracker") then
            set_system_name(system_tools.beos_system)
            -- seconf not yet contributed
         elseif file_tools.is_readable(once "/bin/ls.exe") then
            set_system_name(system_tools.cygwin_system)
            unix_seconf
         elseif file_tools.is_readable(once "/bin/ls") then
            set_system_name(system_tools.unix_system)
            unix_seconf
         else
            if not basic_directory.system_notation_detected then
               basic_directory.set_notation_using(cwd)
            end
            if basic_directory.system_notation_detected then
               if basic_directory.unix_notation then
                  set_system_name(system_tools.unix_system)
                  unix_seconf
               elseif basic_directory.windows_notation then
                  set_system_name(system_tools.windows_system)
                  windows_seconf
               elseif basic_directory.cygwin_notation then
                  set_system_name(system_tools.cygwin_system)
                  unix_seconf
               elseif basic_directory.amiga_notation then
                  set_system_name(system_tools.amiga_system)
               elseif basic_directory.macintosh_notation then
                  set_system_name(system_tools.macintosh_system)
               elseif basic_directory.openvms_notation then
                  set_system_name(system_tools.open_vms_system)
               end
            end
            if system_name = Void then
               basic_directory.connect_to(once "C:\")
               if basic_directory.is_connected then
                  set_system_name(system_tools.windows_system)
                  windows_seconf
                  basic_directory.disconnect
               end
            end
         end
         if system_flavor = Void then
            set_system_flavor(once "generic")
         end
         system_tools.make
         tmp_seconf := system_tools.seconf
         if tmp_seconf = Void then
            tmp_seconf := fz_conf_undefined
         end
         if rcf.seconf_env /= Void then
            -- The "SmartEiffel" environment variable was set, we must use it
            seconf := rcf.seconf_env
         end
         if seconf = Void then
            -- No conf file is set: use the SYSTEM_TOOLS computed default
            seconf := tmp_seconf
         elseif not is_better_default_than_system_tools and then tmp_seconf /= fz_conf_undefined then
            -- A conf file is set, but SYSTEM_TOOLS is deemed certainly more pertinent
            seconf := tmp_seconf
         end
         if file_tools.is_directory(seconf) then
            seconf_dir := seconf.twin
            basic_directory.compute_file_path_with(seconf, once "vanilla.se")
            seconf.copy(basic_directory.last_entry)
         end
         check
            seconf /= Void
            fz_conf_undefined.is_equal(seconf) implies fz_conf_undefined = seconf
         end
      ensure
         system_name /= Void
         seconf /= Void
      end

   unix_seconf is
      local
         rcf: SERC_FACTORY
      do
         if rcf.home_env = Void or else
            rcf.user_env = Void or else
            rcf.user_env.is_equal(once "root")
          then
            seconf := once "/etc/serc"
         else
            seconf := seconf_buffer
            seconf.copy(rcf.home_env)
            if seconf.last /= '/' then
               seconf.extend('/')
            end
            seconf.append(once ".serc")
         end
      end

   windows_seconf is
      local
         rcf: SERC_FACTORY
         i: INTEGER; found: BOOLEAN
      do
         if rcf.userprofile_env = Void then
            seconf := once "C:\SE.CFG"
            from
               i := windows_standard_directories.lower
            until
               found or else i > windows_standard_directories.upper
            loop
               basic_directory.connect_to(windows_standard_directories.item(i))
               found := basic_directory.is_connected
               i := i + 1
            end
            if not found then
               set_system_name(system_tools.dos_system)
            else
               basic_directory.disconnect
            end
         else
            seconf := seconf_buffer
            seconf.copy(rcf.userprofile_env)
            if seconf.last /= '\' then
               seconf.extend('\')
            end
            seconf.append(once "SE.CFG")
         end
      end

   cwd: STRING
         -- Used to save the initial current working directory (it
         -- must be restored before exit using `restore_current_working_directory'
         -- because we are not always under UNIX.

   system_name: STRING
         -- One element of SYSTEM_TOOLS `system_list'

   system_flavor: STRING
         -- Free form string for further configuration

   set_system_name (name: STRING) is
      local
         sysname: STRING; i: INTEGER
      do
         sysname := name
         if not system_tools.system_list.fast_has(sysname) then
            i := system_tools.system_list.first_index_of(name)
            if system_tools.system_list.valid_index(i) then
               sysname := system_tools.system_list.item(i)
            else
               sysname := fz_conf_undefined
            end
         end
         if sysname /= fz_conf_undefined then
            system_name := sysname
            system_tools.set_system_name(sysname)
         end
      end

   set_system_flavor (name: STRING) is
      do
         system_flavor := name
         system_tools.set_system_flavor(name)
      end

   basic_directory: BASIC_DIRECTORY
         -- Used to compute some directory paths

   file_tools: FILE_TOOLS
         -- Used to test some file properties

   seconf_buffer: STRING is
      once
         create Result.make(16)
      end

   windows_standard_directories: FAST_ARRAY[STRING] is
         -- De-facto standard places where Windows is installed. I am too imaginative?
      once
         Result := {FAST_ARRAY[STRING] <<"C:\WINDOWS", "C:\WINNT", "C:\WIN95", "C:\WIN98",
                                         "C:\WINME", "C:\WIN2K", "C:\WIN2000", "C:\WINXP">> }
      end

   first_pass_command_list: FAST_ARRAY[STRING] is
      once
         Result := {FAST_ARRAY[STRING] <<"compile_to_c", "compile", "clean">> }
      end

   no_split_command_list: FAST_ARRAY[STRING] is
         -- Small commands which can be compiled with the -no_split flag.
      once
         Result := {FAST_ARRAY[STRING]   <<
                                         "se",
                                         "compile",
                                         "clean",
                                         "finder",
                                         "eiffeltest",
--|***                                         "print_jvm_class",
                                         "ace_check"
                                         >> }
      end

   split_command_list: FAST_ARRAY[STRING] is
         -- Large commands which cannot be compiled with the -no_split flag.
      once
         Result := {FAST_ARRAY[STRING] <<
                                         "compile_to_c",
                                         "short",
                                         "class_check",
                                         "pretty",
                                         "eiffeldoc",
--|***                                         "compile_to_jvm",
                                         "extract_internals"
                                         >> }
      end

   install_tag: STRING is "3"
         -- Some version tag used to validate the format of the config file.
         -- If not existant, it is presumed to be "0".

   template (compiler: STRING): INI_PARSER is
         -- An ini parser to parse the compiler templates. The "good" parser
         -- is selected, or created, depending on `compiler'.
         -- Returns Void if `compiler' is Void.
      do
         if compiler /= Void then
            Result := rc_template(compiler, Void)
         end
      end

   rc_template (rcfile, rcpath: STRING): INI_PARSER is
         -- An ini parser to parse the compiler templates. The "good" parser
         -- is selected, or created, from the `rcpath'.
         -- Returns Void if the file is not found.
      require
         rcfile /= Void
      do
         if templates.has(rcfile) then
            Result := templates.at(rcfile)
         elseif rcpath /= Void then
            parser_buffer.load_file(rcpath)
            if parser_buffer.is_ready then
               create Result.serc
               Result.a_inifile
            end
            templates.put(Result, rcfile.twin)
         end
      end

   templates: DICTIONARY[INI_PARSER, STRING] is
      once
         create {HASHED_DICTIONARY[INI_PARSER, STRING]} Result.make
      end

   set_compiler_lists is
      local
         i: INTEGER; rcfile, c, key: STRING; inifile: INI_PARSER; skip: BOOLEAN
      do
         directory.scan_with(install_path)
         if directory.last_scan_status then
            from
               i := directory.lower
            until
               i > directory.upper
            loop
               rcfile := once ".............."
               key := once ".............."
               rcfile.copy(directory.item(i))
               rcfile.to_lower
               key.copy(rcfile)
               if rcfile.has_suffix(once ".rc") then
                  key.remove_tail(3)
                  basic_directory.compute_file_path_with(directory.path, rcfile)
                  rcfile.copy(basic_directory.last_entry)
                  inifile := rc_template(key, rcfile)
                  if inifile /= Void then
                     skip := False
                     key := key.twin
                     if inifile.has(fz_conf_compiler_type) then
                        c := inifile.item(fz_conf_compiler_type)
                        if c /= Void and then not c.is_equal(fz_none) and then system_tools.compiler_list.has(c) then
                           c := system_tools.compiler_list.item(system_tools.compiler_list.first_index_of(c))
                           c_compiler_rc_map.add(c, key)
                           debug
                              io.put_string(once "C: ")
                              io.put_string(key)
                              io.put_string(once " -> ")
                              io.put_string(c)
                              io.put_new_line
                           end
                        else
                           std_error.put_string(once "%NThe RC file ")
                           std_error.put_string(rcfile)
                           std_error.put_string(once " contains an invalid ")
                           std_error.put_string(fz_conf_compiler_type)
                           std_error.put_string(once " key. Skipping the file.%N%N")
                           skip := True
                        end
                     else
                        std_error.put_string(once "%NThe RC file ")
                        std_error.put_string(rcfile)
                        std_error.put_string(once " does not contain the ")
                        std_error.put_string(fz_conf_compiler_type)
                        std_error.put_string(once " key. Skipping the file.%N%N")
                        skip := True
                     end
                     if (not skip) and then inifile.has(fz_conf_cpp_compiler_type) then
                        c := inifile.item(fz_conf_cpp_compiler_type)
                        if c /= Void and then not c.is_equal(fz_none) then
                           if system_tools.c_plus_plus_compiler_list.has(c) then
                              c := system_tools.c_plus_plus_compiler_list.item(system_tools.c_plus_plus_compiler_list.first_index_of(c))
                              cpp_compiler_rc_map.add(c, key)
                              debug
                                 io.put_string(once "C++: ")
                                 io.put_string(key)
                                 io.put_string(once " -> ")
                                 io.put_string(c)
                                 io.put_new_line
                              end
                           else
                              std_error.put_string(once "%NThe RC file ")
                              std_error.put_string(rcfile)
                              std_error.put_string(once " contains an invalid valid ")
                              std_error.put_string(fz_conf_cpp_compiler_type)
                              std_error.put_string(once " key. Skipping the key.%N%N")
                           end
                        end
                     end
                  end
               end
               i := i + 1
            end
         end
      end

   call_compile (options, name: STRING): BOOLEAN is
      local
         command, x_name: STRING;
      do
         x_name := name.twin
         system_tools.add_x_suffix(x_name)
         command := once ""
         command.clear_count
         system_tools.append_command_path_to(command, once "compile")
         command.extend(' ')
         command.append(options)
         command.append(once " -o ")
         command.append(x_name)
         command.extend(' ')
         command.append(name)
         Result := execute_command(command)
      end

   call_compile_to_c (options, name: STRING): BOOLEAN is
      local
         x_name, command: STRING
      do
         x_name := name.twin
         system_tools.add_x_suffix(x_name)
         command := once ""
         command.clear_count
         system_tools.append_command_path_to(command, once "compile_to_c")
         command.extend(' ')
         command.append(options)
         command.append(once " -o ")
         command.append(x_name)
         command.extend(' ')
         command.append(name)
         Result := execute_command(command)
      end

   call_clean (name: STRING): BOOLEAN is
      local
         command: STRING
      do
         command := once ""
         command.clear_count
         system_tools.append_command_path_to(command, once "clean")
         command.extend(' ')
         command.append(name)
         Result := execute_command(command)
      end

   open_vms_entry_patch (entry: STRING) is
         -- Remove the strange ;123 version suffix of the OpenVMS system.
      require
         not entry.is_empty
      local
         done: BOOLEAN; s: STRING
      do
         if (once "OpenVMS").same_as(system_name) then
            from
               -- Because the system uses uppercase only:
               entry.to_lower
               s := entry.twin
            until
               done
            loop
               if s.count = 0 then
                  done := True
               elseif s.last = ';' then
                  s.remove_last
                  entry.copy(s)
                  done := True
               elseif s.last.is_decimal_digit then
                  s.remove_last
               else
                  done := True
               end
            end
         end
      end

   files: FAST_ARRAY[STRING] is
      once
         create Result.make(0)
      end


   split_mode_c_compile (name: STRING): BOOLEAN is
         -- Compile some command `name' produced without the "-no_split" flag.
         -- BEWARE, it dose not mean that -no_split is not set; it's just not
         -- *given* (it can be implied by the chosen C mode)
      local
         entry, cmd: STRING; i, max: INTEGER
      do
         ace.set_no_split(False)
         ace.set_executable_name(name)
         entry := once ""
         entry.copy(name)
         entry.append(once ".c")
         directory.scan_current_working_directory
         if directory.has(entry) then
            -- A not split file is preferred to the split ones
            Result := no_split_mode_c_compile(name)
         else
            from
               i := directory.lower
            until
               i > directory.upper
            loop
               entry := directory.item(i).twin
               open_vms_entry_patch(entry)
               if not entry.has_prefix(name) then
               elseif not entry.has_suffix(once ".c") then
               else
                  max := max + 1
               end
               i := i + 1
            end
            from
               entry := once ""
               entry.copy(name)
               i := 1
               Result := True
            until
               not Result or else i > max
            loop
               entry.shrink(1, name.count)
               i.append_in(entry)
               entry.append(once ".c")
               cmd := system_tools.c_compiler_command(entry)
               compile_feedback(name, i, max + 1)
               Result := execute_command(cmd)
               i := i + 1
            end
            if Result and then max > 0 then
               from
                  files.clear_count
                  i := 1
               until
                  i > max
               loop
                  entry := name.twin
                  i.append_in(entry)
                  files.add_last(entry)
                  entry.append(once ".c")
                  i := i + 1
               end
               cmd := system_tools.linker_command(name, files)
               compile_feedback(name, max + 1, max + 1)
               Result := execute_command(cmd)
               if Result then
                  system_tools.remove_other_extra_files(name)
               end
            end
         end
      end

   no_split_mode_c_compile (name: STRING): BOOLEAN is
         -- Compile some command `name' produced with the "-no_split" flag.
      local
         c_name, cmd: STRING
      do
         ace.set_no_split(True)
         ace.set_executable_name(name)
         c_name := once ""
         c_name.copy(name)
         c_name.append(once ".c")
         ace.set_executable_name(name)
         cmd := system_tools.c_compiler_command(c_name)
         compile_feedback(name, 0, 0)
         Result := execute_command(cmd)
         if Result then
            files.clear_count
            files.add_last(c_name)
            cmd := system_tools.linker_command(name, files)
            Result := execute_command(cmd)
         end
      end

   execute_command (command: STRING): BOOLEAN is
      deferred
      end

   install_path: STRING is
         -- The path to the "install" subdirectories, which contains the
         -- templates for the compilers.
      once
         basic_directory.connect_to_current_working_directory
         if basic_directory.is_connected then
            create Result.copy(basic_directory.last_entry)
            basic_directory.disconnect
            basic_directory.compute_subdirectory_with(Result, fz_install)
            Result.copy(basic_directory.last_entry)
         end
      end

   directory: DIRECTORY is
      once
         create Result.make
      end

   c_compiler_rc_map: DICTIONARY[STRING, STRING] is
         -- Keys: "reduced" RC file names
         -- Values: compilers
      once
         create {HASHED_DICTIONARY[STRING, STRING]} Result.make
      end

   cpp_compiler_rc_map: DICTIONARY[STRING, STRING] is
         -- Keys: "reduced" RC file names
         -- Values: compilers
      once
         create {HASHED_DICTIONARY[STRING, STRING]} Result.make
      end

   c_compiler_list: ARRAY[STRING] is
      once
         create Result.make(1, 0)
         c_compiler_rc_map.key_map_in(Result)
      end

   cpp_compiler_list: ARRAY[STRING] is
      once
         create Result.make(1, 0)
         cpp_compiler_rc_map.key_map_in(Result)
         Result.add_first(fz_none)
      end

   standard_tools_names: FAST_ARRAY[STRING] is
      once
         Result := {FAST_ARRAY[STRING] << "c",
                                          "c2c",
                                          "clean",
--|***                                          "java",
                                          "pretty",
                                          "short",
                                          "find",
                                          "ace_check",
                                          "class_check",
--|***                                          "javap",
                                          "doc",
                                          "test",
                                          "x_int"
                                          >> }
      end

   standard_tools_commands: FAST_ARRAY[STRING] is
      once
         Result := {FAST_ARRAY[STRING] << "compile",
                                          "compile_to_c",
                                          "clean",
--|***                                          "compile_to_jvm",
                                          "pretty",
                                          "short",
                                          "finder",
                                          "ace_check",
                                          "class_check",
--|***                                          "print_jvm_class",
                                          "eiffeldoc",
                                          "eiffeltest",
                                          "extract_internals"
                                          >>}
      end

   compile_feedback (name: STRING; current_slice, max_slices: INTEGER) is
      require
         no_slices_or_at_least_two_plus_linking: max_slices = 0 or else max_slices > 2
         current_slice_in_correct_range: (max_slices = 0 and then current_slice = 0) or else current_slice.in_range(1, max_slices)
      deferred
      end

invariant
   standard_tools_names.count = standard_tools_commands.count

end -- class INSTALL_GLOBALS
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
