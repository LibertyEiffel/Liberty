note
	description: "Simple statistics -- a basic structure for computing min, max, average and variance."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTS team
					
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

class GTS_RANGE
	-- Using `init', `add_value' and `update', you can easily maintain basic
	-- statistics about an ensemble of values.
inherit
	C_STRUCT
		redefine
			print_on
		end

	STREAM_HANDLER
		undefine
			is_equal, copy
		redefine
			print_on
		end
	
create {ANY}  make, from_external_pointer

feature {} -- Creation
	make is
			-- Allocate and initializes a GtsRange.
		do
			allocate
			gts_range_init(handle)
		end

feature {ANY} -- Commands
	add_value (a_value: REAL) is
			-- Adds `a_value' to range.
		do
			gts_range_add_value(handle, a_value)
		end

	update is
			-- Updates the fields of range.
		do
			gts_range_update (handle)
		end

	reset is
			-- Sets all the fields of r to 0.
		do
			gts_range_reset(handle)
		end

	print_on (a_file: OUTPUT_STREAM) is
			-- Writes a text representation of range on `a_file'.
		require
			file_not_void: a_file /= Void
			connected: a_file.is_connected
		do
			gts_range_print(handle, a_file.stream_pointer)
		end

feature {ANY} -- Queries
	min: REAL is
			-- Minimum value of the population.
		do
			Result:=get_min(handle)
		end

	max: REAL is
			-- Maximum value of the population.
		do
			Result:=get_max(handle)
		end

	sum: REAL is
		do
			Result:=get_sum(handle)
		end

	mean: REAL is
			-- Average value of the population.
		do
			Result:=get_mean(handle)
		end

	stddev: REAL is
			-- Standard deviation of the population.
		do
			Result:=get_stddev(handle)
		end
	
	count: INTEGER is
			-- Number of samples in the population.
		do
			Result:=get_n(handle)
		end

feature {} -- External calls
	gts_range_init (a_range: POINTER) is
			-- void gts_range_init (GtsRange *r);
		external "C use <gts.h>"
		end

	gts_range_add_value (a_range: POINTER; a_val: REAL) is
			-- void gts_range_add_value (GtsRange *r, gdouble val);
		external "C use <gts.h>"
		end
	
	gts_range_update (a_range: POINTER) is
			-- void gts_range_update (GtsRange *r);
		external "C use <gts.h>"
		end
	
	gts_range_reset (a_range: POINTER) is
			-- void gts_range_reset (GtsRange *r);
		external "C use <gts.h>"
		end
	
	gts_range_print (a_range, a_fptr: POINTER) is
			-- void gts_range_print (GtsRange *r, FILE *fptr);
		external "C use <gts.h>"
		end

feature {} -- Structure getter/setter calls
	-- typedef struct {
	--   gdouble min, max, sum, sum2, mean, stddev;
	--   guint n;
	-- } GtsRange;

	-- A simple statistics structure.

	-- gdouble min;	
	get_min (a_struct: POINTER): REAL is
		external "C struct GtsRange get min use <$include>"
		end

	-- gdouble max;	
	get_max (a_struct: POINTER): REAL is
		external "C struct GtsRange get max use <$include>"
		end
	
	-- gdouble sum;	
	get_sum (a_struct: POINTER): REAL is
		external "C struct GtsRange get sum use <$include>"
		end

	-- gdouble sum2;	
	get_sum2 (a_struct: POINTER): REAL is
		external "C struct GtsRange get sum2 use <$include>"
		end
	
	-- gdouble mean;	
	get_mean (a_struct: POINTER): REAL is
		external "C struct GtsRange get mean use <$include>"
		end

	-- gdouble stddev;	
	get_stddev (a_struct: POINTER): REAL is
		external "C struct GtsRange get stddev use <$include>"
		end
	
	-- guint n;	
	get_n (a_struct: POINTER): INTEGER is
			-- TODO: should be NATURAL
		external "C struct GtsRange get n use <$include>"
		end
 
feature {} -- size
	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsRange)"
		end

end -- class GTS_RANGE
