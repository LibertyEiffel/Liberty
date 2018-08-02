note
	description: "External calls for G_ERROR"
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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
	date: "$Date:$"
	revision "$REvision:$"

deferred class G_ERROR_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_error_get_code (a_error: POINTER): INTEGER
		external "C struct GError get code use <glib.h>"
		end

	g_error_get_domain (a_error: POINTER): INTEGER
		external "C struct GError get domain use <glib.h>"
		end

	g_error_get_message (a_error: POINTER): POINTER
		external "C struct GError get message use <glib.h>"
		end

	g_error_matches (a_error: POINTER; a_domain, a_code: INTEGER): INTEGER
		external "C use <glib.h>"
		end

	g_error_free (a_error: POINTER)
		external "C use <glib.h>"
		end

	g_error_new_literal (a_domain, a_code: INTEGER; a_message: POINTER): POINTER
		external "C use <glib.h>"
		end

end -- class G_ERROR_EXTERNALS
