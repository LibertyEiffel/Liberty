note
	description: "GtkToggleAction — An action which can be toggled between two states"
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

			-- Description: A GtkToggleAction corresponds roughly to a
			-- GtkCheckMenuItem. It has an "active" state specifying
			-- whether the action has been checked or not.

class GTK_TOGGLE_ACTION

inherit GTK_ACTION redefine make, struct_size end

create {ANY} from_external_pointer

feature {} -- Creation
	make (a_name, a_label, a_tooltip, a_stock_id: STRING)
			-- Creates a new GtkToggleAction object. To add the action to
			-- a GtkActionGroup and set the accelerator for the action,
			-- call `GTK_ACTION_GROUP.add_action_with_accel'.

			-- `a_name' A unique name for the action; `a_label' the label
			-- displayed in menu items and on buttons; `a_tooltip' a
			-- tooltip for the action; `a_stock_id' the stock icon to
			-- display in widgets representing the action
		do
			from_external_pointer (gtk_toggle_action_new (a_name.to_external, a_label.to_external,
																		 a_tooltip.to_external,a_stock_id.to_external))
		end

feature {ANY}
	action_toggled
			-- Emits the "toggled" signal on the toggle action.
		do
			gtk_toggle_action_toggled (handle)
		end

	set_active
			-- Sets the checked state on the toggle action.
		do
			gtk_toggle_action_set_active (handle, 1)
		ensure active: is_active
		end

	set_inactive
			-- Sets the checked state on the toggle action to inactive.
		do
			gtk_toggle_action_set_active (handle, 0)
		ensure inactive: not is_active
		end

	is_active: BOOLEAN
			-- Is toggle action checked?
		do
			Result:=gtk_toggle_action_get_active(handle).to_boolean
		end

	
	draw_as_radio
			-- the action should have proxies like a radio action. TODO: 
			-- provide a better description.
		do
			gtk_toggle_action_set_draw_as_radio (handle,1)
		ensure drawn_as_radio: is_drawn_as_radio
		end

	undraw_as_radio
			-- the action should not have proxies like a radio
			-- action. TODO: provide a better description.
		do
			gtk_toggle_action_set_draw_as_radio (handle,0)
		ensure not_drawn_as_radio: not is_drawn_as_radio
		end

	is_drawn_as_radio: BOOLEAN
			-- Should the action have proxies like a radio action?
		do
			Result:=gtk_toggle_action_get_draw_as_radio(handle).to_boolean
		end

feature {ANY} -- TODO: The "toggled" signal

-- void        user_function                  (GtkToggleAction *toggleaction,
--                                             gpointer         user_data)         : Run first

-- toggleaction : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
feature {ANY} -- struct size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkToggleAction)"
		end
	
feature {} -- External calls
	gtk_toggle_action_new (name_str, label_str, tooltip_str, stock_id_str : POINTER): POINTER is --  GtkToggleAction*
		external "C use <gtk/gtk.h>"
		end

	gtk_toggle_action_toggled (toggle_action: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_toggle_action_set_active (toggle_action: POINTER; active_bool: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_toggle_action_get_active (toggle_action: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_toggle_action_set_draw_as_radio (toggle_action: POINTER; draw_as_radio_bool: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_toggle_action_get_draw_as_radio (toggle_action: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
end -- class GTK_TOGGLE_ACTION
