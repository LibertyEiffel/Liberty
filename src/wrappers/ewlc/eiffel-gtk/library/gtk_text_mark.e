note
	description: "GtkTextMark -- a position in the buffer preserved across buffer modifications."
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

class GTK_TEXT_MARK
	-- You may wish to begin by reading the text widget
	-- conceptual overview which gives an overview of all
	-- the objects and data types related to the text
	-- widget and how they work together.

	-- A GtkTextMark is like a bookmark in a text buffer; it preserves a position
	-- in the text. You can convert the mark to an iterator using
	-- GTK_TEXT_BUFFER's `iter_at_mark'. Unlike iterators, marks remain valid
	-- across buffer mutations, because their behavior is defined when text is
	-- inserted or deleted. When text containing a mark is deleted, the mark
	-- remains in the position originally occupied by the deleted text. When text
	-- is inserted at a mark, a mark with left gravity will be moved to the
	-- beginning of the newly-inserted text, and a mark with right gravity will
	-- be moved to the end.

	-- Marks are reference counted, but the reference count only controls the
	-- validity of the memory; marks can be deleted from the buffer at any time
	-- with GTK_TEXT_BUFFER's `delete_mark'. Once deleted from the buffer, a mark
	-- is essentially useless.

	-- Marks optionally have names; these can be convenient to avoid passing the
	-- GtkTextMark object around.
	
	-- Marks are typically created using the GTK_TEXT_BUFFER's `create_mark'
	-- function.

inherit G_OBJECT

create {ANY} from_external_pointer

feature {ANY}

	set_visible
			-- Makes the mark visible; the insertion point is normally
			-- visible, i.e. you can see it as a vertical bar. Also, the
			-- text widget uses a visible mark to indicate where a drop
			-- will occur when dragging-and-dropping text. Most other
			-- marks are not visible. Marks are not visible by default.
		do
			gtk_text_mark_set_visible (handle, 1)
		ensure visible: is_visible
		end

	set_invisible
			-- Makes the mark invisible; see also `set_visible'
		do
			gtk_text_mark_set_visible (handle, 0)
		ensure invisible: not is_visible
		end

	is_visible: BOOLEAN
			-- Is the mark visible ? (i.e. a cursor is displayed for it)
		do
			Result := (gtk_text_mark_get_visible (handle).to_boolean)
		end

	is_deleted: BOOLEAN
			-- Has the mark been removed from its buffer with
			-- `GTK_TEXT_BUFFER.delete_mark'?. Marks can't be used once
			-- deleted.
		do
			Result := (gtk_text_mark_get_deleted (handle).to_boolean)
		end

	name: STRING
			-- the mark name; Void for anonymous marks.
		local ptr: POINTER
		do
			ptr := gtk_text_mark_get_name (handle)
			if ptr.is_not_null then
				create Result.from_external_copy (ptr)
			end
		end

	buffer: GTK_TEXT_BUFFER
			-- the buffer this mark is located inside, or Void if the
			-- mark is deleted.
		local factory: G_OBJECT_EXPANDED_FACTORY [GTK_TEXT_BUFFER]
		do
			Result := factory.wrapper_or_void (gtk_text_mark_get_buffer (handle))
		end

	has_left_gravity: BOOLEAN
			-- Does the mark have left gravity? "left" and "right" here
			-- refer to logical direction (left is the toward the start
			-- of the buffer); in some languages such as Hebrew the
			-- logically-leftmost text is not actually on the left when
			-- displayed.
		do
			Result:=(gtk_text_mark_get_left_gravity (handle).to_boolean)
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTextMark)"
		end

feature {} -- External features
	gtk_text_mark_set_visible (a_mark: POINTER; a_gboolean_setting: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_text_mark_get_visible (a_mark: POINTER): INTEGER is --gboolean
		external "C use <gtk/gtk.h>"
		end
	
	gtk_text_mark_get_deleted (a_mark: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
	
	gtk_text_mark_get_name (a_mark: POINTER): POINTER is -- const gchar*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_text_mark_get_buffer (a_mark: POINTER): POINTER is -- GtkTextBuffer*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_text_mark_get_left_gravity (a_mark: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
end
