class SETTINGS
	-- The setting of wrappers-generator.

inherit
	SINGLETON
insert 
	FILE_TOOLS undefine is_equal, copy end
	BASIC_DIRECTORY undefine is_equal, copy end

creation {ANY}
	default_create

feature {ANY} -- Queries
	global: BOOLEAN

	verbose: BOOLEAN

	directory: STRING is "-" -- Default output is on current directory. May be overwritten.

	typedefs: STRING
	-- The name of the class containing typedef queries, empty queries
	-- named like typedefs, useful for anchored declarations (i.e.
	-- "gsize: INTEGER_32 is do end")

	last_error: STRING

feature {ANY} -- Setters
	set_verbose (a_value: BOOLEAN) is
		do
			verbose := a_value
		end
		

	set_global (a_value: BOOLEAN) is
		do
			global := a_value
		end

	set_directory (a_directory: STRING) is
		do
			directory := a_directory
		end
	
	set_typedefs (a_typedefs: STRING) is do typedefs:=a_typedefs end

	set_error (an_error: STRING) is
		do
			last_error := an_error
		end

end -- class SETTINGS

-- Copyright 2008,2009 Paolo Redaelli

-- eiffel-gcc-xml  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- eiffel-gcc-xml is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.
