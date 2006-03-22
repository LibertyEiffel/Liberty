indexing
	description: "generic gsl vector"
	copyright: "(C) 2006 Raphael Mack <rmack@student.ethz.ch>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
-- todo: do the copy html doc trick and implemtn everything

deferred class GSL_VECTOR_GENERAL[TYPE_]
inherit
	WRAPPER
		redefine copy end
	DISPOSABLE
		redefine copy end
	TRAVERSABLE[TYPE_]
		redefine count, copy end
	
feature {} -- Creation
	
	make (a_count: INTEGER) is
			-- Creates a vector of count `a_count'. Vector's elements are uninitialized
		require
			valid_count: a_count > 0
		do
			if is_not_null then
				gsl_free(handle)
			end
			set_handle(gsl_calloc(a_count))
		ensure
			is_not_null
			count = a_count
			is_owner
		end
	
	make_with_zero (a_count: INTEGER) is
			-- Creates a vector of count `a_count'. Vector's elements are set to zero
		require
			valid_count: a_count > 0
		do
			if is_not_null then
				gsl_free(handle)
			end
			set_handle(gsl_calloc(a_count))
		ensure
			is_not_null
			count = a_count
			is_owner
		end	

	make_from_block(a_block: GSL_BLOCK_GENERAL[TYPE_]; a_offset, a_count, a_stride: INTEGER) is
			-- Creates a vector of count `a_count' from a block.
		require
			valid_block: a_block /= Void and then a_block.is_not_null
			valid_count: a_count > 0
			valid_offset: a_block.valid_index(a_offset)
			valid_stride: a_stride > 0
			valid_data: a_block.valid_index(a_offset + a_stride * (a_count - 1))
		do
			if is_not_null then
				gsl_free(handle)
			end
			set_handle(gsl_alloc_from_block (a_block.handle, a_offset, a_count, a_stride))
		ensure
			is_not_null
			count = a_count
			not is_owner
		end

	make_from_vector(a_vector: like Current; a_offset, a_count, a_stride: INTEGER) is
			-- Creates a vector of count `a_count' from a vector.
		require
			valid_vector: a_vector /= Void and then a_vector.is_not_null
			valid_count: a_count > 0
			valid_offset: a_vector.valid_index(a_offset)
			valid_stride: a_stride > 0
			valid_data: a_vector.valid_index(a_offset + a_stride * (a_count - 1))
		do
			if is_not_null then
				gsl_free(handle)
			end
			set_handle(gsl_alloc_from_vector (a_vector.handle, a_offset, a_count, a_stride))
		ensure
			is_not_null
			count = a_count
			not is_owner
		end

