expanded class MEMORY
	--
	-- Facilities for tuning up the garbage collection, and
	-- everything about memory control.
	--

feature {ANY} -- Garbage collector information and tuning:
	frozen collecting: BOOLEAN is
			-- Is garbage collection enabled?
		external "built_in"
		end

	frozen collection_off is
			-- Disable garbage collection.
		external "built_in"
		end

	frozen collection_on is
			-- Enable garbage collection.
		external "built_in"
		end

	frozen full_collect is
			-- Force a full collection cycle if garbage collection is
			-- enabled (i.e. `collecting' is True); do nothing otherwise.
		external "built_in"
		end

	frozen collector_counter: INTEGER is
			-- The number of collections actually performed or -1 when the
			-- system is not using the SmartEiffel garbage collector (i.e. when
			-- the system is compiled using the -no_gc flag).
		external "built_in"
		ensure
			Result >= -1
		end

feature {ANY} -- SmartEiffel Garbage collector information and tuning:
	frozen smart_eiffel_collector: BOOLEAN is
			-- Is the SmartEiffel garbage collector really used?
		do
			Result := collector_counter >= 0
		ensure
			Result = (collector_counter >= 0)
		end

	frozen low_memory_strategy: BOOLEAN is
			-- Is the low memory strategy in use? When this strategy is used,
			-- the garbage collector try to use as few memory as possible.
		require
			smart_eiffel_collector
		do
			c_inline_c("#ifdef SE_GC_LIB%N")
			c_inline_c("R=(se_gc_strategy==SE_GC_LOW_MEMORY_STRATEGY);%N")
			c_inline_c("#endif%N")
		end

	frozen set_low_memory_strategy is
		require
			smart_eiffel_collector
		do
			c_inline_c("#ifdef SE_GC_LIB%N")
			c_inline_c("se_gc_strategy=SE_GC_LOW_MEMORY_STRATEGY;%N%
		    %gc_update_ceils();%N")
			c_inline_c("#endif%N")
		ensure
			low_memory_strategy
		end

	frozen high_memory_strategy: BOOLEAN is
			-- Is the high memory strategy in use? When this strategy is used,
			-- the garbage collector assume that more memory can be allocated
			-- if necessary.
		require
			smart_eiffel_collector
		do
			c_inline_c("#ifdef SE_GC_LIB%N")
			c_inline_c("R=(se_gc_strategy==SE_GC_HIGH_MEMORY_STRATEGY);%N")
			c_inline_c("#endif%N")
		end

	frozen set_high_memory_strategy is
		require
			smart_eiffel_collector
		do
			c_inline_c("#ifdef SE_GC_LIB%N")
			c_inline_c("se_gc_strategy=SE_GC_HIGH_MEMORY_STRATEGY;%N%
		    %gc_update_ceils();%N")
			c_inline_c("#endif%N")
		ensure
			high_memory_strategy
		end

	frozen default_memory_strategy: BOOLEAN is
			-- Is the default memory strategy in use? This is the default initial
			-- mode for the garbage collector (somewhere between `low_memory_strategy'
			-- and `high_memory_strategy').
		require
			smart_eiffel_collector
		do
			c_inline_c("#ifdef SE_GC_LIB%N")
			c_inline_c("R=(se_gc_strategy==SE_GC_DEFAULT_MEMORY_STRATEGY);%N")
			c_inline_c("#endif%N")
		end

	frozen set_default_memory_strategy is
		require
			smart_eiffel_collector
		do
			c_inline_c("#ifdef SE_GC_LIB%N")
			c_inline_c("se_gc_strategy=SE_GC_DEFAULT_MEMORY_STRATEGY;%N%
		    %gc_update_ceils();%N")
			c_inline_c("#endif%N")
		ensure
			default_memory_strategy
		end

	frozen allocated_bytes: INTEGER is
			-- Total number of allocated bytes of memory in the heap.
		require
			collector_counter >= 0
		do
			c_inline_c("#ifdef SE_GC_LIB%N")
			c_inline_c("R=gc_memory_used();%N")
			c_inline_c("#endif%N")
		end

end -- class MEMORY
