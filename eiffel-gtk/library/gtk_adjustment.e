indexing
	description: "GtkAdjustment -- A GtkObject representing an adjustable bounded value."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

			-- Description
	
			-- The GtkAdjustment object represents a value which has an
			-- associated lower and upper bound, together with step and
			-- page increments, and a page size. It is used within
			-- several GTK+ widgets, including GtkSpinButton,
			-- GtkViewport, and GtkRange (which is a base class for
			-- GtkHScrollbar, GtkVScrollbar, GtkHScale, and GtkVScale).

			-- The GtkAdjustment object does not update the value
			-- itself. Instead it is left up to the owner of the
			-- GtkAdjustment to control the value.

			-- The owner of the GtkAdjustment typically calls the
			-- gtk_adjustment_value_changed() and
			-- gtk_adjustment_changed() functions after changing the
			-- value and its bounds. This results in the emission of the
			-- "value_changed" or "changed" signal respectively.

class GTK_ADJUSTMENT
inherit

	GTK_OBJECT rename make as make_gtk_object end
	GTK_ADJUSTMENT_EXTERNALS
	
creation make, from_external_pointer

feature 
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkAdjustment)"
		end

feature {NONE} -- Creation

	make (a_value, a_lower, an_upper, a_step_increment, a_page_increment, a_page_size: REAL) is
			-- Creates a new GtkAdjustment.
			-- a_value : 	the initial value.
			-- a_lower : 	the minimum value.
			-- an_upper : 	the maximum value.
			-- a_step_increment : 	the step increment.
			-- a_page_increment : 	the page increment.
			-- a_page_size : 	the page size.
		do
			handle := gtk_adjustment_new (a_value, a_lower, an_upper,
													a_step_increment, a_page_increment, a_page_size)
			store_eiffel_wrapper		
		end

feature

	value: REAL is
			-- the current value of the adjustment. 
		do
			Result := gtk_adjustment_get_value (handle)
		end

	set_value (a_value: REAL) is
			-- Sets the GtkAdjustment value. The value is clamped to lie
			-- between adjustment->lower and adjustment->upper.

			-- Note that for adjustments which are used in a
			-- GtkScrollbar, the effective range of allowed values goes
			-- from adjustment->lower to adjustment->upper -
			-- adjustment->page_size.
		do
			gtk_adjustment_set_value (handle,a_value)
		end

	clamp_page (a_lower, an_upper: REAL) is
			-- Updates the GtkAdjustment value to ensure that the range
			-- between lower and upper is in the current page
			-- (i.e. between value and value + page_size). If the range
			-- is larger than the page size, then only the start of it
			-- will be in the current page. A "changed" signal will be
			-- emitted if the value is changed.
		do
			gtk_adjustment_clamp_page (handle, a_lower, an_upper)
		end

	changed is
			-- Emits a "changed" signal from the GtkAdjustment. This is
			-- typically called by the owner of the GtkAdjustment after
			-- it has changed any of the GtkAdjustment fields other than
			-- the value.
		do
			gtk_adjustment_changed (handle)
		end


	value_changed is
			-- Emits a "value_changed" signal from the
			-- GtkAdjustment. This is typically called by the owner of
			-- the GtkAdjustment after it has changed the GtkAdjustment
			-- value field.
		do
			gtk_adjustment_value_changed (handle)
		end

feature -- TODO: The "lower" property

--   "lower"                gdouble               : Read / Write

-- The minimum value of the adjustment.

-- Default value: 0

-- Since 2.4
feature -- TODO: The "page-increment" property

--   "page-increment"       gdouble               : Read / Write

-- The page increment of the adjustment.

-- Default value: 0

-- Since 2.4
feature -- TODO: The "page-size" property

--   "page-size"            gdouble               : Read / Write

-- The page size of the adjustment. Note that the page-size is irrelevant and should be set to zero if the adjustment is used for a simple scalar value, e.g. in a GtkSpinButton.

-- Default value: 0

-- Since 2.4
feature -- TODO: The "step-increment" property

--   "step-increment"       gdouble               : Read / Write

-- The step increment of the adjustment.

-- Default value: 0

-- Since 2.4
feature -- TODO: The "upper" property

--   "upper"                gdouble               : Read / Write

-- The maximum value of the adjustment. Note that values will be restricted by upper - page-size if the page-size property is nonzero.

-- Default value: 0

-- Since 2.4
feature -- TODO: The "value" property

--   "value"                gdouble               : Read / Write

-- The value of the adjustment.

-- Default value: 0

-- Since 2.4
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

-- typedef struct _GtkAdjustment GtkAdjustment;

-- The GtkAdjustment-struct struct contains the following fields.
-- gdouble lower; 	the minimum value.
-- gdouble upper; 	the maximum value.
-- gdouble value; 	the current value.
-- gdouble step_increment; 	the increment to use to make minor changes to the value. In a GtkScrollbar this increment is used when the mouse is clicked on the arrows at the top and bottom of the scrollbar, to scroll by a small amount.
-- gdouble page_increment; 	the increment to use to make major changes to the value. In a GtkScrollbar this increment is used when the mouse is clicked in the trough, to scroll by a large amount.
-- gdouble page_size; 	the page size. In a GtkScrollbar this is the size of the area which is currently visible.

end
