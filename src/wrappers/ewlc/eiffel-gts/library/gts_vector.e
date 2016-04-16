note
	description: "A simple 3D vector."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTS team
					
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

class GTS_VECTOR

inherit
	C_STRUCT redefine print_on end

	STREAM_HANDLER
		undefine is_equal, copy
		redefine print_on
		end
	
create {ANY}  init, allocate, from_external_pointer

feature {} -- Creation
	init (a_point, another_point: GTS_POINT) is
			-- Creates a vector with the coordinates of the vector from
			-- `a_point' to `another_point'
		require
			point_not_void: a_point /= Void
			another_not_void: another_point /= Void
		do
			allocate 
			gts_vector_init(handle, a_point.handle, another_point.handle)
		end

feature {ANY}
	infix "*" (another: GTS_VECTOR): REAL is
			-- The scalar product between Current and `another'.
		require another_not_void: another /= Void
		do
			Result:=gts_vector_scalar(handle,another.handle)
		end

	infix "^" (another: GTS_VECTOR): GTS_VECTOR is
			-- The cross-product of Current and `another' vectors. 
		require another_not_void: another /= Void
		do
			create Result.allocate
			gts_vector_cross(Result.handle,handle,another.handle)
		end

	norm: REAL is
		do
			Result:=gts_vector_norm(handle)
		end

	normalize: REAL is
		do
			Result:=gts_vector_normalize(handle)
		end

feature {ANY} -- Input Output
	print_on (a_file: OUTPUT_STREAM) is
			-- Print Current to `a_file.
		require
			file_not_void: a_file /= Void
			connected: a_file.is_connected
		do
			gts_vector_print(handle, a_file.stream_pointer)
		end
	
	-- gts_vector4_print ()
	-- Print v to file fptr.
	-- void gts_vector4_print (GtsVector4 v, FILE *fptr);
	-- Print v to file fptr.
	
	-- v: a GtsVector4. fptr: a file descriptor.


feature {} -- External calls
	gts_vector_init (v, p1, p2: POINTER) is
			-- #define gts_vector_init (v, p1, p2)
		external "C macro use <gts.h>"
		end
	
	gts_vector_scalar (v1, v2: POINTER): REAL is
			-- #define gts_vector_scalar (v1, v2)
		external "C macro use <gts.h>"
		end
	
	gts_vector_cross (c,a,b: POINTER) is
			-- #define gts_vector_cross (C,A,B)
		external "C macro use <gts.h>"
		end
	
	gts_vector_norm (v: POINTER): REAL is
			-- #define gts_vector_norm (v)
		external "C macro use <gts.h>"
		end
	
	gts_vector_normalize (v: POINTER): REAL is
			-- #define gts_vector_normalize (v)
		external "C macro use <gts.h>"
		end
	
	gts_vector_print (v, fptr: POINTER) is
			-- void gts_vector_print (GtsVector v, FILE *fptr);
		external "C use <gts.h>"
		end
	
	gts_vector4_print (v, fptr: POINTER) is
			-- void gts_vector4_print (GtsVector4 v, FILE *fptr);
		external "C use <gts.h>"
		end

feature {} -- size
	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsVector)"
		end
end -- class GTS_VECTOR

