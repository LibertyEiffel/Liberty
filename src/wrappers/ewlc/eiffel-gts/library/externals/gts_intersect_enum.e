note
	description: "Enum GtsIntersect"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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

deferred class GTS_INTERSECT_ENUM

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_intersection (an_intersect: INTEGER): BOOLEAN
		do	
			Result:=((an_intersect = gts_out) or else
						(an_intersect = gts_on) or else 
						(an_intersect = gts_in))
		end

	gts_out: INTEGER
		external "C macro use <gts.h>"
		alias "GTS_OUT"
		end
	
	gts_on: INTEGER
		external "C macro use <gts.h>"
		alias "GTS_ON"
		end
	
	gts_in: INTEGER
		external "C macro use <gts.h>"
		alias "GTS_IN"
		end
end
