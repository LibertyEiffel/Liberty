note
	description: "Global variables."
	copyright: "[
					Copyright (C) 2001-2017: Natalia B. Bidart
					
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

deferred class POLKA_GLOBAL

		-- The public read-only global variables initialized by the
		-- function polka_initialize.

insert
	POLKA_GLOBAL_EXTERNALS

feature {ANY} -- Variables

	polka_strict: BOOLEAN
			-- True iff. strict inequalities are enable. This requires
			-- an additional dimension in vectors and matrices, and
			-- modifies emptiness and universality tests.
		do
			Result := polka_strict_external.to_boolean
		end

	polka_cst: INTEGER
			-- Indicates the index of the constant coefficient. Should
			-- be always 1, weather strict inequalities are enabled or not.
		do
			Result := polka_cts_external
		end

	polka_eps: INTEGER
			-- Indicates the index of the epsilon coefficient. Should be 2.
		do
			Result := polka_eps_external
		end

	polka_dec: INTEGER
			-- Indicates the index of the first "normal" coefficient; 2
			-- if polka_strict is false, 3 otherwise.
		do
			Result := polka_dec_external
		end

	polka_maxnbdims: INTEGER
			-- Maximum number of dimensions allowed in polyhedra.
		do
			Result := polka_maxnbdims_external
		end

	polka_maxnbrows: INTEGER
			-- Maximum number of rows allowed in matrices.
		do
			Result := polka_maxnbrows_external
		end

	polka_maxcolumns: INTEGER
			-- Maximum number of columns allowed in vectors and
			-- matrices.
		do
			Result := polka_maxnbcolumns_external
		end

end -- class POLKA_GLOBAL
