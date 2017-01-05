note
	description: "GtkPrintContext -- Encapsulates context for drawing pages."
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

	wrapped_version: "2.10.6"

class GTK_PRINT_CONTEXT
	-- A GtkPrintContext encapsulates context information that is required when
	-- drawing pages for printing, such as the cairo context and important
	-- parameters like page size and resolution. It also lets you easily create
	-- PangoLayout and PangoContext objects that match the font metrics of the
	-- cairo surface.

	-- GtkPrintContext objects gets passed to the ::begin-print, ::end-print,
	-- ::request-page-setup and ::draw-page signals on the GtkPrintOperation.

	-- TODO: Eiffelize this example Example 2. Using GtkPrintContext in a
	-- ::draw-page callback

	-- static void
	-- draw_page (GtkPrintOperation *operation,
	--            GtkPrintContext   *context,
	--            int                page_nr)
	-- {
	--   cairo_t *cr;
	--   PangoLayout *layout;
	--   PangoFontDescription *desc;
	--
	--   cr = gtk_print_context_get_cairo_context (context);
	--
	--   /* Draw a red rectangle, as wide as the paper (inside the margins) */
	--   cairo_set_source_rgb (cr, 1.0, 0, 0);
	--   cairo_rectangle (cr, 0, 0, gtk_print_context_get_width (context), 50);
	--
	--   cairo_fill (cr);
	--
	--   /* Draw some lines */
	--   cairo_move_to (cr, 20, 10);
	--   cairo_line_to (cr, 40, 20);
	--   cairo_arc (cr, 60, 60, 20, 0, M_PI);
	--   cairo_line_to (cr, 80, 20);
	--
	--   cairo_set_source_rgb (cr, 0, 0, 0);
	--   cairo_set_line_width (cr, 5);
	--   cairo_set_line_cap (cr, CAIRO_LINE_CAP_ROUND);
	--   cairo_set_line_join (cr, CAIRO_LINE_JOIN_ROUND);
	--
	--   cairo_stroke (cr);
	--
	--   /* Draw some text */
	--   layout = gtk_print_context_create_layout (context);
	--   pango_layout_set_text (layout, "Hello World! Printing is easy", -1);
	--   desc = pango_font_description_from_string ("sans 28");
	--   pango_layout_set_font_description (layout, desc);
	--   pango_font_description_free (desc);
	--
	--   cairo_move_to (cr, 30, 20);
	--   pango_cairo_layout_path (cr, layout);
	--
	--   /* Font Outline */
	--   cairo_set_source_rgb (cr, 0.93, 1.0, 0.47);
	--   cairo_set_line_width (cr, 0.5);
	--   cairo_stroke_preserve (cr);
	--
	--   /* Font Fill */
	--   cairo_set_source_rgb (cr, 0, 0.0, 1.0);
	--   cairo_fill (cr);
	--
	--   g_object_unref (layout);
	-- }

	--   Printing support was added in GTK+ 2.10.

inherit SHARED_C_STRUCT

create {ANY} dummy, from_external_pointer

