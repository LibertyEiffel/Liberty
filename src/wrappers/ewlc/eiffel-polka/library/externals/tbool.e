note
	description: "Data-type for Boolean lattice, ordered as bottom < {true,false} < top"
	copyright: "[
					Copyright (C) 2001-2022: Natalia B. Bidart
					
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
	date: "$Date:$"
	revision "$REvision:$"
	description: "enum GdkGravity defines the reference point of a window and the meaning of coordinates passed to gtk_window_move(). See gtk_window_move() and the "implementation notes" section of the Extended Window Manager Hints specification for more details."

deferred class TBOOL

		-- datatype: tbool
		--     typedef enum tbool {
		--       tbool_bottom = 0,
		--       tbool_true   = 1,
		--       tbool_false  = 2,
		--       tbool_top    = 3
		--     } tbool;

inherit
	ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_tbool (a_tbool: INTEGER): BOOLEAN
		-- is `a_tbool' a valid tbool enum?
		do
			Result := ((a_tbool = tbool_bottom) or else
			           (a_tbool = tbool_true) or else
			           (a_tbool = tbool_false) or else
			           (a_tbool = tbool_top))
		end

	tbool_bottom: INTEGER
		external "C macro use <polka/polka.h>"
		alias "tbool_bottom"
		end

	tbool_true: INTEGER
		external "C macro use <polka/polka.h>"
		alias "tbool_true"
		end

	tbool_false: INTEGER
		external "C macro use <polka/polka.h>"
		alias "tbool_false"
		end

	tbool_top: INTEGER
		external "C macro use <polka/polka.h>"
		alias "tbool_top"
		end

end -- class TBOOL
