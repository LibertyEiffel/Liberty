note
	description: "A really simple example on matrix creation."
	copyright: "[
					Copyright (C) 2001 Natalia B. Bidart
					
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

class MATRIX_SIMPLE

create {ANY} 
	make

feature {} -- Creation

	make
		local
			mat: POLKA_MATRIX
			pk: PKINT
			r, c: INTEGER
			i, j, val: INTEGER
		do
			r := 12
			c := 30
			create mat.make (r, c, False)
			print ("mat's rows: "+(mat.rows).out+"%N")
			print ("mat's columns: "+(mat.columns).out+"%N")
			
			from i := 0 until i >= mat.rows loop
				from j := 0 until j >= mat.columns loop
					val := j + (i*j)
					print ("creating pk from integer: "+val.out+"%N")
					create pk.from_integer (val)
					print ("pk created, integer: "+pk.to_string+"%N")
					mat.set (i, j, pk)
					print ("mat set_from_pkint, value at (i,j): "+mat.at (i,j).to_string+"%N")
					j := j+1
				end
				i := i+1
			end
			
			mat.print_to_stdout
		end

end -- class MATRIX_SIMPLE
