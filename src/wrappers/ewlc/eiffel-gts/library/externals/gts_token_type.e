note
	description: "Enum GTS_TOKEN_TYPE"
	copyright: "[
					Copyright (C) 2006-2022: Paolo Redaelli, GTS team
					
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

deferred class GTS_TOKEN_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_token (a_token: INTEGER): BOOLEAN
		do	
			Result:=((a_token = gts_none) or else
						(a_token = gts_int) or else
						(a_token = gts_uint) or else
						(a_token = gts_float) or else
						(a_token = gts_double) or else
						(a_token = gts_string) or else
						(a_token = gts_file) or else
						(a_token = gts_error))
		end
	
   gts_none: INTEGER
			-- GTS_NONE = 1 < < 8
		external "C macro use <gts.h>"
		alias "GTS_NONE"
		end

   gts_int: INTEGER
			-- GTS_INT = 1 < < 9
		external "C macro use <gts.h>"
		alias "GTS_INT"
		end

   gts_uint: INTEGER
			-- GTS_UINT = 1 < < 10
		external "C macro use <gts.h>"
		alias "GTS_UINT"
		end

   gts_float: INTEGER
			-- GTS_FLOAT = 1 < < 11
		external "C macro use <gts.h>"
		alias "GTS_FLOAT"
		end

   gts_double: INTEGER
			-- GTS_DOUBLE = 1 < < 12
		external "C macro use <gts.h>"
		alias "GTS_DOUBLE"
		end

   gts_string: INTEGER
			-- GTS_STRING = 1 < < 13
		external "C macro use <gts.h>"
		alias "GTS_STRING"
		end

   gts_file: INTEGER
			-- GTS_FILE = 1 < < 14
		external "C macro use <gts.h>"
		alias "GTS_FILE"
		end

   gts_error: INTEGER
			-- GTS_ERROR = 1 < < 15
		external "C macro use <gts.h>"
		alias "GTS_ERROR"
		end
end