feature {} -- Creation

	context: CAIRO_CONTEXT
			-- the cairo context that is associated with the
			-- GTK_PRINT_CONTEXT.
		do
			create Result.from_external_pointer(gtk_print_context_get_cairo_context(handle))
		end
			
	set_context (a_context: CAIRO_CONTEXT; an_x_dpi, an_y_dpi: REAL)
			--  Sets a new cairo context on a print context.

			-- This function is intended to be used when implementing an
			-- internal print preview, it is not needed for printing,
			-- since GTK+ itself creates a suitable cairo context in that
			-- case.

			-- `an_x_dpi': the horizontal resolution to use with
			-- `a_context'
		
			-- `an_y_dpi': the vertical resolution to use with
			-- `a_context'
		require context_not_void: a_context/=Void
		do
			gtk_print_context_set_cairo_context(handle,a_context.handle,
															an_x_dpi, an_y_dpi)
		end	
	
	page_setup: GTK_PAGE_SETUP
			-- the GtkPageSetup that determines the page dimensions of
			-- the GtkPrintContext.
		do
			create Result.from_external_pointer(gtk_print_context_get_page_setup(handle))
		end

	width: REAL
			-- the width of context, in pixels.
		do
			Result:=gtk_print_context_get_width(handle)
		end

	height: REAL
			-- the height of context, in pixels.
		do
			Result:=gtk_print_context_get_height(handle)
		end

	dpi_x: REAL
			-- the horizontal resolution of the GtkPrintContext, in dots per inch.
		do
			Result:=gtk_print_context_get_dpi_x(handle)
		end	

	dpi_y: REAL
			-- the vertical resolution of the GtkPrintContext, in dots per inch.
		do
			Result:=gtk_print_context_get_dpi_y(handle)
		end
	
	
	pango_font_map: PANGO_FONT_MAP
			-- a PangoFontMap that is suitable for use with the 
			-- GtkPrintContext.
		local factory: G_OBJECT_EXPANDED_FACTORY[PANGO_FONT_MAP]
		do
			Result := factory.wrapper(gtk_print_context_get_pango_fontmap(handle))
		end

	pango_context: PANGO_CONTEXT
			-- a new PangoContext that can be used with the
			-- GtkPrintContext.
		do
			create Result.from_external_pointer(gtk_print_context_create_pango_context(handle))
		end
	
	pango_layout: PANGO_LAYOUT
			-- a (newly allocated) PangoLayout that is suitable for use with the GtkPrintContext.
		do
			create Result.from_external_pointer
			(gtk_print_context_create_pango_layout(handle))
		end
	
feature {} -- External calls
	gtk_print_context_get_cairo_context (a_context: POINTER): POINTER
			-- cairo_t* gtk_print_context_get_cairo_context (GtkPrintContext
			-- *context);
		external "C inline use <gtk/gtk.h>"
		end
	
	gtk_print_context_set_cairo_context (a_context, a_cairo: POINTER; a_dpi_x, a_dpi_y: REAL)
			-- void gtk_print_context_set_cairo_context (GtkPrintContext *context,
			-- cairo_t *cr, double dpi_x, double dpi_y);
		external "C inline use <gtk/gtk.h>"
		end
	
	gtk_print_context_get_page_setup (a_context: POINTER): POINTER
			-- 	GtkPageSetup* gtk_print_context_get_page_setup (GtkPrintContext *context);
		external "C inline use <gtk/gtk.h>"
		end
	
	gtk_print_context_get_width (a_context: POINTER): REAL
			-- gdouble gtk_print_context_get_width (GtkPrintContext *context);
		external "C inline use <gtk/gtk.h>"
		end
	
	gtk_print_context_get_height (a_context: POINTER): REAL
			-- gdouble gtk_print_context_get_height (GtkPrintContext *context);
		external "C inline use <gtk/gtk.h>"
		end
	
	gtk_print_context_get_dpi_x (a_context: POINTER): REAL
			-- gdouble gtk_print_context_get_dpi_x (GtkPrintContext *context);
		external "C inline use <gtk/gtk.h>"
		end
	
	gtk_print_context_get_dpi_y (a_context: POINTER): REAL
			-- gdouble gtk_print_context_get_dpi_y (GtkPrintContext *context);
		external "C inline use <gtk/gtk.h>"
		end

	gtk_print_context_get_pango_fontmap (a_context: POINTER): POINTER
			-- PangoFontMap* gtk_print_context_get_pango_fontmap (GtkPrintContext
			-- *context);
		external "C inline use <gtk/gtk.h>"
		end
	
	gtk_print_context_create_pango_context (a_context: POINTER): POINTER
			-- PangoContext* gtk_print_context_create_pango_context
			-- (GtkPrintContext --*context);
		external "C inline use <gtk/gtk.h>"
		end
	
	gtk_print_context_create_pango_layout (a_context: POINTER): POINTER
			-- PangoLayout* gtk_print_context_create_pango_layout (GtkPrintContext
			-- *context);
		external "C inline use <gtk/gtk.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkPrintContext)"
		end

end -- class GTK_PRINT_CONTEXT
