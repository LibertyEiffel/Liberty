note
	description: "External calls for GTK_PRINT_SETTINGS"
	copyright: "(C) 2007 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_PRINT_SETTINGS_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- Unwrapped
	-- GtkPrintSettingsFunc () void (*GtkPrintSettingsFunc) (const gchar *key,
	-- const gchar *value, gpointer user_data); key : value : user_data :

feature {} -- External calls
	-- void (*GtkPrintSettingsFunc) (const gchar *key, const gchar *value,
	-- gpointer user_data);

	gtk_print_settings_new: POINTER is
			-- 	GtkPrintSettings* gtk_print_settings_new (void);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_copy (a_other: POINTER): POINTER is
			-- 	GtkPrintSettings* gtk_print_settings_copy   (GtkPrintSettings *other);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_has_key (a_settings, a_key: POINTER): INTEGER is
			-- gboolean gtk_print_settings_has_key (GtkPrintSettings *settings,
			-- const gchar *key);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_get (a_settings, a_key: POINTER): POINTER is
			-- const gchar* gtk_print_settings_get (GtkPrintSettings *settings,
			-- const gchar *key);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set (a_settings, a_key, a_value: POINTER) is
			-- void gtk_print_settings_set (GtkPrintSettings *settings, const gchar
			-- *key, const gchar *value);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_unset (a_settings, a_key: POINTER) is
			-- void gtk_print_settings_unset (GtkPrintSettings *settings, const
			-- gchar *key);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_foreach (a_settings, a_gtkprintsettingsfunc, some_data: POINTER) is
			-- void gtk_print_settings_foreach (GtkPrintSettings *settings,
			-- GtkPrintSettingsFunc func, gpointer user_data);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_get_bool (a_settings, a_key: POINTER): INTEGER is
			-- gboolean gtk_print_settings_get_bool (GtkPrintSettings *settings,
			-- const gchar *key);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_bool (a_settings, a_key: POINTER; a_value: INTEGER) is
			-- void gtk_print_settings_set_bool (GtkPrintSettings *settings, const
			-- gchar *key, gboolean value);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_get_double (a_settings, a_key: POINTER): REAL is
			-- gdouble gtk_print_settings_get_double (GtkPrintSettings *settings,
			-- const gchar *key);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_get_double_with_default (a_settings, a_key: POINTER; a_def: REAL): REAL is
			-- gdouble gtk_print_settings_get_double_with_default (GtkPrintSettings
			-- *settings, const gchar *key, gdouble def);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_double (a_settings, a_key: POINTER; a_value: REAL) is
			-- 	void gtk_print_settings_set_double (GtkPrintSettings *settings,
			-- 	const gchar *key, gdouble value);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_get_length (a_settings, a_key: POINTER; a_unit: INTEGER): REAL is
			-- 	gdouble gtk_print_settings_get_length (GtkPrintSettings
			-- 	*settings, const gchar *key, GtkUnit unit);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_length (a_settings, a_key: POINTER; a_value: REAL; a_unit: INTEGER) is
			-- void gtk_print_settings_set_length (GtkPrintSettings *settings,
			-- const gchar *key, gdouble value, GtkUnit unit);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_get_int (a_settings, a_key: POINTER): INTEGER is
			-- gint gtk_print_settings_get_int (GtkPrintSettings *settings, const
			-- gchar *key);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_get_int_with_default (a_settings, a_key: POINTER; a_default: INTEGER): INTEGER is
			-- gint gtk_print_settings_get_int_with_default (GtkPrintSettings
			-- *settings, const gchar *key, gint def);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_int (a_settings, a_key: POINTER; a_value: INTEGER) is
			-- void gtk_print_settings_set_int (GtkPrintSettings *settings, const
			-- gchar *key, gint value);
		external "C use <gtk/gtk.h>"
		end
	
	-- #define     GTK_PRINT_SETTINGS_PRINTER
	gtk_print_settings_get_printer (a_settings: POINTER): POINTER is
			-- const gchar* gtk_print_settings_get_printer (GtkPrintSettings
			-- *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_printer  (a_settings, a_printer: POINTER) is
			-- void gtk_print_settings_set_printer (GtkPrintSettings *settings,
			-- const gchar *printer);
		external "C use <gtk/gtk.h>"
		end

	-- #define     GTK_PRINT_SETTINGS_ORIENTATION
	
	gtk_print_settings_get_orientation (a_settings: POINTER): INTEGER is
			-- GtkPageOrientation gtk_print_settings_get_orientation
			-- (GtkPrintSettings *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_orientation (a_settings: POINTER; an_orientation: INTEGER) is
			-- void gtk_print_settings_set_orientation (GtkPrintSettings *settings,
			-- GtkPageOrientation orientation);
		external "C use <gtk/gtk.h>"
		end

	--	#define     GTK_PRINT_SETTINGS_PAPER_FORMAT
	gtk_print_settings_get_paper_size (a_settings: POINTER): POINTER is
			-- GtkPaperSize* gtk_print_settings_get_paper_size (GtkPrintSettings
			-- *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_paper_size (a_settings, a_paper_size: POINTER) is
			-- void gtk_print_settings_set_paper_size (GtkPrintSettings *settings,
			-- GtkPaperSize *paper_size);
		external "C use <gtk/gtk.h>"
		end

	-- #define GTK_PRINT_SETTINGS_PAPER_WIDTH
	gtk_print_settings_get_paper_width (a_settings: POINTER; a_unit: INTEGER): REAL is
			-- gdouble gtk_print_settings_get_paper_width (GtkPrintSettings
			-- *settings, GtkUnit unit);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_paper_width (a_settings: POINTER; a_width: REAL;	a_unit: INTEGER) is
			-- void gtk_print_settings_set_paper_width (GtkPrintSettings *settings,
			-- gdouble width, GtkUnit unit);
		external "C use <gtk/gtk.h>"
		end

	-- #define GTK_PRINT_SETTINGS_PAPER_HEIGHT
	gtk_print_settings_get_paper_height (a_settings: POINTER; a_unit: INTEGER): REAL is
			-- gdouble gtk_print_settings_get_paper_height (GtkPrintSettings
			-- *settings, GtkUnit unit);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_paper_height (a_settings: POINTER; an_height: REAL; a_unit: INTEGER) is
			-- void gtk_print_settings_set_paper_height (GtkPrintSettings
			-- *settings, gdouble height, GtkUnit unit);
		external "C use <gtk/gtk.h>"
		end

	--	#define     GTK_PRINT_SETTINGS_USE_COLOR
	gtk_print_settings_get_use_color (a_settings: POINTER): INTEGER is
			-- gboolean gtk_print_settings_get_use_color (GtkPrintSettings
			-- *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_use_color (a_settings: POINTER; use_color_bool: INTEGER) is
			-- void gtk_print_settings_set_use_color (GtkPrintSettings *settings,
			-- gboolean use_color);
		external "C use <gtk/gtk.h>"
		end

	--	#define GTK_PRINT_SETTINGS_COLLATE
	gtk_print_settings_get_collate (a_settings: POINTER): INTEGER is
			-- gboolean gtk_print_settings_get_collate (GtkPrintSettings
			-- *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_collate (a_settings: POINTER; collate_bool: INTEGER) is
			-- void gtk_print_settings_set_collate (GtkPrintSettings *settings,
			-- gboolean collate);
		external "C use <gtk/gtk.h>"
		end

	-- #define     GTK_PRINT_SETTINGS_REVERSE
	gtk_print_settings_get_reverse  (a_settings: POINTER): INTEGER is
			-- 	gboolean    gtk_print_settings_get_reverse  (GtkPrintSettings *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_reverse  (a_settings: POINTER; reverse: INTEGER) is
			-- void gtk_print_settings_set_reverse (GtkPrintSettings *settings,
			-- gboolean reverse);
		external "C use <gtk/gtk.h>"
		end

	-- 	enum GtkPrintDuplex;
	
	--#define GTK_PRINT_SETTINGS_DUPLEX
	gtk_print_settings_get_duplex (a_settings: POINTER): INTEGER is
			-- GtkPrintDuplex gtk_print_settings_get_duplex (GtkPrintSettings
			-- *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_duplex (a_settings: POINTER; a_duplex: INTEGER) is
			-- void gtk_print_settings_set_duplex (GtkPrintSettings *settings,
			-- GtkPrintDuplex duplex);
		external "C use <gtk/gtk.h>"
		end

	-- 	enum GtkPrintQuality;
	
	-- #define GTK_PRINT_SETTINGS_QUALITY
	gtk_print_settings_get_quality (a_settings: POINTER): INTEGER is
			-- GtkPrintQuality gtk_print_settings_get_quality (GtkPrintSettings
			-- *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_quality  (a_settings: POINTER; a_quality: INTEGER) is
			-- void gtk_print_settings_set_quality (GtkPrintSettings *settings,
			-- GtkPrintQuality quality);
		external "C use <gtk/gtk.h>"
		end

	-- #define     GTK_PRINT_SETTINGS_N_COPIES
	gtk_print_settings_get_n_copies (a_settings: POINTER): INTEGER is
			-- gint gtk_print_settings_get_n_copies (GtkPrintSettings *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_n_copies (a_settings: POINTER; num_copies: INTEGER) is
			--	void gtk_print_settings_set_n_copies (GtkPrintSettings *settings,
			--	gint num_copies);
		external "C use <gtk/gtk.h>"
		end

	--	#define GTK_PRINT_SETTINGS_NUMBER_UP
	gtk_print_settings_get_number_up (a_settings: POINTER): INTEGER is
			-- gint gtk_print_settings_get_number_up (GtkPrintSettings *settings);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_print_settings_set_number_up (a_settings: POINTER; a_number_up: INTEGER) is
			-- void gtk_print_settings_set_number_up (GtkPrintSettings *settings,
			-- gint number_up);
		external "C use <gtk/gtk.h>"
		end

	--	#define     GTK_PRINT_SETTINGS_RESOLUTION
	gtk_print_settings_get_resolution (a_settings: POINTER): INTEGER is
			--	gint gtk_print_settings_get_resolution (GtkPrintSettings *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_resolution (a_settings: POINTER; a_resolution: INTEGER) is
			-- void gtk_print_settings_set_resolution (GtkPrintSettings *settings,
			-- gint resolution);
		external "C use <gtk/gtk.h>"
		end

	-- #define     GTK_PRINT_SETTINGS_SCALE
	gtk_print_settings_get_scale (a_settings: POINTER): REAL is
			-- gdouble gtk_print_settings_get_scale (GtkPrintSettings *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_scale (a_settings: POINTER; a_scale: REAL) is
			-- void gtk_print_settings_set_scale (GtkPrintSettings *settings,
			-- gdouble scale);
		external "C use <gtk/gtk.h>"
		end

	--	enum GtkPrintPages;

	-- #define     GTK_PRINT_SETTINGS_PRINT_PAGES
	gtk_print_settings_get_print_pages (a_settings: POINTER): INTEGER is
			-- GtkPrintPages gtk_print_settings_get_print_pages (GtkPrintSettings
			-- *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_print_pages (a_settings: POINTER; a_print_pages: INTEGER) is
			-- void gtk_print_settings_set_print_pages (GtkPrintSettings *settings,
			-- GtkPrintPages pages);
		external "C use <gtk/gtk.h>"
		end

	-- GtkPageRange;

	-- #define     GTK_PRINT_SETTINGS_PAGE_RANGES
	gtk_print_settings_get_page_ranges (a_settings, a_num_ranges: POINTER): POINTER is
			-- GtkPageRange* gtk_print_settings_get_page_ranges (GtkPrintSettings
			-- *settings, gint *num_ranges);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_page_ranges (a_settings, a_page_ranges: POINTER; a_num_ranges: INTEGER) is
			-- void gtk_print_settings_set_page_ranges (GtkPrintSettings *settings,
			-- GtkPageRange *page_ranges, gint num_ranges);
		external "C use <gtk/gtk.h>"
		end

	-- enum GtkPageSet;

	-- #define     GTK_PRINT_SETTINGS_PAGE_SET
	gtk_print_settings_get_page_set (a_settings: POINTER): INTEGER is
			-- GtkPageSet gtk_print_settings_get_page_set (GtkPrintSettings
			-- *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_page_set (a_settings: POINTER; a_page_set: INTEGER) is
			-- void gtk_print_settings_set_page_set (GtkPrintSettings *settings,
			-- GtkPageSet page_set);
		external "C use <gtk/gtk.h>"
		end

	-- #define     GTK_PRINT_SETTINGS_DEFAULT_SOURCE
	gtk_print_settings_get_default_source (a_settings: POINTER): POINTER is
			-- const gchar* gtk_print_settings_get_default_source (GtkPrintSettings
			-- *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_default_source (a_settings, a_default_source: POINTER) is
			-- void gtk_print_settings_set_default_source (GtkPrintSettings
			-- *settings, const gchar *default_source);
		external "C use <gtk/gtk.h>"
		end

	-- #define GTK_PRINT_SETTINGS_MEDIA_TYPE
	gtk_print_settings_get_media_type (a_settings: POINTER): POINTER is
			-- const gchar* gtk_print_settings_get_media_type (GtkPrintSettings
			-- *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_media_type (a_settings, a_media_type: POINTER) is
			-- void gtk_print_settings_set_media_type (GtkPrintSettings *settings,
			-- const gchar *media_type);
		external "C use <gtk/gtk.h>"
		end

	-- #define GTK_PRINT_SETTINGS_DITHER
	gtk_print_settings_get_dither  (a_settings: POINTER): POINTER is
			-- const gchar* gtk_print_settings_get_dither (GtkPrintSettings
			-- *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_dither (a_settings, a_dither: POINTER) is
			-- void gtk_print_settings_set_dither (GtkPrintSettings *settings,
			-- const gchar *dither);
		external "C use <gtk/gtk.h>"
		end

	--	#define GTK_PRINT_SETTINGS_FINISHINGS
	gtk_print_settings_get_finishings (a_settings: POINTER): POINTER is
			-- const gchar* gtk_print_settings_get_finishings (GtkPrintSettings
			-- *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_finishings (a_settings, a_finishings: POINTER) is
			-- void gtk_print_settings_set_finishings (GtkPrintSettings *settings,
			-- const gchar *finishings);
		external "C use <gtk/gtk.h>"
		end

	-- #define GTK_PRINT_SETTINGS_OUTPUT_BIN
	gtk_print_settings_get_output_bin (a_settings: POINTER): POINTER is
			-- const gchar* gtk_print_settings_get_output_bin (GtkPrintSettings
			-- *settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_settings_set_output_bin (a_settings, an_output_bin: POINTER) is
			-- void gtk_print_settings_set_output_bin (GtkPrintSettings *settings,
			-- const gchar *output_bin);
		external "C use <gtk/gtk.h>"
		end

	--	#define     GTK_PRINT_SETTINGS_OUTPUT_FILE_FORMAT
	-- #define     GTK_PRINT_SETTINGS_OUTPUT_URI
	-- #define     GTK_PRINT_SETTINGS_WIN32_DRIVER_EXTRA
	-- #define     GTK_PRINT_SETTINGS_WIN32_DRIVER_VERSION
feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkPrintSettings)"
		end
end
