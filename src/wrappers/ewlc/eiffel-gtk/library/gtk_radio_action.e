note
	description: "GtkRadioAction — An action of which only one in a group can be active."
	copyright: "[
					Copyright (C) 2006-2022: Paolo Redaelli, GTS team
					
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

			-- Description: A GtkRadioAction is similar to
			-- GtkRadioMenuItem. A number of radio actions can be linked
			-- together so that only one may be active at any one time.

class GTK_RADIO_ACTION

inherit
	GTK_TOGGLE_ACTION
		rename make as make_toggle
		redefine struct_size
		end

create {ANY} make, from_external_pointer

feature {ANY}  -- Creation
	make  (a_name, a_label, a_tooltip, a_stock_id: STRING; a_value: INTEGER)
			-- Creates a new GtkRadioAction object. To add the action to
			-- a GtkActionGroup and set the accelerator for the action,
			-- call `GTK_ACTION_GROUP.add_action_with_accel'.
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_radio_action_new (a_name.to_external, a_label.to_external,
																		a_tooltip.to_external, a_stock_id.to_external, a_value))
		end
feature {ANY}
	group: G_SLIST [GTK_RADIO_ACTION]
			-- the list representing the radio group for this
			-- object. Note that the returned list is only valid until
			-- the next change to the group.

			-- TODO: Eiffelize this example
			-- A common way to set up a group of radio group is the following:
		
			--   GSList *group = NULL;
			--   GtkRadioAction *action;
		
			--   while (/* more actions to add */) {
			--        action = gtk_radio_action_new (...);
			--        gtk_radio_action_set_group (action, group);
			--        group = gtk_radio_action_get_group (action);
			--   }
		do
			create {G_OBJECT_SLIST[GTK_RADIO_ACTION]} Result.from_external_pointer (gtk_radio_action_get_group(handle))
		end

	set_group (a_group: G_SLIST [GTK_RADIO_ACTION])
			-- Sets the radio group for the radio action object.
		do
			gtk_radio_action_set_group (handle,a_group.handle)
		end	

	current_value: INTEGER
			-- the value of the currently active member of the group to which action belongs.
		do
			Result := gtk_radio_action_get_current_value(handle)
		end

feature {ANY} -- Properties

--   "group"                GtkRadioAction        : Write
--   "value"                gint                  : Read / Write

-- Signals

-- "changed"   void        user_function      (GtkRadioAction *action,
--                                             GtkRadioAction *current,
--                                             gpointer        user_data)      : Run first / No recursion

-- Property Details
-- The "group" property

--   "group"                GtkRadioAction        : Write

-- Sets a new group for a radio action.

-- Since 2.4
-- The "value" property

--   "value"                gint                  : Read / Write

-- The value is an arbitrary integer which can be used as a convenient way to determine which action in the group is currently active in an ::activate or ::changed signal handler. See gtk_radio_action_get_current_value() and GtkRadioActionEntry for convenient ways to get and set this property.

-- Default value: 0

-- Since 2.4
-- Signal Details
-- The "changed" signal

-- void        user_function                  (GtkRadioAction *action,
--                                             GtkRadioAction *current,
--                                             gpointer        user_data)      : Run first / No recursion

-- The ::changed signal is emitted on every member of a radio group when the active member is changed. The signal gets emitted after the ::activate signals for the previous and current active members.

-- action : 	the action on which the signal is emitted
-- current : 	the member of actions group which has just been activated
-- user_data : 	user data set when the signal handler was connected.

-- Since 2.4
feature {ANY} -- size

	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkRadioAction)"
		end

feature {} -- External calls
	gtk_radio_action_new (name_str,label_str,tooltip_str,stock_id_str: POINTER; a_value: INTEGER): POINTER is -- GtkRadioAction*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_radio_action_get_group      (an_action: POINTER): POINTER is -- GSList*   
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_action_set_group      (an_action, gslist_group: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_radio_action_get_current_value (an_action: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
end -- class GTK_RADIO_ACTION
