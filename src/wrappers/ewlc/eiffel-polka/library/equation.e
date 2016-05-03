note
	description: "Data-type for performing parallel assignements and substitutions on matrices and polyhedra."
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

class EQUATION

		-- datatype: equation_t
		--     typedef struct equation_t {
		--       int var;
		--       pkint* expr;
		--     } equation_t;

inherit
	C_STRUCT

insert
	POLKA_GLOBAL
	EQUATION_EXTERNALS
   EIFFEL_OWNED

create {ANY}	make

feature {} -- Creation

	make (a_dimension: INTEGER) is
		require
			a_dimension > 0
		do
			allocate
			dimension := a_dimension
		end

feature {} -- Representation

	dimension: INTEGER

feature {ANY} -- Operations

	set_var (a_variable: INTEGER) is
		require
			a_variable.in_range (0, dimension - polka_dec)
		do
			equation_set_var (handle, a_variable)
		ensure
			variable = a_variable
		end

	set_assignment (an_assignment: ARRAY [PKINT]) is
		require
			an_assignment /= Void
			not an_assignment.has (Void)
			an_assignment.count.in_range (0, dimension - polka_dec)
		do
			equation_set_expr (handle, an_assignment.to_external)
		ensure
			assignment = an_assignment
		end

feature {ANY} -- Access

	variable: INTEGER is
		do
			Result := equation_get_var (handle)
		ensure
			variable.in_range (0, dimension - polka_dec)
		end

	assignment: ARRAY [PKINT] is
		local
			c_ptr: POINTER
			i: INTEGER
		do
			create Result.make (1, 0)
			c_ptr := equation_get_expr (handle)
			from i := 0 until i >= dimension loop
				Result.add_last (create {PKINT}.from_external_pointer (c_ptr))
				c_ptr := c_ptr + struct_size
				i := i+1
			end
		ensure
			assignment /= Void
			not assignment.has (Void)
			assignment.count.in_range (0, dimension - polka_dec)
		end

feature {} -- size

	struct_size: INTEGER is
		external "C inline use <polka/.h>"
		alias "sizeof (equation_t)"
		end

end -- class EQUATION
