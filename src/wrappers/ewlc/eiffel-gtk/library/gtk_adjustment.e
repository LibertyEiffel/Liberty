note
	description: "GtkAdjustment -- A GtkObject representing an adjustable bounded value."
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

class GTK_ADJUSTMENT
	-- The GtkAdjustment object represents a value which has an
	-- associated lower and upper bound, together with step and page
	-- increments, and a page size. It is used within several GTK+
	-- widgets, including GtkSpinButton, GtkViewport, and GtkRange
	-- (which is a base class for GtkHScrollbar, GtkVScrollbar,
	-- GtkHScale, and GtkVScale).

	-- The GtkAdjustment object does not update the value
	-- itself. Instead it is left up to the owner of the GtkAdjustment
	-- to control the value.

	-- The owner of the GtkAdjustment typically calls the
	-- `value_changed' and `changed' features after changing the value
	-- and its bounds. This results in the emission of the
	-- "value_changed" or "changed" signal respectively.

inherit GTK_OBJECT

insert
	GTK_ADJUSTMENT_EXTERNALS
	EXCEPTIONS
		export {} all
		undefine copy, is_equal
		end

create {ANY} make, from_external_pointer

feature {ANY}
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkAdjustment)"
		end

feature {} -- Creation

	make (a_value, a_lower, an_upper, a_step_increment, a_page_increment, a_page_size: REAL_64)
			-- Creates a new GtkAdjustment.
			-- a_value : 	the initial value.
			-- a_lower : 	the minimum value.
			-- an_upper : 	the maximum value.
			-- a_step_increment : 	the step increment.
			-- a_page_increment : 	the page increment.
			-- a_page_size : 	the page size.
		do
			from_external_pointer(gtk_adjustment_new (a_value, a_lower, an_upper,
										 a_step_increment, a_page_increment, a_page_size))
		end

feature {ANY} -- Access

	value: REAL_64
			-- the current value of the adjustment. 
		do
			Result := gtk_adjustment_get_value (handle)
		end

	lower: REAL_64
			-- Retrieves the lowest possible value for this adjustment
		do
			Result := gtk_adjustment_get_lower (handle)
		end

	upper: REAL_64
			-- The maximum value of the adjustment. Note that values will be
			-- restricted by upper - page-size if the page-size property is nonzero.
		do
			Result := gtk_adjustment_get_upper (handle)
		end

	page_increment: REAL_64
			-- Retrieves the page increment for this adjustment.  In a GtkScrollbar this
			-- increment is used when the mouse is clicked in the trough, to scroll by a
			-- large amount.
		do
			Result := gtk_adjustment_get_page_increment (handle)
		end

	page_size: REAL_64
			-- Retrieves page size of the adjustment.
			-- In a GtkScrollbar this is the size of the area which is currently visible.
			-- Irrelevant and should be set to zero if the adjustment is used for a
			-- simple scalar value, e.g. in a GtkSpinButton.
		do
			Result := gtk_adjustment_get_page_size (handle)
		end

	step_increment: REAL_64
			-- Retrieves the increment to use to make minor changes to the value.
			-- In a GtkScrollbar this increment is used when the mouse is clicked on
			-- the arrows at the top and bottom of the scrollbar, to scroll by a
			-- small amount.
		do
			Result := gtk_adjustment_get_step_increment (handle)
		end

feature {ANY} -- Operations

	set_value (a_value: REAL_64)
			-- Sets the GtkAdjustment value. The value is clamped to lie
			-- between adjustment->lower and adjustment->upper.
			-- Note that for adjustments which are used in a
			-- GtkScrollbar, the effective range of allowed values goes
			-- from adjustment->lower to adjustment->upper -
			-- adjustment->page_size.
		do
			gtk_adjustment_set_value (handle, a_value)
		end

	set_lower (a_lower: REAL_64)
			-- Sets the lowest possible value for this adjustment
		do
			gtk_adjustment_set_lower (handle, a_lower)
		end

	set_upper (an_upper: REAL_64)
			-- Sets the maximum value of the adjustment. Note that values will be
			-- restricted by upper - page-size if the page-size property is nonzero.
		do
			gtk_adjustment_set_upper (handle, an_upper)
		end

	set_page_increment (a_page_increment: REAL_64)
			-- Sets the page increment for this adjustment.  In a GtkScrollbar this
			-- increment is used when the mouse is clicked in the trough, to scroll by a
			-- large amount.
		do
			gtk_adjustment_set_page_increment (handle, a_page_increment)
		end

	set_page_size (a_page_size: REAL_64)
			-- Sets the page size of the adjustment.
			-- In a GtkScrollbar this is the size of the area which is currently visible.
			-- Irrelevant and should be set to zero if the adjustment is used for a
			-- simple scalar value, e.g. in a GtkSpinButton.
		do
			gtk_adjustment_set_page_size (handle, a_page_size)
		end

	set_step_increment (a_step_increment: REAL_64)
			-- Sets the increment to use to make minor changes to the value.
			-- In a GtkScrollbar this increment is used when the mouse is clicked on
			-- the arrows at the top and bottom of the scrollbar, to scroll by a
			-- small amount.
		do
			gtk_adjustment_set_step_increment (handle, a_step_increment)
		end

	clamp_page (a_lower, an_upper: REAL_64)
			-- Updates the GtkAdjustment value to ensure that the range
			-- between lower and upper is in the current page
			-- (i.e. between value and value + page_size). If the range
			-- is larger than the page size, then only the start of it
			-- will be in the current page. A "changed" signal will be
			-- emitted if the value is changed.
		do
			gtk_adjustment_clamp_page (handle, a_lower, an_upper)
		end

	changed
			-- Emits a "changed" signal from the GtkAdjustment. This is
			-- typically called by the owner of the GtkAdjustment after
			-- it has changed any of the GtkAdjustment fields other than
			-- the value.
		do
			gtk_adjustment_changed (handle)
		end

	value_changed
			-- Emits a "value_changed" signal from the
			-- GtkAdjustment. This is typically called by the owner of
			-- the GtkAdjustment after it has changed the GtkAdjustment
			-- value field.
		do
			gtk_adjustment_value_changed (handle)
		end

-- TODO: The "value" property
-- NOTE (achuni): the 'value' feature should be used instead of this, I think

-- Signal Details
-- The "changed" signal

-- void        user_function                  (GtkAdjustment *adjustment, gpointer user_data);

-- Emitted when one or more of the GtkAdjustment fields have been changed, other than the value field.
-- adjustment : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- The "value-changed" signal

-- void        user_function                  (GtkAdjustment *adjustment, gpointer user_data);

-- Emitted when the GtkAdjustment value field has been changed.
-- adjustment : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.

end
