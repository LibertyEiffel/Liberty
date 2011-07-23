-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class MAKE_RELEASE_JOB

inherit
   JOB

insert
   INSTALL_GLOBALS

feature {}
   gui: MAKE_RELEASE_GUI is
         -- the GUI engine
      deferred
      end

   cc: STRING is
         -- The C compiler
      deferred
      end

feature {} -- Generating the configuration files
   lib_path: STRING
   doc_path: STRING

   config_bin_path: STRING
   config_sys_path: STRING
   config_short_path: STRING
   config_tutorial_path: STRING
   config_tools_path: STRING
   config_lib_path: STRING

   config_directory_path: STRING

   generate_default_config is
      local
         msg: STRING; output: TEXT_FILE_WRITE; i: INTEGER
      do -- once
         if seconf_dir /= Void then
            config_directory_path := seconf_dir
         else
            ensure_seconf_is_a_directory
            config_directory_path := seconf
         end

         msg := "Generating configuration files in " + config_directory_path
         gui.set_action(msg)

         if config_bin_path = Void then
            basic_directory.compute_subdirectory_with(lib_path, "bin")
            config_bin_path := basic_directory.last_entry.twin
         end
         if config_sys_path = Void then
            basic_directory.compute_subdirectory_with(lib_path, "sys")
            config_sys_path := basic_directory.last_entry.twin
         end
         if config_short_path = Void then
            basic_directory.compute_subdirectory_with(lib_path, "short")
            config_short_path := basic_directory.last_entry.twin
         end
         if config_tutorial_path = Void then
            basic_directory.compute_subdirectory_with(doc_path, "tutorial")
            config_tutorial_path := basic_directory.last_entry.twin
         end
         if config_tools_path = Void then
            basic_directory.compute_subdirectory_with(lib_path, "tools")
            config_tools_path := basic_directory.last_entry.twin
         end
         if config_lib_path = Void then
            basic_directory.compute_subdirectory_with(lib_path, "lib")
            config_lib_path := basic_directory.last_entry.twin
         end

         output := open_configuration(0, 3, "vanilla.se")
         if output /= Void then
            output.put_line("[General]")
            output.put_string("bin: ")
            output.put_line(config_bin_path)
            output.put_string("sys: ")
            output.put_line(config_sys_path)
            output.put_string("short: ")
            output.put_line(config_short_path)
            output.put_string("os: ")
            output.put_line(system_name)
            output.put_string("flavor: ")
            output.put_line(system_flavor)
            output.put_string("tag: ")
            output.put_line(install_tag)
            output.put_line("jobs: 4")
            output.put_line("[Environment]")
            output.put_string("path_lib: ")
            output.put_line(config_lib_path)
            output.put_line("[Loadpath]")
            output.put_line("lib: ${path_lib}loadpath.se")
            output.put_line("[Tools]")
            from
               i := standard_tools_names.lower
            until
               i > standard_tools_names.upper
            loop
               output.put_string(standard_tools_names.item(i))
               output.put_string(once ": ")
               output.put_line(standard_tools_commands.item(i))
               i := i + 1
            end
            write_c_modes(output)
            output.disconnect
         end

         output := open_configuration(1, 3, "tools.se")
         if output /= Void then
            output.put_line("[Environment]")
            output.put_string("path_tools: ")
            output.put_line(config_tools_path)
            output.put_line("[Loadpath]")
            output.put_line("tools: ${path_tools}loadpath.se")
            output.disconnect
         end

         output := open_configuration(2, 3, "doc.se")
         if output /= Void then
            output.put_line("[Environment]")
            output.put_string("path_tutorial: ")
            output.put_line(config_tutorial_path)
            output.put_line("[Loadpath]")
            output.put_line("tutorial: ${path_tutorial}loadpath.se")
            output.disconnect
         end

         gui.set_progress(3, 3, "")
      end

   open_configuration (val, max: INTEGER; filename: STRING): TEXT_FILE_WRITE is
      require
         not configuration_output.is_connected
      local
         path, msg: STRING
      do
         gui.set_progress(val, max, filename)
         path := once ""
         basic_directory.compute_file_path_with(config_directory_path, filename)
         path.copy(basic_directory.last_entry)
         if file_tools.file_exists(path) then
            msg := once ""
            msg.copy(once "The file ")
            msg.append(filename)
            msg.append(once " already exists. Not overwriting.")
            gui.info(msg)
         else
            Result := configuration_output
            Result.connect_to(path)
         end
      ensure
         Result /= Void implies (Result = configuration_output and then Result.is_connected)
      end

   configuration_output: TEXT_FILE_WRITE is
      once
         create Result.make
      end

   ensure_seconf_is_a_directory is
      local
         tmp, vanilla: STRING
      do -- once
         if not file_tools.is_directory(seconf) then
            if file_tools.is_file(seconf) then
               tmp := seconf + ".tmp"
               basic_directory.compute_file_path_with(seconf, "vanilla.se")
               vanilla := basic_directory.last_entry.twin
               if basic_directory.create_new_directory(tmp) then
                  file_tools.rename_to(seconf, vanilla)
                  file_tools.rename_to(tmp, seconf)
               else
                  gui.fatal("Could not create the directory: " + tmp, 1)
               end
            elseif not basic_directory.create_new_directory(seconf) then
               gui.fatal("Could not create the directory: " + seconf, 1)
            end
         end
      ensure
         file_tools.is_directory(seconf)
      end

   write_c_modes (output: TEXT_FILE_WRITE) is
      require
         output.is_connected
      local
         ini: INI_PARSER; sections, keys: ITERATOR[STRING]
         section, key, value, msg: STRING
      do -- once
         ini := template(cc)
         if ini = Void then
            msg := "Could not find template for "
            msg.append(cc)
            gui.warning(msg)
         else
            from
               sections := ini.sections_iterator
            until
               sections.is_off
            loop
               section := sections.item
               output.put_character('[')
               output.put_string(section)
               output.put_character(']')
               output.put_character('%N')
               from
                  keys := ini.section_key_iterator(section)
               until
                  keys.is_off
               loop
                  key := keys.item
                  value := ini.section_item(section, key)
                  output.put_string(key)
                  output.put_string(once ": ")
                  output.put_line(value)
                  keys.next
               end
               sections.next
            end
         end
      end

invariant
   gui /= Void
   cc /= Void

end -- class MAKE_RELEASE_JOB
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
