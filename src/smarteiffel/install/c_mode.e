-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_MODE
   --
   -- Used by the new-generation installer.
   --

inherit
   INSTALL_GLOBALS

creation {INSTALL}
   from_template, no_template

feature {INSTALL}
   c_file: INI_PARSER

   cpp_file: INI_PARSER

   name: STRING

   c_compiler_type: STRING

   c_compiler_path: STRING

   c_compiler_options: STRING

   c_linker_path: STRING

   c_linker_options: STRING

   cpp_compiler_type: STRING

   cpp_compiler_path: STRING

   cpp_compiler_options: STRING

   cpp_linker_path: STRING

   cpp_linker_options: STRING

   smarteiffel_options: STRING

   could_read_template: BOOLEAN
         -- True if a template was used by the last `set_c_compiler_type' call.

   set_c_compiler_path (ccp: STRING) is
      do
         if ccp = Void then
            c_compiler_path := Void
         else
            buf_c_compiler_path.copy(ccp)
            c_compiler_path := buf_c_compiler_path
         end
      ensure
         ccp = Void implies c_compiler_path = Void
         ccp /= Void implies c_compiler_path.is_equal(ccp)
      end

   set_c_compiler_options (cco: STRING) is
      do
         if cco = Void then
            c_compiler_options := Void
         else
            buf_c_compiler_options.copy(cco)
            c_compiler_options := buf_c_compiler_options
         end
         if c_same then
            if cco = Void then
               c_linker_options := Void
            else
               buf_c_linker_options.copy(cco)
               c_linker_options := buf_c_linker_options
            end
         end
      ensure
         cco = Void implies c_compiler_options = Void
         cco /= Void implies c_compiler_options.is_equal(cco)
      end

   set_c_linker_path (clp: STRING) is
      do
         if clp = Void then
            c_linker_path := Void
         else
            buf_c_linker_path.copy(clp)
            c_linker_path := buf_c_linker_path
         end
      ensure
         clp = Void implies c_linker_path = Void
         clp /= Void implies c_linker_path.is_equal(clp)
      end

   set_c_linker_options (clo: STRING) is
      do
         if clo = Void then
            c_linker_options := Void
         else
            buf_c_linker_options.copy(clo)
            c_linker_options := buf_c_linker_options
         end
         c_same := False
      ensure
         clo = Void implies c_linker_options = Void
         clo /= Void implies c_linker_options.is_equal(clo)
      end

   set_cpp_compiler_path (ccp: STRING) is
      do
         if ccp = Void then
            cpp_compiler_path := Void
         else
            buf_cpp_compiler_path.copy(ccp)
            cpp_compiler_path := buf_cpp_compiler_path
         end
      ensure
         ccp = Void implies cpp_compiler_path = Void
         ccp /= Void implies cpp_compiler_path.is_equal(ccp)
      end

   set_cpp_compiler_options (cco: STRING) is
      do
         if cco = Void then
            cpp_compiler_options := Void
         else
            buf_cpp_compiler_options.copy(cco)
            cpp_compiler_options := buf_cpp_compiler_options
         end
         if cpp_same then
            if cco = Void then
               cpp_linker_options := Void
            else
               buf_cpp_linker_options.copy(cco)
               cpp_linker_options := buf_cpp_linker_options
            end
         end
      ensure
         cco = Void implies cpp_compiler_options = Void
         cco /= Void implies cpp_compiler_options.is_equal(cco)
      end

   set_cpp_linker_path (clp: STRING) is
      do
         if clp = Void then
            cpp_linker_path := Void
         else
            buf_cpp_linker_path.copy(clp)
            cpp_linker_path := buf_cpp_linker_path
         end
      ensure
         clp = Void implies cpp_linker_path = Void
         clp /= Void implies cpp_linker_path.is_equal(clp)
      end

   set_cpp_linker_options (clo: STRING) is
      do
         if clo = Void then
            cpp_linker_options := Void
         else
            buf_cpp_linker_options.copy(clo)
            cpp_linker_options := buf_cpp_linker_options
         end
         cpp_same := False
      ensure
         clo = Void implies cpp_linker_options = Void
         clo /= Void implies cpp_linker_options.is_equal(clo)
      end

   set_smarteiffel_options (so: STRING) is
      do
         if so = Void then
            smarteiffel_options := Void
         else
            buf_smarteiffel_options.copy(so)
            smarteiffel_options := buf_smarteiffel_options
         end
      ensure
         so = Void implies smarteiffel_options = Void
         so /= Void implies smarteiffel_options.is_equal(so)
      end

feature {INSTALL}
   from_template (a_name: like name; a_c_file: like c_file; a_cpp_file: like cpp_file) is
      require
         name_not_void: a_name /= Void
         c_compiler_exists: a_c_file /= Void
      do
         if name = Void then
            basic_create
         end

         name.copy(a_name)

         c_file := a_c_file
         cpp_file := a_cpp_file

         read_template
      end

   no_template (a_name: like name; a_c_compiler_type: like c_compiler_type; a_cpp_compiler_type: like cpp_compiler_type) is
      require
         name_not_void: a_name /= Void
         c_compiler_not_void: a_c_compiler_type /= Void
         cpp_compiler_not_void: a_cpp_compiler_type /= Void
      local
         i: INTEGER
      do
         if name = Void then
            basic_create
         end

         name.copy(a_name)

         i := system_tools.compiler_list.first_index_of(a_c_compiler_type)
         c_compiler_type := system_tools.compiler_list.item(i)

         if a_cpp_compiler_type = fz_conf_undefined then
            cpp_compiler_type := Void
         else
            i := system_tools.c_plus_plus_compiler_list.first_index_of(a_cpp_compiler_type)
            cpp_compiler_type := system_tools.c_plus_plus_compiler_list.item(i)
         end
      end

feature {}
   basic_create is
      require
         name = Void
      do
         -- Create buffers:
         create name.make(8)
         create buf_c_compiler_path.make(16)
         create buf_c_compiler_options.make(16)
         create buf_c_linker_path.make(16)
         create buf_c_linker_options.make(16)
         create buf_cpp_compiler_path.make(16)
         create buf_cpp_compiler_options.make(16)
         create buf_cpp_linker_path.make(16)
         create buf_cpp_linker_options.make(16)
         create buf_smarteiffel_options.make(16)
      end

   read_template is
         -- Reads the template into the keys of this C mode.
      local
         tmp: STRING; rc: INI_PARSER
      do
         set_c_compiler_path(Void)
         set_c_compiler_options(Void)
         set_c_linker_path(Void)
         set_c_linker_options(Void)
         set_cpp_compiler_path(Void)
         set_cpp_compiler_options(Void)
         set_cpp_linker_path(Void)
         set_cpp_linker_options(Void)
         set_smarteiffel_options(Void)

         c_same := False
         cpp_same := False

         rc := c_file
         c_compiler_type := system_tools.compiler_list.item(system_tools.compiler_list.first_index_of(rc.item(fz_conf_compiler_type)))
         if rc.section_has(name, fz_conf_compiler_path) then
            tmp := rc.section_item(name, fz_conf_compiler_path)
            set_c_compiler_path(tmp)
         end
         if rc.section_has(name, fz_conf_compiler_options) then
            tmp := rc.section_item(name, fz_conf_compiler_options)
            set_c_compiler_options(tmp)
         end
         if rc.section_has(name, fz_conf_linker_path) then
            tmp := rc.section_item(name, fz_conf_linker_path)
            set_c_linker_path(tmp)
         end
         if rc.section_has(name, fz_conf_linker_options) then
            tmp := rc.section_item(name, fz_conf_linker_options)
            set_c_linker_options(tmp)
         end
         if rc.section_has(name, fz_conf_smarteiffel_options) then
            tmp := rc.section_item(name, fz_conf_smarteiffel_options)
            set_smarteiffel_options(tmp)
         end
         c_same := c_compiler_options = c_linker_options
         if not c_same and then c_compiler_options /= Void and then c_linker_options /= Void then
            c_same := c_compiler_options.is_equal(c_linker_options)
         end

         rc := cpp_file
         if rc = Void then
            cpp_compiler_type := Void
         else
            cpp_compiler_type := system_tools.c_plus_plus_compiler_list.item(system_tools.c_plus_plus_compiler_list.first_index_of(rc.item(fz_conf_cpp_compiler_type)))
            if rc.section_has(name, fz_conf_cpp_compiler_path) then
               tmp := rc.section_item(name, fz_conf_cpp_compiler_path)
               set_cpp_compiler_path(tmp)
            end
            if rc.section_has(name, fz_conf_cpp_compiler_options) then
               tmp := rc.section_item(name, fz_conf_cpp_compiler_options)
               set_cpp_compiler_options(tmp)
            end
            if rc.section_has(name, fz_conf_cpp_linker_path) then
               tmp := rc.section_item(name, fz_conf_cpp_linker_path)
               set_cpp_linker_path(tmp)
            end
            if rc.section_has(name, fz_conf_cpp_linker_options) then
               tmp := rc.section_item(name, fz_conf_cpp_linker_options)
               set_cpp_linker_options(tmp)
            end
            cpp_same := cpp_compiler_options = cpp_linker_options
            if not cpp_same and then cpp_compiler_options /= Void and then cpp_linker_options /= Void then
               cpp_same := cpp_compiler_options.is_equal(cpp_linker_options)
            end
         end
      end

   buf_c_compiler_path: STRING

   buf_c_compiler_options: STRING

   buf_c_linker_path: STRING

   buf_c_linker_options: STRING

   buf_cpp_compiler_path: STRING

   buf_cpp_compiler_options: STRING

   buf_cpp_linker_path: STRING

   buf_cpp_linker_options: STRING

   buf_smarteiffel_options: STRING

   c_same: BOOLEAN

   cpp_same: BOOLEAN

feature {}
   execute_command (command: STRING): BOOLEAN is
      do
         check False end
      end

   compile_feedback (what_name: STRING; current_slice, max_slices: INTEGER) is
      do
         check False end
      end

invariant
   name /= Void

   c_compiler_type /= Void

   cpp_file /= Void implies cpp_compiler_type /= Void

end -- class C_MODE
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
