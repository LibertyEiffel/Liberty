note
	description: "External C calls for CAIRO_FONT_OPTIONS"
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli,
					Soluciones Informaticas Libres S.A. (Except),
					Cairo team
					
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
	wrapped_version: "1.2.4"

deferred class CAIRO_FONT_OPTIONS_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	cairo_font_options_create: POINTER is
			-- cairo_font_options_t* cairo_font_options_create (void);
		external "C use <cairo.h>"
		end

	cairo_font_options_copy (a_font_options: POINTER): POINTER is
			-- cairo_font_options_t* cairo_font_options_copy
			--                       (const cairo_font_options_t *original);
		external "C use <cairo.h>"
		end

	cairo_font_options_destroy (a_font_options: POINTER) is
			--void        cairo_font_options_destroy      (cairo_font_options_t *options);
		external "C use <cairo.h>"
		end

	cairo_font_options_status (a_font_options: POINTER): INTEGER is
			--cairo_status_t cairo_font_options_status    (cairo_font_options_t *options);
		external "C use <cairo.h>"
		end

	cairo_font_options_merge (a_font_options, another: POINTER) is
			--void        cairo_font_options_merge        (cairo_font_options_t *options,
			--                                             const cairo_font_options_t *other);
		external "C use <cairo.h>"
		end

	cairo_font_options_hash (a_font_options: POINTER): INTEGER_64 is
			--unsigned long cairo_font_options_hash       (const cairo_font_options_t *options);
		external "C use <cairo.h>"
		end

	cairo_font_options_equal (a_font_options, another: POINTER): INTEGER is
			--cairo_bool_t cairo_font_options_equal       (const cairo_font_options_t *options,
			--                                             const cairo_font_options_t *other);
		external "C use <cairo.h>"
		end

	cairo_font_options_set_antialias (a_font_options: POINTER; an_antialias: INTEGER) is
			--void        cairo_font_options_set_antialias
			--                                            (cairo_font_options_t *options,
			--                                             cairo_antialias_t antialias);
		external "C use <cairo.h>"
		end

	cairo_font_options_get_antialias (a_font_options: POINTER): INTEGER is
			--cairo_antialias_t cairo_font_options_get_antialias
			--                                            (const cairo_font_options_t *options);
		external "C use <cairo.h>"
		end

	cairo_font_options_set_subpixel_order (a_font_options: POINTER; an_order: INTEGER) is
			--void        cairo_font_options_set_subpixel_order
			--                                            (cairo_font_options_t *options,
			--                                          cairo_subpixel_order_t subpixel_order);
		external "C use <cairo.h>"
		end

	cairo_font_options_get_subpixel_order (a_font_options: POINTER): INTEGER is
			--cairo_subpixel_order_t cairo_font_options_get_subpixel_order
			--                                         (const cairo_font_options_t *options);
		external "C use <cairo.h>"
		end

	cairo_font_options_set_hint_style (a_font_options: POINTER; a_style: INTEGER) is
			--void        cairo_font_options_set_hint_style
			--                                            (cairo_font_options_t *options,
			--                                             cairo_hint_style_t hint_style);
		external "C use <cairo.h>"
		end

	cairo_font_options_get_hint_style (a_font_options: POINTER): INTEGER is
			--cairo_hint_style_t cairo_font_options_get_hint_style
			--                                        (const cairo_font_options_t *options);
		external "C use <cairo.h>"
		end

	cairo_font_options_set_hint_metrics (a_font_options: POINTER; a_metric: INTEGER) is
			--void        cairo_font_options_set_hint_metrics
			--                                            (cairo_font_options_t *options,
			--                                             cairo_hint_metrics_t hint_metrics);
		external "C use <cairo.h>"
		end

	cairo_font_options_get_hint_metrics (a_font_options: POINTER): INTEGER is
			--cairo_hint_metrics_t cairo_font_options_get_hint_metrics
			--                                        (const cairo_font_options_t *options);
		external "C use <cairo.h>"
		end

feature {ANY} -- size

	struct_size: INTEGER is
		external "C inline use <cairo.h>"
		alias "sizeof(cairo_font_options_t)"
		end

end -- class CAIRO_FONT_OPTIONS_EXTERNALS
