indexing
	description: "Enum "
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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


				-- events usually notified by the library itself, and
				-- which the providers should notify on very special cases
				-- (like a transaction being started or committed via a
				-- BEGIN/COMMIT command directly sent to the
				-- execute_command method on the provider 

deferred class GDA_CLIENT_EVENT_ENUM

inherit ANY undefine is_equal, copy end


feature {} -- enum
	is_valid_client_event (an_event :INTEGER): BOOLEAN is
		do	
			Result:=((an_event=gda_client_event_invalid) or else
						(an_event=gda_client_event_error) or else                 
						(an_event=gda_client_event_connection_opened) or else     
						(an_event=gda_client_event_connection_closed) or else     
						(an_event=gda_client_event_transaction_started) or else   
						(an_event=gda_client_event_transaction_committed) or else 
						(an_event=gda_client_event_transaction_cancelled)
						)
		end

	gda_client_event_invalid: INTEGER is
		external "C macro use  <libgda/libgda.h>"
		alias "GDA_CLIENT_EVENT_INVALID"
		end

	gda_client_event_error: INTEGER is
		external "C macro use  <libgda/libgda.h>"
		alias "GDA_CLIENT_EVENT_ERROR"
		end

	gda_client_event_connection_opened: INTEGER is
		external "C macro use  <libgda/libgda.h>"
		alias "GDA_CLIENT_EVENT_CONNECTION_OPENED"
		end

	gda_client_event_connection_closed: INTEGER is
		external "C macro use  <libgda/libgda.h>"
		alias "GDA_CLIENT_EVENT_CONNECTION_CLOSED"
		end

	gda_client_event_transaction_started: INTEGER is
		external "C macro use  <libgda/libgda.h>"
		alias "GDA_CLIENT_EVENT_TRANSACTION_STARTED"
		end

	gda_client_event_transaction_committed: INTEGER is
		external "C macro use  <libgda/libgda.h>"
		alias "GDA_CLIENT_EVENT_TRANSACTION_COMMITTED"
		end

	gda_client_event_transaction_cancelled: INTEGER is
		external "C macro use  <libgda/libgda.h>"
		alias "GDA_CLIENT_EVENT_TRANSACTION_CANCELLED"
		end
end
