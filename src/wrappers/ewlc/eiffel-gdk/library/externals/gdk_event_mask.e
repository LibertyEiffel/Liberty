note
	description: "Enum GdkEventMask"
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team, Anthony Lenton
					
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

	-- A set of bit-flags to indicate which events a window is to receive.
	-- Most of these masks map onto one or more of the GdkEventType event
	-- types.

deferred class GDK_EVENT_MASK

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gdk_event_mask (an_event_mask: INTEGER) : BOOLEAN
		do
			Result := an_event_mask.bit_and (gdk_all_events_mask.bit_not) = 0
		end

	gdk_exposure_mask: INTEGER
			-- receive expose events
		external "C macro use <gdk/gdk.h>"
		alias "GDK_EXPOSURE_MASK"
		end

	gdk_pointer_motion_mask: INTEGER
			-- receive all pointer motion events
		external "C macro use <gdk/gdk.h>"
		alias "GDK_POINTER_MOTION_MASK"
		end

	gdk_pointer_motion_hint_mask: INTEGER
			-- GDK_POINTER_MOTION_HINT_MASK is a special mask which is used to
			-- reduce the number of GDK_MOTION_NOTIFY events received. Normally
			-- a GDK_MOTION_NOTIFY event is received each time the mouse moves.
			-- However, if the application spends a lot of time processing the
			-- event (updating the display, for example), it can easily lag
			-- behind the position of the mouse. When using the
			-- GDK_POINTER_MOTION_HINT_MASK the server will only send a single
			-- GDK_MOTION_NOTIFY event (which is marked as a hint) until the
			-- application asks for more, by calling gdk_window.get_pointer(). 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_POINTER_MOTION_HINT_MASK"
		end

	gdk_button_motion_mask: INTEGER
			-- receive pointer motion events while any button is pressed
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BUTTON_MOTION_MASK"
		end

	gdk_button1_motion_mask: INTEGER
			-- receive pointer motion events while 1 button is pressed
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BUTTON1_MOTION_MASK"
		end

	gdk_button2_motion_mask: INTEGER
			-- receive pointer motion events while 2 button is pressed
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BUTTON2_MOTION_MASK"
		end

	gdk_button3_motion_mask: INTEGER
			-- receive pointer motion events while 3 button is pressed
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BUTTON3_MOTION_MASK"
		end

	gdk_button_press_mask: INTEGER
			-- receive button press events
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BUTTON_PRESS_MASK"
		end

	gdk_button_release_mask: INTEGER
			-- receive button release events
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BUTTON_RELEASE_MASK"
		end

	gdk_key_press_mask: INTEGER
			-- receive key press events
		external "C macro use <gdk/gdk.h>"
		alias "GDK_KEY_PRESS_MASK"
		end

	gdk_key_release_mask: INTEGER
			-- receive key release events 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_KEY_RELEASE_MASK"
		end

	gdk_enter_notify_mask: INTEGER
			-- receive window enter events
		external "C macro use <gdk/gdk.h>"
		alias "GDK_ENTER_NOTIFY_MASK"
		end

	gdk_leave_notify_mask: INTEGER
			-- receive window leave events
		external "C macro use <gdk/gdk.h>"
		alias "GDK_LEAVE_NOTIFY_MASK"
		end

	gdk_focus_change_mask: INTEGER
			-- receive focus change events
		external "C macro use <gdk/gdk.h>"
		alias "GDK_FOCUS_CHANGE_MASK"
		end

	gdk_structure_mask: INTEGER
			-- receive events about window configuration change 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_STRUCTURE_MASK"
		end

	gdk_property_change_mask: INTEGER
			-- receive property change events
		external "C macro use <gdk/gdk.h>"
		alias "GDK_PROPERTY_CHANGE_MASK"
		end

	gdk_visibility_notify_mask: INTEGER
			-- receive visibility change events
		external "C macro use <gdk/gdk.h>"
		alias "GDK_VISIBILITY_NOTIFY_MASK"
		end

	gdk_proximity_in_mask: INTEGER
			-- receive proximity in events
		external "C macro use <gdk/gdk.h>"
		alias "GDK_PROXIMITY_IN_MASK"
		end

	gdk_proximity_out_mask: INTEGER
			-- receive proximity out events
		external "C macro use <gdk/gdk.h>"
		alias "GDK_PROXIMITY_OUT_MASK"
		end

	gdk_substructure_mask: INTEGER
			-- receive events about window configuration changes of child windows
		external "C macro use <gdk/gdk.h>"
		alias "GDK_SUBSTRUCTURE_MASK"
		end

	gdk_scroll_mask: INTEGER
			-- receive scroll events
		external "C macro use <gdk/gdk.h>"
		alias "GDK_SCROLL_MASK"
		end

	gdk_all_events_mask: INTEGER
			-- the combination of all the above event masks.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_ALL_EVENTS_MASK"
		end

end -- GDK_EVENT_MASK
