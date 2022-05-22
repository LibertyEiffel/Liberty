-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_PLUGIN

inherit
   PLUGIN

create {C_PLUGIN_FACTORY, FAKE_PLUGIN}
   make

feature {SYSTEM_TOOLS}
   try_auto_init
      local
         i: INTEGER; ok: BOOLEAN; p: PLUGIN
      do
         check
            cpp.pending_c_function
         end
         if c_auto_init_function_name = Void then
            auto_init_done := True
         else
            ok := True
            if c_auto_init_plugin_deps_location /= Void then
               from
                  i := c_auto_init_plugin_deps_location.lower
               until
                  not ok or else i > c_auto_init_plugin_deps_location.upper
               loop
                  p := system_tools.loaded_plugin(c_auto_init_plugin_deps_location.item(i),
                                                  c_auto_init_plugin_deps_name.item(i))
                  if p = Void then
                     error_handler.add_position(start_position)
                     error_handler.append(once "Could not load the plugin; one dependancy is not satisfied: location <")
                     error_handler.append(c_auto_init_plugin_deps_location.item(i))
                     error_handler.append(once ">, module_name <")
                     error_handler.append(c_auto_init_plugin_deps_name.item(i))
                     error_handler.append(once ">. Strange dependency!")
                     error_handler.print_as_fatal_error
                  elseif p = Current then
                     error_handler.add_position(start_position)
                     error_handler.append(once "Strange dependency: location <")
                     error_handler.append(c_auto_init_plugin_deps_location.item(i))
                     error_handler.append(once ">, module_name <")
                     error_handler.append(c_auto_init_plugin_deps_name.item(i))
                     error_handler.append(once ">. The plugin seems to depend on itself! Ignored.")
                     error_handler.print_as_warning
                  else
                     ok := p.auto_init_done
                  end
                  i := i + 1
               end
            end
            if ok then
               cpp.pending_c_function_body.append(c_auto_init_function_name)
               cpp.pending_c_function_body.append(once "();%N")
               auto_init_done := True
            end
         end
      end

feature {ANY}
   auto_init_done: BOOLEAN

feature {}
   plugin_echo (log: STRING)
      do
         echo.put_string(once "Plugin ")
         echo.put_string(name)
         echo.put_string(once ": ")
         echo.put_line(log)
      end

