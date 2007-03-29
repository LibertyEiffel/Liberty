indexing
	description: "Gts intersection enum."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli,  1999 St<E9>phane Popinet
					
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

deferred class GTS_INTERSECTION

feature  -- enum
	is_valid_gts_intersection (a_value :INTEGER): BOOLEAN is
		do	
			Result:=((a_value = gts_out) or else
						(a_value = gts_on) or else
						(a_value = gts_in))
		end

	gts_out: INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_OUT"
		end

	gts_on: INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_ON"
		end

	gts_in: INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IN"
		end

end -- GTS_INTERSECTION
