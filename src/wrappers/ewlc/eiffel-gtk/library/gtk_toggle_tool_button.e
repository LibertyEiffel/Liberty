note
	description: "GtkToggleToolButton - A GtkToolItem containing a toggle button."
	copyright: "[
					Copyright (C) 2006 Soluciones Informaticas Libres S.A.,
					eiffel-libraries team, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GTK_TOGGLE_TOOL_BUTTON

inherit
	GTK_TOOL_BUTTON
		redefine 
			make,
			from_stock
		end

insert
	GTK_TOGGLE_TOOL_BUTTON_EXTERNALS

create {ANY}
	from_external_pointer, make

feature {} -- Creation

	make is
		do
			from_external_pointer (gtk_toggle_tool_button_new)
		end
	
	from_stock (a_stock_id: STRING) is
		do
			from_external_pointer(gtk_toggle_tool_button_new_from_stock (a_stock_id.to_external))
		end

feature {ANY} -- Operations

	set_active (is_active: BOOLEAN) is
			-- Sets the status of the toggle tool button.
			-- Set to TRUE if you want the GtkToggleButton to be
			-- 'pressed in', and FALSE to raise it.
			-- This action causes the toggled signal to be emitted.
		do
			gtk_toggle_tool_button_set_active (handle, is_active.to_integer)
		end

	active: BOOLEAN is
			-- Queries a GtkToggleToolButton and returns its current state.
			-- Returns TRUE if the toggle button is pressed in
			-- and FALSE if it is raised.
		do
			Result := gtk_toggle_tool_button_get_active (handle).to_boolean
		end

feature {ANY} -- The "toggled" signal

	toggled_signal_name: STRING is "toggled"
		--void                user_function           (GtkToggleToolButton *toggle_tool_button,
		--                                             gpointer user_data);

	on_toggled is
			-- Built-in toggled signal handler; empty by design; redefine it.
		do
		end

	enable_on_toggled is
			-- Connects "toggled" signal to `on_toggled' feature.

			-- Emitted whenever the toggle tool button changes state..
		do
			connect (Current, toggled_signal_name, $on_toggled)
		end

	connect_agent_to_toggled_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_TOGGLE_TOOL_BUTTON]]) is
			-- togglebutton : 	the object which received the signal.
		require valid_procedure: a_procedure /= Void
		local toggled_callback: TOGGLED_CALLBACK [like Current]
		do
			create toggled_callback.make
			toggled_callback.connect (Current, a_procedure)
		end

end -- class GTK_TOGGLE_TOOL_BUTTON
