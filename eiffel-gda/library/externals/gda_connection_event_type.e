indexing
	description: "Enum "
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
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

deferred class GDA_CONNECTION_EVENT_TYPE
	--  enum GdaConnectionEventType

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_connection_event_type (a_type :INTEGER): BOOLEAN is
		do	
			Result:=((a_type=gda_connection_event_notice) or else
						(a_type=gda_connection_event_warning) or else
						(a_type=gda_connection_event_error))
		end

	gda_connection_event_notice: INTEGER is
			-- GDA_CONNECTION_EVENT_NOTICE
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_NOTICE"
		end

	gda_connection_event_warning: INTEGER is
			-- GDA_CONNECTION_EVENT_WARNING
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_WARNING"
		end

	gda_connection_event_error: INTEGER is
			-- GDA_CONNECTION_EVENT_ERROR
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_ERROR"
		end
end
