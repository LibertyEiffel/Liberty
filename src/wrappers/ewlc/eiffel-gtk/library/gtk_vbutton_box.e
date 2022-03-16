note
	description: "GtkHButtonBox: A container for arranging buttons horizontally."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, GTK+ team
					
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

class GTK_VBUTTON_BOX
	-- A button box provides a consistent layout of buttons throughout
	-- your application. The layout/spacing can be altered by the
	-- programmer, or if desired, by the user to alter the 'feel' of a
	-- program to a small degree.

	-- Buttons are packed into a button box the same way widgets are
	-- added to any other container, using `add'. You can also use
	-- `pack_start' or `pack_end', but for button boxes both these
	-- functions work just like `add', ie., they pack the button in a
	-- way that depends on the current layout style and on whether the
	-- button has had gtk_button_box_set_child_secondary() called on
	-- it.

	--   The spacing between buttons can be set with gtk_box_set_spacing(). The
	--   arrangement and layout of the buttons can be changed with
	--   gtk_button_box_set_layout().

inherit  GTK_BUTTON_BOX
	--   GtkVbuttonBox implements AtkImplementorIface.

create {ANY} make, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new vertical button box.
		do
			from_external_pointer(gtk_vbutton_box_new)
		end

feature {} -- External calls
	gtk_vbutton_box_new: POINTER
			-- GtkWidget* gtk_vbutton_box_new (void);
		external "C inline use <gtk/gtk.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkVbuttonBox)"
		end
end -- class GTK_VBUTTON_BOX
