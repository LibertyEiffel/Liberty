note
	description: "GtkSpinButton Retrieve an integer or floating-point number from the user."
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

class GTK_SPIN_BUTTON
	-- A GtkSpinButton is an ideal way to allow the user to set the value of some
	-- attribute. Rather than having to directly type a number into a GtkEntry,
	-- GtkSpinButton allows the user to click on one of two arrows to increment
	-- or decrement the displayed value. A value can still be typed in, with the
	-- bonus that it can be checked to ensure it is in a given range.

	-- The main properties of a GtkSpinButton are through a GtkAdjustment. See
	-- the GtkAdjustment section for more details about an adjustment's
	-- properties.

	-- TODO: Example 1. Using a GtkSpinButton to get an integer.
	
	-- /* Provides a function to retrieve an integer value from a GtkSpinButton
	--  * and creates a spin button to model percentage values.
	--  */

	-- gint grab_int_value (GtkSpinButton *a_spinner, gpointer user_data) {
	--    return gtk_spin_button_get_value_as_int (a_spinner);
	-- }

	-- void create_integer_spin_button (void) {

	--    GtkWidget *window, *spinner;
	--    GtkAdjustment *spinner_adj;
	
	--    spinner_adj = (GtkAdjustment *) gtk_adjustment_new (50.0, 0.0, 100.0, 1.0, 5.0, 5.0);
	
	--    window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
	--    gtk_container_set_border_width (GTK_CONTAINER (window), 5);
	
	--    /* creates the spinner, with no decimal places */
	--    spinner = gtk_spin_button_new (spinner_adj, 1.0, 0);
	--    gtk_container_add (GTK_CONTAINER (window), spinner);
	
	--    gtk_widget_show_all (window);
	--    return;
	-- }

	-- TODO: Example 2. Using a GtkSpinButton to get a floating point value.

	-- /* Provides a function to retrieve a floating point value from a
	--  * GtkSpinButton, and creates a high precision spin button.
--  */
	
	-- gfloat grab_int_value (GtkSpinButton *a_spinner, gpointer user_data) {
	--    return gtk_spin_button_get_value (a_spinner);
	-- }
	
	-- void create_floating_spin_button (void) {
	
	--    GtkWidget *window, *spinner;
	--    GtkAdjustment *spinner_adj;

	--    spinner_adj = (GtkAdjustment *) gtk_adjustment_new (2.500, 0.0, 5.0, 0.001, 0.1, 0.1);
	
	--    window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
	--    gtk_container_set_border_width (GTK_CONTAINER (window), 5);
	
	--    /* creates the spinner, with three decimal places */
	--    spinner = gtk_spin_button_new (spinner_adj, 0.001, 3);
	--    gtk_container_add (GTK_CONTAINER (window), spinner);
	
	--    gtk_widget_show_all (window);
	--    return;
	-- }

inherit
	GTK_ENTRY rename make as as_entry end
		-- GtkSpinButton implements AtkImplementorIface, GtkCellEditable and
		-- GtkEditable.
insert GTK_SPIN_BUTTON_EXTERNALS
	
create {ANY} make, from_external_pointer

