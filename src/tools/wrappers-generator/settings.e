class SETTINGS
   -- The setting of wrappers-generator.

inherit
   SINGLETON

insert
   FILE_TOOLS
      undefine is_equal, copy
      end
   BASIC_DIRECTORY
      undefine is_equal, copy
      end

feature {ANY} -- Queries
   global: BOOLEAN

   verbose: BOOLEAN

   directory: STRING "."
         -- Default output is on current directory. May be overwritten.

   typedefs: STRING

   standard_typedefs_class: STRING

   are_standard_typedefs_emitted: BOOLEAN

   last_error: STRING

feature {ANY} -- Setters
   set_verbose (a_value: BOOLEAN)
      do
         verbose := a_value
      end

   set_global (a_value: BOOLEAN)
      do
         global := a_value
      end
      --      set_directory (a_directory: STRING)
      --              do
      --                      directory := a_directory
      --              end

   set_typedefs (a_typedefs: STRING)
      do
         typedefs := a_typedefs
      end

   set_standard_typedefs (a_class_name: STRING)
      do
         standard_typedefs_class := a_class_name
      end

   use_standard_typedefs
      do
         are_standard_typedefs_emitted := True
      end

   unset_use_standard_typedefs
      do
         are_standard_typedefs_emitted := False
      end

   set_error (an_error: STRING)
      do
         last_error := an_error
      end

end -- class SETTINGS

-- Copyright (C) 2008-2017: Paolo Redaelli
-- wrappers_generator is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as publhed by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.
-- eiffel-gcc-xml is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.
-- You should have received a copy of the GNU General Public License along with
-- th program.  If not, see <http://www.gnu.org/licenses/>.
