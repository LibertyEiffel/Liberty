indexing
	description: "[
					  The PangoAttrType distinguishes between different
					  types of attributes. Along with the predefined
					  values, it is possible to allocate additional values
					  for custom attributes using
					  pango_attr_type_register(). The predefined values are
					  given below. The type of structure used to store the
					  attribute is listed in parentheses after the
					  description.  
					  ]" 
	
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

deferred class PANGO_ATTR_TYPE

inherit ANY undefine is_equal, copy end


feature {ANY}  -- enum
	is_valid_pango_attribute_type (a_type :INTEGER): BOOLEAN is
		do	
			-- Note perhaps it would be "smarter" to rely on C enum
			-- properties, writing something like
			-- Result:=(a_type.in_range(pango_attr_invalid,pango_attr_absoluute_size))
			-- Paolo 2006-07-10

			Result:=((a_type = pango_attr_invalid) or else
						(a_type = pango_attr_language) or else
						(a_type = pango_attr_family) or else
						(a_type = pango_attr_style) or else
						(a_type = pango_attr_weight) or else
						(a_type = pango_attr_variant) or else
						(a_type = pango_attr_stretch) or else
						(a_type = pango_attr_size) or else
						(a_type = pango_attr_font_desc) or else
						(a_type = pango_attr_foreground) or else
						(a_type = pango_attr_background) or else
						(a_type = pango_attr_underline) or else
						(a_type = pango_attr_strikethrough) or else
						(a_type = pango_attr_rise) or else
						(a_type = pango_attr_shape) or else
						(a_type = pango_attr_scale) or else
						(a_type = pango_attr_fallback) or else
						(a_type = pango_attr_letter_spacing) or else
						(a_type = pango_attr_underline_color) or else
						(a_type = pango_attr_strikethrough_color) or else
						(a_type = pango_attr_absolute_size))
		end
feature {ANY} 
   pango_attr_invalid: INTEGER is
			-- invalid attribute
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_INVALID"
		end

   pango_attr_language: INTEGER is
			-- language (PangoAttrLanguage)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_LANGUAGE"
		end

   pango_attr_family: INTEGER is
			-- font family name list (PangoAttrString)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_FAMILY"
		end

   pango_attr_style: INTEGER is
			-- font slant style (PangoAttrInt)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_STYLE"
		end

   pango_attr_weight: INTEGER is
			-- font weight (PangoAttrInt)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_WEIGHT"
		end

   pango_attr_variant: INTEGER is
			-- font variant (normal or small caps) (PangoAttrInt)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_VARIANT"
		end

   pango_attr_stretch: INTEGER is
			-- font stretch (PangoAttrInt)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_STRETCH"
		end

   pango_attr_size: INTEGER is
			-- font size in points divided by PANGO_SCALE (PangoAttrInt)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_SIZE"
		end

   pango_attr_font_desc: INTEGER is
			-- font description (PangoAttrFontDesc)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_FONT_DESC"
		end

   pango_attr_foreground: INTEGER is
			-- foreground color (PangoAttrColor)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_FOREGROUND"
		end

   pango_attr_background: INTEGER is
			-- background color (PangoAttrColor)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_BACKGROUND"
		end

   pango_attr_underline: INTEGER is
			-- whether the text has an underline (PangoAttrInt)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_UNDERLINE"
		end

   pango_attr_strikethrough: INTEGER is
			-- whether the text is struck-through (PangoAttrInt)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_STRIKETHROUGH"
		end

   pango_attr_rise: INTEGER is
			-- baseline displacement (PangoAttrInt)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_RISE"
		end

   pango_attr_shape: INTEGER is
			-- shape (PangoAttrShape)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_SHAPE"
		end

   pango_attr_scale: INTEGER is
			-- font size scale factor (PangoAttrFloat)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_SCALE"
		end

   pango_attr_fallback: INTEGER is
			-- whether fallback is enabled (PangoAttrInt)
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_FALLBACK"
		end

   pango_attr_letter_spacing: INTEGER is
			-- TODO: provide a description
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_LETTER_SPACING"
		end

   pango_attr_underline_color: INTEGER is
			-- TODO: provide a description
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_UNDERLINE_COLOR"
		end

   pango_attr_strikethrough_color: INTEGER is
			-- TODO: provide a description
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_STRIKETHROUGH_COLOR"
		end

   pango_attr_absolute_size: INTEGER is
			-- TODO: provide a description
		external "C macro use <pango/pango.h>"
		alias "PANGO_ATTR_ABSOLUTE_SIZE"
		end
end
