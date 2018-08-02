note
	description: "."
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli, GTK+ team
					
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

deferred class GTK_PRINT_OPERATION_PREVIEW

inherit G_OBJECT

insert GTK_PRINT_OPERATION_PREVIEW_EXTERNALS

feature {ANY} -- Creation
	end_preview
			-- Ends a preview. This function must be called to finish a custom
			-- print preview.
		do
			gtk_print_operation_preview_end_preview(handle)
		end

	is_selected (a_page_number: INTEGER): BOOLEAN
			-- Has the given page is included in the set of pages that have been
			-- selected for printing?
		do
			Result:=gtk_print_operation_preview_is_selected(handle,a_page_number).to_boolean
		end

	render_page (a_page_number: INTEGER)
			-- Renders a page to the preview, using the print context that was
			-- passed to the GtkPrintOperation::preview handler together with
			-- preview.

			-- Note that this function requires a suitable cairo context to be
			-- associated with the print context.
		do
			gtk_print_operation_preview_render_page(handle,a_page_number)
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkPrintOperationPreview)"
		end

end -- class GTK_PRINT_OPERATION_PREVIEW
