indexing
	description: "GdaHandlerTime -- Default handler for time, date and timestamp."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GDA developers
					
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

	wrapped_version: "3.0.1"

class GDA_HANDLER_TIME
	--   GdaHandlerTime -- Default handler for time, date and timestamp
inherit
	GDA_DATA_HANDLER
	GDA_OBJECT

creation make, from_external_pointer

feature {} -- Creation

	make is
			--   Creates a data handler for time values
		do
			from_external_pointer(gda_handler_time_new)
		end

	make_no_locale is
			-- Creates a data handler for time values, but using the
			-- default C locale instead of the current user locale.
		do
			from_external_pointer(gda_handler_time_new_no_locale)
		end

feature 
	-- TODO: gda_handler_time_set_sql_spec ()
	--
	-- void                gda_handler_time_set_sql_spec       (GdaHandlerTime *dh,
	--                                                          GDateDMY first,
	--                                                          GDateDMY sec,
	--                                                          GDateDMY third,
	--                                                          gchar separator,
	--                                                          gboolean twodigits_years);
	--
	--   Specifies the SQL output style of the dh data handler. The general format
	--   is "FIRSTsSECsTHIRD" where FIRST, SEC and THIRD are specified by first,
	--   sec and trird and 's' is the separator, specified by separator.
	--
	--   The default implementation is FIRST=G_DATE_MONTH, SEC=G_DATE_DAY and
	--   THIRD=G_DATE_YEAR (the year is rendered on 4 digits) and the separator is
	--   '-'
	--
	--   dh :              a GdaHandlerTime object
	--   first :
	--   sec :
	--   third :
	--   separator :
	--   twodigits_years : TRUE if year part of date must be rendered on 2 digits
	--
	--   --------------------------------------------------------------------------
	--
	format (a_type: like g_type): STRING is
			-- A string representing the locale-dependant way to enter a
			-- date/time/datetime, using a syntax suitable for the
			-- GnomeDbFormatEntry. Result is newly allocated.
		do
			create Result.from_external(gda_handler_time_get_format
												 (handle, a_type))
		end
feature -- size
	dummy_gobject: POINTER is do unimplemented end 

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaHandlerTime)"
		end

feature {} -- External calls
	gda_handler_time_new: POINTER is
			-- GdaDataHandler* gda_handler_time_new (void);
		external "C use <libgda/libgda.h>"
		end

	gda_handler_time_new_no_locale: POINTER is
			-- GdaDataHandler* gda_handler_time_new_no_locale (void);
		external "C use <libgda/libgda.h>"
		end

	gda_handler_time_set_sql_spec (a_time_handler: POINTER; a_first, a_sec, a_third: INTEGER; a_separator: CHARACTER; a_twodigits_years: INTEGER) is
			-- void gda_handler_time_set_sql_spec (GdaHandlerTime *dh, GDateDMY first, GDateDMY sec, GDateDMY third, gchar separator, gboolean twodigits_years);
		external "C use <libgda/libgda.h>"
		end
	
	gda_handler_time_get_format (a_time_handler: POINTER; a_type: like g_type): POINTER is
			-- gchar* gda_handler_time_get_format (GdaHandlerTime *dh, GType type);
		external "C use <libgda/libgda.h>"
		end
end -- class GDA_HANDLER_TIME
