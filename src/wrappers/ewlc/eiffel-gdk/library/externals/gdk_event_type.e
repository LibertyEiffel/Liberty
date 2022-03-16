note
	description: "Enum GdkEventType: Specifies the type of the event."
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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

deferred class GDK_EVENT_TYPE
	-- Do not confuse these events with the signals that GTK+ widgets
	-- emit. Although many of these events result in corresponding
	-- signals being emitted, the events are often transformed or
	-- filtered along the way.

inherit ANY undefine is_equal, copy end

feature {} --  enum

	is_valid_gdk_event_type (an_event_type: INTEGER) : BOOLEAN
		do
			Result:=((an_event_type=gdk_event_nothing) or else
						(an_event_type=gdk_event_delete) or else
						(an_event_type=gdk_event_destroy) or else
						(an_event_type=gdk_event_expose) or else
						(an_event_type=gdk_event_motion_notify) or else
						(an_event_type=gdk_event_button_press) or else
						(an_event_type=gdk_event_2button_press) or else
						(an_event_type=gdk_event_3button_press) or else
						(an_event_type=gdk_event_button_release) or else
						(an_event_type=gdk_event_key_press) or else
						(an_event_type=gdk_event_key_release) or else
						(an_event_type=gdk_event_enter_notify) or else
						(an_event_type=gdk_event_leave_notify) or else
						(an_event_type=gdk_event_focus_change) or else
						(an_event_type=gdk_event_configure) or else
						(an_event_type=gdk_event_map) or else
						(an_event_type=gdk_event_unmap) or else
						(an_event_type=gdk_event_property_notify) or else
						(an_event_type=gdk_event_selection_clear) or else
						(an_event_type=gdk_event_selection_request) or else
						(an_event_type=gdk_event_selection_notify) or else
						(an_event_type=gdk_event_proximity_in) or else
						(an_event_type=gdk_event_proximity_out) or else
						(an_event_type=gdk_event_drag_enter) or else
						(an_event_type=gdk_event_drag_leave) or else
						(an_event_type=gdk_event_drag_motion) or else
						(an_event_type=gdk_event_drag_status) or else
						(an_event_type=gdk_event_drop_start) or else
						(an_event_type=gdk_event_drop_finished) or else
						(an_event_type=gdk_event_client_event) or else
						(an_event_type=gdk_event_visibility_notify) or else
						(an_event_type=gdk_event_no_expose) or else
						(an_event_type=gdk_event_scroll) or else
						(an_event_type=gdk_event_window_state) or else
						(an_event_type=gdk_event_setting) or else
--			         (an_event_type=gdk_event_grab_broken) or else
						(an_event_type=gdk_event_owner_change))
		end

	gdk_event_nothing: INTEGER
			-- a special code to indicate a null event.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_NOTHING"
		end

	gdk_event_delete: INTEGER
			-- the window manager has requested that the toplevel window
			-- be hidden or destroyed, usually when the user clicks on a
			-- special icon in the title bar.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_DELETE"
		end

	gdk_event_destroy: INTEGER
			-- the window has been destroyed.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_DESTROY"
		end

	gdk_event_expose: INTEGER
			-- all or part of the window has become visible and needs to be redrawn.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_EXPOSE"
		end

	gdk_event_motion_notify: INTEGER
			-- the pointer (usually a mouse) has moved.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_MOTION_NOTIFY"
		end

	gdk_event_button_press: INTEGER
			-- a mouse button has been pressed.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BUTTON_PRESS"
		end

	gdk_event_2button_press: INTEGER
			-- a mouse button has been double-clicked (clicked twice
			-- within a short period of time). Note that each click also
			-- generates a GDK_BUTTON_PRESS event.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_2BUTTON_PRESS"
		end

	gdk_event_3button_press: INTEGER
			-- a mouse button has been clicked 3 times in a short period
			-- of time. Note that each click also generates a
			-- GDK_BUTTON_PRESS event.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_3BUTTON_PRESS"
		end

	gdk_event_button_release: INTEGER
			-- a mouse button has been released.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BUTTON_RELEASE"
		end

	gdk_event_key_press: INTEGER
			-- a key has been pressed.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_KEY_PRESS"
		end

	gdk_event_key_release: INTEGER
			-- a key has been released.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_KEY_RELEASE"
		end

	gdk_event_enter_notify: INTEGER
			-- the pointer has entered the window.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_ENTER_NOTIFY"
		end

	gdk_event_leave_notify: INTEGER
			-- the pointer has left the window.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_LEAVE_NOTIFY"
		end

	gdk_event_focus_change: INTEGER
			--  the keyboard focus has entered or left the window.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_FOCUS_CHANGE"
		end

	gdk_event_configure: INTEGER
			-- the size, position or stacking order of the window has
			-- changed. Note that GTK+ discards these events for
			-- GDK_WINDOW_CHILD windows.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_CONFIGURE"
		end

	gdk_event_map: INTEGER
			-- the window has been mapped.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_MAP"
		end

	gdk_event_unmap: INTEGER
			-- the window has been unmapped.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_UNMAP"
		end

	gdk_event_property_notify: INTEGER
			-- a property on the window has been changed or deleted.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_PROPERTY_NOTIFY"
		end

	gdk_event_selection_clear: INTEGER
			-- the application has lost ownership of a selection.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_SELECTION_CLEAR"
		end

	gdk_event_selection_request: INTEGER
			-- another application has requested a selection.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_SELECTION_REQUEST"
		end

	gdk_event_selection_notify: INTEGER
			-- a selection has been received.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_SELECTION_NOTIFY"
		end

	gdk_event_proximity_in: INTEGER
			-- an input device has moved into contact with a sensing
			-- surface (e.g. a touchscreen or graphics tablet).
		external "C macro use <gdk/gdk.h>"
		alias "GDK_PROXIMITY_IN"
		end

	gdk_event_proximity_out: INTEGER
			-- an input device has moved out of contact with a sensing surface.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_PROXIMITY_OUT"
		end

	gdk_event_drag_enter: INTEGER
			-- the mouse has entered the window while a drag is in progress.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_DRAG_ENTER"
		end

	gdk_event_drag_leave: INTEGER
			-- the mouse has left the window while a drag is in progress.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_DRAG_LEAVE"
		end

	gdk_event_drag_motion: INTEGER
			-- the mouse has moved in the window while a drag is in progress.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_DRAG_MOTION"
		end

	gdk_event_drag_status: INTEGER
			-- the status of the drag operation initiated by the window has changed.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_DRAG_STATUS"
		end

	gdk_event_drop_start: INTEGER
			-- a drop operation onto the window has started.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_DROP_START"
		end

	gdk_event_drop_finished: INTEGER
			-- the drop operation initiated by the window has completed.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_DROP_FINISHED"
		end

	gdk_event_client_event: INTEGER
			-- a message has been received from another application.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_CLIENT_EVENT"
		end

	gdk_event_visibility_notify: INTEGER
			-- the window visibility status has changed.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_VISIBILITY_NOTIFY"
		end

	gdk_event_no_expose: INTEGER
			-- indicates that the source region was completely available
			-- when parts of a drawable were copied. This is not very
			-- useful.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_NO_EXPOSE"
		end

	gdk_event_scroll: INTEGER
			-- the scroll wheel was turned
		external "C macro use <gdk/gdk.h>"
		alias "GDK_SCROLL"
		end

	gdk_event_window_state: INTEGER
			-- the state of a window has changed. See GdkWindowState for the possible window states
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_STATE"
		end

	gdk_event_setting: INTEGER
			-- a setting has been modified.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_SETTING"
		end

	gdk_event_owner_change: INTEGER
			-- the owner of a selection has changed. This event type was added in 2.6
		external "C macro use <gdk/gdk.h>"
		alias "GDK_OWNER_CHANGE"
		end

---- Uncomment this if you need it, but it brakes if GTK is 2.6
--	gdk_event_grab_broken: INTEGER is
--			-- a pointer or keyboard grab was broken. This event type was added in 2.8.
--		external "C macro use <gdk/gdk.h>"
--		alias "GDK_GRAB_BROKEN"
--		end

end -- GDK_EVENT_TYPE
