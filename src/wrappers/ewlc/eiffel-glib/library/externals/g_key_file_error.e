note
	description: "Enum "
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"

deferred class G_KEY_FILE_ERROR
	-- Error codes returned by key file parsing.
	
inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_key_file_error (an_error: INTEGER): BOOLEAN
		do	
			Result:=((an_error =g_key_file_error_unknown_encoding) or else
						(an_error =g_key_file_error_parse) or else
						(an_error =g_key_file_error_not_found) or else
						(an_error =g_key_file_error_key_not_found) or else
						(an_error =g_key_file_error_group_not_found) or else
						(an_error =g_key_file_error_invalid_value))
		end
	
   g_key_file_error_unknown_encoding: INTEGER
			-- the text being parsed was in an unknown encoding
		external "C macro use <glib.h>"
		alias "G_KEY_FILE_ERROR_UNKNOWN_ENCODING"
		end

   g_key_file_error_parse: INTEGER
			-- document was ill-formed
		external "C macro use <glib.h>"
		alias "G_KEY_FILE_ERROR_PARSE"
		end

   g_key_file_error_not_found: INTEGER
			-- the file was not found
		external "C macro use <glib.h>"
		alias "G_KEY_FILE_ERROR_NOT_FOUND"
		end

   g_key_file_error_key_not_found: INTEGER
			-- a requested key was not found
		external "C macro use <glib.h>"
		alias "G_KEY_FILE_ERROR_KEY_NOT_FOUND"
		end

   g_key_file_error_group_not_found: INTEGER
			-- a requested group was not found
		external "C macro use <glib.h>"
		alias "G_KEY_FILE_ERROR_GROUP_NOT_FOUND"
		end

   g_key_file_error_invalid_value: INTEGER
			-- a value could not be parsed
		external "C macro use <glib.h>"
		alias "G_KEY_FILE_ERROR_INVALID_VALUE"
		end
end
