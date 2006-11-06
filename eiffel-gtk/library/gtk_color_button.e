indexing
	description: "GtkColorButton — A button to launch a color selection dialog"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team,  GTK+ team and others
					
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

			-- The GtkColorButton is a button which displays the currently
			-- selected color an allows to open a color selection dialog to
			-- change the color.

			-- It is suitable widget for selecting a color in a preference dialog.

class GTK_COLOR_BUTTON

inherit GTK_BUTTON redefine make end

insert
	GTK_COLOR_BUTTON_EXTERNALS
		-- Implemented Interfaces
		-- GtkColorButton implements AtkImplementorIface.

creation
	make,
	from_external_pointer
	
feature {} -- Creation

	make is
			-- Creates a new color button. This is a widget in the form of a small button
			-- containing a swatch representing the current selected color.
			-- When the button is clicked, a color-selection dialog will open,
			-- allowing the user to select a color.
			-- The swatch will be updated to reflect the new color when the user finishes.
		do
			from_external_pointer (gtk_color_button_new)
		end

-- gtk_color_button_new_with_color ()
-- 
-- GtkWidget*  gtk_color_button_new_with_color (const GdkColor *color);
-- 
-- Creates a new color button.
-- 
-- color : 	A GdkColor to set the current color with.
-- Returns : 	a new color button.
-- 
-- Since 2.4

feature

	set_color (a_color: GDK_COLOR) is
			-- Sets the current color to be a_color.
		do
			gtk_color_button_set_color (handle, a_color.handle)
		end

	color: GDK_COLOR is
			-- Current color in the widget.
		do
			create Result.make
			gtk_color_button_get_color (handle, Result.handle)
		end

-- gtk_color_button_set_alpha ()
-- 
-- void        gtk_color_button_set_alpha      (GtkColorButton *color_button,
--                                              guint16 alpha);
-- 
-- Sets the current opacity to be alpha.
-- 
-- color_button : 	a GtkColorButton.
-- alpha : 	an integer between 0 and 65535.
-- 
-- Since 2.4
-- gtk_color_button_get_alpha ()
-- 
-- guint16     gtk_color_button_get_alpha      (GtkColorButton *color_button);
-- 
-- Returns the current alpha value.
-- 
-- color_button : 	a GtkColorButton.
-- Returns : 	an integer between 0 and 65535.
-- 
-- Since 2.4
-- gtk_color_button_set_use_alpha ()
-- 
-- void        gtk_color_button_set_use_alpha  (GtkColorButton *color_button,
--                                              gboolean use_alpha);
-- 
-- Sets whether or not the color button should use the alpha channel.
-- 
-- color_button : 	a GtkColorButton.
-- use_alpha : 	TRUE if color button should use alpha channel, FALSE if not.
-- 
-- Since 2.4
-- gtk_color_button_get_use_alpha ()
-- 
-- gboolean    gtk_color_button_get_use_alpha  (GtkColorButton *color_button);
-- 
-- Does the color selection dialog use the alpha channel?
-- 
-- color_button : 	a GtkColorButton.
-- Returns : 	TRUE if the color sample uses alpha channel, FALSE if not.
-- 
-- Since 2.4
-- gtk_color_button_set_title ()
-- 
-- void        gtk_color_button_set_title      (GtkColorButton *color_button,
--                                              const gchar *title);
-- 
-- Sets the title for the color selection dialog.
-- 
-- color_button : 	a GtkColorButton
-- title : 	String containing new window title.
-- 
-- Since 2.4
-- gtk_color_button_get_title ()
-- 
-- const gchar* gtk_color_button_get_title     (GtkColorButton *color_button);
-- 
-- Gets the title of the color selection dialog.
-- 
-- color_button : 	a GtkColorButton
-- Returns : 	An internal string, do not free the return value
-- 
-- Since 2.4
-- Property Details
-- The "alpha" property
-- 
--   "alpha"                guint                 : Read / Write
-- 
-- The selected opacity value (0 fully transparent, 65535 fully opaque).
-- 
-- Allowed values: <= 65535
-- 
-- Default value: 65535
-- 
-- Since 2.4
-- The "color" property
-- 
--   "color"                GdkColor              : Read / Write
-- 
-- The selected color.
-- 
-- Since 2.4
-- The "title" property
-- 
--   "title"                gchararray            : Read / Write
-- 
-- The title of the color selection dialog
-- 
-- Default value: "Pick a Color"
-- 
-- Since 2.4
-- The "use-alpha" property
-- 
--   "use-alpha"            gboolean              : Read / Write
-- 
-- If this property is set to TRUE, the color swatch on the button is rendered against a checkerboard background to show its opacity and the opacity slider is displayed in the color selection dialog.
-- 
-- Default value: FALSE
-- 
-- Since 2.4
-- Signal Details
-- The "color-set" signal
-- 
-- void        user_function                  (GtkColorButton *widget,
--                                             gpointer        user_data)      : Run first
-- 
-- The ::color-set signal is emitted when the user selects a color. When handling this signal, use gtk_color_button_get_color() and gtk_color_button_get_alpha() to find out which color was just selected.
-- 
-- Note that this signal is only emitted when the user changes the color. If you need to react to programmatic color changes as well, use the notify::color signal.
-- 
-- widget : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- 
-- Since 2.4



end -- GTK_COLOR_BUTTON
