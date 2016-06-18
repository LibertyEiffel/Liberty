-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class MEMORY_OPS_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = alloca_low_level)  or else
				(a_value = atomic_cmp_xchg_low_level)  or else
				(a_value = atomic_rmw_low_level)  or else
				(a_value = fence_low_level)  or else
				(a_value = get_element_ptr_low_level)  or else
				(a_value = load_low_level)  or else
				(a_value = memory_ops_begin_low_level)  or else
				(a_value = memory_ops_end_low_level)  or else
				(a_value = store_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_alloca
		do
			value := alloca_low_level
		end

	set_atomic_cmp_xchg
		do
			value := atomic_cmp_xchg_low_level
		end

	set_atomic_rmw
		do
			value := atomic_rmw_low_level
		end

	set_fence
		do
			value := fence_low_level
		end

	set_get_element_ptr
		do
			value := get_element_ptr_low_level
		end

	set_load
		do
			value := load_low_level
		end

	set_memory_ops_begin
		do
			value := memory_ops_begin_low_level
		end

	set_memory_ops_end
		do
			value := memory_ops_end_low_level
		end

	set_store
		do
			value := store_low_level
		end

feature {ANY} -- Queries
	is_alloca: BOOLEAN
		do
			Result := (value=alloca_low_level)
		end

	is_atomic_cmp_xchg: BOOLEAN
		do
			Result := (value=atomic_cmp_xchg_low_level)
		end

	is_atomic_rmw: BOOLEAN
		do
			Result := (value=atomic_rmw_low_level)
		end

	is_fence: BOOLEAN
		do
			Result := (value=fence_low_level)
		end

	is_get_element_ptr: BOOLEAN
		do
			Result := (value=get_element_ptr_low_level)
		end

	is_load: BOOLEAN
		do
			Result := (value=load_low_level)
		end

	is_memory_ops_begin: BOOLEAN
		do
			Result := (value=memory_ops_begin_low_level)
		end

	is_memory_ops_end: BOOLEAN
		do
			Result := (value=memory_ops_end_low_level)
		end

	is_store: BOOLEAN
		do
			Result := (value=store_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	alloca_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Alloca"
 			}"
 		end

	atomic_cmp_xchg_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "AtomicCmpXchg"
 			}"
 		end

	atomic_rmw_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "AtomicRMW"
 			}"
 		end

	fence_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Fence"
 			}"
 		end

	get_element_ptr_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GetElementPtr"
 			}"
 		end

	load_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Load"
 			}"
 		end

	memory_ops_begin_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "MemoryOpsBegin"
 			}"
 		end

	memory_ops_end_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "MemoryOpsEnd"
 			}"
 		end

	store_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Store"
 			}"
 		end


end -- class MEMORY_OPS_ENUM
