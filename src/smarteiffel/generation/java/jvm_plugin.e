-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class JVM_PLUGIN

inherit
   PLUGIN

creation {JVM_PLUGIN_FACTORY, FAKE_PLUGIN}
   make

feature {SYSTEM_TOOLS}
   try_auto_init is
      do
         -- nothing done yet
      end

feature {ANY}
   auto_init_done: BOOLEAN is True

feature {NATIVE_PLUG_IN}
   include (position: POSITION) is
      local
         i: INTEGER; class_file, source_file, command, dest, cd: STRING
         ft: FILE_TOOLS
      do
         if not is_included then
            if jvm_classes /= Void then
               create cd.make_from_string(bd.current_working_directory)
               bd.change_current_working_directory(plugin_path)
               from
                  i := jvm_classes.lower
               until
                  i > jvm_classes.upper
               loop
                  class_file := jvm_classes.item(i)
                  check
                     class_file.has_suffix(once ".class")
                  end
                  source_file := once ""
                  source_file.copy(class_file)
                  source_file.remove_suffix(once ".class")
                  source_file.append(once ".java")
                  if ft.is_readable(source_file) then
                     if ft.is_readable(class_file) and then ft.last_change_of(class_file) < ft.last_change_of(source_file) then
                        ft.delete(class_file)
                     end
                     if not ft.is_readable(class_file) then
                        if ace.java_compiler /= Void then
                           command := once ""
                           command.append(ace.java_compiler)
                           command.append(jvm_tools.get_compiler_flags(command))
                           command.append(" -classpath ")
                           command.append(jvm.compute_runtime_directory)
                           command.extend(' ')
                        else
                           error_handler.append("No external Java compiler found !")
                           error_handler.print_as_fatal_error
                        end
                        command.append(source_file)
                        if echo.system_call(command) /= exit_success_code then
                           error_handler.append("Compilation of plugin ")
                           error_handler.append(name)
                           error_handler.append(" failed !")
                           error_handler.print_as_fatal_error
                        end
                     end
                  end

                  echo.put_string(once "Copying plugin ")
                  echo.put_string(class_file)
                  echo.put_new_line
                  dest := name.twin
                  dest.append(once ".class")
                  bd.compute_file_path_with(jvm.sup_directory, dest)
                  ft.copy_to(jvm_classes.item(i), bd.last_entry)
                  i := i + 1
               end
               bd.change_current_working_directory(cd)
            end
            is_included := True
         end
      end

feature {}
   is_included: BOOLEAN

   make (position: POSITION; a_name, a_path: STRING) is
      local
         class_file, source_file: STRING
         ft: FILE_TOOLS
      do
         bd.compute_parent_directory_of(position.path)
         cwd.copy(bd.last_entry)

         name := a_name
          path := absolute_path(a_path).twin
         hash_code := a_name.hash_code.bit_xor(path.hash_code)

         plugin_path := once ""
         bd.compute_subdirectory_with(a_path, a_name)
         plugin_path.copy(bd.last_entry)
         bd.compute_subdirectory_with(plugin_path, once "java")
         plugin_path.copy(bd.last_entry)

         if not bd.last_entry.is_empty then
            source_file := a_name.twin
            source_file.replace_all('/', '_');
            source_file.append(once ".java")
            source_file.prepend(plugin_path)
            class_file := a_name.twin
            class_file.replace_all('/', '_');
            class_file.append(once ".class")
            class_file.prepend(plugin_path)

            if ft.is_readable(class_file) or else ft.is_readable(source_file) then
               add_jvm_class(class_file)
            else
               error_handler.append("The plugin ")
               error_handler.append(a_name)
               error_handler.append(" at ")
               error_handler.append(a_path)
                 error_handler.append(" defined in ")
               error_handler.append(position.path)
               error_handler.append(" does not provide any .class or .java file !")
               error_handler.print_as_fatal_error
            end
         end
      end

   add_jvm_class (a_jvm_class: STRING) is
      do
         if jvm_classes = Void then
            create jvm_classes.with_capacity(1)
         end
         echo.put_string(once "Including class ")
         echo.put_string(a_jvm_class)
         echo.put_new_line
         jvm_classes.add_last(a_jvm_class)
      end

   jvm_classes: FAST_ARRAY[STRING]
   plugin_path: STRING

invariant
   jvm_classes /= Void implies not jvm_classes.is_empty

end -- class JVM_PLUGIN
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
-- http://liberty-eiffel.blogspot.com - liberty-eiffel.blogspot.com
-- ------------------------------------------------------------------------------------------------------------------------------
