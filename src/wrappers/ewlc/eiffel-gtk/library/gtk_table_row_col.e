note
	description: "."
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
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_TABLE_ROW_COL
inherit G_STRUCT
	
create {ANY} from_external_pointer
	
	-- TODO: wrap this structure for real
	
feature {} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTableRowCol)"
		end

feature {} -- Creation
	--   GtkTableRowCol

	--  typedef struct {
	--    guint16 requisition;
	--    guint16 allocation;
	--    guint16 spacing;
	--    guint need_expand : 1;
	--    guint need_shrink : 1;
	--    guint expand : 1;
	--    guint shrink : 1;
	--    guint empty : 1;
	--  } GtkTableRowCol;
	
	-- These fields should be considered read-only and not be modified
	-- directly.
end
