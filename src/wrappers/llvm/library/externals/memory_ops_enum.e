-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class MEMORY_OPS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = memoryopsbegin_low_level)  or else
				(a_value = free_low_level)  or else
				(a_value = alloca_low_level)  or else
				(a_value = load_low_level)  or else
				(a_value = store_low_level)  or else
				(a_value = getelementptr_low_level)  or else
				(a_value = memoryopsend_low_level) )
		end

feature -- Setters
	default_create,
	set_memoryopsbegin is
		do
			value := memoryopsbegin_low_level
		end

	set_free is
		do
			value := free_low_level
		end

	set_alloca is
		do
			value := alloca_low_level
		end

	set_load is
		do
			value := load_low_level
		end

	set_store is
		do
			value := store_low_level
		end

	set_getelementptr is
		do
			value := getelementptr_low_level
		end

	set_memoryopsend is
		do
			value := memoryopsend_low_level
		end

feature -- Queries
	is_memoryopsbegin: BOOLEAN is
		do
			Result := (value=memoryopsbegin_low_level)
		end

	is_free: BOOLEAN is
		do
			Result := (value=free_low_level)
		end

	is_alloca: BOOLEAN is
		do
			Result := (value=alloca_low_level)
		end

	is_load: BOOLEAN is
		do
			Result := (value=load_low_level)
		end

	is_store: BOOLEAN is
		do
			Result := (value=store_low_level)
		end

	is_getelementptr: BOOLEAN is
		do
			Result := (value=getelementptr_low_level)
		end

	is_memoryopsend: BOOLEAN is
		do
			Result := (value=memoryopsend_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	memoryopsbegin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "MemoryOpsBegin"
 			}"
 		end

	free_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Free"
 			}"
 		end

	alloca_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Alloca"
 			}"
 		end

	load_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Load"
 			}"
 		end

	store_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Store"
 			}"
 		end

	getelementptr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GetElementPtr"
 			}"
 		end

	memoryopsend_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "MemoryOpsEnd"
 			}"
 		end


end -- class MEMORY_OPS_ENUM
