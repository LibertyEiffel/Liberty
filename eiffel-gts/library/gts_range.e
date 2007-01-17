indexing
	description: "Simple statistics -- a basic structure for computing min, max, average and variance."
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

class GTS_RANGE
	-- Simple statistics, a basic class for computing min, max,
	-- average and variance. Using `init', `add_value' and `update',
	-- you can easily maintain basic statistics about an ensemble of
	-- values.
	
inherit C_STRUCT

creation make, from_external_pointer

feature {} -- Creation
	make is
			-- Create and initializes a GtsRange.
		do
			allocate
			gts_range_init (handle)
		end

feature
	add_value (a_value: REAL) is
			-- Adds `a_value' to Current range.
		do
			gts_range_add_value(handle, a_value)
		end

	update is
			-- Updates the fields of Current.
		do
			gts_range_update(handle)
		end

	reset is
			--	Sets all the fields to 0.
		do
			gts_range_reset(handle)
		end

	-- TODO: gts_range_print ()

	--void gts_range_print (GtsRange *r, FILE *fptr);

   -- Writes a text representation of r in fptr.

feature -- Queries
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
	
	sum2: REAL is
		do
			Result:=get_sum2(handle)
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
		do
			Result:=get_n(handle)
		end
feature -- Struct access
	--   GtsRange
	
	--  typedef struct {
	--    gdouble min, max, sum, sum2, mean, stddev;
	--    guint n;
	--  } GtsRange;
	
	--    A simple statistics structure.
	
	--     gdouble min;     Minimum value of the population.
	--     gdouble max;     Maximum value of the population.
	--     gdouble sum;
	--     gdouble sum2;
	--     gdouble mean;    Average value of the population.
	--     gdouble stddev;  Standard deviation of the population.
	--     guint n;         Number of samples in the population.

	get_min (a_struct: POINTER): REAL is
		external "C struct GtsRange get min use <gts.h>"
		end
	
	get_max (a_struct: POINTER): REAL is
		external "C struct GtsRange get max use <gts.h>"
		end
	
	get_sum (a_struct: POINTER): REAL is
		external "C struct GtsRange get sum use <gts.h>"
		end
	
	get_sum2 (a_struct: POINTER): REAL is
		external "C struct GtsRange get sum2 use <gts.h>"
		end
	
	get_mean (a_struct: POINTER): REAL is
		external "C struct GtsRange get mean use <gts.h>"
		end
	
	get_stddev (a_struct: POINTER): REAL is
		external "C struct GtsRange get stddev use <gts.h>"
		end

	get_n (a_struct: POINTER): INTEGER is
		external "C struct GtsRange get n use <gts.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsRange)"
		end
	
feature {} -- External calls
   gts_range_init (a_range: POINTER) is
			--  gts_range_init (GtsRange *r);
		external "C use <gts.h>"
		end
	
	gts_range_add_value (a_range: POINTER; a_val: REAL) is
			--  gts_range_add_value (GtsRange *r, gdouble val);
		external "C use <gts.h>"
		end

 gts_range_update (a_range: POINTER) is
			--  gts_range_update (GtsRange *r);
		external "C use <gts.h>"
		end

 gts_range_reset (a_range: POINTER) is
			--  gts_range_reset (GtsRange *r);
		external "C use <gts.h>"
		end

 gts_range_print (a_range, a_fptr: POINTER) is
			--  gts_range_print (GtsRange *r, FILE *fptr);
		external "C use <gts.h>"
		end



end -- class GTS_RANGE
