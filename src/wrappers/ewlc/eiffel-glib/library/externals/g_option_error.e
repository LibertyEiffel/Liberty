note
	description: "Enum "
	copyright: "[
					Copyright (C) 2007-2017: $EWLC_developer, $original_copyright_holder
					
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

deferred class G_OPTION_ERROR
	--    Error codes returned by option parsing.
inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_option_error (an_error: INTEGER): BOOLEAN
		do	
			Result:=((an_error = g_option_error_unknown_option) or else
						(an_error = g_option_error_bad_value) or else
						(an_error = g_option_error_failed))
		end
	

	g_option_error_unknown_option: INTEGER
			-- An option was not known to the parser. This error will
			-- only be reported, if the parser hasn't been instructed to
			-- ignore unknown options, see
			-- g_option_context_set_ignore_unknown_options().
		external "C macro use <glib.h>"
		alias "G_OPTION_ERROR_UNKNOWN_OPTION"
		end

	
	g_option_error_bad_value: INTEGER
			-- A value couldn't be parsed.
		external "C macro use <glib.h>"
		alias "G_OPTION_ERROR_BAD_VALUE"
		end

	g_option_error_failed: INTEGER
			-- A GOptionArgFunc callback failed.
		external "C macro use <glib.h>"
		alias "G_OPTION_ERROR_FAILED"
		end

end
