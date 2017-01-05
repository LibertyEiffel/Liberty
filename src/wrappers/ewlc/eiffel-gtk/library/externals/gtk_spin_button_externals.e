note
	description: "External calls for GTK_SPIN_BUTTON"
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

deferred class GTK_SPIN_BUTTON_EXTERNALS

inherit ANY undefine is_equal, copy end

insert
	GTK_SPIN_BUTTON_UPDATE_POLICY
	GTK_SPIN_TYPE
	-- Note: for a "better" portability these classes inherited non-conformigly 
	-- could be inherited "normally" exporting everything to NONE

feature {} -- External calls

	gtk_spin_button_configure (a_spin_button, an_adjustment: POINTER; a_climb_rate: REAL; some_digits: INTEGER)
			-- Note some_digits shall be NATURAL
		require
			valid_spin_button: a_spin_button.is_not_null
			valid_adjustment: an_adjustment.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_new (an_adjustment: POINTER; a_climb_rate: REAL; some_digits: INTEGER): POINTER
		-- TODO: some_digits shall be NATURAL
		require valid_adjustment: an_adjustment.is_not_null
			positive_digits: some_digits >= 0
		external "C use <gtk/gtk.h>"
		ensure Result.is_not_null
		end

	gtk_spin_button_new_with_range (a_min,a_max,a_step: REAL): POINTER
		require valid_values: a_min < a_max 
		external "C use <gtk/gtk.h>"
		ensure Result.is_not_null
		end

	gtk_spin_button_set_adjustment (a_spin_button, an_adjustment: POINTER)
		require
			valid_spin_button: a_spin_button.is_not_null
			valid_adjustment: an_adjustment.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_get_adjustment (a_spin_button: POINTER): POINTER
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		ensure Result.is_not_null
		end

	gtk_spin_button_set_digits (a_spin_button: POINTER; some_digits: INTEGER)
			-- TODO some_digits shall be NATURAL
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_set_increments (a_spin_button: POINTER; a_step,a_page:REAL)
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_set_range (a_spin_button: POINTER; a_min, a_max: REAL)
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_get_value_as_int (a_spin_button: POINTER): INTEGER
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_set_value (a_spin_button: POINTER; a_value: REAL)
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_set_update_policy (a_spin_button: POINTER; a_policy: INTEGER)
		require
			valid_spin_button: a_spin_button.is_not_null
			valid_policy: is_valid_gtk_spin_button_update_policy (a_policy)
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_set_numeric (a_spin_button: POINTER; a_numeric: INTEGER)
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_spin (a_spin_button: POINTER; a_direction: INTEGER; an_increment: REAL)
		require
			valid_spin_button: a_spin_button.is_not_null
			valid_direction: is_valid_gtk_spin_type (a_direction)
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_set_wrap (a_spin_button: POINTER; a_wrap: INTEGER)
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_set_snap_to_ticks (a_spin_button: POINTER; a_snap_to_ticks: INTEGER)
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_update (a_spin_button: POINTER)
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_get_digits (a_spin_button: POINTER): INTEGER
			-- Note: result shall be NATURAL
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_get_increments (a_spin_button, a_step_ptr, a_page_ptr: POINTER)
		require
			valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_get_numeric (a_spin_button: POINTER): INTEGER
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end
	
	gtk_spin_button_get_range (a_spin_button, a_min_ptr, a_max_ptr: POINTER)
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_get_snap_to_ticks (a_spin_button: POINTER): INTEGER
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_get_update_policy (a_spin_button: POINTER): INTEGER
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_get_value (a_spin_button: POINTER): REAL
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_spin_button_get_wrap (a_spin_button: POINTER): INTEGER
		require valid_spin_button: a_spin_button.is_not_null
		external "C use <gtk/gtk.h>"
		end

	-- Signals

	-- "change-value"
	-- void user_function (GtkSpinButton *spinbutton, GtkScrollType arg1, gpointer user_data);
	-- "input" gint user_function (GtkSpinButton *spinbutton, gpointer arg1, gpointer user_data);
	-- "output" gboolean user_function (GtkSpinButton *spinbutton, gpointer user_data);
	-- "value-changed"
	-- void user_function (GtkSpinButton *spinbutton, gpointer user_data);

end
