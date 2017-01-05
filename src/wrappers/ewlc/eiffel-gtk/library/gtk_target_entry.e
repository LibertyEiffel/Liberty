note
	description: "GtkTargetEntry -- String representing the drag type."
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
				
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
	gtk_documentation: "[

						 ]"

class GTK_TARGET_ENTRY
	--	A GtkTargetEntry structure represents a single type of data than
	--	can be supplied for by a widget for a selection or for supplied
	--	or received during drag-and-drop. It contains a string
	--	representing the drag type, a flags field (used only for drag
	--	and drop - see GtkTargetFlags), and an application assigned
	--	integer ID. The integer ID will later be passed as a signal
	--	parameter for signals like %"selection_get%".  It allows the
	--	application to identify the target type without extensive string
	--	compares.

	-- GtkTargetEntry
	-- 
	-- typedef struct {
	--   gchar *target;
	--   guint  flags;
	--   guint  info;
	-- } GtkTargetEntry;
	
inherit
	G_STRUCT

insert
	GTK_TARGET_ENTRY_EXTERNALS

create {ANY} from_external_pointer, make

feature {ANY} -- Creation

	make
		do
			allocate
		end

feature {ANY} -- Access

	target: STRING
		local
			c_ptr: POINTER
		do
			c_ptr := gtk_target_entry_get_target (handle)
			if c_ptr.is_not_null then
				create Result.from_external (c_ptr)
			end
		end

	flags: INTEGER
		do
			Result := gtk_target_entry_get_flags (handle)
		end

	info: INTEGER
		do
			Result := gtk_target_entry_get_info (handle)
		end

feature {ANY} -- Operations

	set_target (a_target: STRING)
		require
			a_target /= Void
		do
			gtk_target_entry_set_target (handle, a_target.to_external)
		end

	set_flags (some_flags: INTEGER)
		do
			gtk_target_entry_set_flags (handle, some_flags)
		end

	set_info (some_info: INTEGER)
		do
			gtk_target_entry_set_info (handle, some_info)
		end

feature {ANY} -- size

	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof (GtkTargetEntry)"
		end

end
