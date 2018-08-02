note
	description: "."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GTK+ team
					
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
	--   Link: Cairo: A Vector Graphics Library (parent)
	--   Link: Index (previous)
	--   Link: Appendix A. Creating a language binding for cairo (next)
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
	--   Prev   Home             Cairo: A Vector Graphics Library              Next
	--
	--Index of new symbols in 1.2
	--
	--  C
	--
	--   cairo_font_face_get_type, cairo_font_face_get_type ()
	--
	--   cairo_font_type_t, enum cairo_font_type_t
	--
	--   cairo_get_group_target, cairo_get_group_target ()
	--
	--   cairo_image_surface_get_data, cairo_image_surface_get_data ()
	--
	--   cairo_image_surface_get_format, cairo_image_surface_get_format ()
	--
	--   cairo_image_surface_get_stride, cairo_image_surface_get_stride ()
	--
	--   cairo_new_sub_path, cairo_new_sub_path ()
	--
	--   cairo_pattern_get_type, cairo_pattern_get_type ()
	--
	--   cairo_pattern_type_t, enum cairo_pattern_type_t
	--
	--   cairo_pdf_surface_create, cairo_pdf_surface_create ()
	--
	--   cairo_pdf_surface_create_for_stream, cairo_pdf_surface_create_for_stream
	--   ()
	--
	--   cairo_pdf_surface_set_size, cairo_pdf_surface_set_size ()
	--
	--   cairo_pop_group, cairo_pop_group ()
	--
	--   cairo_pop_group_to_source, cairo_pop_group_to_source ()
	--
	--   cairo_ps_surface_create, cairo_ps_surface_create ()
	--
	--   cairo_ps_surface_create_for_stream, cairo_ps_surface_create_for_stream ()
	--
	--   cairo_ps_surface_dsc_begin_page_setup,
	--   cairo_ps_surface_dsc_begin_page_setup ()
	--
	--   cairo_ps_surface_dsc_begin_setup, cairo_ps_surface_dsc_begin_setup ()
	--
	--   cairo_ps_surface_dsc_comment, cairo_ps_surface_dsc_comment ()
	--
	--   cairo_ps_surface_set_size, cairo_ps_surface_set_size ()
	--
	--   cairo_push_group, cairo_push_group ()
	--
	--   cairo_push_group_with_content, cairo_push_group_with_content ()
	--
	--   cairo_scaled_font_get_ctm, cairo_scaled_font_get_ctm ()
	--
	--   cairo_scaled_font_get_font_face, cairo_scaled_font_get_font_face ()
	--
	--   cairo_scaled_font_get_font_matrix, cairo_scaled_font_get_font_matrix ()
	--
	--   cairo_scaled_font_get_font_options, cairo_scaled_font_get_font_options ()
	--
	--   cairo_scaled_font_get_type, cairo_scaled_font_get_type ()
	--
	--   cairo_scaled_font_text_extents, cairo_scaled_font_text_extents ()
	--
	--   cairo_set_scaled_font, cairo_set_scaled_font ()
	--
	--   cairo_surface_get_content, cairo_surface_get_content ()
	--
	--   cairo_surface_get_device_offset, cairo_surface_get_device_offset ()
	--
	--   cairo_surface_get_type, cairo_surface_get_type ()
	--
	--   cairo_surface_set_fallback_resolution,
	--   cairo_surface_set_fallback_resolution ()
	--
	--   cairo_surface_type_t, enum cairo_surface_type_t
	--
	--   cairo_svg_get_versions, cairo_svg_get_versions ()
	--
	--   cairo_svg_surface_create, cairo_svg_surface_create ()
	--
	--   cairo_svg_surface_create_for_stream, cairo_svg_surface_create_for_stream
	--   ()
	--
	--   cairo_svg_surface_restrict_to_version,
	--   cairo_svg_surface_restrict_to_version ()
	--
	--   cairo_svg_version_to_string, cairo_svg_version_to_string ()
	--
	--   cairo_win32_surface_create_with_dib, cairo_win32_surface_create_with_dib
	--   ()
	--
	--   cairo_win32_surface_get_dc, cairo_win32_surface_get_dc ()
	--
	--   cairo_xlib_surface_get_depth, cairo_xlib_surface_get_depth ()
	--
	--   cairo_xlib_surface_get_display, cairo_xlib_surface_get_display ()
	--
	--   cairo_xlib_surface_get_drawable, cairo_xlib_surface_get_drawable ()
	--
	--   cairo_xlib_surface_get_height, cairo_xlib_surface_get_height ()
	--
	--   cairo_xlib_surface_get_screen, cairo_xlib_surface_get_screen ()
	--
	--   cairo_xlib_surface_get_visual, cairo_xlib_surface_get_visual ()
	--
	--   cairo_xlib_surface_get_width, cairo_xlib_surface_get_width ()

end -- class FOO
