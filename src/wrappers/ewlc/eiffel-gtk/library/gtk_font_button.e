note
	description: "GtkFontButton: A button to launch a font selection dialog."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "2.10.6"

class GTK_FONT_BUTTON
	-- The GtkFontButton is a button which displays the currently
	-- selected font an allows to open a font selection dialog to
	-- change the font. It is suitable widget for selecting a font in a
	-- preference dialog.

inherit
	GTK_BUTTON
		undefine
			struct_size
		redefine
			make
		end

insert GTK_FONT_BUTTON_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation
	make is
			-- Creates a new font picker widget.
		do
			from_external_pointer(gtk_font_button_new)
		end

	with_font (a_font_name: STRING) is
			-- Creates a new font picker widget. `a_font_name' is the
			-- name of font to display in font selection dialog
		require
            name_not_void: a_font_name /= Void
		do
			from_external_pointer(gtk_font_button_new_with_font(a_font_name.to_external))
		end

feature {ANY}

	set_font_name (a_font_name: STRING) is
			-- Sets or updates the currently-displayed font in font
			-- picker dialog.

			-- `a_font_name': Name of font to display in font selection
			-- dialog.

			-- `font_exists' is set to True if the selection dialog and
			-- the font exists.
		require name_not_void: a_font_name /= Void
		do
			font_exists := (gtk_font_button_set_font_name 
								 (handle, a_font_name.to_external).to_boolean)
			--   Returns : Return value of
			--   gtk_font_selection_dialog_set_font_name() if the font
			--   selection dialog exists, otherwise FALSE.
		end

	font_exists: BOOLEAN 
			-- Has the last call to `set_font' successful?

	font_name: STRING is
			-- The name of the currently selected font. 
			-- Default value: "Sans 12"
		do
			create Result.from_external_copy (gtk_font_button_get_font_name(handle))
		end

	set_show_style (a_setting: BOOLEAN) is
			-- If `a_setting' is True, the font style will be displayed
			-- along with name of the selected font.
		
			-- If this property is set to TRUE, the name of the selected
			-- font style will be shown in the label. For a more WYSIWYG
			-- way to show the selected style, see the ::use-font
			-- property.
		do
			gtk_font_button_set_show_style  (handle,a_setting.to_integer)
		ensure set: a_setting = is_style_shown
		end

	is_style_shown: BOOLEAN is
			-- Will the font style be shown in the label?
		do
			Result:=gtk_font_button_get_show_style(handle).to_boolean
		end
	
	set_show_size (a_setting: BOOLEAN) is
			-- If `a_setting' is True, the font size will be displayed
			-- along with the name of the selected font.
		do
			gtk_font_button_set_show_size(handle, a_setting.to_integer)
		ensure set: a_setting = is_size_shown
		end	

	is_size_shown: BOOLEAN is
			-- Will the font size be shown in the label?

			-- If this property is set to True, the selected font size
			-- will be shown in the label. For a more WYSIWYG way to show
			-- the selected size, see the ::use-size property.
		do
			Result:=gtk_font_button_get_show_size(handle).to_boolean
		end

	set_use_font (a_setting: BOOLEAN) is
			-- If `a_setting' is True, the font name will be written
			-- using the selected font.
		do
			gtk_font_button_set_use_font(handle,a_setting.to_integer)
		ensure set: a_setting = is_font_used
		end
	
	is_font_used: BOOLEAN is
			-- Is the selected font used in the label?
		do
			Result:=gtk_font_button_get_use_font(handle).to_boolean
		end

	set_use_size (a_setting: BOOLEAN) is
			-- If `a_setting' is TRUE, the font name will be written
			-- using the selected size.
		do
			gtk_font_button_set_use_size(handle,a_setting.to_integer)
		ensure set: a_setting = is_size_used
		end

	is_size_used: BOOLEAN is
			-- Is the selected size used in the label?
		do
			Result:=gtk_font_button_get_use_size(handle) /= 0
		end

	set_title (a_title: STRING) is
			-- Sets the title for the font selection dialog.
		require title_not_void: a_title /= Void
		do
			gtk_font_button_set_title(handle, a_title.to_external)
		ensure set: a_title.is_equal(title)
		end

	title: CONST_STRING is
			-- the title of the font selection dialog.
		do
			create Result.from_external(gtk_font_button_get_title(handle))
		ensure
            not_void: Result /= Void
		end
	
	-- Note: "font-name", "show-size", "show-style", "title",
	-- "use-font", "use-size" properties already have strongly-typed
	-- setter/getter features

		--
	--   Default value: FALSE
	--
	--   Since 2.4
	--
	--   --------------------------------------------------------------------------
	--
	--  The "use-size" property
	--
	--   "use-size"             gboolean              : Read / Write
	--
	--   If this property is set to TRUE, the label will be drawn with the selected
	--   font size.
	--
	--   Default value: FALSE
	--
	--   Since 2.4
	--

feature {ANY} -- The "font-set" signal

	connect_agent_to_font_set_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_FONT_BUTTON]]) is
			--   The ::font-set signal is emitted when the user selects a font. When
			--   handling this signal, use `font_name()' to find out
			--   which font was just selected.
			--
			--   Note that this signal is only emitted when the user changes the font. If
			--   you need to react to programmatic font changes as well, use the
			--   notify::font-name signal.
			--
			--   widget :    the object which received the signal.
			--
			--   Since 2.4
		require
			valid_procedure: a_procedure /= Void
		local
			font_set_callback: FONT_SET_CALLBACK
		do
			create font_set_callback.make
			font_set_callback.connect (Current, a_procedure)
		end

end -- class GTK_FONT_BUTTON_EXTERNALS
