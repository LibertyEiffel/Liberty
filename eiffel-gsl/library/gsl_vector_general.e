indexing
	description: "generic gsl vector"
	copyright: "(C) 2006 Raphael Mack <rmack@student.ethz.ch>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
         -- TODO: many things ;-)
         -- TODO: manifest_put
         -- TODO: operations
         -- TODO: tests
   
deferred class GSL_VECTOR_GENERAL[TYPE_]
inherit
	WRAPPER
      undefine
         out, fill_tagged_out_memory
      end

	COLLECTION [TYPE_]
      redefine
         out, swap
      end

   GSL_ERRNO
      undefine
         out, copy, is_equal, fill_tagged_out_memory
      end
	
feature -- Creation
	make (a_count: INTEGER) is
			-- Creates a vector of count `a_count'. Vector's elements are uninitialized
		require
			valid_count: a_count > 0
		do
			if is_not_null then
				gsl_vector_free(handle)
			end
			set_handle(gsl_vector_calloc(a_count))
		ensure
			is_not_null
			count = a_count
		end
	
	make_zero (a_count: INTEGER) is
			-- Creates a vector of count `a_count'. Vector's elements are set to zero
		require
			valid_count: a_count > 0
		do
			if is_not_null then
				gsl_vector_free(handle)
			end
			set_handle(gsl_vector_calloc(a_count))
		ensure
			is_not_null
			count = a_count
		end	

