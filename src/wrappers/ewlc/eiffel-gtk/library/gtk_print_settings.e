note
	description: "GtkPrintSettings -- Stores print settings."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, GTK+ team
					
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

class GTK_PRINT_SETTINGS
	-- A GtkPrintSettings object represents the settings of a print dialog in a
	-- system-independent way. The main use for this object is that once you've
	-- printed you can get a settings object that represents the settings the
	-- user chose, and the next time you print you can pass that object in so
	-- that the user doesn't have to re-set all his settings.

	-- Its also possible to enumerate the settings so that you can easily save
	-- the settings for the next time your app runs, or even store them in a
	-- document. The predefined keys try to use shared values as much as possible
	-- so that moving such a document between systems still works.
	
	-- Printing support was added in GTK+ 2.10.
	
inherit
	G_OBJECT
		redefine
			copy
		end

insert
	GTK_UNIT
	GTK_PAGE_ORIENTATION
	GTK_PRINT_SETTINGS_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new GtkPrintSettings object.
		do
			from_external_pointer(gtk_print_settings_new)
		end
	
feature {ANY} -- Copying
	copy (another: GTK_PRINT_SETTINGS)
			--   Copies a GtkPrintSettings object.
		do
			from_external_pointer(gtk_print_settings_copy(another.handle))
		end

