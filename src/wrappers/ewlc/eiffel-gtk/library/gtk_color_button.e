note
	description: "GtkColorButton — A button to launch a color selection dialog"
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team,  GTK+ team and others
					
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
	revision "$REvision:$"

class GTK_COLOR_BUTTON
	-- The GtkColorButton is a button which displays the currently
	-- selected color an allows to open a color selection dialog to
	-- change the color.
	
	-- It is suitable widget for selecting a color in a preference dialog.

inherit
	GTK_BUTTON
		undefine struct_size
		redefine make end

insert
	GTK_COLOR_BUTTON_EXTERNALS
		-- Implemented Interfaces
		-- GtkColorButton implements AtkImplementorIface.

create {ANY}
	make, with_color,
	from_external_pointer
	
feature {} -- Creation

	make
			-- Creates a new color button. This is a widget in the form of a small button
			-- containing a swatch representing the current selected color.
			-- When the button is clicked, a color-selection dialog will open,
			-- allowing the user to select a color.
			-- The swatch will be updated to reflect the new color when the user finishes.
		do
			from_external_pointer (gtk_color_button_new)
		end

	with_color (a_color: GDK_COLOR)
		do
			from_external_pointer( gtk_color_button_new_with_color (a_color.handle))
		end
-- 
-- Creates a new color button.
-- 
-- color : 	A GdkColor to set the current color with.
-- Returns : 	a new color button.
-- 
-- Since 2.4

feature {ANY}

	set_color (a_color: GDK_COLOR)
			-- Sets the current color to be a_color.
		do
			gtk_color_button_set_color (handle, a_color.handle)
		end

	color: GDK_COLOR
			-- Current color in the widget.
		do
			create Result.make
			gtk_color_button_get_color (handle, Result.handle)
		end

	set_alpha (an_alpha: INTEGER)
			-- Sets the current opacity to be `an_alpha'.
			-- TODO: an_alpha should be NATURAL_16
		require
			fits_natural_16: an_alpha.in_range (0, 65535)
		do
			gtk_color_button_set_alpha (handle, an_alpha)
		end

	alpha: INTEGER
			-- The selected opacity value (0 fully transparent, 65535 fully opaque).
			-- TODO: it should be NATURAL_16
		do
			Result := gtk_color_button_get_alpha (handle)
		ensure
			fits_natural_16: Result.in_range (0, 65535)
		end

	set_use_alpha (a_setting: BOOLEAN)
			-- Sets whether or not the color button should use the alpha 
			-- channel.
		do
			gtk_color_button_set_use_alpha (handle, a_setting.to_integer)
		ensure
			set: a_setting = is_alpha_used
		end

	is_alpha_used: BOOLEAN
			-- Does the color selection dialog use the alpha channel?
			-- If True, the color swatch on the button is rendered
			-- against a checkerboard background to show its opacity and
			-- the opacity slider is displayed in the color selection
			-- dialog.
		do
			Result := gtk_color_button_get_use_alpha (handle).to_boolean
		end

	set_title (a_title: STRING)
			-- Sets the title for the color selection dialog.
		require
			title_not_void: a_title /= Void
		do
			gtk_color_button_set_title (handle, a_title.to_external)
		ensure
			set: a_title.is_equal (title)
		end

	title: CONST_STRING
			-- the title of the color selection dialog.
		do
			create Result.from_external (gtk_color_button_get_title (handle))
		ensure
			not_void: Result /= Void
		end

	-- Note: it is not necessary to wrap the "alpha", "title" and
	-- "use-alpha" properties, since there are strongly-typed setter
	-- and getter features

	-- TODO: The "color" property
	
	--   "color"                GdkColor              : Read / Write
	 
	-- The selected color.

	
feature {ANY} -- The "color-set" signal

	connect_agent_to_color_set_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_COLOR_BUTTON]])
			-- The ::color-set signal is emitted when the user selects a color.
			-- When handling this signal, use `get_color()' and `get_alpha()'
			-- to find out which color was just selected.
			-- 
			-- Note that this signal is only emitted when the user changes the
			-- color. If you need to react to programmatic color changes as
			-- well, use the notify::color signal.
			-- 
			-- widget : 	the object which received the signal.
		require
			valid_procedure: a_procedure /= Void
		local
			color_set_callback: COLOR_SET_CALLBACK
		do
			create color_set_callback.make
			color_set_callback.connect (Current, a_procedure)
		end

end -- GTK_COLOR_BUTTON
