note
	description: "."
	copyright: "[
					Copyright (C) 2007-2017: Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "1.2.4"

class FOO

inherit
	(SHARED_?)C_STRUCT

insert
	FOO_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: Cairo: A Vector Graphics Library (start)
	--   Link: Fonts (parent)
	--   Link: FreeType Fonts (previous)
	--   Link: Surfaces (next)
	--   Link: Part I. Tutorial (part)
	--   Link: Part II. Reference (part)
	--   Link: Drawing (chapter)
	--   Link: Fonts (chapter)
	--   Link: Surfaces (chapter)
	--   Link: Utilities (chapter)
	--   Link: Index (index)
	--   Link: Index of new symbols in 1.2 (index)
	--   Link: Appendix A. Creating a language binding for cairo (appendix)
	--
	--   Prev Up Home             Cairo: A Vector Graphics Library             Next
	--   Top  |  Description
	--
	--   Win32 Fonts
	--
	--   Win32 Fonts -- Font support for Microsoft Windows
	--
	--Synopsis
	--
	--
	--
	--
	-- cairo_font_face_t* cairo_win32_font_face_create_for_logfontw
	--                                             (LOGFONTW *logfont);
	-- cairo_font_face_t* cairo_win32_font_face_create_for_hfont
	--                                             (HFONT font);
	-- cairo_status_t cairo_win32_scaled_font_select_font
	--                                             (cairo_scaled_font_t *scaled_font,
	--                                              HDC hdc);
	-- void        cairo_win32_scaled_font_done_font
	--                                             (cairo_scaled_font_t *scaled_font);
	-- double      cairo_win32_scaled_font_get_metrics_factor
	--                                             (cairo_scaled_font_t *scaled_font);
	--
	--Description
	--
	--Details
	--
	--  cairo_win32_font_face_create_for_logfontw ()
	--
	-- cairo_font_face_t* cairo_win32_font_face_create_for_logfontw
	--                                             (LOGFONTW *logfont);
	--
	--   Creates a new font for the Win32 font backend based on a LOGFONT. This
	--   font can then be used with cairo_set_font_face() or
	--   cairo_scaled_font_create(). The cairo_scaled_font_t returned from
	--   cairo_scaled_font_create() is also for the Win32 backend and can be used
	--   with functions such as cairo_win32_scaled_font_select_font().
	--
	--   logfont : A LOGFONTW structure specifying the font to use. The lfHeight,
	--             lfWidth, lfOrientation and lfEscapement fields of this structure
	--             are ignored.
	--   Returns : a newly created cairo_font_face_t. Free with
	--             cairo_font_face_destroy() when you are done using it.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_win32_font_face_create_for_hfont ()
	--
	-- cairo_font_face_t* cairo_win32_font_face_create_for_hfont
	--                                             (HFONT font);
	--
	--   Creates a new font for the Win32 font backend based on a HFONT. This font
	--   can then be used with cairo_set_font_face() or cairo_scaled_font_create().
	--   The cairo_scaled_font_t returned from cairo_scaled_font_create() is also
	--   for the Win32 backend and can be used with functions such as
	--   cairo_win32_scaled_font_select_font().
	--
	--   font :    An HFONT structure specifying the font to use.
	--   Returns : a newly created cairo_font_face_t. Free with
	--             cairo_font_face_destroy() when you are done using it.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_win32_scaled_font_select_font ()
	--
	-- cairo_status_t cairo_win32_scaled_font_select_font
	--                                             (cairo_scaled_font_t *scaled_font,
	--                                              HDC hdc);
	--
	--   Selects the font into the given device context and changes the map mode
	--   and world transformation of the device context to match that of the font.
	--   This function is intended for use when using layout APIs such as Uniscribe
	--   to do text layout with the cairo font. After finishing using the device
	--   context, you must call cairo_win32_scaled_font_done_font() to release any
	--   resources allocated by this function.
	--
	--   See cairo_win32_scaled_font_get_metrics_factor() for converting logical
	--   coordinates from the device context to font space.
	--
	--   Normally, calls to SaveDC() and RestoreDC() would be made around the use
	--   of this function to preserve the original graphics state.
	--
	--   scaled_font : A cairo_scaled_font_t from the Win32 font backend. Such an
	--                 object can be created with
	--                 cairo_win32_scaled_font_create_for_logfontw().
	--   hdc :         a device context
	--   Returns :     CAIRO_STATUS_SUCCESS if the operation succeeded. otherwise
	--                 an error such as CAIRO_STATUS_NO_MEMORY and the device
	--                 context is unchanged.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_win32_scaled_font_done_font ()
	--
	-- void        cairo_win32_scaled_font_done_font
	--                                             (cairo_scaled_font_t *scaled_font);
	--
	--   Releases any resources allocated by cairo_win32_scaled_font_select_font()
	--
	--   scaled_font : A cairo_scaled_font_t from the Win32 font backend.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_win32_scaled_font_get_metrics_factor ()
	--
	-- double      cairo_win32_scaled_font_get_metrics_factor
	--                                             (cairo_scaled_font_t *scaled_font);
	--
	--   Gets a scale factor between logical coordinates in the coordinate space
	--   used by cairo_win32_scaled_font_select_font() (that is, the coordinate
	--   system used by the Windows functions to return metrics) and font space
	--   coordinates.
	--
	--   scaled_font : a cairo_scaled_font_t from the Win32 font backend
	--   Returns :     factor to multiply logical units by to get font space
	--                 coordinates.

end -- class FOO
