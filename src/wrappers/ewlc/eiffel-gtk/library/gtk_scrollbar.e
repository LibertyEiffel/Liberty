note
	description: "GtkScrollbar: Base class for GtkHScrollbar and GtkVScrollbar."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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
			
deferred class GTK_SCROLLBAR
	-- The GTK_SCROLLBAR widget is a deferred (abstract) base class for
	-- GTK_HSCROLLBAR and GTK_VSCROLLBAR.

	-- The position of the thumb in a scrollbar is controlled by the
	-- scroll adjustments. See GTK_ADJUSTMENT for the fields in an
	-- adjustment - for GtkScrollbar, the "value" field represents the
	-- position of the scrollbar, which must be between the "lower"
	-- field and "upper - page_size." The "page_size" field represents
	-- the size of the visible scrollable area. The "step_increment"
	-- and "page_increment" fields are used when the user asks to step
	-- down (using the small stepper arrows) or page down (using for
	-- example the PageDown key).

inherit GTK_RANGE

feature {ANY} -- The "fixed-slider-length" style property

	is_slider_length_fixed: BOOLEAN
			-- Don't change slider size, just lock it to the minimum
			-- length.  Default value: False
		do
			Result := boolean_property_from_pspec (fixed_slider_lenght_pspec)
		end

feature {} -- "fixed-slider-lenght" Implementation
	fixed_slider_lenght_property_property_name: STRING is "fixed-slider-length"

	fixed_slider_lenght_pspec: G_PARAM_SPEC
		require has_property (fixed_slider_lenght_property_property_name)
		once
			create Result.from_external_pointer
			(g_object_class_find_property
			 (g_object_get_class(handle),
			  fixed_slider_lenght_property_property_name.to_external))
		end

feature {ANY} -- The "has-backward-stepper" style property

	has_backward_stepper: BOOLEAN
			-- Is the standard backward arrow button displayed?  Default
			-- value: True
		do
			Result := boolean_property_from_pspec (has_backward_stepper_pspec)
		end

feature {} -- "has-backward-stepper" Implementation
	has_backward_stepper_property_property_name: STRING is "has-backward-stepper"

	has_backward_stepper_pspec: G_PARAM_SPEC
		require has_property (has_backward_stepper_property_property_name)
		once
			create Result.from_external_pointer
			(g_object_class_find_property
			 (g_object_get_class(handle),
			  has_backward_stepper_property_property_name.to_external))
		end

feature {ANY} -- The "has-forward-stepper" style property

	has_forward_stepper: BOOLEAN
			-- Is the standard forward arrow button displayed?  Default
			-- value: True
		do
			Result := boolean_property_from_pspec (has_forward_stepper_pspec)
		end

feature {} -- "has-forward-stepper" Implementation
	has_forward_stepper_property_property_name: STRING is "has-forward-stepper"

	has_forward_stepper_pspec: G_PARAM_SPEC
		require has_property (has_forward_stepper_property_property_name)
		once
			create Result.from_external_pointer
			(g_object_class_find_property
			 (g_object_get_class(handle),
			  has_forward_stepper_property_property_name.to_external))
		end

feature {ANY} -- TODO: The "has-secondary-backward-stepper" style property

--   "has-secondary-backward-stepper" gboolean              : Read

-- Display a second backward arrow button on the opposite end of the scrollbar.

-- Default value: FALSE
feature {ANY} -- TODO: The "has-secondary-forward-stepper" style property

--   "has-secondary-forward-stepper" gboolean              : Read

-- Display a secondary forward arrow button on the opposite end of the scrollbar.

-- Default value: FALSE
feature {ANY} -- TODO: The "min-slider-length" style property

--   "min-slider-length"    gint                  : Read

-- Minimum length of scrollbar slider.

-- Allowed values: >= 0

-- Default value: 21
end -- class GTK_SCROLLBAR
