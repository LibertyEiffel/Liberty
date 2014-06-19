class SETTINGS
	-- The setting of wrappers-generator.

inherit
	SINGLETON
insert 
		FILE_TOOLS undefine _equal, copy end
		BASIC_DIRECTORY undefine _equal, copy end

feature {ANY} -- Queries
	global: BOOLEAN

	verbose: BOOLEAN

	directory: STRING is "." -- Default output is on current directory. May be overwritten.

	typedefs: STRING
	-- The name of the class containing typedef queries, empty queries
	-- named like typedefs, useful for anchored declarations (i.e.
	-- "gsize: INTEGER_32 is do end")

	standard_typedefs_class: STRING
	-- The name of the class containing the typedefs defined in the C99 standard

	are_standard_typedefs_emitted: BOOLEAN 
		-- Are the C99 standard typedefs and those of types with non-constant size emitted?

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

-- 	set_directory (a_directory: STRING)
-- 		do
-- 			directory := a_directory
-- 		end
	
	set_typedefs (a_typedefs: STRING)  do typedefs:=a_typedefs end

	set_standard_typedefs (a_class_name: STRING)  do standard_typedefs_class:=a_class_name end
	use_standard_typedefs  do are_standard_typedefs_emitted := True end
	unset_use_standard_typedefs  do are_standard_typedefs_emitted := False end

	set_error (an_error: STRING)
		do
			last_error := an_error
		end

end -- class SETTINGS

-- Copyright 2008,2009 Paolo Redaelli

-- eiffel-gcc-xml  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as publhed by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- eiffel-gcc-xml is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- th program.  If not, see <http://www.gnu.org/licenses/>.
