indexing
	description: "Enum GdaBlobMode"
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

deferred class GDA_BLOB_MODE_ENUM
feature {} -- enum
	is_valid_blob_mode (a_mode :INTEGER): BOOLEAN is
		do	
			Result:=((a_mode = gda_blob_mode_read) or else
						(a_mode = gda_blob_mode_write) or else
						(a_mode = gda_blob_mode_rdwr))
		end

	gda_blob_mode_read: INTEGER is
	external "C macro use <libgda/libgda.h>"
	alias "GDA_BLOB_MODE_READ"
	end

	gda_blob_mode_write: INTEGER is
	external "C macro use <libgda/libgda.h>"
	alias "GDA_BLOB_MODE_WRITE"
	end

	gda_blob_mode_rdwr: INTEGER is
	external "C macro use <libgda/libgda.h>"
	alias "GDA_BLOB_MODE_RDWR"
	end

end
