class SETTINGS
	-- The setting of eiffel-gcc-xml.

inherit
	SINGLETON
insert 
	FILE_TOOLS
creation {ANY}
	default_create

feature {ANY} -- Queries
	global: BOOLEAN

	verbose: BOOLEAN

	directory: STRING

	are_naturals_used: BOOLEAN

	patches_are_appliable: BOOLEAN

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

	use_naturals is
		do
			are_naturals_used := True
		end

	use_integers is
		do
			are_naturals_used := False
		end

	apply_patches is
		do
			patches_are_appliable := True
		end

	do_not_apply_patches is
		do
			patches_are_appliable:=False
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
