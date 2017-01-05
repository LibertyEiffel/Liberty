note
	description: "Enum "
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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


deferred class GDK_WINDOW_HINTS
	-- Used to indicate which fields of a GdkGeometry struct should be
	-- paid attention to. Also, the presence/absence of `gdk_hint_pos',
	-- `gdk_hint_user_pos', and `gdk_hint_user_size' is significant,
	-- though they don't directly refer to `GDK_GEOMETRY_STRUCT' (TODO)
	-- fields. `gdk_hint_user_pos' will be set automatically by
	-- GtkWindow if you call GTK_WINDOW's `move'. `gdk_hint_user_pos'
	-- and `gdk_hint_user_size' should be set if the user specified a
	-- size/position using a --geometry command-line argument;
	-- GTK_WINDOW's `parse_geometry' (TODO) automatically sets these
	-- flags.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_window_hint (an_hint :INTEGER): BOOLEAN
		do	
			Result:=((an_hint = gdk_hint_pos) or else
						(an_hint = gdk_hint_min_size) or else
						(an_hint = gdk_hint_max_size) or else
						(an_hint = gdk_hint_base_size) or else
						(an_hint = gdk_hint_aspect) or else
						(an_hint = gdk_hint_resize_inc) or else
						(an_hint = gdk_hint_win_gravity) or else
						(an_hint = gdk_hint_user_pos) or else
						(an_hint = gdk_hint_user_size))
		end

	gdk_hint_pos: INTEGER
			-- indicates that the program has positioned the window
		external "C macro use <gdk/gdk.h>"
		alias "GDK_HINT_POS"
		end

	gdk_hint_min_size: INTEGER
			-- min size fields are set
		external "C macro use <gdk/gdk.h>"
		alias "GDK_HINT_MIN_SIZE"
		end

	gdk_hint_max_size: INTEGER
			-- max size fields are set
		external "C macro use <gdk/gdk.h>"
		alias "GDK_HINT_MAX_SIZE"
		end

	gdk_hint_base_size: INTEGER
			-- base size fields are set
		external "C macro use <gdk/gdk.h>"
		alias "GDK_HINT_BASE_SIZE"
		end

	gdk_hint_aspect: INTEGER
			-- aspect ratio fields are set
		external "C macro use <gdk/gdk.h>"
		alias "GDK_HINT_ASPECT"
		end

	gdk_hint_resize_inc: INTEGER
			-- resize increment fields are set
		external "C macro use <gdk/gdk.h>"
		alias "GDK_HINT_RESIZE_INC"
		end

	gdk_hint_win_gravity: INTEGER
			-- window gravity field is set
		external "C macro use <gdk/gdk.h>"
		alias "GDK_HINT_WIN_GRAVITY"
		end

	gdk_hint_user_pos: INTEGER
			-- indicates that the window's position was explicitly set by the user
		external "C macro use <gdk/gdk.h>"
		alias "GDK_HINT_USER_POS"
		end

	gdk_hint_user_size: INTEGER
			-- indicates that the window's size was explicitly set by the user
		external "C macro use <gdk/gdk.h>"
		alias "GDK_HINT_USER_SIZE"
		end

end
