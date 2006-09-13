indexing
	description: "Enum  GdaConnectionOptions"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
5~					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"

deferred class GDA_CONNECTION_OPTIONS_ENUM
feature  -- enum
	are_valid_connection_option (some_options :INTEGER): BOOLEAN is
		do	
			Result:=(some_options & (gda_connection_options_read_only |
											 gda_connection_options_dont_share)
						).to_boolean
		end

	gda_connection_options_read_only: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_OPTIONS_READ_ONLY"
		end 

	gda_connection_options_dont_share: INTEGER is
	external "C macro use <libgda/libgda.h>"
	alias "GDA_CONNECTION_OPTIONS_DONT_SHARE"
	end

end
