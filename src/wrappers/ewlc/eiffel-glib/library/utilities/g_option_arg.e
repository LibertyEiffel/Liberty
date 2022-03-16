note
	description: "GOptionArg enum"
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, Glib developers.
					
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

expanded class G_OPTION_ARG
	-- The GOptionArg enum values determine which type of extra
	-- argument the options expect to find. If an option expects an
	-- extra argument, it can be specified in several ways; with a
	-- short option: -x arg, with a long option: --name arg or combined
	-- in a single argument: --name=arg.

insert ENUM 

create {ANY} default_create

feature {ANY}
	default_create, set_none
			-- No extra argument. This is useful for simple flags.
		do
			value:=g_option_arg_none
		end
	
	set_string
			-- The option takes a string argument.
		do
			value:=g_option_arg_string
		end
	
	set_integer
			-- The option takes an integer argument.
		do
			value:=g_option_arg_int
		end

	set_callback
			-- The option provides a callback to parse the extra argument.
		do
			value:=g_option_arg_callback
		end

	set_filename
			-- The option takes a filename as argument.
		do
			value:=g_option_arg_filename
		end

	set_string_array
			-- the option takes a string argument, multiple uses of the option are collected into an array of strings.
		do
			value:=g_option_arg_string_array
		end

	set_filename_array
			-- The option takes a filename as argument, multiple uses of the option are collected into an array of strings.
		do
			value:=g_option_arg_filename_array
		end

	set_real
			-- The option takes a REAL double argument. The argument can be formatted either for the user's locale or for the "C" locale. Since 2.12
		do
			value:=g_option_arg_double
		end

	set_integer_64
			-- The option takes a 64-bit integer. Like G_OPTION_ARG_INT but for larger numbers. The number can be in decimal base, or in hexadecimal (when prefixed with 0x, for example, 0xffffffff). Since 2.12
		do
			value:=g_option_arg_int64
		end


feature {ANY} -- Queries
	is_none: BOOLEAN do Result := (value=g_option_arg_none) end
	is_string: BOOLEAN do Result := (value=g_option_arg_string) end
	is_integer: BOOLEAN do Result := (value=g_option_arg_int) end
	is_callback: BOOLEAN do Result := (value=g_option_arg_callback) end
	is_filename: BOOLEAN do Result := (value=g_option_arg_filename) end
	is_string_array: BOOLEAN do Result := (value=g_option_arg_string_array) end
	is_filename_array: BOOLEAN do Result := (value=g_option_arg_filename_array) end
	is_real: BOOLEAN do Result := (value=g_option_arg_double) end
	is_integer_64: BOOLEAN do Result := (value=g_option_arg_int64) end

feature {WRAPPER_HANDLER} -- enum
	is_valid_value (a_value: INTEGER): BOOLEAN
		do	
			Result:=((a_value = g_option_arg_none) or else
						(a_value = g_option_arg_string) or else
						(a_value = g_option_arg_int) or else
						(a_value = g_option_arg_callback) or else
						(a_value = g_option_arg_filename) or else
						(a_value = g_option_arg_string_array) or else
						(a_value = g_option_arg_filename_array) or else
						(a_value = g_option_arg_double) or else
						(a_value = g_option_arg_int64))
		end

	g_option_arg_none: INTEGER
			-- No extra argument. This is useful for simple flags.
		external "C macro use <glib.h>"
		alias "G_OPTION_ARG_NONE"
		end

	g_option_arg_string: INTEGER
			-- The option takes a string argument.
		external "C macro use <glib.h>"
		alias "G_OPTION_ARG_STRING"
		end

	g_option_arg_int: INTEGER
			-- The option takes an integer argument.
		external "C macro use <glib.h>"
		alias "G_OPTION_ARG_INT"
		end

	g_option_arg_callback: INTEGER
			-- The option provides a callback to parse the ext
		external "C macro use <glib.h>"
		alias "G_OPTION_ARG_CALLBACK"
		end

	g_option_arg_filename: INTEGER
			-- The option takes a filename as argument.
		external "C macro use <glib.h>"
		alias "G_OPTION_ARG_FILENAME"
		end

	g_option_arg_string_array: INTEGER
			-- The option takes a string argument, multiple uses of the
			-- option are collected into an array of strings.
		external "C macro use <glib.h>"
		alias "G_OPTION_ARG_STRING_ARRAY"
		end

	g_option_arg_filename_array: INTEGER
			-- The option takes a filename as argument, multiple uses of
			-- the option are collected into an array of strings.
		external "C macro use <glib.h>"
		alias "G_OPTION_ARG_FILENAME_ARRAY"
		end

	g_option_arg_double: INTEGER
			-- The option takes a double argument. The argument can be
			-- formatted either for the user's locale or for the "C"
			-- locale.
		external "C macro use <glib.h>"
		alias "G_OPTION_ARG_DOUBLE"
		end

	g_option_arg_int64: INTEGER
			-- The option takes a 64-bit integer. Like `g_option_arg_int'
			-- but for larger numbers. The number can be in decimal base,
			-- or in hexadecimal (when prefixed with 0x, for example,
			-- 0xffffffff).
		external "C macro use <glib.h>"
		alias "G_OPTION_ARG_INT64"
		end
end
