note
	description: "GtkColorSelection, a widget used to select a color."
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
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_COLOR_SELECTION
	-- The GtkColorSelection is a widget that is used to select a
	-- color. It consists of a color wheel and number of sliders and
	-- entry boxes for color parameters such as hue, saturation, value,
	-- red, green, blue, and opacity. It is found on the standard color
	-- selection dialog box GtkColorSelectionDialog.

inherit GTK_VBOX
	rename
		make as vbox_make
	redefine
		struct_size
	end

	-- TODO: GtkColorSelection implements AtkImplementorIface.

insert
	GTK_COLOR_SELECTION_EXTERNALS

create {ANY} make, from_external_pointer

feature {ANY} -- size

	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkColorSelection)"
		end

feature {ANY}
	make
			-- Creates a new GtkColorSelection.
		do
			from_external_pointer(gtk_color_selection_new)
		end

feature {ANY}
	current_color: GDK_COLOR
			-- Returns the current color in the GTK_COLOR_SELECTION widget
		do
			create Result.make
			gtk_color_selection_get_current_color (handle, Result.handle)
		end

	set_current_color (a_color: GDK_COLOR)
			-- Sets the current color to be a_color. The first time this is
			-- called, it will also set the original color to be a_color too.
		do
			gtk_color_selection_set_current_color (handle, a_color.handle)
		end

	set_has_opacity_control (a_setting: BOOLEAN)
			-- Sets Current color selection to use or not use opacity.
			-- colorsel : a GtkColorSelection.  has_opacity : TRUE if
			-- colorsel can set the opacity, FALSE otherwise.
		do
			gtk_color_selection_set_has_opacity_control
			(handle, a_setting.to_integer)
		end

	has_opacity_control: BOOLEAN
			-- Does the color selection have an opacity control.
		do
			Result := (gtk_color_selection_get_has_opacity_control
						  (handle).to_boolean)
		end

	set_has_palette (a_setting: BOOLEAN)
			-- Shows or hides the palette based upon the value of `a_setting'.
		do
			gtk_color_selection_set_has_palette(handle, a_setting.to_integer)
		end

	has_palette: BOOLEAN
			-- Does the selector have a palette?
		do
			Result := gtk_color_selection_get_has_palette(handle).to_boolean
		end

	current_alpha: INTEGER
			-- the current alpha value.  
		do
			Result:=gtk_color_selection_get_current_alpha(handle)
		ensure fit_natural_16: Result.in_range(0, 65535)
		end

	set_current_alpha (an_alpha: INTEGER)
			-- Sets the current opacity to `an_alpha'. The first time
			-- this is called, it will also set the original opacity to
			-- `an_alpha'.
		require fit_natural_16: an_alpha.in_range(0, 65535)
		do
			gtk_color_selection_set_current_alpha(handle, an_alpha)
		ensure set: current_alpha = an_alpha
		end

	previous_alpha: INTEGER
			-- the previous alpha value.
		do
			Result:=gtk_color_selection_get_previous_alpha(handle)
		ensure fit_natural_16: Result.in_range(0, 65535)
		end

	set_previous_alpha (an_alpha: INTEGER)
			-- Sets the 'previous' alpha to `an_alpha'. This function
			-- should be called with some hesitations, as it might seem
			-- confusing to have that alpha change.
		require fit_natural_16: an_alpha.in_range(0, 65535)
		do
			gtk_color_selection_set_previous_alpha(handle, an_alpha)
		ensure set: previous_alpha = an_alpha
		end

	previous_color: GDK_COLOR
			-- the original color value.
		do
			create Result.make
			gtk_color_selection_get_previous_color (handle, Result.handle)
		end

	set_previous_color (a_color: GDK_COLOR)
			-- Sets the 'previous' color to `a_color'. This function
			-- should be called with some hesitations, as it might seem
			-- confusing to have that color change. Calling
			-- `set_current_color' will also set this color the first
			-- time it is called.
		require color_not_void: a_color /= Void
		do
			gtk_color_selection_set_previous_color(handle, a_color.handle)
		end

	is_adjusting: BOOLEAN
			-- Is the user currently dragging a color around?
		do
			Result:=(gtk_color_selection_is_adjusting(handle).to_boolean)
		end

	-- gtk_color_selection_palette_from_string ()

	-- gboolean gtk_color_selection_palette_from_string (const gchar
	-- *str, GdkColor **colors, gint *n_colors);

	-- Parses a color palette string; the string is a colon-separated
	-- list of color names readable by gdk_color_parse().
	
	-- str : 	a string encoding a color palette.
	-- colors : 	return location for allocated array of GdkColor.
	-- n_colors : 	return location for length of array.
	-- Returns : 	TRUE if a palette was successfully parsed.
	-- gtk_color_selection_palette_to_string ()
	-- 
	-- gchar*      gtk_color_selection_palette_to_string
	--                                             (const GdkColor *colors,
	--                                              gint n_colors);
	-- 
	-- Encodes a palette as a string, useful for persistent storage.
	-- 
	-- colors : 	an array of colors.
	-- n_colors : 	length of the array.
	-- Returns : 	allocated string encoding the palette.
	-- gtk_color_selection_set_change_palette_hook ()
	-- 
	-- gtk_color_selection_set_change_palette_with_screen_hook ()
	-- 
	-- GtkColorSelectionChangePaletteWithScreenFunc gtk_color_selection_set_change_palette_with_screen_hook
	--                                             (GtkColorSelectionChangePaletteWithScreenFunc func);
	-- 
	-- Installs a global function to be called whenever the user tries to modify the palette in a color selection. This function should save the new palette contents, and update the GtkSettings property "gtk-color-palette" so all GtkColorSelection widgets will be modified.
	-- 
	-- func : 	a function to call when the custom palette needs saving.
	-- Returns : 	the previous change palette hook (that was replaced).
	-- 
	-- Since 2.2
	-- GtkColorSelectionChangePaletteWithScreenFunc ()
	-- 
	-- void        (*GtkColorSelectionChangePaletteWithScreenFunc)
	--                                             (GdkScreen *screen,
	--                                              const GdkColor *colors,
	--                                              gint n_colors);
	-- 
	-- screen : 	
	-- colors : 	
	-- n_colors : 	
	-- 
	-- Since 2.2
