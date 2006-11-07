indexing
	description: "GdaHandlerTime -- Default handler for time, date and timestamp."
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

class GDA_HANDLER_TIME

inherit 
	GDA_OBJECT
	GDA_DATA_HANDLER

creation make, make_no_locale, from_external_pointer

feature {} -- Creation

	make is
			-- Creates a data handler for time values
		do
			from_external_pointer(gda_handler_time_new)
		end

	make_no_locale is
			-- Creates a data handler for time values, but using the
			-- default C locale instead of the current user locale.
		do
			from_external_pointer(gda_handler_time_new_no_locale)
		end   
feature {}
	gda_handler_time_new: POINTER is
			-- GdaDataHandler* gda_handler_time_new (void);
		external "C use <libgda/libhda.h>"
		end

	gda_handler_time_new_no_locale: POINTER is
			-- GdaDataHandler* gda_handler_time_new_no_locale (void);
		external "C use <libgda/libhda.h>"
		end
end -- class GDA_HANDLER_TIME
