note
	description: "External calls for GtkLabel A widget that displays a small to medium amount of text"
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_LABEL_EXTERNALS

inherit
	GTK_JUSTIFICATION

	ANY undefine is_equal, copy end


feature {} -- External calls

	gtk_label_new (a_string: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_label_set_text (a_label,a_string: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_label_set_attributes (a_label, pangoattrlist: POINTER;)
		external "C use <gtk/gtk.h>"
		end

	gtk_label_set_markup (a_label, a_string: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_label_set_markup_with_mnemonic (a_label, a_string: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_label_set_pattern (a_label,a_pattern: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_label_set_justify (a_label: POINTER; a_justification: INTEGER)
		require is_valid_gtk_justification (a_justification)
		external "C use <gtk/gtk.h>"
		end

	-- TODO: gtk_label_set_ellipsize (a_label:
	-- POINTER;PangoEllipsizeMode mode) is external "C use <gtk/gtk.h>"
	-- end

	gtk_label_set_width_chars (a_label: POINTER; n_chars: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_label_set_max_width_chars (a_label: POINTER; n_chars: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_label_set_line_wrap (a_label: POINTER; a_wrap: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_label_get_layout_offsets (a_label, an_y, a_y: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_label_get_mnemonic_keyval   (a_label: POINTER): INTEGER
			-- TODO Result is guint
		external "C use <gtk/gtk.h>"
		end

	gtk_label_get_selectable (a_label: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_label_get_text (a_label: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_label_new_with_mnemonic (a_string: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_label_select_region (a_label: POINTER;a_start_offset,an_end_offset: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_label_set_mnemonic_widget (a_label, a_widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_label_set_selectable (a_label: POINTER;a_setting: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_label_set_text_with_mnemonic (a_label, a_string: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_label_get_attributes     (a_label: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_label_get_justify      (a_label: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		ensure valid: is_valid_gtk_justification (Result)
		end

	-- TODO PangoEllipsizeMode gtk_label_get_ellipsize (a_label:
	-- POINTER) is external "C use <gtk/gtk.h>" end

	gtk_label_get_width_chars (a_label: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_label_get_max_width_chars   (a_label: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_label_get_label            (a_label: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_label_get_layout           (a_label: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_label_get_line_wrap (a_label: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_label_get_mnemonic_widget   (a_label: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_label_get_selection_bounds (a_label,a_start,an_end: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_label_get_use_markup (a_label: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_label_get_use_underline (a_label: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_label_get_single_line_mode (a_label: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_label_get_angle             (a_label: POINTER): REAL
		external "C use <gtk/gtk.h>"
		end

	gtk_label_set_label (a_label,a_string: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_label_set_use_markup (a_label: POINTER;a_setting: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_label_set_use_underline (a_label: POINTER; a_setting: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_label_set_single_line_mode (a_label: POINTER; single_line_mode: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_label_set_angle (a_label: POINTER;an_angle: REAL)
		external "C use <gtk/gtk.h>"
		end

end