feature {} -- Creation
	make (an_adjustment: GTK_ADJUSTMENT; a_climb_rate: REAL; some_digits: INTEGER)
			-- Creates a new GtkSpinButton. `an_adjustment' is the GtkAdjustment
			-- object that this spin button should use. `a_climb_rate' specifies
			-- how much the spin button changes when an arrow is clicked on.
			-- `some_digits' are the number of decimal places to display.
		require
			gtk_initialized: gtk.is_initialized
			valid_adjustment: an_adjustment /= Void
			positive_digits: some_digits >= 0 
		do
			handle:=gtk_spin_button_new (an_adjustment.handle,
												  a_climb_rate, some_digits)
			store_eiffel_wrapper
		end

	with_range (a_min,a_max,a_step: REAL)
			-- A convenience creation feature that allows creation of a numeric
			-- GtkSpinButton without manually creating an adjustment. The value is
			-- initially set to the minimum value and a page increment of 10 * step
			-- is the default. The precision of the spin button is equivalent to
			-- the precision of step.

			-- Note that the way in which the precision is derived works best if
			-- step is a power of ten. If the resulting precision is not suitable
			-- for your needs, use `set_digits' to correct it.

			-- `a_min' : Minimum allowable value

			-- `a_max' : Maximum allowable value
		
			-- `a_step' : Increment added or subtracted by spinning the widget
		require gtk_initialized: gtk.is_initialized
		do
			handle:=gtk_spin_button_new_with_range  (a_min, a_max, a_step)
			store_eiffel_wrapper
		end

feature {ANY} -- Configuration
	configure  (an_adjustment: GTK_ADJUSTMENT; a_climb_rate: REAL; some_digits: INTEGER)
			-- Changes the properties of an existing spin button. `an_adjustment'
			-- is the GtkAdjustment object that this spin button should
			-- use. `a_climb_rate' specifies how much the spin button changes when
			-- an arrow is clicked on.  `some_digits' are the number of decimal
			-- places to display.
		require
			valid_adjustment: an_adjustment /= Void
			positive_digits: some_digits >= 0 
		do
			gtk_spin_button_configure (handle, an_adjustment.handle,
												a_climb_rate, some_digits)
		ensure -- TODO
		end

	set_adjustment (an_adjustment: GTK_ADJUSTMENT)
			-- Replaces the GtkAdjustment associated with spin_button to `an_adjustment'.
		require valid_adjustment: an_adjustment /= Void
		do
			gtk_spin_button_set_adjustment (handle, an_adjustment.handle)
		end


	adjustment: GTK_ADJUSTMENT
			-- the adjustment associated with a GtkSpinButton
		do
			create Result.from_external_pointer (gtk_spin_button_get_adjustment (handle))
		ensure Result/=Void
		end

	set_digits (some_digits: INTEGER)
			-- Set the precision to be displayed by spin_button. Up to 20 digit precision is allowed.
			-- TODO: some_digits shall be NATURAL
		require
			positive_digits: some_digits >= 0
			valid_digits: some_digits <=  20
		do
			gtk_spin_button_set_digits (handle, some_digits)
		end

	set_increments (a_step, a_page: REAL)
			-- Sets the step and page increments for spin_button. This affects how
			-- quickly the value changes when the spin button's arrows are
			-- activated. `a_step' is the increment applied for a button 1
			-- press. `a_page' is the increment applied for a button 2 press.
		do
			gtk_spin_button_set_increments  (handle, a_step, a_page)
		end

	set_range (a_min, a_max: REAL)
			-- Sets the minimum (`a_min') and maximum (`a_max') allowable values for 
			-- spin_button
		require valid_value: a_min < a_max
		do
			gtk_spin_button_set_range (handle, a_min, a_max)
		end

	to_integer: INTEGER
			-- the value of the spin_button represented as an integer.
		do
			Result :=  gtk_spin_button_get_value_as_int (handle)
		end

	set_value (a_value: REAL)
			-- Set the value of spin_button.
		do
			gtk_spin_button_set_value (handle, a_value)
		end
	
feature {ANY} -- update policy
	
	set_always_update_policy
			-- Sets the update behavior of a spin button: when refreshing your
			-- GtkSpinButton, the value is always displayed.
		do
			gtk_spin_button_set_update_policy (handle, gtk_update_always)
		end
	
	set_if_valid_update_policy
			-- When refreshing your GtkSpinButton, the value is only displayed if
			-- it is valid within the bounds of the spin button's GtkAdjustment.
		do
			gtk_spin_button_set_update_policy (handle, gtk_update_if_valid)
		end

	is_policy_always_update: BOOLEAN
			-- Is the value always displayed when refreshing the GtkSpinButton?
		do
			Result:=(gtk_spin_button_get_update_policy (handle)=gtk_update_always)
		end
	
	is_policy_valid_update: BOOLEAN
			-- Is the value displayed only if it is valid within the bounds of the
			-- spin button's GtkAdjustment? 
		do
			Result:=(gtk_spin_button_get_update_policy (handle)=gtk_update_if_valid)
		end


-- Gets the update behavior of a spin button. See gtk_spin_button_set_update_policy().

-- spin_button : 	a GtkSpinButton
	-- Returns : 	the current update policy
	

feature {ANY}
	allow_non_numeric
			-- Allow the user to type non-numeric text into the spin button.
		do
			gtk_spin_button_set_numeric (handle, 0)
		end

	allow_only_numeric
			-- Allow the user to type only numeric text into the spin button.
		do
			gtk_spin_button_set_numeric (handle, 1)
		end
	
	are_only_numeric_allowed: BOOLEAN
			-- Can only numeric text can be entered?
		do
			Result:=(gtk_spin_button_get_numeric (handle)).to_boolean
		end

feature {ANY}  -- Spinning
	spin (a_direction: INTEGER; an_increment: INTEGER)
			-- Increment or decrement a spin button's value in a specified direction by a specified amount.
			-- `a_direction' is a GtkSpinType indicating the direction to spin.
			-- `an_increment' is the step increment to apply in the specified direction.
		require is_valid_gtk_spin_type (a_direction)
		do
			gtk_spin_button_spin (handle, a_direction, an_increment)
		end

