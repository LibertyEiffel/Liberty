indexing
	description: "Access to general gsl_block struct "
	copyright: "(C) 2006 José Bollo <jose.bollo@laposte.net>"
	license: "LGPL v2 or later"
	date: "$Date$"
	revision: "$Revision$"

deferred class GSL_BLOCK_GENERAL[TYPE_]
	
inherit
	WRAPPER
	DISPOSABLE
	TRAVERSABLE[TYPE_]
		redefine count end
			
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

	item(index: INTEGER): TYPE_ is
			-- the item
		do
			Result := data.item(index)
		end
	
	data: NATIVE_ARRAY[TYPE_] is
			-- the 'data' field of the block
		require
			is_not_null
		do
			Result := Result.from_pointer(gsl_data(handle))
		ensure
			Result.is_not_null
		end

	make(a_count: INTEGER) is
			-- allocate a block but don't initialize the values
		require
			a_count >= 0
		do
			if is_not_null then
				gsl_free(handle)
			end
			handle := gsl_alloc(a_count)
		ensure
			count = a_count
			is_not_null
			data.is_not_null
		end	

	make_with_zero(a_count: INTEGER) is
			-- allocate a block and initialize its values to zero
		require
			a_count >= 0
		do
			if is_not_null then
				gsl_free(handle)
			end
			handle := gsl_calloc(a_count)
		ensure
			count = a_count
			is_not_null
			data.is_not_null
			data.all_default(upper)
		end	

	free is
			-- free the allocated data
		require
			is_not_null
		do
			gsl_free(handle)
			clear_handle
		ensure
			is_null
		end

feature {} -- dispose
	dispose is
			-- called when the current is sawn as garbage
		do
			if is_not_null then
				free
			end
		end
		
feature {} -- External calls
	gsl_count(ptr: POINTER): INTEGER is
			-- the 'size' field of the block
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end
	
	gsl_data(ptr: POINTER): POINTER is
			-- the 'data' field of the block
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end

	gsl_alloc(a_count: INTEGER): POINTER is
			-- allocate a blocfree the block pointed by 'ptr'
			-- the 'count' field of the block
		deferred
		end
	
	gsl_calloc(a_count: INTEGER): POINTER is
			-- allocate a blocfree the block pointed by 'ptr'
			-- the 'count' field of the block
		deferred
		end
	
	gsl_free(ptr: POINTER) is
			-- free the block pointed by 'ptr'
		require
			ptr = handle
			ptr.is_not_null
		deferred
		end
	
end