feature {NATIVE_PLUG_IN}
   include (position: POSITION)
      local
         ok: BOOLEAN; i: INTEGER; string_array: FAST_ARRAY[STRING]; string: STRING
      do
         if not is_included then
            bd.compute_parent_directory_of(position.path)
            cwd.copy(bd.last_entry)
            string_array := c_linker_options
            if string_array = Void then
               plugin_echo(once "No linker options")
            else
               from
                  i := string_array.lower
               until
                  i > string_array.upper
               loop
                  system_tools.append_c_linker_option(string_array.item(i))
                  i := i + 1
               end
            end
            string_array := c_compiler_options
            if string_array = Void then
               plugin_echo(once "No compiler options")
            else
               from
                  i := string_array.lower
               until
                  i > string_array.upper
               loop
                  system_tools.append_c_compiler_option(string_array.item(i))
                  i := i + 1
               end
            end
            string_array := c_header_paths
            if string_array = Void then
               plugin_echo(once "No header paths")
            else
               from
                  i := string_array.lower
               until
                  i > string_array.upper
               loop
                  system_tools.add_external_header_path(absolute_path(string_array.item(i)))
                  i := i + 1
               end
            end
            string_array := c_libraries
            if string_array = Void then
               plugin_echo(once "No libraries")
            else
               from
                  i := string_array.lower
               until
                  i > string_array.upper
               loop
                  string := string_array.item(i)
                  if not string.is_empty then
                     system_tools.add_external_lib(string)
                  end
                  i := i + 1
               end
            end
            string_array := c_library_paths
            if string_array = Void then
               plugin_echo(once "No library paths")
            else
               from
                  i := string_array.lower
               until
                  i > string_array.upper
               loop
                  system_tools.add_external_lib_path(absolute_path(string_array.item(i)))
                  i := i + 1
               end
            end
            string_array := c_headers
            if string_array = Void then
               plugin_echo(once "No header files")
            else
               from
                  i := string_array.lower
               until
                  i > string_array.upper
               loop
                  echo.tfr_connect(tfr, absolute_path(string_array.item(i)))
                  cpp.put_h_file(tfr)
                  i := i + 1
               end
               ok := True
            end
            string_array := c_sources
            if string_array = Void then
               plugin_echo(once "No source files")
            else
               from
                  i := string_array.lower
               until
                  i > string_array.upper
               loop
                  echo.tfr_connect(tfr, absolute_path(string_array.item(i)))
                  cpp.put_c_file(tfr)
                  i := i + 1
               end
               ok := True
            end
            if not ok then
               error_handler.add_position(start_position)
               error_handler.append(once "No support found for this external %"plug_in%" (plugin: %"")
               error_handler.append(name)
               error_handler.append(once "%" at ")
               error_handler.append(path)
               error_handler.append(once "). No description file found.")
               error_handler.add_position(position)
               error_handler.print_as_fatal_error
            end
            is_included := True
         end
      end

feature {}
   is_included: BOOLEAN
   start_position: POSITION

   make (position: POSITION; a_name, a_path: STRING)
      local
         plugin_path, b, c, entry, filepath: STRING
      do
         start_position := position
         c := once ""
         b := once ""
         entry := once ""
         plugin_path := once ""
         bd.compute_parent_directory_of(position.path)
         cwd.copy(bd.last_entry)
         name := a_name
         path := absolute_path(a_path).twin
         hash_code := a_name.hash_code.bit_xor(path.hash_code)

         --*** Old plugin scheme (transitional)
         bd.compute_subdirectory_with(path, once "c")
         c.copy(bd.last_entry)
         b.copy(name)
         b.append(once ".h")
         bd.compute_file_path_with(c, b)
         b.copy(bd.last_entry)
         if (create {FILE_TOOLS}).is_readable(b) then
            add_c_header(b.twin)
         end
         b.copy(name)
         b.append(once ".c")
         bd.compute_file_path_with(c, b)
         b.copy(bd.last_entry)
         if (create {FILE_TOOLS}).is_readable(b) then
            add_c_source(b.twin)
         end

         -- New plugin scheme
         bd.compute_subdirectory_with(path, a_name)
         plugin_path.copy(bd.last_entry)
         bd.compute_subdirectory_with(plugin_path, once "c")
         b.copy(bd.last_entry)
         bd.connect_to(b)
         if bd.is_connected then
            from
               bd.read_entry
            until
               bd.end_of_input
            loop
               entry.copy(bd.last_entry)
               bd.compute_file_path_with(b, entry)
               filepath := bd.last_entry.twin
               inspect
                  entry
               when "includes" then
                  c_header_paths := read(filepath)
               when "libs" then
                  c_libraries := read(filepath)
               when "paths" then
                  c_library_paths := read(filepath)
               when "linker_options" then
                  c_linker_options := read(filepath)
               when "compiler_options" then
                  c_compiler_options := read(filepath)
               when "auto_init" then
                  read_auto_init(filepath)
               when "cecil.se" then
                  cecil_pool.add_cecil_file(filepath)
               else
                  if entry.has_suffix(once ".h") or else entry.has_suffix(once ".H") then
                     add_c_header(filepath)
                  elseif entry.has_suffix(once ".c") or else entry.has_suffix(once ".C") then
                     add_c_source(filepath)
                  end
               end
               bd.read_entry
            end
            bd.disconnect
         end
         -- sanity checks
         if c_sources = Void and then c_headers = Void then
            error_handler.append(once "The plugin ")
            error_handler.append(a_name)
            error_handler.append(once " at ")
            error_handler.append(a_path)
            error_handler.append(once " defined in ")
            error_handler.append(position.path)
            error_handler.append(once " does not provide any .h or .c file, nor a cecil.se file!")
            error_handler.print_as_fatal_error
         end
      end

   add_c_source (a_c_source: STRING)
      do
         if c_sources = Void then
            create c_sources.with_capacity(2)
         end
         echo.put_string(once "Including source ")
         echo.put_string(a_c_source)
         echo.put_new_line
         c_sources.add_last(a_c_source)
      end

   add_c_header (a_c_header: STRING)
      do
         if c_headers = Void then
            create c_headers.with_capacity(2)
         end
         echo.put_string(once "Including header ")
         echo.put_string(a_c_header)
         echo.put_new_line
         c_headers.add_last(a_c_header)
      end

   c_sources: FAST_ARRAY[STRING]

   c_headers: FAST_ARRAY[STRING]

   c_header_paths: FAST_ARRAY[STRING]

   c_libraries: FAST_ARRAY[STRING]

   c_library_paths: FAST_ARRAY[STRING]

   c_linker_options: FAST_ARRAY[STRING]

   c_compiler_options: FAST_ARRAY[STRING]

   c_auto_init_function_name: STRING
   c_auto_init_plugin_deps_location: FAST_ARRAY[STRING]
   c_auto_init_plugin_deps_name: FAST_ARRAY[STRING]

feature {}
   read_auto_init (filename: STRING)
      local
         sections: ITERATOR[STRING]
      do
         parser_buffer.load_file(filename)
         if parser_buffer.is_ready then
            plugin_config.a_inifile

            if plugin_config.has(once "function") then
               c_auto_init_function_name := plugin_config.item(once "function")
            else
               error_handler.add_position(start_position)
               error_handler.append(once "The default key %"function%" was not found. Invalid auto_init file.")
               error_handler.print_as_fatal_error
            end

            sections := plugin_config.sections_iterator
            if sections /= Void then
               from
                  create c_auto_init_plugin_deps_location.make(0)
                  create c_auto_init_plugin_deps_name.make(0)
               until
                  sections.is_off
               loop
                  if plugin_config.section_has(sections.item, once "location")
                     and then plugin_config.section_has(sections.item, once "module_name") then
                     c_auto_init_plugin_deps_location.add_last(plugin_config.section_item(sections.item, once "location"))
                     c_auto_init_plugin_deps_name.add_last(plugin_config.section_item(sections.item, once "module_name"))
                  end
                  sections.next
               end
            end
         end
      end

   read (filename: STRING): FAST_ARRAY[STRING]
      local
         b: STRING; string_array: ITERATOR[STRING]
      do
         parser_buffer.load_file(filename)
         if parser_buffer.is_ready then
            plugin_config.a_inifile

            -- try for "system.flavor.compiler" entry
            b := once ""
            b.copy(system_tools.system_name)
            b.extend('.')
            b.append(system_tools.system_flavor)
            b.extend('.')
            b.append(system_tools.c_compiler)
            string_array := plugin_config.section_key_iterator(b)

            -- nothing found, try "system.flavor" entry
            if string_array = Void then
               b.copy(system_tools.system_name)
               b.extend('.')
               b.append(system_tools.system_flavor)
               string_array := plugin_config.section_key_iterator(b)
            end

            -- nothing found, try "system.compiler" entry
            if string_array = Void then
               b.copy(system_tools.system_name)
               b.extend('.')
               b.append(system_tools.c_compiler)
               string_array := plugin_config.section_key_iterator(b)
            end

            -- nothing found, try "system" entry
            if string_array = Void then
               b.copy(system_tools.system_name)
               string_array := plugin_config.section_key_iterator(b)
            end
            if string_array /= Void then
               from
                  create Result.with_capacity(2)
               until
                  string_array.is_off
               loop
                  Result.add_last(plugin_config.section_item(b, string_array.item).twin)
                  string_array.next
               end
            else
               -- still nothing found, try the default entry
               string_array := plugin_config.key_iterator
               if string_array /= Void then
                  from
                     create Result.with_capacity(2)
                  until
                     string_array.is_off
                  loop
                     Result.add_last(plugin_config.item(string_array.item).twin)
                     string_array.next
                  end
               end
            end
         end
      end

invariant
   c_headers /= Void implies not c_headers.is_empty
   c_sources /= Void implies not c_sources.is_empty
   c_auto_init_plugin_deps_location /= Void implies c_auto_init_plugin_deps_location.count = c_auto_init_plugin_deps_name.count

end -- class C_PLUGIN
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
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- https://www.liberty-eiffel.org
-- ------------------------------------------------------------------------------------------------------------------------------
