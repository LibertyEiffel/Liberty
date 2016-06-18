note
	description: "External calls for GTK_BOX"
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

deferred class GTK_BOX_EXTERNALS

inherit
	ANY undefine is_equal, copy end
	GTK_PACK_TYPE
	
feature {} -- External calls
	gtk_box_pack_start (a_box, a_child: POINTER; expand, fill: INTEGER; guint_padding: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_box_pack_end (a_box, a_child: POINTER; expand, fill: INTEGER; guint_padding: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_box_pack_start_defaults (a_box, a_widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_box_pack_end_defaults (a_box, a_widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_box_get_homogeneous (a_box: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_box_set_homogeneous (a_box: POINTER;homogeneous: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_box_get_spacing (a_box: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_box_set_spacing (a_box: POINTER; a_spacing: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_box_reorder_child (a_box, a_child: POINTER;
								  a_position: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_box_query_child_packing (a_box,a_child,expand,fill,padding,pack_type: POINTER;)
		external "C use <gtk/gtk.h>"
		end

	gtk_box_set_child_packing (a_box,a_child: POINTER; expand, fill, padding, pack_type: INTEGER)
		require valid_pack: is_valid_gtk_pack_type (pack_type)
		external "C use <gtk/gtk.h>"
		end

-- -- TODO wrap the structure if necessary

-- typedef struct {
--   GList *children;
--   gint16 spacing;
--   guint homogeneous : 1;
-- } GtkBox;

-- The GtkBox-struct describes an instance of GtkBox and contains the following fields. (These fields should be considered read-only. They should never be set by an application.)
-- GList * children; 	a list of children belonging the GtkBox. The data is a list of structures of type GtkBoxChild-struct.
-- gint16 spacing; 	the number of pixels to put between children of the GtkBox, zero by default. Use gtk_box_set_spacing() to set this field.
-- guint homogeneous; 	a flag that if TRUE forces all children to get equal space in the GtkBox; FALSE by default. Use gtk_box_set_homogeneous() to set this field.

-- GtkBoxChild

-- typedef struct {
--   GtkWidget *widget;
--   guint16 padding;
--   guint expand : 1;
--   guint fill : 1;
--   guint pack : 1;
--   guint is_secondary : 1;
-- } GtkBoxChild;

-- The GtkBoxChild-struct holds a child widget of GtkBox and describes how the child is to be packed into the GtkBox. Use gtk_box_query_child_packing() and gtk_box_set_child_packing() to query and reset the padding, expand, fill, and pack fields.

-- GtkBoxChild-struct contains the following fields. (These fields should be considered read-only. They should never be directly set by an application.)
-- GtkWidget * widget; 	the child widget, packed into the GtkBox.
-- guint16 padding; 	the number of extra pixels to put between this child and its neighbors, set when packed, zero by default.
-- guint expand; 	flag indicates whether extra space should be given to this child. Any extra space given to the parent GtkBox is divided up among all children with this attribute set to TRUE; set when packed, TRUE by default.
-- guint fill; 	flag indicates whether any extra space given to this child due to its expand attribute being set is actually allocated to the child, rather than being used as padding around the widget; set when packed, TRUE by default.
-- guint pack; 	one of GtkPackType indicating whether the child is packed with reference to the start (top/left) or end (bottom/right) of the GtkBox.

end
