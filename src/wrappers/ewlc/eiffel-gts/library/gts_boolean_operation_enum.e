note
	description: "Enum "
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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

deferred class GTS_BOOLEAN_OPERATION_ENUM

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_operation (an_operation: INTEGER): BOOLEAN
		do	
			Result:=((an_operation = gts_1_out_2) or else
						(an_operation = gts_1_in_2) or else
						(an_operation = gts_2_out_1) or else
						(an_operation = gts_2_in_1))
		end
	
	gts_1_out_2: INTEGER
			-- identifies the part of the first surface which lies outside the
			-- second surface.
		external "C macro <gts.h>"
		alias "GTS_1_OUT_2"
		end


	gts_1_in_2: INTEGER
			-- identifies the part of the first surface which lies inside the
			-- second surface.
		external "C macro <gts.h>"
		alias "GTS_1_IN_2"
		end

	
	gts_2_out_1: INTEGER
			-- identifies the part of the second surface which lies outside the
			-- first surface.
		external "C macro <gts.h>"
		alias "GTS_2_OUT_1"
		end


	gts_2_in_1: INTEGER
			-- identifies the part of the second surface which lies inside the
			-- first surface.
		external "C macro <gts.h>"
		alias "GTS_2_IN_1"
		end
end
