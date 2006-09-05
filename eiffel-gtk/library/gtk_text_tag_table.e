indexing
	description: "GtkTextTagTable - Collection of tags that can be used together."
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


			-- Description: You may wish to begin by reading the text
			-- widget conceptual overview which gives an overview of all
			-- the objects and data types related to the text widget and
			-- how they work together.


class GTK_TEXT_TAG_TABLE

inherit G_OBJECT

insert GTK

creation make, from_external_pointer

feature {} -- Creation

	make is
			-- Creates a new GtkTextTagTable. The table contains no tags
			-- by default.
		require
			gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_text_tag_table_new)
		end

feature
	add (a_tag: GTK_TEXT_TAG) is
			-- Add a tag to the table. The tag is assigned the highest priority in the table.
		require
			tag_not_void: a_tag /= Void
			-- TODO: tag must not be in a tag table already,
			-- TODO: a tagmay not have the same name as an already-added tag.
		do
			gtk_text_tag_table_add (handle, a_tag.handle)
		end

	remove (a_tag: GTK_TEXT_TAG) is
			-- Remove a tag from the table. This will remove the table's
			-- reference to the tag, so be careful - the tag will end up
			-- destroyed if you don't have a reference to it.
		require
			tag_not_void: a_tag /= Void
		do
			gtk_text_tag_table_remove (handle, a_tag.handle)
		end
	
	lookup (a_name: STRING): GTK_TEXT_TAG is
			-- Lookup the tag with `a_name', or Void if none by that name
			-- is in the table.
		local ptr: POINTER; retriever: G_RETRIEVER [GTK_TEXT_TAG]
		do
			ptr := gtk_text_tag_table_lookup (handle, a_name.to_external)
			if ptr.is_not_null then
				Result := retriever.eiffel_wrapper_from_gobject_pointer (ptr)
				if Result = Void then
					create Result.from_external_pointer (ptr)
				end
			end
		end

-- gtk_text_tag_table_foreach ()

-- void        gtk_text_tag_table_foreach      (GtkTextTagTable *table,
--                                              GtkTextTagTableForeach func,
--                                              gpointer data);

-- Calls func on each tag in table, with user data data. Note that the table may not be modified while iterating over it (you can't add/remove tags).

-- table : 	a GtkTextTagTable
-- func : 	a function to call on each tag
-- data : 	user data
-- gtk_text_tag_table_get_size ()

-- gint        gtk_text_tag_table_get_size     (GtkTextTagTable *table);

-- Returns the size of the table (number of tags)

-- table : 	a GtkTextTagTable
	-- Returns : 	number of tags in table
	
feature -- TODO: Signals

-- "tag-added" void        user_function      (GtkTextTagTable *texttagtable,
--                                             GtkTextTag      *arg1,
--                                             gpointer         user_data)         : Run last
-- "tag-changed"
--             void        user_function      (GtkTextTagTable *texttagtable,
--                                             GtkTextTag      *arg1,
--                                             gboolean         arg2,
--                                             gpointer         user_data)         : Run last
-- "tag-removed"
--             void        user_function      (GtkTextTagTable *texttagtable,
--                                             GtkTextTag      *arg1,
--                                             gpointer         user_data)         : Run last
-- Signal Details
-- The "tag-added" signal

-- void        user_function                  (GtkTextTagTable *texttagtable,
--                                             GtkTextTag      *arg1,
--                                             gpointer         user_data)         : Run last

-- texttagtable : 	the object which received the signal.
-- arg1 : 	
-- user_data : 	user data set when the signal handler was connected.
-- The "tag-changed" signal

-- void        user_function                  (GtkTextTagTable *texttagtable,
--                                             GtkTextTag      *arg1,
--                                             gboolean         arg2,
--                                             gpointer         user_data)         : Run last

-- texttagtable : 	the object which received the signal.
-- arg1 : 	
-- arg2 : 	
-- user_data : 	user data set when the signal handler was connected.
-- The "tag-removed" signal

-- void        user_function                  (GtkTextTagTable *texttagtable,
--                                             GtkTextTag      *arg1,
--                                             gpointer         user_data)         : Run last

-- texttagtable : 	the object which received the signal.
-- arg1 : 	
-- user_data : 	user data set when the signal handler was connected.

feature -- size

	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTextTagTable)"
		end

feature {} -- External calls
	-- void        (*GtkTextTagTableForeach)       (GtkTextTag *tag, gpointer data)

	gtk_text_tag_table_new: POINTER is -- GtkTextTagTable*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_text_tag_table_add (a_table, a_tag: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_text_tag_table_remove (a_table, a_tag: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_text_tag_table_lookup (a_table, a_const_name: POINTER): POINTER is -- GtkTextTag*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_text_tag_table_foreach (a_table, a_gtktexttagtableforeach_func, some_data: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_text_tag_table_get_size (a_table: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end
end
