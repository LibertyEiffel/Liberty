indexing
	description: "."
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
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_SELECTION_DATA
inherit C_STRUCT -- TODO: check if SHARED_C_STRUCT is a better choice
creation make, from_external_pointer

feature {NONE} -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkSelectionData)"
		end

feature {NONE} -- Creation

--   GtkSelectionData

-- typedef struct {
--   GdkAtom       selection;
--   GdkAtom       target;
--   GdkAtom       type;
--   gint          format;
--   guchar       *data;
--   gint          length;
--   GdkDisplay   *display;
-- } GtkSelectionData;
end
