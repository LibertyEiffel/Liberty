note
	description: "."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GtkSourceView developers
					
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

class GTK_SOURCE_TAG_TABLE

inherit
	GTK_TEXT_TAG_TABLE
		redefine 
			make,
			struct_size
		end

create {ANY} dummy, make, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new GtkSourceTagTable. The table contains no tags by
			-- default.
		do
			from_external_pointer(gtk_source_tag_table_new)
		end

feature {ANY}
	add_tags (some_tags: G_SLIST[GTK_TEXT_TAG])
			-- Adds a list of tag to the table. The added tags are assigned the
			-- highest priority in the table.

			-- If a tag is already present in table or has the same name as an
			-- already-added tag, then it is not added to the table.
		require tags_not_void: some_tags/=Void
		do
			gtk_source_tag_table_add_tags(handle,some_tags.handle)
		end

	remove_source_tags
			-- Removes all the source tags from the table. This will remove the
			-- table's reference to the tags, so be careful - tags will end up
			-- destroyed if you don't have a reference to them.
		do
			gtk_source_tag_table_remove_source_tags(handle)
		end

feature {ANY} -- Signals
	--   "changed"                                        : Run Last
	--Signal Details
	--
	--  The "changed" signal
	--
	-- void                user_function                      (GtkSourceTagTable *sourcetagtable,
	--                                                         gpointer           user_data)           : Run Last
	--
	--   sourcetagtable : the object which received the signal.
	--   user_data :      user data set when the signal handler was connected.

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtksourceview/gtksourcetagtable.h>"
		alias "sizeof(GtkSourceTagTable)"
		end
	
feature {} -- External calls
	gtk_source_tag_table_new: POINTER
			-- GtkSourceTagTable* gtk_source_tag_table_new (void);
		external "C use <gtksourceview/gtksourcetagtable.h>"
		end
	
	gtk_source_tag_table_add_tags (a_table, some_tags: POINTER)
			-- void gtk_source_tag_table_add_tags (GtkSourceTagTable *table, const
			-- GSList *tags);
		external "C use <gtksourceview/gtksourcetagtable.h>"
		end
	
	gtk_source_tag_table_remove_source_tags (a_table: POINTER)
			-- void gtk_source_tag_table_remove_source_tags (GtkSourceTagTable
			-- *table);
		external "C use <gtksourceview/gtksourcetagtable.h>"
		end
	

end -- class GTK_SOURCE_TAG_TABLE