feature -- Accessing

	item (i: INTEGER): TYPE_ is
			-- the i-th element of Current vector
		do
			Result := gsl_vector_get (handle, i)
		end

	put (x: TYPE_; i: INTEGER) is
			-- Sets the value of the i-th element of Current vector to `an_x'.
		do
			gsl_vector_set (handle, i, x)
		end
	
feature -- Vector size
	has_same_size (other: like Current): BOOLEAN is
		require
			valid_other: other /= Void
		do
			Result := (count = other.count)
		ensure
			Result = (count = other.count)
		end
		
feature -- public interface
	count: INTEGER is
			-- the count of size field of the vector
		do
			Result := gsl_vector_size(handle)
		end

	lower: INTEGER is 0
		-- lower index fixed to 0

	upper: INTEGER is
			-- upper index
		do
			Result := count - 1
		ensure
			Result = count - 1
		end

	set_all_with(x: TYPE_) is
		do
			gsl_vector_set_all(handle,x)
		end

	set_all_with_zero is
		do
			gsl_vector_set_zero(handle)
		ensure
			all_default
		end

	set_with_basis(i: INTEGER) is
		require
			valid_index(i)
		do
			gsl_vector_set_basis (handle, i)
		end

	swap(i: INTEGER; j: INTEGER) is
		do
			gsl_vector_swap_elements (handle, i, j)
		end

	reverse is
		do
			gsl_vector_reverse(handle)
		end

	scale (x: TYPE_) is
		do
			gsl_vector_scale (handle, x)
		end

	add_constant (x:TYPE_) is
		do
			gsl_vector_add_constant(handle,x)
		end

	max: TYPE_ is
		do
			Result := gsl_vector_max(handle)
		end

	min: TYPE_ is
		do
			Result := gsl_vector_min(handle)
		end

   -- TODO: implement
--	minmax is

	max_index: INTEGER is
		do
			Result := gsl_vector_max_index(handle)
      ensure
         definition: item(Result) = max
		end

	min_index: INTEGER is
		do
			Result := gsl_vector_min_index(handle)
      ensure
         definition: item(Result) = min
		end

	all_default: BOOLEAN is
		do
			Result := gsl_vector_isnull(handle)
		end

	copy (other: like Current) is
		do
         if count /= other.count then
            gsl_vector_free(handle)
            handle := default_pointer
         end
         if is_null then
            make(other.count)
         end
         gsl_vector_copy_from(handle, other.handle)
      end

	swap_with (other: like Current) is
		require
			has_same_size(other)
		do
			gsl_vector_swap(handle, other.handle)
      ensure
         swapped1: is_equal(old other)
         swapped2: (old Current).is_equal(other)
		end

	add_vector (other: like Current) is
		require
			has_same_size(other)
		do
			gsl_vector_add(handle, other.handle)
		end

	sub (other: like Current) is
		require
			has_same_size(other)
		do
			gsl_vector_sub(handle, other.handle)
		end

   -- TODO:
	mul (other: like Current) is
		require
			has_same_size(other)
		do
			gsl_vector_mul(handle, other.handle)
		end

   -- TODO:
	div (other: like Current) is
		require
			has_same_size(other)
		do
			gsl_vector_div(handle,other.handle)
		end

   feature {ANY}
   out: STRING is
         -- print in nice, readable format
      local
         i: INTEGER_32
      do
         create Result.make(count * 4)
			Result.extend('[')
			from
				i := lower
			until
				i > upper
			loop
            Result.append(item(i).out)
            i := i + 1
            if i < upper then
               Result.extend(',')
            end
			end
         Result.extend(']')         
      end

feature {} -- dispose
	dispose is
			-- called when the current is sawn as garbage
		do
         gsl_vector_free(handle)
         handle := default_pointer
		end
		
feature {} -- External structure
	gsl_vector_size(ptr: POINTER): INTEGER is
			-- the 'size' field of the vector
		require
			ptr.is_not_null
		deferred
		end
	
	gsl_vector_stride(ptr: POINTER): INTEGER is
			-- the 'stride' field of the vector
		require
			ptr.is_not_null
		deferred
		end
	
	gsl_vector_data(ptr: POINTER): POINTER is
			-- the 'data' field of the vector
		require
			ptr.is_not_null
		deferred
		end

	gsl_vector_block(ptr: POINTER): POINTER is
			-- the 'block' field of the vector
		require
			ptr.is_not_null
		deferred
		end

	gsl_vector_owner(ptr: POINTER): INTEGER is
			-- the 'owner' field of the vector
		require
			ptr.is_not_null
		deferred
		end
	
feature {} -- External calls
	gsl_vector_alloc(a_count: INTEGER): POINTER is
		deferred
		end
	
	gsl_vector_calloc(a_count: INTEGER): POINTER is
		deferred
		end
	
	gsl_vector_alloc_from_block(a_block: POINTER; a_offset, a_count, a_stride: INTEGER): POINTER is
		require
			a_block.is_not_null
		deferred
		end

	gsl_vector_free(ptr: POINTER) is
			-- free the vector pointed by 'ptr'
		require
			ptr.is_not_null
		deferred
		end

	gsl_vector_get (ptr: POINTER; i: INTEGER): TYPE_ is
		require
			ptr.is_not_null
      deferred
		end

	gsl_vector_set (ptr: POINTER; i: INTEGER; x: TYPE_) is
		require
			ptr.is_not_null
		deferred
		end

	gsl_vector_set_all (ptr: POINTER; x: TYPE_) is
		require
			ptr.is_not_null
		deferred
		end

	gsl_vector_set_zero (ptr: POINTER) is
		require
			ptr.is_not_null
		deferred
		end

	gsl_vector_set_basis (ptr: POINTER; i: INTEGER) is
		require
			ptr.is_not_null
		deferred
		end

	gsl_vector_copy_from (dest: POINTER; src: POINTER) is
		require
			dest.is_not_null
			src.is_not_null
		deferred
		end

	gsl_vector_swap (ptr: POINTER; w: POINTER) is
		require
			ptr.is_not_null
			w.is_not_null
		deferred
		end

	gsl_vector_swap_elements (ptr: POINTER; i: INTEGER; j: INTEGER) is
		require
			ptr.is_not_null
		deferred
		end

	gsl_vector_reverse (ptr: POINTER) is
		require
			ptr.is_not_null
		deferred
		end

	gsl_vector_add (a: POINTER; b: POINTER) is
		require
			a.is_not_null
			b.is_not_null
		deferred
		end

	gsl_vector_sub (a: POINTER; b: POINTER) is
		require
			a.is_not_null
			b.is_not_null
		deferred
		end

	gsl_vector_mul (a: POINTER; b: POINTER) is
		require
			a.is_not_null
			b.is_not_null
		deferred
		end

	gsl_vector_div (a: POINTER; b: POINTER) is
		require
			a.is_not_null
			b.is_not_null
		deferred
		end

	gsl_vector_scale (a: POINTER; x: TYPE_) is
		require
			a.is_not_null
		deferred
		end

	gsl_vector_add_constant (a: POINTER; x:TYPE_) is
		require
			a.is_not_null
		deferred
		end

	gsl_vector_max (ptr: POINTER): TYPE_ is
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end

	gsl_vector_min (ptr: POINTER): TYPE_ is
		require
			ptr.is_not_null
		deferred
		end

	gsl_vector_minmax (ptr: POINTER; min_out,max_out: POINTER) is
		require
			ptr.is_not_null
		deferred
		end

	gsl_vector_max_index (ptr: POINTER): INTEGER is
		require
			ptr.is_not_null
		deferred
		end

	gsl_vector_min_index (ptr: POINTER): INTEGER is
		require
			ptr.is_not_null
		deferred
		end

	gsl_vector_minmax_index (ptr: POINTER; imin, imax: POINTER) is
		require
			ptr.is_not_null
		deferred
		end

	gsl_vector_isnull (ptr: POINTER): BOOLEAN is
		require
			ptr.is_not_null
		deferred
		end


invariant
   valid_handle: handle /= default_pointer
end
