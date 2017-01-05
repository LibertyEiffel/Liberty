note
	description: "A GdkCursor structure represents a cursor."
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GDK_CURSOR

inherit
	G_STRUCT
		redefine dispose end

insert
	GDK_CURSOR_EXTERNALS

create {ANY} from_type, from_external_cursor

feature {ANY} -- size

	struct_size: INTEGER
		external "C inline use <gdk/gdk.h>"
		alias "sizeof(GdkCursor)"
		end

feature {} -- Creation

	from_type (a_cursor_type: INTEGER)
		require
			is_valid_gdk_cursor_type (a_cursor_type)
		do
			from_external_pointer (gdk_cursor_new (a_cursor_type))
		end

	from_external_cursor (a_cursor: POINTER)
			-- Creates a cursor from an already existing C cursor.  This feature
			-- Increases the reference count to a_cursor by one.
		require
			a_cursor.is_not_null
		local
			dummy: POINTER
		do
			from_external_pointer (a_cursor)
			dummy := gdk_cursor_ref (a_cursor)
		end

feature {ANY} -- Disposing

	dispose
		do
			gdk_cursor_unref (handle)
			handle:= default_pointer -- null
		end

feature {ANY}

--typedef struct {
--  GdkCursorType type;
--} GdkCursor;

	cursor_type: INTEGER
		do
			Result := gdk_cursor_type (handle)
		ensure
			is_valid_gdk_cursor_type (Result)
		end

end -- class GDK_CURSOR

