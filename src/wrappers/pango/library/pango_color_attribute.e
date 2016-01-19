indexing
	description: "The PangoAttrColor structure is used to represent attributes that are colors."
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

class PANGO_COLOR_ATTRIBUTE

inherit
	PANGO_ATTRIBUTE
		redefine
			struct_size
		end

create {ANY} from_external_pointer

feature {ANY} -- Getters
	red: INTEGER_32 is
		do
			Result := color_get_red(handle)
		end
	green: INTEGER_32 is
		do
			Result := color_get_green(handle)
		end
	blue: INTEGER_32 is
		do
			Result := color_get_blue(handle)
		end
feature {ANY} -- Setters

feature {ANY} -- size

	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(PangoAttrColor)"
		end

feature {} -- Structure access
	-- typedef struct {
	-- TODO: PangoAttribute attr;
	-- PangoColor color;
	-- } PangoAttrColor;

	-- typedef struct { guint16 red;guint16 green; guint16 blue; }
	-- PangoColor;
	color_get_red (a_pango_attr_color: POINTER): INTEGER_32 is
			-- TODO: This should be a NATURAL_16 since its values are between 0 and 65535. Using INTEGER_32 to avoid overflows
		external "C use <pango/pango.h>"
		alias "(($a_pango_attr_color)->color.red)"
		end
	
	color_set_red (an_attr_color: POINTER; a_red: INTEGER_32) is
			-- TODO: This should be a NATURAL_32 since its values are between 0 and 65535. Using INTEGER_32 to avoid overflows
		external "C use <pango/pango.h>"
		alias "($an_attr_color)->color.red = $a_red;"
		end

	color_get_green (a_pango_attr_color: POINTER): INTEGER_32 is
			-- TODO: This should be a NATURAL_32 since its values are between 0 and 65535. Using INTEGER_32 to avoid overflows
		external "C use <pango/pango.h>"
		alias "(($a_pango_attr_color)->color.green)"
		end
	
	color_set_green (an_attr_color: POINTER; a_green: INTEGER_32) is
			-- TODO: This should be a NATURAL_32 since its values are between 0 and 65535. Using INTEGER_32 to avoid overflows
		external "C use <pango/pango.h>"
		alias "($an_attr_color)->color.green = $a_green;"
		end

	color_get_blue (a_pango_attr_color: POINTER): INTEGER_32 is
			-- TODO: This should be a NATURAL_32 since its values are between 0 and 65535. Using INTEGER_32 to avoid overflows
		external "C use <pango/pango.h>"
		alias "(($a_pango_attr_color)->color.blue)"
		end
	
	color_set_blue (an_attr_color: POINTER; a_blue: INTEGER_32) is
			-- TODO: This should be a NATURAL_32 since its values are between 0 and 65535. Using INTEGER_32 to avoid overflows
		external "C use <pango/pango.h>"
		alias "($an_attr_color)->color.blue = $a_blue;"
		end
end
