indexing
	description: "An attributes which set font size."
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

class PANGO_SIZE_ATTRIBUTE

inherit
	PANGO_ATTRIBUTE 
		redefine
			struct_size
		end
	
insert PANGO_SCALES
	
create {ANY} from_external_pointer
	-- TODO: make_small, make_x_small, make_xx_small, 
	-- TODO: make_medium,
	-- TODO: make_large, make_x_large, make_xx_large

feature {ANY}  -- Creation

feature {ANY} -- size
		struct_size: INTEGER is
		external "C inline use <pango/pango.h>"
		alias "sizeof(PangoAttrSize)"
		end

feature {} -- Struct access
	-- PangoAttribute attr;
	get_size (a_struct: POINTER): INTEGER is
			-- int size; size of font, in units of 1/PANGO_SCALE of a point (for
			-- PANGO_ATTR_SIZE) or of a device uni (for PANGO_ATTR_ABSOLUTE_SIZE)
		external "C struct PangoAttrSize get size use <pango/pango.h>"
		end

	-- it is not ncessary to wrap `guint absolute : 1' whether the font size is
	-- in device units or points. This field is only present for compatibility
	-- with Pango-1.8.0 (PANGO_ATTR_ABSOLUTE_SIZE was added in 1.8.1); and always
	-- will be FALSE for PANGO_ATTR_SIZE and TRUE for PANGO_ATTR_ABSOLUTE_SIZE.
end
