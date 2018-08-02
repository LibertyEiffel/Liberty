note
	description: "Enum "
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

deferred class GDK_WINDOW_CLASS

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_window_class (a_class: INTEGER): BOOLEAN
		do	
			Result:=((a_class = gdk_input_output) or else
						(a_class = gdk_input_only))
		end
	
	gdk_input_output: INTEGER
			-- windows are the standard kind of window you might
			-- expect. `gdk_input_only' windows are invisible; they are
			-- used to trap events, but you can't draw on them.

			-- window for graphics and events
		external "C macro use <gdk/gdk.h>"
		alias "GDK_INPUT_OUTPUT"
		end
	
	gdk_input_only: INTEGER
			-- window for events only
		external "C macro use <gdk/gdk.h>"
		alias "GDK_INPUT_ONLY"
		end
end