feature {ANY} -- Wrapping
	set_wrap
			-- Makes the spin button value wraps around to the opposite limit when
			-- the upper or lower limit of the range is exceeded.
		do
			gtk_spin_button_set_wrap (handle, 1)
		end

	unset_wrap
			-- Unset wrapping. See `set_wrap'
		do
			gtk_spin_button_set_wrap (handle, 0)
		end

	is_wrap_set: BOOLEAN
			-- Doed the spin button's value wrap around to the opposite limit when
			-- the upper or lower limit of the range is exceeded?
		do
			Result:=(gtk_spin_button_get_wrap (handle)).to_boolean
		end

feature {ANY} -- Snapping
	set_snap_to_ticks
			-- At every update corrects the values to the nearest step increment
			-- when a spin button is activated after providing an invalid value.
		do
			gtk_spin_button_set_snap_to_ticks (handle, 1)
		end

	unset_snap_to_ticks
			-- Unset snap to ticks. See `set_snap_to_ticks'
		do
			gtk_spin_button_set_snap_to_ticks (handle, 1)
		end
	
feature {ANY}
	update
			-- Manually force an update of the spin button.
		do
			gtk_spin_button_update (handle)
		end

	digits: INTEGER
			--  the precision of spin_button. See `set_digits'. TODO: shall be NATURAL
		do
			Result := gtk_spin_button_get_digits (handle)
		end


	increments: TUPLE[REAL,REAL]
			--  the current step and page the increments used by spin_button. See
			--  `set_increments'.
		local s,p: REAL
		do
			gtk_spin_button_get_increments (handle, $s, $p)
			-- s,step : 	location to store step increment, or NULL
			-- p,page : 	location to store page increment, or NULL
			create Result.make_2 (s,p)
		end

	range: TUPLE[REAL,REAL]
			-- the range (minumun, maximum) allowed for spin_button. See
			-- `set_range'.
		local a_min,a_max:REAL
		do
			gtk_spin_button_get_range (handle, $a_min, $a_max)
			-- spin_button : 	a GtkSpinButton
			-- min : 	location to store minimum allowed value, or NULL
			-- max : 	location to store maximum allowed value, or NULL
			create Result.make_2 (a_min, a_max)
		end

	is_snapped_to_ticks: BOOLEAN
		-- Are the values corrected to the nearest step? See `set_snap_to_ticks'.
		do
			Result:= gtk_spin_button_get_snap_to_ticks(handle).to_boolean
		end
	
	value: REAL
			--  the value in the spin_button.
		do
			Result := gtk_spin_button_get_value (handle)
		end
	
feature {ANY} -- TODO Properties
-- The "adjustment" property

--   "adjustment"           GtkAdjustment         : Read / Write

-- The adjustment that holds the value of the spinbutton.
-- The "climb-rate" property

--   "climb-rate"           gdouble               : Read / Write

-- The acceleration rate when you hold down a button.

-- Allowed values: >= 0

-- Default value: 0
-- The "digits" property

--   "digits"               guint                 : Read / Write

-- The number of decimal places to display.

-- Allowed values: <= 20

-- Default value: 0
-- The "numeric" property

--   "numeric"              gboolean              : Read / Write

-- Whether non-numeric characters should be ignored.

-- Default value: FALSE
-- The "snap-to-ticks" property

--   "snap-to-ticks"        gboolean              : Read / Write

-- Whether erroneous values are automatically changed to a spin button's nearest step increment.

-- Default value: FALSE
-- The "update-policy" property

--   "update-policy"        GtkSpinButtonUpdatePolicy  : Read / Write

-- Whether the spin button should update always, or only when the value is legal.

-- Default value: GTK_UPDATE_ALWAYS
-- The "value" property

--   "value"                gdouble               : Read / Write

-- Reads the current value, or sets a new value.

-- Default value: 0
-- The "wrap" property

--   "wrap"                 gboolean              : Read / Write

-- Whether a spin button should wrap upon reaching its limits.

-- Default value: FALSE
-- Style Property Details
-- The "shadow-type" style property

--   "shadow-type"          GtkShadowType         : Read

-- the type of border that surrounds the arrows of a spin button.

-- Default value: GTK_SHADOW_IN
-- Signal Details
-- The "change-value" signal

-- void        user_function                  (GtkSpinButton *spinbutton,
--                                             GtkScrollType arg1,
--                                             gpointer user_data);

-- spinbutton : 	the object which received the signal.
-- arg1 : 	
-- user_data : 	user data set when the signal handler was connected.
-- The "input" signal

-- gint        user_function                  (GtkSpinButton *spinbutton,
--                                             gpointer arg1,
--                                             gpointer user_data);

-- spinbutton : 	the object which received the signal.
-- arg1 : 	
-- user_data : 	user data set when the signal handler was connected.
-- Returns : 	
-- The "output" signal

-- gboolean    user_function                  (GtkSpinButton *spinbutton,
--                                             gpointer user_data);

-- spinbutton : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- Returns : 	
-- The "value-changed" signal

-- void        user_function                  (GtkSpinButton *spinbutton,
--                                             gpointer user_data);

-- spinbutton : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- See Also

-- GtkEntry 	

-- retrieve text rather than numbers.


end
