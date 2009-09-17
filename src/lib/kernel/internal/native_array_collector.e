deferred class NATIVE_ARRAY_COLLECTOR[E_]
	--
	-- Very low level class to tune some aspects of the garbage collector. Actually,
	-- NATIVE_ARRAY_COLLECTOR is useful only for classes using attribute(s) of type NATIVE_ARRAY
	-- and must be used only by expert people. This is very low level and the goal is to achieve the
	-- very best performances.
	--
	-- A class with attribute(s) of type NATIVE_ARRAY can insert NATIVE_ARRAY_COLLECTOR in order
	-- to define its own specialized mark phase of the garbage collector. Actually, as soon as the
	-- NATIVE_ARRAY_COLLECTOR class is inserted, all attributes of type NATIVE_ARRAY are ignored during
	-- the marking phase. Other attributes which are not of type NATIVE_ARRAY are treated normally.
	-- The class which inserts NATIVE_ARRAY_COLLECTOR must implement its own specialized
	-- `mark_native_arrays' in order to mark only reachable slots of its NATIVE_ARRAY(s). Be
	-- '''very careful''' when you decide to use this class: do not forget to mark all reachable slots!
	--
	-- When there is nothing to mark in the actual type E_ (i.e. when E_ is a plain expanded object
	-- with no embedded references), the `mark_native_arrays' is not called at all.
	--
	-- See classes ARRAY, FAST_ARRAY or RING_ARRAY for examples.
	--
insert
	ANY
		undefine fill_tagged_out_memory, copy, is_equal
		end

feature{}
	mark_native_arrays is
			-- This routine is magically called by the garbage collector. This routine is supposed to mark
			-- only reachable slots for all attributes of type NATIVE_ARRAY by using the `mark_item'
			-- built_in.
		deferred
		end

	mark_item (native_array: NATIVE_ARRAY[E_]; index: INTEGER) is
			-- To be used _only_ inside the definition of `mark_native_arrays'.
			-- Forces the garbage collector to continue the marking process on the `index'-th element of
			-- the `native_array'. The element at `index' can be Void or not Void (the Void-ness test is
			-- performed inside the `mark_item' itself).
		external "built_in"
		end

end -- class NATIVE_ARRAY_COLLECTOR