feature {ANY} -- Dictionary like behaviour
	-- TODO: make it a real DICTIONARY
	
	has (a_key: STRING): BOOLEAN
			-- Does `a_key' have a value?
		do
			Result:=gtk_print_settings_has_key(handle,a_key.to_external).to_boolean
		end

	at (a_key: STRING): CONST_STRING
			--   Looks up the string value associated with key.
		do
			create Result.from_external
			(gtk_print_settings_get(handle,
											a_key.to_external))
		end

	put (a_key, a_value: STRING)
			-- Associates `a_value' with `a_key'.
		require
			key_not_void: a_key /= Void
			value_not_void: a_value /= Void
		do
			gtk_print_settings_set(handle,a_key.to_external,a_value.to_external)
		end

	unset (a_key: STRING)
			-- Removes any value associated with `a_key'.
		require
			key_not_void: a_key /= Void
		do
			gtk_print_settings_unset(handle,a_key.to_external)
		end

	
	--  gtk_print_settings_foreach ()

	-- void        gtk_print_settings_foreach      (GtkPrintSettings *settings,
	--                                              GtkPrintSettingsFunc func,
	--                                              gpointer user_data);

	--   Calls func for each key-value pair of settings.

	--   settings :  a GtkPrintSettings
	--   func :      the function to call
	--   user_data : user data for func

feature {ANY}
	unit: INTEGER -- The unit used in queries
	
	set_unit (a_unit: INTEGER)
			-- Set the unit used in queries
		require valid_unit: is_valid_gtk_unit(a_unit)
		do
			unit:=a_unit
		ensure set: unit = a_unit
		end

	get_bool (a_key: STRING): BOOLEAN
			-- The boolean represented by the value that is associated with `a_key'.
		require key_not_void: a_key /= Void
		do
			Result:=gtk_print_settings_get_bool(handle, a_key.to_external).to_boolean
		end

	set_bool (a_key: STRING; a_value: BOOLEAN)
			--   Sets `a_key' to `a_value'.
		require key_not_void: a_key /= Void
		do
			gtk_print_settings_set_bool(handle,a_key.to_external,a_value.to_integer)
		end

	get_double (a_key: STRING): REAL
			-- the double value associated with `a_key,' or 0.
		require key_not_void: a_key /= Void
		do
			Result:=gtk_print_settings_get_double(handle,a_key.to_external)
		end

	get_double_with_default (a_key: STRING; a_default: REAL): REAL
			-- The floating point number represented by the value that is
			-- associated with `a_key', or `a_default' if the value does not
			-- represent a floating point number.
		
			-- Floating point numbers are parsed with the C function
			-- `g_ascii_strtod'.
		require key_not_void: a_key /= Void
		do
			Result:=(gtk_print_settings_get_double_with_default
						(handle, a_key.to_external, a_default))
		end

	set_double (a_key: STRING; a_value: REAL)
			-- Sets `a_key' to double `a_value'.
		require key_not_void: a_key /= Void
		do
			gtk_print_settings_set_double(handle,a_key.to_external,a_value)
		end

	get_length (a_key: STRING): REAL
			-- The value associated with `a_key,' interpreted as a length,
			-- expressed in `unit'.
		require key_not_void: a_key /= Void
		do
			Result:=gtk_print_settings_get_length(handle, a_key.to_external,unit)
		end

	set_length (a_key: STRING; a_length: REAL)
			--   Associates `a_length' in `unit' with `a_key'.
		require key_not_void: a_key /= Void
		do
			gtk_print_settings_set_length(handle, a_key.to_external, a_length, unit)
		end


	get_integer (a_key: STRING): INTEGER
			-- The integer value of `a_key,' or 0.
		require
			key_not_void: a_key /= Void
		do
			Result:=gtk_print_settings_get_int(handle, a_key.to_external)
		end

	get_integer_with_default (a_key: STRING; a_default: INTEGER): INTEGER
			-- The integer value of `a_key,' or `a_default' value.
		require
			key_not_void: a_key /= Void
		do
			Result:=gtk_print_settings_get_int_with_default(handle,a_key.to_external,a_default)
		end

	set_integer (a_key: STRING; a_value: INTEGER)
			-- Sets `a_key' to an integer `a_value'.
		require
			key_not_void: a_key /= Void
		do
			gtk_print_settings_set_int(handle,a_key.to_external,a_value)
		end

	--  GTK_PRINT_SETTINGS_PRINTER

	-- #define GTK_PRINT_SETTINGS_PRINTER "printer" 

	printer: CONST_STRING
			-- the printer name.
		do
			create Result.from_external(gtk_print_settings_get_printer(handle))
		end

	set_printer (a_printer: STRING)
		do
			gtk_print_settings_set_printer(handle,a_printer.to_external)
		end
	
	--  GTK_PRINT_SETTINGS_ORIENTATION

	-- #define GTK_PRINT_SETTINGS_ORIENTATION "orientation"

	orientation: INTEGER
			-- the page orientation.
		do
			Result:=gtk_print_settings_get_orientation(handle)
		ensure valid: is_valid_gtk_page_orientation(Result)
		end

	set_orientation (an_orientation: INTEGER)
			--   Sets the value of page orientation.
		require valid: is_valid_gtk_page_orientation(an_orientation)
		do
			gtk_print_settings_set_orientation(handle,an_orientation)
		end
	
	--  GTK_PRINT_SETTINGS_PAPER_FORMAT
	
	-- #define GTK_PRINT_SETTINGS_PAPER_FORMAT   "paper-format"

	paper_size: GTK_PAPER_SIZE
			-- the paper format.
		do
			create Result.from_external_pointer
			(gtk_print_settings_get_paper_size(handle))
		end

	set_paper_size (a_paper_size: GTK_PAPER_SIZE)
			-- Sets the value of paper size.
		require size_not_void: a_paper_size/=Void
		do
			gtk_print_settings_set_paper_size(handle,a_paper_size.handle)
		end
	
	--  GTK_PRINT_SETTINGS_PAPER_WIDTH
	
	-- #define GTK_PRINT_SETTINGS_PAPER_WIDTH "paper-width"
	
	paper_width: REAL
			-- the paper width, in units of unit
		do
			Result:= gtk_print_settings_get_paper_width(handle,unit)
		end

	set_paper_width (a_width: REAL)
			--   Sets the value of the paper to `a_width', expressed in `unit'
		do
			gtk_print_settings_set_paper_width(handle,a_width, unit)
		end
	
	--  GTK_PRINT_SETTINGS_PAPER_HEIGHT
	
	-- #define GTK_PRINT_SETTINGS_PAPER_HEIGHT   "paper-height"

	paper_height: REAL
			-- The paper height, expressed in unit.
		do
			Result:=gtk_print_settings_get_paper_height(handle, unit)
		end

	
	set_paper_height (an_height: REAL)
			-- Sets the value of paper height.
		do
			gtk_print_settings_set_paper_height(handle, an_height, unit)
		end
	
	--  GTK_PRINT_SETTINGS_USE_COLOR
	--
	-- #define GTK_PRINT_SETTINGS_USE_COLOR      "use-color"

	use_color: BOOLEAN
			-- whether to use color
		do
			Result:=gtk_print_settings_get_use_color(handle).to_boolean
		end

	set_use_color (a_setting: BOOLEAN)
			--   Sets the value of `use_color'.
		do
			gtk_print_settings_set_use_color(handle,a_setting.to_integer)
		end
	
	--  GTK_PRINT_SETTINGS_COLLATE
	--
	-- #define GTK_PRINT_SETTINGS_COLLATE        "collate"

	collate: BOOLEAN
			-- Are the printed pages collated?
		do
			Result:=gtk_print_settings_get_collate(handle).to_boolean
		end

	set_collate (a_setting: BOOLEAN)
			-- Sets whether to collate the output.
		do
			gtk_print_settings_set_collate  (handle, a_setting.to_integer)
		end
	
	--  GTK_PRINT_SETTINGS_REVERSE
	--
	-- #define GTK_PRINT_SETTINGS_REVERSE        "reverse"

	is_reversed: BOOLEAN
			-- Are pages printed in reverse order?
		do
			Result:=gtk_print_settings_get_reverse(handle).to_boolean
		end

	set_reverse (a_setting: BOOLEAN)
			-- Sets whether to reverse the output.
		do
			gtk_print_settings_set_reverse  (handle, a_setting.to_integer)
		end
	
	--  enum GtkPrintDuplex
	--
	-- typedef enum {
	--   GTK_PRINT_DUPLEX_SIMPLEX,
	--   GTK_PRINT_DUPLEX_HORIZONTAL,
	--   GTK_PRINT_DUPLEX_VERTICAL
	-- } GtkPrintDuplex;
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_DUPLEX
	--
	-- #define GTK_PRINT_SETTINGS_DUPLEX         "duplex"
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_get_duplex ()
	--
	-- GtkPrintDuplex gtk_print_settings_get_duplex
	--                                             (GtkPrintSettings *settings);
	--
	--   Gets the value of GTK_PRINT_SETTINGS_DUPLEX.
	--
	--   settings : a GtkPrintSettings
	--   Returns :  whether to print the output in duplex.
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_set_duplex ()
	--
	-- void        gtk_print_settings_set_duplex   (GtkPrintSettings *settings,
	--                                              GtkPrintDuplex duplex);
	--
	--   Sets the value of GTK_PRINT_SETTINGS_DUPLEX.
	--
	--   settings : a GtkPrintSettings
	--   duplex :   a GtkPrintDuplex value
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  enum GtkPrintQuality
	--
	-- typedef enum {
	--   GTK_PRINT_QUALITY_LOW,
	--   GTK_PRINT_QUALITY_NORMAL,
	--   GTK_PRINT_QUALITY_HIGH,
	--   GTK_PRINT_QUALITY_DRAFT
	-- } GtkPrintQuality;
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_QUALITY
	--
	-- #define GTK_PRINT_SETTINGS_QUALITY        "quality"
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_get_quality ()
	--
	-- GtkPrintQuality gtk_print_settings_get_quality
	--                                             (GtkPrintSettings *settings);
	--
	--   Gets the value of GTK_PRINT_SETTINGS_QUALITY.
	--
	--   settings : a GtkPrintSettings
	--   Returns :  the print quality
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_set_quality ()
	--
	-- void        gtk_print_settings_set_quality  (GtkPrintSettings *settings,
	--                                              GtkPrintQuality quality);
	--
	--   Sets the value of GTK_PRINT_SETTINGS_QUALITY.
	--
	--   settings : a GtkPrintSettings
	--   quality :  a GtkPrintQuality value
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_N_COPIES
	--
	-- #define GTK_PRINT_SETTINGS_N_COPIES       "n-copies"
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_get_n_copies ()
	--
	-- gint        gtk_print_settings_get_n_copies (GtkPrintSettings *settings);
	--
	--   Gets the value of GTK_PRINT_SETTINGS_N_COPIES.
	--
	--   settings : a GtkPrintSettings
	--   Returns :  the number of copies to print
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_set_n_copies ()
	--
	-- void        gtk_print_settings_set_n_copies (GtkPrintSettings *settings,
	--                                              gint num_copies);
	--
	--   Sets the value of GTK_PRINT_SETTINGS_N_COPIES.
	--
	--   settings :   a GtkPrintSettings
	--   num_copies : the number of copies
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_NUMBER_UP
	--
	-- #define GTK_PRINT_SETTINGS_NUMBER_UP      "number-up"
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_get_number_up ()
	--
	-- gint        gtk_print_settings_get_number_up
	--                                             (GtkPrintSettings *settings);
	--
	--   Gets the value of GTK_PRINT_SETTINGS_NUMBER_UP.
	--
	--   settings : a GtkPrintSettings
	--   Returns :  the number of pages per sheet
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_set_number_up ()
	--
	-- void        gtk_print_settings_set_number_up
	--                                             (GtkPrintSettings *settings,
	--                                              gint number_up);
	--
	--   Sets the value of GTK_PRINT_SETTINGS_NUMBER_UP.
	--
	--   settings :  a GtkPrintSettings
	--   number_up : the number of pages per sheet
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_RESOLUTION
	--
	-- #define GTK_PRINT_SETTINGS_RESOLUTION     "resolution"
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_get_resolution ()
	--
	-- gint        gtk_print_settings_get_resolution
	--                                             (GtkPrintSettings *settings);
	--
	--   Gets the value of GTK_PRINT_SETTINGS_RESOLUTION.
	--
	--   settings : a GtkPrintSettings
	--   Returns :  the resolution in dpi
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_set_resolution ()
	--
	-- void        gtk_print_settings_set_resolution
	--                                             (GtkPrintSettings *settings,
	--                                              gint resolution);
	--
	--   Sets the value of GTK_PRINT_SETTINGS_RESOLUTION.
	--
	--   settings :   a GtkPrintSettings
	--   resolution : the resolution in dpi
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_SCALE
	--
	-- #define GTK_PRINT_SETTINGS_SCALE          "scale"
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_get_scale ()
	--
	-- gdouble     gtk_print_settings_get_scale    (GtkPrintSettings *settings);
	--
	--   Gets the value of GTK_PRINT_SETTINGS_SCALE.
	--
	--   settings : a GtkPrintSettings
	--   Returns :  the scale in percent
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_set_scale ()
	--
	-- void        gtk_print_settings_set_scale    (GtkPrintSettings *settings,
	--                                              gdouble scale);
	--
	--   Sets the value of GTK_PRINT_SETTINGS_SCALE.
	--
	--   settings : a GtkPrintSettings
	--   scale :    the scale in percent
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  enum GtkPrintPages
	--
	-- typedef enum {
	--   GTK_PRINT_PAGES_ALL,
	--   GTK_PRINT_PAGES_CURRENT,
	--   GTK_PRINT_PAGES_RANGES
	-- } GtkPrintPages;
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_PRINT_PAGES
	--
	-- #define GTK_PRINT_SETTINGS_PRINT_PAGES    "print-pages"
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_get_print_pages ()
	--
	-- GtkPrintPages gtk_print_settings_get_print_pages
	--                                             (GtkPrintSettings *settings);
	--
	--   Gets the value of GTK_PRINT_SETTINGS_PRINT_PAGES.
	--
	--   settings : a GtkPrintSettings
	--   Returns :  which pages to print
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_set_print_pages ()
	--
	-- void        gtk_print_settings_set_print_pages
	--                                             (GtkPrintSettings *settings,
	--                                              GtkPrintPages pages);
	--
	--   Sets the value of GTK_PRINT_SETTINGS_PRINT_PAGES.
	--
	--   settings : a GtkPrintSettings
	--   pages :    a GtkPrintPages value
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  GtkPageRange
	--
	-- typedef struct {
	--   gint start;
	--   gint end;
	-- } GtkPageRange;
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_PAGE_RANGES
	--
	-- #define GTK_PRINT_SETTINGS_PAGE_RANGES    "page-ranges"
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_get_page_ranges ()
	--
	-- GtkPageRange* gtk_print_settings_get_page_ranges
	--                                             (GtkPrintSettings *settings,
	--                                              gint *num_ranges);
	--
	--   Gets the value of GTK_PRINT_SETTINGS_PAGE_RANGES.
	--
	--   settings :   a GtkPrintSettings
	--   num_ranges : return location for the length of the returned array
	--   Returns :    an array of GtkPageRanges. Use g_free() to free the array
	--                when it is no longer needed.
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_set_page_ranges ()
	--
	-- void        gtk_print_settings_set_page_ranges
	--                                             (GtkPrintSettings *settings,
	--                                              GtkPageRange *page_ranges,
	--                                              gint num_ranges);
	--
	--   Sets the value of GTK_PRINT_SETTINGS_PAGE_RANGES.
	--
	--   settings :    a GtkPrintSettings
	--   page_ranges : an array of GtkPageRanges
	--   num_ranges :  the length of page_ranges
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  enum GtkPageSet
	--
	-- typedef enum {
	--   GTK_PAGE_SET_ALL,
	--   GTK_PAGE_SET_EVEN,
	--   GTK_PAGE_SET_ODD
	-- } GtkPageSet;
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_PAGE_SET
	--
	-- #define GTK_PRINT_SETTINGS_PAGE_SET       "page-set"
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_get_page_set ()
	--
	-- GtkPageSet  gtk_print_settings_get_page_set (GtkPrintSettings *settings);
	--
	--   Gets the value of GTK_PRINT_SETTINGS_PAGE_SET.
	--
	--   settings : a GtkPrintSettings
	--   Returns :  the set of pages to print
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_set_page_set ()
	--
	-- void        gtk_print_settings_set_page_set (GtkPrintSettings *settings,
	--                                              GtkPageSet page_set);
	--
	--   Sets the value of GTK_PRINT_SETTINGS_PAGE_SET.
	--
	--   settings : a GtkPrintSettings
	--   page_set : a GtkPageSet value
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_DEFAULT_SOURCE
	--
	-- #define GTK_PRINT_SETTINGS_DEFAULT_SOURCE "default-source"
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_get_default_source ()
	--
	-- const gchar* gtk_print_settings_get_default_source
	--                                             (GtkPrintSettings *settings);
	--
	--   Gets the value of GTK_PRINT_SETTINGS_DEFAULT_SOURCE.
	--
	--   settings : a GtkPrintSettings
	--   Returns :  the default source
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_set_default_source ()
	--
	-- void        gtk_print_settings_set_default_source
	--                                             (GtkPrintSettings *settings,
	--                                              const gchar *default_source);
	--
	--   Sets the value of GTK_PRINT_SETTINGS_DEFAULT_SOURCE.
	--
	--   settings :       a GtkPrintSettings
	--   default_source : the default source
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_MEDIA_TYPE
	--
	-- #define GTK_PRINT_SETTINGS_MEDIA_TYPE     "media-type"
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_get_media_type ()
	--
	-- const gchar* gtk_print_settings_get_media_type
	--                                             (GtkPrintSettings *settings);
	--
	--   Gets the value of GTK_PRINT_SETTINGS_MEDIA_TYPE.
	--
	--   The set of media types is defined in PWG 5101.1-2002 PWG.
	--
	--   settings : a GtkPrintSettings
	--   Returns :  the media type
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_set_media_type ()
	--
	-- void        gtk_print_settings_set_media_type
	--                                             (GtkPrintSettings *settings,
	--                                              const gchar *media_type);
	--
	--   Sets the value of GTK_PRINT_SETTINGS_MEDIA_TYPE.
	--
	--   The set of media types is defined in PWG 5101.1-2002 PWG.
	--
	--   settings :   a GtkPrintSettings
	--   media_type : the media type
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_DITHER
	--
	-- #define GTK_PRINT_SETTINGS_DITHER         "dither"
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_get_dither ()
	--
	-- const gchar* gtk_print_settings_get_dither  (GtkPrintSettings *settings);
	--
	--   Gets the value of GTK_PRINT_SETTINGS_DITHER.
	--
	--   settings : a GtkPrintSettings
	--   Returns :  the dithering that is used
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_set_dither ()
	--
	-- void        gtk_print_settings_set_dither   (GtkPrintSettings *settings,
	--                                              const gchar *dither);
	--
	--   Sets the value of GTK_PRINT_SETTINGS_DITHER.
	--
	--   settings : a GtkPrintSettings
	--   dither :   the dithering that is used
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_FINISHINGS
	--
	-- #define GTK_PRINT_SETTINGS_FINISHINGS     "finishings"
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_get_finishings ()
	--
	-- const gchar* gtk_print_settings_get_finishings
	--                                             (GtkPrintSettings *settings);
	--
	--   Gets the value of GTK_PRINT_SETTINGS_FINISHINGS.
	--
	--   settings : a GtkPrintSettings
	--   Returns :  the finishings
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_set_finishings ()
	--
	-- void        gtk_print_settings_set_finishings
	--                                             (GtkPrintSettings *settings,
	--                                              const gchar *finishings);
	--
	--   Sets the value of GTK_PRINT_SETTINGS_FINISHINGS.
	--
	--   settings :   a GtkPrintSettings
	--   finishings : the finishings
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_OUTPUT_BIN
	--
	-- #define GTK_PRINT_SETTINGS_OUTPUT_BIN     "output-bin"
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_get_output_bin ()
	--
	-- const gchar* gtk_print_settings_get_output_bin
	--                                             (GtkPrintSettings *settings);
	--
	--   Gets the value of GTK_PRINT_SETTINGS_OUTPUT_BIN.
	--
	--   settings : a GtkPrintSettings
	--   Returns :  the output bin
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_settings_set_output_bin ()
	--
	-- void        gtk_print_settings_set_output_bin
	--                                             (GtkPrintSettings *settings,
	--                                              const gchar *output_bin);
	--
	--   Sets the value of GTK_PRINT_SETTINGS_OUTPUT_BIN.
	--
	--   settings :   a GtkPrintSettings
	--   output_bin : the output bin
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_OUTPUT_FILE_FORMAT
	--
	-- #define GTK_PRINT_SETTINGS_OUTPUT_FILE_FORMAT  "output-file-format"
	--
	--   The key used by the "Print to file" printer to store the format of the
	--   output. The supported values are "PS" and "PDF".
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_OUTPUT_URI
	--
	-- #define GTK_PRINT_SETTINGS_OUTPUT_URI          "output-uri"
	--
	--   The key used by the "Print to file" printer to store the URI to which the
	--   output should be written. GTK+ itself supports only "file://" URIs.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_WIN32_DRIVER_EXTRA
	--
	-- #define GTK_PRINT_SETTINGS_WIN32_DRIVER_EXTRA   "win32-driver-extra"
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRINT_SETTINGS_WIN32_DRIVER_VERSION
	--
			-- #define GTK_PRINT_SETTINGS_WIN32_DRIVER_VERSION 
			-- "win32-driver-version"
			
invariant
	valid_unit: is_valid_gtk_unit(unit)
end -- class GTK_PRINT_SETTINGS
