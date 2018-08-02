note
	description: "."
	copyright: "[
					Copyright (C) 2008-2018: Paolo Redaelli					
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

expanded class GDK_EVENT_FACTORY

insert 
	WRAPPER_FACTORY[GDK_EVENT]
	GDK_EVENT_TYPE
	GDK_EVENT_EXTERNALS
	EXCEPTIONS

feature {ANY}
	wrapper (an_event_pointer: POINTER): GDK_EVENT
		local a_type: INTEGER
		do
			a_type:=gdk_event_type(an_event_pointer)
			if     a_type = gdk_event_nothing then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_delete then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_destroy then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_expose then 
				create {GDK_EVENT_EXPOSE} Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_motion_notify then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_button_press or a_type = gdk_event_2button_press or
				a_type = gdk_event_3button_press or a_type = gdk_event_button_release then 
				create {GDK_EVENT_BUTTON} Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_key_press then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_key_release then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_enter_notify or a_type = gdk_event_leave_notify then
				create {GDK_EVENT_CROSSING} Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_focus_change then 
				create {GDK_EVENT_FOCUS} Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_configure then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_map then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_unmap then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_property_notify then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_selection_clear then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_selection_request then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_selection_notify then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_proximity_in then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_proximity_out then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_drag_enter then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_drag_leave then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_drag_motion then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_drag_status then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_drop_start then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_drop_finished then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_client_event then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_visibility_notify then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_no_expose then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_scroll then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_window_state then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_setting then  create Result.from_external_pointer(an_event_pointer)
			elseif a_type = gdk_event_owner_change then  create Result.from_external_pointer(an_event_pointer)
			else raise("Unknown GdkEvent type")
			end
		end
end
