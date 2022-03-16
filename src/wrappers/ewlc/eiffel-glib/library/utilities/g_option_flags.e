note
	description: "Enum "
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, Glib developers
					
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

deferred class G_OPTION_FLAGS
	-- Flags which modify individual options in G_OPTION_GROUP
inherit ANY undefine is_equal, copy end

feature {} -- enum
	are_valid_flags (some_flags: INTEGER): BOOLEAN
		do	
			Result:=(some_flags & (g_option_flag_hidden |
										  g_option_flag_in_main |
										  g_option_flag_reverse |
										  g_option_flag_no_arg |
										  g_option_flag_filename |
										  g_option_flag_optional_arg |
										  g_option_flag_noalias)).to_boolean
		end

   g_option_flag_hidden: INTEGER
			-- The option doesn't appear in --help output.
		external "C macro use <glib.h>"
		alias "G_OPTION_FLAG_HIDDEN"
		end

   g_option_flag_in_main: INTEGER
			-- The option appears in the main section of the --help
			-- output, even if it is defined in a group.
		external "C macro use <glib.h>"
		alias "G_OPTION_FLAG_IN_MAIN"
		end

   g_option_flag_reverse: INTEGER
			-- For options of the G_OPTION_ARG_NONE kind, this flag
			-- indicates that the sense of the option is reversed.
		external "C macro use <glib.h>"
		alias "G_OPTION_FLAG_REVERSE"
		end

   g_option_flag_no_arg: INTEGER
			-- For options of the G_OPTION_ARG_CALLBACK kind, this flag
			-- indicates that the callback does not take any argument
			-- (like a G_OPTION_ARG_NONE option). Since 2.8
		external "C macro use <glib.h>"
		alias "G_OPTION_FLAG_NO_ARG"
		end

   g_option_flag_filename: INTEGER
			-- For options of the G_OPTION_ARG_CALLBACK kind, this flag
			-- indicates that the argument should be passed to the
			-- callback in the GLib filename encoding rather than
			-- UTF-8. Since 2.8
		external "C macro use <glib.h>"
		alias "G_OPTION_FLAG_FILENAME"
		end

   g_option_flag_optional_arg: INTEGER
			-- For options of the G_OPTION_ARG_CALLBACK kind, this flag
			-- indicates that the argument supply is optional.  If no
			-- argument is given then data of GOptionParseFunc will be
			-- set to NULL. Since 2.8
		external "C macro use <glib.h>"
		alias "G_OPTION_FLAG_OPTIONAL_ARG"
		end

   g_option_flag_noalias: INTEGER
			-- This flag turns off the automatic conflict resolution
			-- which prefixes long option names with groupname- if there
			-- is a conflict. This option should only be used in
			-- situations where aliasing is necessary to model some
			-- legacy commandline interface. It is not safe to use this
			-- option, unless all option groups are under your direct
			-- control. Since 2.8.
		external "C macro use <glib.h>"
		alias "G_OPTION_FLAG_NOALIAS"
		end
end

