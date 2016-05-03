note
	description: "Enum "
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

deferred class G_LOG_LEVEL_FLAGS_ENUM

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	are_valid_log_level_flags (some_flags :INTEGER): BOOLEAN is
		do	
			Result:=(some_flags & (g_log_flag_recursion |
										  g_log_flag_fatal |
										  g_log_level_error |
										  g_log_level_critical |
										  g_log_level_warning |
										  g_log_level_message |
										  g_log_level_info |
										  g_log_level_debug |
										  g_log_level_mask)).to_boolean
		end
	
	g_log_flag_recursion: INTEGER is
		external "C macro use <glib.h>"
		alias "G_LOG_FLAG_RECURSION"
		end

	g_log_flag_fatal: INTEGER is
		external "C macro use <glib.h>"
		alias "G_LOG_FLAG_FATAL"
		end

	g_log_level_error: INTEGER is
		external "C macro use <glib.h>"
		alias "G_LOG_LEVEL_ERROR"
		end

	g_log_level_critical: INTEGER is
		external "C macro use <glib.h>"
		alias "G_LOG_LEVEL_CRITICAL"
		end

	g_log_level_warning: INTEGER is
		external "C macro use <glib.h>"
		alias "G_LOG_LEVEL_WARNING"
		end

	g_log_level_message: INTEGER is
		external "C macro use <glib.h>"
		alias "G_LOG_LEVEL_MESSAGE"
		end

	g_log_level_info: INTEGER is
		external "C macro use <glib.h>"
		alias "G_LOG_LEVEL_INFO"
		end

	g_log_level_debug: INTEGER is
		external "C macro use <glib.h>"
		alias "G_LOG_LEVEL_DEBUG"
		end

	g_log_level_mask: INTEGER is
			-- GLib log levels that are considered fatal by default.
		external "C macro use <glib.h>"
		alias "G_LOG_LEVEL_MASK"
		end

	g_log_fatal_mask: INTEGER is
			-- #define G_LOG_FATAL_MASK
		external "C macro use <glib.h>"
		alias "G_LOG_FATAL_MASK"
		end

	g_log_level_user_shift: INTEGER is
			-- #define G_LOG_LEVEL_USER_SHIFT
		external "C macro use <glib.h>"
		alias "G_LOG_LEVEL_USER_SHIFT"
		end
end
