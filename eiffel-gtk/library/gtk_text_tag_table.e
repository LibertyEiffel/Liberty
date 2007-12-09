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

class GTK_TEXT_TAG_TABLE
	-- A collection of tags that can be used together.

	-- You may wish to begin by reading the text widget conceptual
	-- overview which gives an overview of all the objects and data
	-- types related to the text widget and how they work together.


inherit
	G_OBJECT rename lookup as g_object_lookup end

insert
	GTK
	GTK_TEXT_TAG_TABLE_EXTERNALS

creation dummy, make, from_external_pointer

feature {} -- Creation

	make is
			-- Creates a new GtkTextTagTable. The table contains no tags
			-- by default.
		require
			gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_text_tag_table_new)
		end

feature -- Operations

	add (a_tag: GTK_TEXT_TAG) is
			-- Add a tag to the table. The tag is assigned the highest priority in the table.
		require
			tag_not_void: a_tag /= Void
			named_tag: a_tag.name/=Void
			-- TODO: tag must not be in a tag table already,
						  
			-- TODO: a tag may not have the same name as an already-added
			-- tag.
			no_tag_with_same_name: lookup(a_tag.name)=Void
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

feature -- Access

	has (a_name: STRING): BOOLEAN is
		do
			Result := lookup (a_name) /= Void
		end
	
	lookup (a_name: STRING): GTK_TEXT_TAG is
			-- Lookup the tag with `a_name', or Void if none by that name
			-- is in the table.
		do
			Result := text_tag_factory.wrapper_or_void(gtk_text_tag_table_lookup(handle, a_name.to_external))
		ensure
			has (a_name) implies Result /= Void
		end

	has (a_tag: GTK_TEXT_TAG): BOOLEAN is
		require
			tag_not_void: a_tag /= Void
			named_tag: a_tag.name /= Void
		do
			Result:= gtk_text_tag_table_lookup(handle, a_tag.name.to_external).is_not_null
		end
		-- gtk_text_tag_table_foreach ()
	
		-- void        gtk_text_tag_table_foreach      (GtkTextTagTable *table,
		--                                              GtkTextTagTableForeach func,
		--                                              gpointer data);
	
		-- Calls func on each tag in table, with user data data. Note that the table may not be modified while iterating over it (you can't add/remove tags).
	
		-- table : 	a GtkTextTagTable
		-- func : 	a function to call on each tag
		-- data : 	user data

	size: INTEGER is
			-- Returns the size of the table (number of tags)
		do
			Result := gtk_text_tag_table_get_size (handle)
		end


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

	dummy_gobject: POINTER is
		do
			Result:=gtk_text_tag_table_new
		end
end
