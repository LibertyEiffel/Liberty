note
	description: "External calls for "
	copyright: "Copyright (C) 2007-2022: $EWLC_developer, $original_copyright_holder"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDK_PIXMAP_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
		gdk_pixmap_new (a_drawable: POINTER; a_width, an_height, a_depth: INTEGER): POINTER
			-- GdkPixmap* gdk_pixmap_new (GdkDrawable *drawable, gint width, gint height, gint depth);
		external "C use <gdk/gdk.h>"
		end

	gdk_bitmap_create_from_data (a_drawable, a_data: POINTER; a_width, an_height: INTEGER): POINTER
			-- GdkBitmap* gdk_bitmap_create_from_data (GdkDrawable *drawable, const gchar *data, gint width, gint height);
		external "C use <gdk/gdk.h>"
		end


	gdk_pixmap_create_from_data (a_drawable, a_data: POINTER; a_width, an_height, a_depth: INTEGER; a_fg, a_bg: POINTER): POINTER
			-- GdkPixmap* gdk_pixmap_create_from_data (GdkDrawable *drawable, const gchar *data, gint width, gint height, gint depth, const GdkColor *fg, const GdkColor *bg);
		external "C use <gdk/gdk.h>"
		end

	gdk_pixmap_create_from_xpm (a_drawable, a_mask_ref, a_transparent_color, a_filename: POINTER): POINTER
			-- GdkPixmap* gdk_pixmap_create_from_xpm (GdkDrawable *drawable, GdkBitmap **mask, const GdkColor *transparent_color, const gchar *filename);
		external "C use <gdk/gdk.h>"
		end

	gdk_pixmap_colormap_create_from_xpm (a_drawable, a_colormap, a_mask_ref, a_transparent_color, a_filename: POINTER): POINTER
			-- GdkPixmap* gdk_pixmap_colormap_create_from_xpm (GdkDrawable *drawable, GdkColormap *colormap, GdkBitmap **mask, const GdkColor *transparent_color, const gchar *filename);
		external "C use <gdk/gdk.h>"
		end

	gdk_pixmap_create_from_xpm_d (a_drawable, a_mask_ref, a_transparent_color, some_data: POINTER): POINTER
			-- GdkPixmap* gdk_pixmap_create_from_xpm_d (GdkDrawable *drawable, GdkBitmap **mask, const GdkColor *transparent_color, gchar **data);
		external "C use <gdk/gdk.h>"
		end

	gdk_pixmap_colormap_create_from_xpm_d (a_drawable, a_colormap, a_mask_ref, a_transparent_color, some_data_ref: POINTER): POINTER
			-- GdkPixmap* gdk_pixmap_colormap_create_from_xpm_d (GdkDrawable *drawable, GdkColormap *colormap, GdkBitmap **mask, const GdkColor *transparent_color, gchar **data);
		external "C use <gdk/gdk.h>"
		end
end
