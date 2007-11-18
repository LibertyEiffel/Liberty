indexing
	description: "--  enum GdaServerOperationNodeStatus"
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

deferred class GDA_SERVER_OPERATION_NODE_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_ (a_ :INTEGER): BOOLEAN is
		do	
			Result:=((a_type = gda_server_operation_status_optional) or else
						(a_type = gda_server_operation_status_required) or else
						(a_type = gda_server_operation_status_unknown))
		end

	gda_server_operation_status_optional: INTEGER is
			-- GDA_SERVER_OPERATION_STATUS_OPTIONAL
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_STATUS_OPTIONAL"
		end

	gda_server_operation_status_required: INTEGER is
			-- GDA_SERVER_OPERATION_STATUS_REQUIRED
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_STATUS_REQUIRED"
		end

	gda_server_operation_status_unknown: INTEGER is
			-- GDA_SERVER_OPERATION_STATUS_UNKNOWN
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_STATUS_UNKNOWN"
		end


end
