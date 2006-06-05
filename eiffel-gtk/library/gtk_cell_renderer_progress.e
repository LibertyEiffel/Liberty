indexing
	description: "GtkCellRendererProgress %GÅ‚Äî%@ Renders numbers as progress bars."
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

class GTK_CELL_RENDERER_PROGRESS
inherit GTK_CELL_RENDERER redefine make	
creation make, from_external_pointer

feature {NONE} -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkCellRendererProgress)"
		end

feature {NONE} -- Creation
	make is
			-- Creates a new GtkCellRendererProgress.
		do
			handle := gtk_cell_renderer_progress_new 
		end 

feature -- Properties
			
--   "text"                 gchararray            : Read / Write
--   "value"                gint                  : Read / Write
-- Property Details
feature -- The "text" property
	text: STRING is
			-- The "text" property determines the label which will be
			-- drawn over the progress bar. Setting this property to Void
			-- causes the default label to be displayed. Setting this
			-- property to an empty string causes no label to be
			-- displayed.
		do
			Result:= get_string_property(text_property_name)
		end

	set_text (a_text: STRING) is
			-- Set text property
		obsolete "Please provide a more direct implementation. Currently there is a temporary G_VALUE object"
		require valid_text: a_text /= Void
		do
			set_property (create {G_VALUE}.from_string(a_text))
		end

	-- Default value: NULL

feature -- The "value" property

--   "value"                gint                  : Read / Write

-- The "value" property determines the percentage to which the progress bar will be "filled in".

-- Allowed values: [0,100]

-- Default value: 0

-- Since 2.6
feature {NONE} -- Properties names
	text_property_name: STRING is "text"
	value_property_name: STRING is "value"

feature {NONE} -- External calls
	gtk_cell_renderer_progress_new: POINTER is
		external "C use <gtk/gtk.h>"
		end
end
