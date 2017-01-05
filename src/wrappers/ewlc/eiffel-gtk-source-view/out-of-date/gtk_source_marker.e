note
	description: "."
	copyright: "[
					Copyright (C) 2007-2017: Paolo Redaelli, GtkSourceView developers
					
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

	wrapped_version: "1.8.5"

class GTK_SOURCE_MARKER

inherit SHARED_C_STRUCT

create {ANY} dummy, make, from_external_pointer

feature {ANY}
	set_marker_type (a_type: STRING)
		require type_not_void: a_type/=Void
		do
			gtk_source_marker_set_marker_type (handle, a_type.to_external)
		ensure set: a_type.is_equal(marker_type)
		end

	marker_type: STRING
			-- the marker type.
		do
			create Result.from_external
			(gtk_source_marker_get_marker_type(handle))
		end

	line: INTEGER
			-- the line number of this marker.
		do
			Result:=gtk_source_marker_get_line(handle)
		end

	name: STRING
			-- the name of this marker.
		local p: POINTER
		do
			p:=gtk_source_marker_get_name(handle)
			check pointer_not_null: p.is_not_null end
			create {CONST_STRING} Result.from_external_pointer(p)
		ensure not_void: Result/=Void
		end

	buffer: GTK_SOURCE_BUFFER
			-- the buffer associated with this marker.
		do
			create Result.from_external_pointer
			(gtk_source_marker_get_buffer (handle))
		end

	next: like Current
			--  the next marker after marker.
		local p: POINTER
		do
			p:=gtk_source_marker_next(handle)
			check pointer_not_null: p.is_not_null end
			create Result.from_external_pointer(p)
		ensure not_void: Result/=Void
		end

	previous: like Current
			-- the previous marker before marker.
		local p: POINTER
		do
			p:=gtk_source_marker_prev(handle)
			create Result.from_external_pointer(p)
		ensure not_void: Result/=Void
		end

feature {} -- External calls
	gtk_source_marker_set_marker_type (a_marker, a_type: POINTER)
			-- void gtk_source_marker_set_marker_type (GtkSourceMarker *marker,
			-- const gchar *type);
		external "C use <gtksourceview/gtksourcemarker.h>"
		end
	
	gtk_source_marker_get_marker_type (a_marker: POINTER): POINTER
			-- gchar* gtk_source_marker_get_marker_type (GtkSourceMarker *marker);
		external "C use <gtksourceview/gtksourcemarker.h>"
		end

	gtk_source_marker_get_line (a_marker: POINTER): INTEGER
			-- gint gtk_source_marker_get_line (GtkSourceMarker *marker);
		external "C use <gtksourceview/gtksourcemarker.h>"
		end
	
	gtk_source_marker_get_name (a_marker: POINTER): POINTER
		-- const gchar* gtk_source_marker_get_name (GtkSourceMarker *marker);
		external "C use <gtksourceview/gtksourcemarker.h>"
		end

	gtk_source_marker_get_buffer (a_marker: POINTER): POINTER
			--	GtkSourceBuffer* gtk_source_marker_get_buffer (GtkSourceMarker
			--	*marker);
		external "C use <gtksourceview/gtksourcemarker.h>"
		end

	gtk_source_marker_next (a_marker: POINTER): POINTER
			--GtkSourceMarker* gtk_source_marker_next (GtkSourceMarker *marker);
		external "C use <gtksourceview/gtksourcemarker.h>"
		end
	
	gtk_source_marker_prev (a_marker: POINTER): POINTER
			-- GtkSourceMarker* gtk_source_marker_prev (GtkSourceMarker *marker);
		external "C use <gtksourceview/gtksourcemarker.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkSourceMarker)"
		end
end -- class GTKSOURCEVIEW_GTK_SOURCE_MARKER
