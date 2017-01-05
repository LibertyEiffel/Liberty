note
	description: "GtkTargetEntry -- External calls."
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

deferred class GTK_TARGET_ENTRY_EXTERNALS

inherit ANY undefine is_equal, copy end

		-- GtkTargetEntry
		-- 
		-- typedef struct {
		--   gchar *target;
		--   guint  flags;
		--   guint  info;
		-- } GtkTargetEntry;

feature {} -- External calls

	gtk_target_entry_get_target (handle: POINTER): POINTER
		external "C struct GtkTargetEntry get target use <gtk/gtk.h>"
		end

	gtk_target_entry_get_flags (handle: POINTER): INTEGER
		external "C struct GtkTargetEntry get flags use <gtk/gtk.h>"
		end

	gtk_target_entry_get_info (handle: POINTER): INTEGER
		external "C struct GtkTargetEntry get info use <gtk/gtk.h>"
		end

	gtk_target_entry_set_target (handle, a_target: POINTER)
		external "C struct GtkTargetEntry set target use <gtk/gtk.h>"
		end

	gtk_target_entry_set_flags (handle: POINTER; some_flags: INTEGER)
		external "C struct GtkTargetEntry set flags use <gtk/gtk.h>"
		end

	gtk_target_entry_set_info (handle: POINTER; some_info: INTEGER)
		external "C struct GtkTargetEntry set info use <gtk/gtk.h>"
		end

end -- class GTK_TARGET_ENTRY_EXTERNALS
