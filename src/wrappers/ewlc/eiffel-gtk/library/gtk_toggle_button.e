note
	description: "."
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
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_TOGGLE_BUTTON
	-- A GtkToggleButton is a GtkButton which will remain 'pressed-in' when
	-- clicked. Clicking again will cause the toggle button to return to its
	-- normal state.

	-- A toggle button is created by calling either `make' or `with_label'. If
	-- using the former, it is advisable to pack a widget, (such as a GtkLabel
	-- and/or a GtkPixmap), into the toggle button's container. (See GtkButton
	-- for more information).

	-- The state of a GtkToggleButton can be set specifically using `set_active,'
	-- and retrieved using `is_active'.

	-- To simply switch the state of a toggle button, use `toggled'.
	
	-- Example 2. Creating two GtkToggleButton widgets.

	-- dialog: GTK_DIALOG
	-- toggle1,toggle2: GTK_TOGGLE_BUTTON
	
	-- make_toggles is
	--   do

	--     create dialog.make
	--     create toggle1.with_label ("Hi, i'm a toggle button.")
	
	--    -- Makes this toggle button invisible
	--    toggle1.draw_indicator 

	--    -- toggle1.connect_to_toggled_signal (--TODO)
	--    dialog.action_area.pack_start (toggle1, False, False, 2)
	
	--    create toggle2.with_label ("Hi, i'm another toggle button.")
	--    toggle2.draw_as_button
	--    -- g_signal_connect (toggle2, "toggled",  G_CALLBACK (output_state), NULL);
	--    dialog.action_area.pack_start (toggle2, False, False, 2)
	--    dialog.show_all
	-- end

inherit
	GTK_BUTTON redefine make, with_label, with_mnemonic end

insert
	GTK
	GTK_TOGGLE_BUTTON_EXTERNALS
		-- TODO: GtkToggleButton implements AtkImplementorIface.

create {ANY} make, with_label, with_mnemonic, from_external_pointer

feature {} -- Creation

	make is
			-- Creates a new toggle button. A widget should be packed
			-- into the button, as GTK_BUTTON.make.
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_toggle_button_new)
		end

	with_label (a_label: STRING) is
			-- Creates a new toggle button with a text `a_label'.
		require else
			gtk_initialized: gtk.is_initialized
			label_not_void: a_label /= Void
		do
			from_external_pointer (gtk_toggle_button_new_with_label (a_label.to_external))
		end

	with_mnemonic (a_label: STRING) is
			-- Creates a new GtkToggleButton containing `a_label'. The
			-- label will be created using GTK_LABEL.with_mnemonic, so
			-- underscores in label indicate the mnemonic for the button.
		require else
			gtk_initialized: gtk.is_initialized
			label_not_void: a_label /= Void
		do
			from_external_pointer (gtk_toggle_button_new_with_mnemonic (a_label.to_external))
		end

feature {ANY}

	draw_indicator is
			-- Makes the button displayed as a separate indicator and
			-- label. This feature only effects instances of classes like
			-- GtkCheckButton and GtkRadioButton that derive from
			-- GtkToggleButton, not instances of GtkToggleButton itself.
		do
			gtk_toggle_button_set_mode (handle, 1)
		ensure is_indicator_drawn
		end

	draw_as_button is
			-- Makes the button look like a normal button.  This function
			-- only effects instances of classes like GtkCheckButton and
			-- GtkRadioButton that derive from GtkToggleButton, not
			-- instances of GtkToggleButton itself.
		do
			gtk_toggle_button_set_mode (handle, 0)
		ensure drawn_as_button
		end

	is_indicator_drawn: BOOLEAN is
			-- is the button displayed as a separate indicator and label?
		do
			Result := (gtk_toggle_button_get_mode(handle) = 1)
		end

	drawn_as_button: BOOLEAN is
			-- is the toggle button drawn as a normal button?
		do
			Result := (gtk_toggle_button_get_mode(handle) = 0)
		end

	toggled is
			-- Emits the toggled signal on the GtkToggleButton. There is
			-- no good reason for an application ever to call this
			-- function.
		do
			gtk_toggle_button_toggled (handle)
		end

	is_active: BOOLEAN is
			-- Is the toggle button pressed? (False means that it is
			-- raised).
		do
			Result:=(gtk_toggle_button_get_active(handle)).to_boolean
		end

	set_active is
			-- Sets the status of the toggle button to be 'pressed
			-- in'. This action causes the toggled signal to be emitted.
		do
			gtk_toggle_button_set_active (handle,1)
		end

	set_inactive is
			-- Sets the status of the toggle button to be 'pressed out',
			-- i.e.  to raise it. This action causes the toggled signal
			-- to be emitted.
		do
			gtk_toggle_button_set_active (handle,0)
		end

	is_inconsistent: BOOLEAN is
			-- Is button inconsistent?
		do
			Result := (gtk_toggle_button_get_inconsistent (handle)).to_boolean
		end

	set_inconsistent is
			-- If the user has selected a range of elements (such as some
			-- text or spreadsheet cells) that are affected by a toggle
			-- button, and the current values in that range are
			-- inconsistent, you may want to display the toggle in an "in
			-- between" state. This function turns on "in between"
			-- display. Normally you would turn off the inconsistent
			-- state again if the user toggles the toggle button. This
			-- has to be done manually, `set_inconsistent' only affects
			-- visual appearance, it doesn't affect the semantics of the
			-- button.
		do
			gtk_toggle_button_set_inconsistent (handle,1)
		ensure is_inconsistent
		end

	set_consistent is
		do
			gtk_toggle_button_set_inconsistent (handle,0)
		ensure not is_inconsistent
		end

feature {ANY} -- "active" property
--   "active"               gboolean              : Read / Write

-- If the toggle button should be pressed in or not.

-- Default value: FALSE

feature {ANY} -- The "draw-indicator" property

--   "draw-indicator"       gboolean              : Read / Write

-- If the toggle part of the button is displayed.

-- Default value: FALSE
-- The "inconsistent" property

--   "inconsistent"         gboolean              : Read / Write

-- If the toggle button is in an "in between" state.

-- Default value: FALSE

feature {ANY} -- The "toggled" signal

	toggled_signal_name: STRING is "toggled"
		-- void        user_function                  (GtkToggleButton *togglebutton,
		--                                             gpointer user_data);

	on_toggled is
			-- Built-in toggled signal handler; empty by design; redefine it.
		do
			-- local a_foo: INTEGER --a_foo := 12 -- Dummy instructions
		end

	enable_on_toggled is
			-- Connects "toggled" signal to `on_toggled' feature.

			-- Should be connected if you wish to perform an action
			-- whenever the GTK_TOGGLE_BUTTON's state is changed.
		do
			connect (Current, toggled_signal_name, $on_toggled)
		end

	connect_to_toggled_signal, connect_agent_to_toggled_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_TOGGLE_BUTTON]]) is
			-- togglebutton : 	the object which received the signal.
		require valid_procedure: a_procedure /= Void
		local toggled_callback: TOGGLED_CALLBACK [like Current]
		do
			create toggled_callback.make
			toggled_callback.connect (Current, a_procedure)
		end

end
