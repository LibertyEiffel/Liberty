indexing
	description: "Wrapper callback for GCompareDataFunc"
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class G_COMPARE_DATA_CALLBACK

inherit GLIB_CALLBACK

insert SHARED_WRAPPERS_DICTIONARY

creation make

feature {} -- Creation
	make (a_function: FUNCTION[ANY,TUPLE[COMPARABLE_SHARED_C_STRUCT,COMPARABLE_SHARED_C_STRUCT],INTEGER]) is
		require function_not_void: a_function/=Void
		do
			function:=a_function
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
	function: FUNCTION[ANY,TUPLE[COMPARABLE_SHARED_C_STRUCT,COMPARABLE_SHARED_C_STRUCT],INTEGER]

	callback (a,b: POINTER; me: like Current): INTEGER is
		local cscs_a, cscs_b: COMPARABLE_SHARED_C_STRUCT
		do
			-- export CECIL 
			check
				a_wrapper_exists: me.wrappers.has(a)
				b_wrapper_exists: me.wrappers.has(b)
			end
			cscs_a ::= wrappers.at(a)
			cscs_b ::= wrappers.at(b)
			Result:=(me.function.item([cscs_a,cscs_b]))
		end

	callback_address: POINTER is
		external "[
					 C inline use "glib-callbacks.h"
															  ]"
		alias "EiffelGCompareDataFunc"
		end
end -- class G_COMPARE_DATA_CALLBACK