feature -- Accessing

	item (i: INTEGER): TYPE_ is
			-- the i-th element of Current vector
		do
			Result := gsl_get (handle, i)
		end

	put (x: TYPE_; i: INTEGER) is
			-- Sets the value of the i-th element of Current vector to `an_x'.
		require
			valid_index (i)
		do
			gsl_set (handle, i, x)
		ensure
			definition: item(i) = x
		end
	
feature -- VEctor size
	same_as (other: like Current): BOOLEAN is
		require
			valid_other: other /= Void
		do
			Result := is_not_null and then other.is_not_null and then (count = other.count)
		ensure
			Result = (is_not_null and then other.is_not_null and then (count = other.count))
		end
		
feature -- public interface
	count: INTEGER is
			-- the count of size field of the block
		do
			Result := gsl_size(handle)
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
		require
			is_not_null
		do
			gsl_set_all(handle,x)
		end

	set_all_with_zero is
		require
			is_not_null
		do
			gsl_set_zero(handle)
		ensure
			is_all_zero
		end

	set_with_basis(i: INTEGER) is
		require
			is_not_null
			valid_index(i)
		do
			gsl_set_basis (handle, i)
		end

	swap(i: INTEGER; j: INTEGER) is
		require
			is_not_null
			valid_index(i)
			valid_index(j)
		do
			gsl_swap_elements (handle, i, j)
		end

	reverse is
		require
			is_not_null
		do
			gsl_reverse(handle)
		end

	scale (x: TYPE_) is
		require
			is_not_null
		do
			gsl_scale (handle, x)
		end

	add_constant (x:TYPE_) is
		require
			is_not_null
		do
			gsl_add_constant(handle,x)
		end

	max: TYPE_ is
		require
			is_not_null
		do
			Result := gsl_max(handle)
		end

	min: TYPE_ is
		require
			is_not_null
		do
			Result := gsl_min(handle)
		end

	last_min: TYPE_ is
		require
			is_not_null
		do
			Result := min_memo.item(0)
		end
		
	last_max: TYPE_ is
		require
			is_not_null
		do
			Result := max_memo.item(0)
		end

	minmax is
		require
			is_not_null
		do
			gsl_minmax (handle, min_memo.to_pointer, max_memo.to_pointer)
		end

	max_index: INTEGER is
		require
			is_not_null
		do
			Result := gsl_max_index(handle)
		end

	min_index: INTEGER is
		require
			is_not_null
		do
			Result := gsl_min_index(handle)
		end

	last_min_index: INTEGER is
		require
			is_not_null
		do
			Result := min_index_memo.item(0)
		end
		
	last_max_index: INTEGER is
		require
			is_not_null
		do
			Result := max_index_memo.item(0)
		end

	minmax_index is
		require
			is_not_null
		do
			gsl_minmax_index (handle, min_index_memo.to_pointer, max_index_memo.to_pointer)
		end

	is_all_zero: BOOLEAN is
		do
			Result := gsl_isnull(handle) /= 0
		end

	is_owner: BOOLEAN is
		do
			Result := gsl_owner(handle) /= 0
		end

	copy(other: like Current) is
		do
			if other.is_null then
				if is_not_null then
					gsl_free(handle)
					clear_handle
				end
			else
				if is_not_null and then count /= other.count then
					gsl_free(handle)
					clear_handle
				end
				if is_null then
					make(other.count)
				end
				gsl_copy_from(handle,other.handle)
			end
		end

	swap_with(other: like Current) is
		require
			same_as(other)
		do
			gsl_swap(handle,other.handle)
		end

	add(other: like Current) is
		require
			same_as(other)
		do
			gsl_add(handle,other.handle)
		end

	sub(other: like Current) is
		require
			same_as(other)
		do
			gsl_sub(handle,other.handle)
		end

	mul(other: like Current) is
		require
			same_as(other)
		do
			gsl_mul(handle,other.handle)
		end

	div(other: like Current) is
		require
			same_as(other)
		do
			gsl_div(handle,other.handle)
		end

feature {} -- dispose
	dispose is
			-- called when the current is sawn as garbage
		do
			if is_not_null then
				gsl_free(handle)
				clear_handle
			end
		end
		
feature {}
	min_memo: NATIVE_ARRAY[TYPE_] is
		deferred
		end

	max_memo: NATIVE_ARRAY[TYPE_] is
		deferred
		end

	min_index_memo: NATIVE_ARRAY[INTEGER] is
		deferred
		end

	max_index_memo: NATIVE_ARRAY[INTEGER] is
		deferred
		end

feature {} -- External structure
	gsl_size(ptr: POINTER): INTEGER is
			-- the 'size' field of the vector
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end
	
	gsl_stride(ptr: POINTER): INTEGER is
			-- the 'stride' field of the vector
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end
	
	gsl_data(ptr: POINTER): POINTER is
			-- the 'data' field of the vector
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end

	gsl_block(ptr: POINTER): POINTER is
			-- the 'block' field of the vector
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end

	gsl_owner(ptr: POINTER): INTEGER is
			-- the 'owner' field of the vector
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end
	
feature {} -- External calls
	gsl_alloc(a_count: INTEGER): POINTER is
		deferred
		end
	
	gsl_calloc(a_count: INTEGER): POINTER is
		deferred
		end
	
	gsl_alloc_from_block(a_block: POINTER; a_offset, a_count, a_stride: INTEGER): POINTER is
		require
			a_block.is_not_null
		deferred
		end

	gsl_alloc_from_vector (a_vector: POINTER; a_offset, a_count, a_stride: INTEGER): POINTER is
		require
			a_vector.is_not_null
		deferred
		end

	gsl_free(ptr: POINTER) is
			-- free the vector pointed by 'ptr'
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end

	gsl_get (ptr: POINTER; i: INTEGER): TYPE_ is
		require
			ptr = handle
			ptr.is_not_null
			valid_index(i)
		deferred
		end

	gsl_set (ptr: POINTER; i: INTEGER; x: TYPE_) is
		require
			ptr = handle
			ptr.is_not_null
			valid_index(i)
		deferred
		end

	gsl_set_all (ptr: POINTER; x: TYPE_) is
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end

	gsl_set_zero (ptr: POINTER) is
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end

	gsl_set_basis (ptr: POINTER; i: INTEGER) is
		require
			ptr = handle
			ptr.is_not_null
			valid_index(i)
		deferred
		end

	gsl_copy_from (dest: POINTER; src: POINTER) is
		require
			dest = handle
			dest.is_not_null
			src.is_not_null
		deferred
		end

	gsl_swap (ptr: POINTER; w: POINTER) is
		require
			ptr = handle
			ptr.is_not_null
			w.is_not_null
		deferred
		end

	gsl_swap_elements (ptr: POINTER; i: INTEGER; j: INTEGER) is
		require
			ptr = handle
			ptr.is_not_null
			valid_index(i)
			valid_index(j)
		deferred
		end

	gsl_reverse (ptr: POINTER) is
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end

	gsl_add (a: POINTER; b: POINTER) is
		require
			a = handle
			a.is_not_null
			b.is_not_null
		deferred
		end

	gsl_sub (a: POINTER; b: POINTER) is
		require
			a = handle
			a.is_not_null
			b.is_not_null
		deferred
		end

	gsl_mul (a: POINTER; b: POINTER) is
		require
			a = handle
			a.is_not_null
			b.is_not_null
		deferred
		end

	gsl_div (a: POINTER; b: POINTER) is
		require
			a = handle
			a.is_not_null
			b.is_not_null
		deferred
		end

	gsl_scale (a: POINTER; x: TYPE_) is
		require
			a = handle
			a.is_not_null
		deferred
		end

	gsl_add_constant (a: POINTER; x:TYPE_) is
		require
			a = handle
			a.is_not_null
		deferred
		end

	gsl_max (ptr: POINTER): TYPE_ is
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end

	gsl_min (ptr: POINTER): TYPE_ is
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end

	gsl_minmax (ptr: POINTER; min_out,max_out: POINTER) is
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end

	gsl_max_index (ptr: POINTER): INTEGER is
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end

	gsl_min_index (ptr: POINTER): INTEGER is
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end

	gsl_minmax_index (ptr: POINTER; imin, imax: POINTER) is
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end

	gsl_isnull (ptr: POINTER): INTEGER is
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end
end
