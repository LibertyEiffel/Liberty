note
	description: "GtkScale -- Base class for GtkHScale and GtkVScale."
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

deferred class GTK_SCALE
	-- A GTK_SCALE is a slider control used to select a numeric
	-- value. To use it, you'll probably want to investigate the
	-- methods on its base class, GTK_RANGE, in addition to the methods
	-- for GTK_SCALE itself. To set the value of a scale, you would
	-- normally use `set_value'. To detect changes to the value, you
	-- would normally use the "value_changed" signal.
	
inherit
	GTK_RANGE
	GTK_SCALE_EXTERNALS

feature {ANY} -- digits
	digits: INTEGER
			-- the number of decimal places that are displayed in the value.
		do
			Result := gtk_scale_get_digits (handle)
		end

	set_digits (some_digits: INTEGER)
			-- Sets the number of decimal places that are displayed in
			-- the value. Also causes the value of the adjustment to be
			-- rounded off to this number of digits, so the retrieved
			-- value matches the value the user saw. `some_digits' : the
			-- number of decimal places to display, e.g. use 1 to display
			-- 1.0, 2 to display 1.00 etc.
		do
			gtk_scale_set_digits (handle, some_digits)
		end

feature {ANY} -- layout

	layout: PANGO_LAYOUT
			-- the PangoLayout used to display the scale.
		local factory: G_OBJECT_EXPANDED_FACTORY[PANGO_LAYOUT]
		do
			Result := factory.wrapper_or_void (gtk_scale_get_layout (handle))
			-- Note: The returned object is owned by the scale.
		ensure
			(not is_value_drawn) = (Result = Void)
		end

feature {ANY} -- Draw value
	set_draw_value
			-- Specifies whether the current value is displayed as a string next to the slider.
		do
			gtk_scale_set_draw_value (handle,1)
		end

	is_value_drawn: BOOLEAN
			-- Is the current value is displayed as a string next to the
			-- slider?
		do
			Result := (gtk_scale_get_draw_value (handle)).to_boolean
		end
	
feature {ANY} -- position
	display_on_left
			-- Display the current value on the left.
		do
			gtk_scale_set_value_pos (handle, gtk_pos_left)
		end

	display_on_right
			-- Display the current value on the right.
		do
			gtk_scale_set_value_pos (handle, gtk_pos_right)
		end

	display_on_top
			-- Display the current value on the top.
		do
			gtk_scale_set_value_pos (handle, gtk_pos_top)
		end

	display_on_bottom
			-- Display the current value on the bottom.
		do
			gtk_scale_set_value_pos (handle, gtk_pos_bottom)
		end

	is_displayed_on_left: BOOLEAN
			-- Is  the current value displayed on the left?
		do
			Result := gtk_scale_get_value_pos (handle) = gtk_pos_left
		end

	is_displayed_on_right: BOOLEAN
			-- Is  the current value displayed on the right?
		do
			Result := gtk_scale_get_value_pos (handle) = gtk_pos_right
		end

	is_displayed_on_top: BOOLEAN
			-- Is  the current value displayed on the top?
		do
			Result := gtk_scale_get_value_pos (handle) = gtk_pos_top
		end

	is_displayed_on_bottom: BOOLEAN
			-- Is  the current value displayed on the bottom?
		do
			Result := gtk_scale_get_value_pos (handle) = gtk_pos_bottom
		end

	-- TODO: gtk_scale_get_layout () PangoLayout* gtk_scale_get_layout
	-- (GtkScale *scale); Gets the PangoLayout used to display the
	-- scale. The returned object is owned by the scale so does not
	-- need to be freed by the caller.  scale : A GtkScale Returns :
	-- the PangoLayout for this scale, or NULL if the draw_value
	-- property is FALSE.

feature {ANY}
	layout_offsets: TUPLE [REAL, REAL]
			-- Obtains the coordinates where the scale will draw the
			-- PangoLayout representing the text in the scale. Remember
			-- when using the PangoLayout function you need to convert to
			-- and from pixels using PANGO_PIXELS() or PANGO_SCALE. If
			-- the draw_value property is FALSE, the return values are
			-- undefined.
		local an_x,an_y: REAL
		do
			gtk_scale_get_layout_offsets (handle, $an_x, $an_y)
			create Result.make_2 (an_x, an_y)
		end
	

feature {ANY} -- TODO: Property Details
-- The "digits" property

--   "digits"               gint                  : Read / Write

-- The number of decimal places that are displayed in the value.

-- Allowed values: [-1,64]

-- Default value: 1
-- The "draw-value" property

--   "draw-value"           gboolean              : Read / Write

-- Whether the current value is displayed as a string next to the slider.

-- Default value: TRUE
-- The "value-pos" property

--   "value-pos"            GtkPositionType       : Read / Write

-- The position in which the current value is displayed.

-- Default value: GTK_POS_TOP
-- Style Property Details
-- The "slider-length" style property

--   "slider-length"        gint                  : Read

-- Length of scale's slider.

-- Allowed values: >= 0

-- Default value: 31
-- The "value-spacing" style property

--   "value-spacing"        gint                  : Read

-- Space between value text and the slider/trough area.

-- Allowed values: >= 0

-- Default value: 2
-- Signal Details

feature {ANY} -- The "format-value" signal

		-- Signal which allows you to change how the scale value is displayed.
		-- Connect a signal handler which returns an allocated string representing
		-- value. That string will then be used to display the scale's value.
		-- Here's an example signal handler which displays a value 1.0 as with
		-- "-->1.0<--".
		
		-- static gchar*
		-- format_value_callback (GtkScale *scale,
		--                        gdouble   value)
		-- {
		--   return g_strdup_printf ("-->%0.*g<--",
		--                           gtk_scale_get_digits (scale), value);
		-- }

	format_value_signal_name: STRING is "format-value"
		-- gchar*      user_function                  (GtkScale *scale,
		--                                             gdouble arg1,
		--                                             gpointer user_data);

	enable_on_format_value
			-- Connects "format-value" signal to `on_format_value' feature.
		do
			connect (Current, format_value_signal_name, $on_format_value)
		end

	on_format_value: INTEGER
			-- Built-in format-value signal handler; empty by design; redefine it.
		do
		end

	connect_agent_to_format_value_signal (a_function: FUNCTION[ANY, TUPLE [REAL, GTK_SCALE], STRING])
			-- scale : 	the object which received the signal.
			-- arg1 : 	
			-- Returns : 	allocated string representing value
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			format_value_callback: FORMAT_VALUE_CALLBACK
		do
			create format_value_callback.make
			format_value_callback.connect (Current, a_function)
		end

end
