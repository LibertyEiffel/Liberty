note
	description: "."
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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

class GTK_CHECK_BUTTON

inherit
	GTK_TOGGLE_BUTTON redefine make,with_label,with_mnemonic,struct_size end

insert
	GTK_CHECK_BUTTON_EXTERNALS

create {ANY} make,with_label,with_mnemonic, from_external_pointer

feature {} -- Creation

	make
			-- Creates a new GtkCheckButton.
		do
			from_external_pointer (gtk_check_button_new)
		end

	with_label (a_label: STRING)
			-- Creates a new GtkCheckButton with a GtkLabel to the right of it.
		do
			from_external_pointer (gtk_check_button_new_with_label (a_label.to_external))
		end
	
	with_mnemonic (a_label: STRING)
			-- Creates a new GtkCheckButton containing a label. The label
			-- will be created using GTK_LABEL.with_mnemonic(), so
			-- underscores in label indicate the mnemonic for the check
			-- button.
		do
			from_external_pointer (gtk_check_button_new_with_mnemonic (a_label.to_external))
		end
feature {ANY}
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkCheckButton)"
		end

feature {ANY} -- Style Properties TODO
-- The "indicator-size" style property

--   "indicator-size"       gint                  : Read

-- Size of check or radio indicator.

-- Allowed values: >= 0

-- Default value: 13
-- The "indicator-spacing" style property

--   "indicator-spacing"    gint                  : Read

-- Spacing around check or radio indicator.

-- Allowed values: >= 0

-- Default value: 2
-- See Also
end
