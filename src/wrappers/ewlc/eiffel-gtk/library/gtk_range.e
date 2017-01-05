note
	description: "GtkRange -- Base class for widgets which visualize an adjustment."
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

deferred class GTK_RANGE

inherit
	GTK_WIDGET
	GTK_RANGE_EXTERNALS

feature {ANY} -- The adjustment

	adjustment: GTK_ADJUSTMENT
			-- the GtkAdjustment which is the "model" object for
			-- GtkRange. It contains the current value of this range
			-- object.
		local
			factory: G_OBJECT_EXPANDED_FACTORY [GTK_ADJUSTMENT]
		do
			Result := factory.unreffed_wrapper_or_void (gtk_range_get_adjustment (handle))
			-- GTK documentation says "See gtk_range_set_adjustment() for
			-- details. The return value does not have a reference added,
			-- so should not be unreferenced." Instead we just add a
			-- reference to the adjustment, because there will be an
			-- effective refence on the Eiffel side
			-- Result.ref
		ensure
			valid_adjustment: Result /= Void
		end

	set_adjustment (an_adjustment: GTK_ADJUSTMENT)
			-- Sets the adjustment to be used as the "model" object for
			-- this range widget. The adjustment indicates the current
			-- range value, the minimum and maximum range values, the
			-- step/page increments used for keybindings and scrolling,
			-- and the page size. The page size is normally 0 for
			-- GtkScale and nonzero for GtkScrollbar, and indicates the
			-- size of the visible area of the widget being scrolled. The
			-- page size affects the size of the scrollbar slider.
		require valid_adjustment: an_adjustment /= Void
		do
			gtk_range_set_adjustment (handle, an_adjustment.handle)
		end

feature {ANY} -- update policy
	set_continous_update_policy
			-- Sets the update policy for the range. GTK_UPDATE_CONTINUOUS
			-- means that anytime the range slider is moved, the range value
			-- will change and the value_changed signal will be
			-- emitted. 
		do
			gtk_range_set_update_policy (handle, gtk_update_continuous)
		ensure is_update_policy_continous
		end

	is_update_policy_continous: BOOLEAN
			-- Sets the update policy for the range. GTK_UPDATE_CONTINUOUS
			-- means that anytime the range slider is moved, the range value
			-- will change and the value_changed signal will be
			-- emitted. 
		do
			Result := (gtk_range_get_update_policy (handle) = gtk_update_continuous)
		end

	set_discontinous_update_policy
			-- Sets the update policy for the range. GTK_UPDATE_DELAYED
			-- means that the value will be updated after a brief timeout
			-- where no slider motion occurs, so updates are spaced by a
			-- short time rather than continuous.
		do
			gtk_range_set_update_policy (handle, gtk_update_discontinuous)
		ensure is_update_policy_discontinous
		end

	is_update_policy_discontinous: BOOLEAN
			-- Sets the update policy for the range. GTK_UPDATE_DELAYED
			-- means that the value will be updated after a brief timeout
			-- where no slider motion occurs, so updates are spaced by a
			-- short time rather than continuous.
		do
			Result := (gtk_range_get_update_policy (handle) = gtk_update_discontinuous)
		end

	set_delayed_update_policy
			-- Sets the update policy for the
			-- range. GTK_UPDATE_DISCONTINUOUS means that the value will
			-- only be updated when the user releases the button and ends
			-- the slider drag operation.
		do
			gtk_range_set_update_policy (handle, gtk_update_delayed)
		ensure is_update_policy_delayed
		end

	is_update_policy_delayed: BOOLEAN
			-- Sets the update policy for the
			-- range. GTK_UPDATE_DISCONTINUOUS means that the value will
			-- only be updated when the user releases the button and ends
			-- the slider drag operation.
		do
			Result := (gtk_range_get_update_policy (handle) = gtk_update_delayed)
		end

feature {ANY} -- Inverted-ness

	is_inverted: BOOLEAN
			-- Is the range inverted? An inverted direction slider moves
			-- to increase range value.
		do
			Result := (gtk_range_get_inverted (handle)).to_boolean
		end

	set_inverted
			-- Ranges normally move from lower to higher values as the
			-- slider moves from top to bottom or left to right. Inverted
			-- ranges have higher values at the top or on the right
			-- rather than on the bottom or left.
		do
			gtk_range_set_inverted (handle,1)
		ensure is_inverted
		end

	set_normal
			-- Ranges normally move from lower to higher values as the
			-- slider moves from top to bottom or left to right. Inverted
			-- ranges have higher values at the top or on the right
			-- rather than on the bottom or left.
		do
			gtk_range_set_inverted (handle,0)
		ensure not is_inverted
		end

feature {ANY} -- value

	value: REAL_64
			-- the current value of the range.
		do
			Result := gtk_range_get_value (handle)
		end

	set_value (a_value: REAL_64)
			-- Sets the current value of the range; if `a_value' is
			-- outside the minimum or maximum range values, it will be
			-- clamped to fit inside them. The range emits the
			-- "value_changed" signal if the value changes.
		do
			gtk_range_set_value (handle, a_value)
		end

feature {ANY} -- increments
	set_increments (a_step, a_page: REAL)
			-- Sets the step and page sizes for the range. The step size
			-- is used when the user clicks the GtkScrollbar arrows or
			-- moves GtkScale via arrow keys. The page size is used for
			-- example when moving via Page Up or Page Down keys.
		do
			gtk_range_set_increments (handle, a_step, a_page)
		end

feature {ANY} -- range

	set_range (a_min,a_max: REAL_64)
			-- Sets the allowable values in the GtkRange, and clamps the
			-- range value to be between min and max. (If the range has a
			-- non-zero page size, it is clamped between min and max -
			-- page-size.) -- `a_min': minimum range value; `a_max':
			-- maximum range value
		do
			gtk_range_set_range (handle, a_min, a_max)
		end


	-- Note: The "adjustment", "inverted" property

