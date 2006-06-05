indexing
	description: "GtkHBox -- A horizontal container box."
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

			-- GtkHBox is a container that organizes child widgets into a
			-- single row. Use the GtkBox packing interface to determine
			-- the arrangement, spacing, width, and alignment of GtkHBox
			-- children. All children are allocated the same height.

class GTK_HBOX
inherit GTK_BOX -- GtkHBox also implements AtkImplementorIface.
insert GTK_HBOX_EXTERNALS
creation make, from_external_pointer

feature {NONE} -- Creation
	make (an_homogeneous: BOOLEAN; a_spacing: INTEGER) is
			-- Creates a new GtkHBox. If `an_homogeneous' is True all
			-- children are to be given equal space
			-- allotments. `a_spacing' is the number of pixels to place
			-- by default between children.
		do
			handle:=gtk_hbox_new (an_homogeneous.to_integer, a_spacing)
			store_eiffel_wrapper
		end
end
