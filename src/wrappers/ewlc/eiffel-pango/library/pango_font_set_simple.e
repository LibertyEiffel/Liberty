indexing
	description: "."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class PANGO_FONT_SET_SIMPLE
	-- PangoFontsetSimple is a implementation of the abstract
	-- PangoFontset base class in terms of an array of fonts, which the
	-- creator provides when constructing the PangoFontsetSimple.

inherit PANGO_FONT_SET redefine struct_size end

create {ANY} make, from_external_pointer

feature {ANY}
	make (a_language: PANGO_LANGUAGE) is
			-- Creates a new PangoFontsetSimple for `a_language'.
		require language_not_void: a_language/=Void
		do
			from_external_pointer(pango_fontset_simple_new(a_language.handle))
		end

feature {ANY} 
	append (a_font: PANGO_FONT) is
			-- Adds `a_font' to the fontset.
		require font_not_void: a_font/=Void
		do
			pango_fontset_simple_append (handle, a_font.handle)
		ensure grown: old count + 1 = count
		end

	count: INTEGER is
			-- the number of fonts in the fontset.
		do
			Result:=pango_fontset_simple_size(handle)
		end
feature {} -- External calls
	
	pango_fontset_simple_new (a_language: POINTER): POINTER is
			-- PangoFontsetSimple* pango_fontset_simple_new
			-- (PangoLanguage *language);
		external "C  use <pango.h>"
		end

	pango_fontset_simple_append (a_fontset, a_font: POINTER) is
			-- void pango_fontset_simple_append (PangoFontsetSimple
			-- *fontset, PangoFont *font);
		external "C  use <pango.h>"
		end

	pango_fontset_simple_size (a_fontset: POINTER): INTEGER is
			-- int pango_fontset_simple_size (PangoFontsetSimple *fontset);
		external "C  use <pango.h>"
		end
	
feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <pango.h>"
		alias "sizeof(PangoFontSetSimple)"
		end

end -- class PANGO_FONT_SET_SIMPLE