feature {ANY} -- TODO: The "update-policy" property
	--   "update-policy"        GtkUpdateType         : Read / Write
	
	-- How the range should be updated on the screen.
	
	-- Default value: GTK_UPDATE_CONTINUOUS
	-- Style Property Details

feature {ANY} -- TODO: The "arrow-displacement-x" style property
--   "arrow-displacement-x" gint                  : Read

-- How far in the x direction to move the arrow when the button is depressed.

-- Default value: 0
feature {ANY} -- TODO: The "arrow-displacement-y" style property
--   "arrow-displacement-y" gint                  : Read

-- How far in the y direction to move the arrow when the button is depressed.

-- Default value: 0
feature {ANY} -- TODO: The "slider-width" style property
--   "slider-width"         gint                  : Read

-- Width of scrollbar or scale thumb.

-- Allowed values: >= 0

-- Default value: 14
feature {ANY} -- TODO: The "stepper-size" style property
--   "stepper-size"         gint                  : Read

-- Length of step buttons at ends.

-- Allowed values: >= 0

-- Default value: 14
feature {ANY} -- TODO: The "stepper-spacing" style property
--   "stepper-spacing"      gint                  : Read

-- Spacing between step buttons and thumb.

-- Allowed values: >= 0

-- Default value: 0
feature {ANY} -- TODO: The "trough-border" style property
--   "trough-border"        gint                  : Read

-- Spacing between thumb/steppers and outer trough bevel.

-- Allowed values: >= 0

-- Default value: 1

feature {ANY} -- TODO: Signal Details

-- The "adjust-bounds" signal

-- void        user_function                  (GtkRange *range,
--                                             gdouble arg1,
--                                             gpointer user_data);

-- range : 	the object which received the signal.
-- arg1 : 	
-- user_data : 	user data set when the signal handler was connected.

feature {ANY} -- The "change-value" signal

		-- Since 2.6
		-- The `change-value' signal is emitted when a scroll action is
		-- performed on a range. It allows an application to determine the type of
		-- scroll event that occurred and the resultant new value. The application
		-- can handle the event itself and return True to prevent further
		-- processing. Or, by returning False, it can pass the event to other
		-- handlers until the default GTK+ handler is reached.

		-- The value parameter is unrounded. An application that overrides the
		-- `change-value' signal is responsible for clamping the value to the
		-- desired number of decimal digits; the default GTK+ handler clamps the
		-- value based on range->round_digits.

		-- It is not possible to use delayed update policies in an overridden
		-- `change-value' handler.

	change_value_signal_name: STRING is "change-value"
		-- gboolean    user_function                  (GtkRange *range,
		--                                             GtkScrollType scroll,
		--                                             gdouble value,
		--                                             gpointer user_data);

	enable_on_change_value
			-- Connects "change-value" signal to `on_change_value' feature.
		do
			connect (Current, change_value_signal_name, $on_change_value)
		end

	on_change_value: INTEGER
			-- Built-in change-value signal handler; empty by design; redefine it.
		do
		end

	connect_agent_to_change_value_signal (a_function: FUNCTION[ANY, TUPLE [REAL, INTEGER, GTK_RANGE], BOOLEAN])
			-- range : the range that received the signal.
			-- scroll: the type of scroll action that was performed.
			-- value : the new value resulting from the scroll action.
			-- returns:	True to prevent other handlers from being invoked for the signal.
			--          False to propagate the signal further.
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			change_value_callback: CHANGE_VALUE_CALLBACK
		do
			create change_value_callback.make
			change_value_callback.connect (Current, a_function)
		end

-- The "move-slider" signal

-- void        user_function                  (GtkRange *range,
--                                             GtkScrollType arg1,
--                                             gpointer user_data);

-- Virtual function that moves the slider. Used for keybindings.
-- range : 	the GtkRange
-- arg1 : 	
-- user_data : 	user data set when the signal handler was connected.

feature {ANY} -- The "value-changed" signal
-- void        user_function                  (GtkRange *range,
--                                             gpointer user_data);

-- Emitted when the range value changes.
-- range : 	the GtkRange
-- user_data : 	user data set when the signal handler was connected.

	value_changed_signal_name: STRING is "value-changed"

	on_value_changed
			-- Built-in value_changed signal handler; empty by design; redefine it.
		do
		end

	enable_on_value_changed
			-- Connects "value_changed" signal to `on_value_changed' feature.
		do
			connect (Current, value_changed_signal_name, $on_value_changed)
		end

	connect_agent_to_value_changed_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_RANGE]])
		require valid_procedure: a_procedure /= Void
		local value_changed_callback: VALUE_CHANGED_CALLBACK
		do
			create value_changed_callback.make
			value_changed_callback.connect (Current, a_procedure)
		end

end
