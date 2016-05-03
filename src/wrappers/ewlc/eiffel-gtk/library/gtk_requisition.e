note
	description: "A GtkRequisition represents the desired size of a widget. See the section called `Siz Requisition' in GTK_WIDGET for more informations."
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

class GTK_REQUISITION
	-- The size requisition of a widget is it's desired width and
	-- height. This is represented by a GtkRequisition.

	-- How a widget determines its desired size depends on the
	-- widget. A GtkLabel, for example, requests enough space to
	-- display all its text. Container widgets generally base their
	-- size request on the requisitions of their children.

	-- The size requisition phase of the widget layout process operates
	-- top-down. It starts at a top-level widget, typically a
	-- GtkWindow. The top-level widget asks its child for its size
	-- requisition by calling gtk_widget_size_request(). To determine
	-- its requisition, the child asks its own children for their
	-- requisitions and so on. Finally, the top-level widget will get a
	-- requisition back from its child.

inherit
	G_STRUCT redefine is_equal end

create {ANY} make, copy, copy_from_pointer, from_external_pointer

feature {} -- Creation

	make is
		do
			allocate
		end

	copy_from_pointer (a_ptr: POINTER) is
		require
			a_ptr.is_not_null
		do
			dispose
			allocate
			handle := memcpy (handle, a_ptr, struct_size)
		end

feature {ANY} -- size

	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkRequisition)"
		end

feature {ANY}

	is_equal (other: like Current): BOOLEAN is
		do
			Result := width = other.width and height = other.height
		end

	width: INTEGER is
			-- the widget's desired width
		do
			Result := get_width_external (handle)
		end

	set_width (a_width: INTEGER) is
		do
			set_width_external (handle, a_width)
		end

	height: INTEGER is
			-- the widget's desired height
		do
			Result := get_height_external (handle)
		end

	set_height (an_height: INTEGER) is
		do
			set_height_external (handle, an_height)
		end

feature {} -- External

	get_width_external (ptr: POINTER): INTEGER is
		require valid_ptr: ptr.is_not_null
		external "C struct GtkRequisition get width use <gtk/gtk.h>"
		end

	set_width_external (ptr: POINTER; a_width:INTEGER) is
		require valid_ptr: ptr.is_not_null
		external "C struct GtkRequisition set width use <gtk/gtk.h>"
		end

	get_height_external (ptr: POINTER): INTEGER is
		require valid_ptr: ptr.is_not_null
		external "C struct GtkRequisition get height use <gtk/gtk.h>"
		end

	set_height_external (ptr: POINTER; an_height:INTEGER) is
		require valid_ptr: ptr.is_not_null
		external "C struct GtkRequisition set height use <gtk/gtk.h>"
		end

end
