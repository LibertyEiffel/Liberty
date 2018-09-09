note
	description: "GtkTextChildAnchor: a spot in the buffer where child widgets can be anchored"
	copyright:
		"[
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

class GTK_TEXT_CHILD_ANCHOR
	-- A GtkTextChildAnchor is a spot in the buffer where child widgets
	-- can be "anchored" (inserted inline, as if they were
	-- characters). The anchor can have multiple widgets anchored, to
	-- allow for multiple views.

inherit G_OBJECT

insert GTK

create {ANY} make, from_external_pointer

feature {} -- Creation
	make
		-- Creates a new GtkTextChildAnchor. Usually you would then
		-- insert it into a GTK_TEXT_BUFFER with
		-- `insert_child_anchor'. To perform the creation and insertion
		-- in one step, use the convenience function
		-- `GTK_TEXT_BUFFER.create_child_anchor'.
		require
			gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_text_child_anchor_new)
		end

feature {ANY}
	widgets: G_LIST [GTK_WIDGET]
			-- a list of all widgets anchored at this child anchor.
		do
			create {G_OBJECT_LIST[GTK_WIDGET]} Result.from_external_pointer (gtk_text_child_anchor_get_widgets (handle))
		end

	get_deleted: BOOLEAN
			-- Has the child anchor been deleted from its buffer? Keep in
			-- mind that the child anchor will be unreferenced when
			-- removed from the buffer, so you need to hold your own
			-- reference (with `ref') if you plan to use this function
			-- otherwise all deleted child anchors will also be
			-- finalized. 
		do
			Result := gtk_text_child_anchor_get_deleted(handle).to_boolean
		end
	
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTextChildAnchor)"

		end
feature {} -- External calls

	gtk_text_child_anchor_new: POINTER is --GtkTextChildAnchor*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_text_child_anchor_get_widgets (an_anchor: POINTER): POINTER is --GList*
		external "C use <gtk/gtk.h>"
		end
 
	gtk_text_child_anchor_get_deleted (an_anchor: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
end