feature {ANY} -- Properties
	--   "current-alpha"        guint                 : Read / Write
	--   "current-color"        GdkColor              : Read / Write
	--   "has-opacity-control"  gboolean              : Read / Write
	--   "has-palette"          gboolean              : Read / Write
	-- Property Details
	-- The "current-alpha" property
	-- 
	--   "current-alpha"        guint                 : Read / Write
	-- 
	-- The current opacity value (0 fully transparent, 65535 fully opaque).
	-- 
	-- Allowed values: <= 65535
	-- 
	-- Default value: 65535
	-- The "current-color" property
	-- 
	--   "current-color"        GdkColor              : Read / Write
	-- 
	-- The current color.
	-- The "has-opacity-control" property
	-- 
	--   "has-opacity-control"  gboolean              : Read / Write
	-- 
	-- Whether the color selector should allow setting opacity.
	-- 
	-- Default value: FALSE
	-- The "has-palette" property
	-- 
	--   "has-palette"          gboolean              : Read / Write
	-- 
	-- Whether a palette should be used.
	-- 
	-- Default value: FALSE
	-- 
feature {ANY} -- The "color-changed" signal
	-- void user_function (GtkColorSelection *colorselection, gpointer
	-- user_data) : Run first

	-- This signal is emitted when the color changes in the
	-- GtkColorSelection according to its update policy.
	-- colorselection : the object which received the signal.
	-- user_data : user data set when the signal handler was connected.

end -- class GTK_COLOR_SELECTION
