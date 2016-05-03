note
	description: "enum GKeyFileFlags"
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, Glib developers
					
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

deferred class G_KEY_FILE_FLAGS
   -- Flags which influence the parsing of a G_KEY_FILE
	
inherit ANY undefine is_equal, copy end

feature {} -- enum
	are_valid_flags (some_flags: INTEGER): BOOLEAN is
		do	
			Result:=(some_flags & (g_key_file_none |
										  g_key_file_keep_comments  |
										  g_key_file_keep_translations)).to_boolean
		end

   g_key_file_none: INTEGER is
			-- No flags, default behaviour
		external "C macro use <glib.h>"
		alias "G_KEY_FILE_NONE"
		end

   g_key_file_keep_comments: INTEGER is
			-- Use this flag if you plan to write the (possibly modified)
			-- contents of the key file back to a file; otherwise all
			-- comments will be lost when the key file is written back.
		external "C macro use <glib.h>"
		alias "G_KEY_FILE_KEEP_COMMENTS"
		end

   g_key_file_keep_translations: INTEGER is
			-- Use this flag if you plan to write the (possibly modified)
			-- contents of the key file back to a file; otherwise only
			-- the translations for the current language will be written
			-- back.
		external "C macro use <glib.h>"
		alias "G_KEY_FILE_KEEP_TRANSLATIONS"
		end
end
