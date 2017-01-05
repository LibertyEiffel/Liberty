note
	description: "GtkCellRendererProgress — Renders numbers as progress bars."
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

class GTK_CELL_RENDERER_PROGRESS

inherit GTK_CELL_RENDERER

create {ANY} make, from_external_pointer

feature {} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkCellRendererProgress)"
		end

feature {} -- Creation
	make
			-- Creates a new GtkCellRendererProgress.
		do
			from_external_pointer (gtk_cell_renderer_progress_new)
		end 

feature {ANY} -- Properties
			
--   "text"                 gchararray            : Read / Write
--   "value"                gint                  : Read / Write
-- Property Details
feature {ANY} -- The "text" property
	text: STRING
			-- The "text" property determines the label which will be
			-- drawn over the progress bar. Setting this property to Void
			-- causes the default label to be displayed. Setting this
			-- property to an empty string causes no label to be
			-- displayed.
		do
			Result:= get_string_property(text_property_name)
		end

	set_text (a_text: STRING)
			-- Set text property
			-- TODO: provide a more direct implementation. Currently there is a temporary G_VALUE object
		require valid_text: a_text /= Void
		do
			set_property (text_property_name, create {G_VALUE}.from_string(a_text))
		end

feature {ANY} -- The "value" property
	value: INTEGER
			-- The "value" property determines the percentage to which
			-- the progress bar will be "filled in".
		do
			Result:=integer_property(value_property_name)
		ensure in_range: Result.in_range(0,100)
		end

	set_value (a_value: INTEGER)
		require in_range: a_value.in_range(0,100)
		do
			set_integer_property(value_property_name,a_value)
		end
	
feature {} -- Properties names
	text_property_name: STRING is "text"
	value_property_name: STRING is "value"

feature {} -- External calls
	gtk_cell_renderer_progress_new: POINTER
		external "C use <gtk/gtk.h>"
		end
end
