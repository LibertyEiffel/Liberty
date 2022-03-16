note
	description: "The `fixed-slider-length' style property."
	copyright: "[
					Copyright (C) 2006-2022: Paolo Redaelli, GTK+ team
					
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

deferred class FIXED_SLIDER_LENGHT_PROPERTY

inherit GTK_OBJECT -- WRAPPER
feature {ANY} -- TODO: The "fixed-slider-length" style property

	is_slider_length_fixed: BOOLEAN
			-- Don't change slider size, just lock it to the minimum
			-- length.  Default value: False
		do
			Result := boolean_property_from_pspec (fixed_slider_lenght_pspec)
		end

feature {} -- Implementation
	fixed_slider_lenght_property_property_name: STRING is "fixed-slider-length"

	fixed_slider_lenght_pspec: G_PARAM_SPEC
		require has_property (fixed_slider_lenght_property_property_name)
		once
			create Result.from_external_pointer
			(g_object_class_find_property
			 (g_object_get_class(handle),
			  fixed_slider_lenght_property_property_name.to_external))
		end
end -- class FIXED_SLIDER_LENGHT_PROPERTY
