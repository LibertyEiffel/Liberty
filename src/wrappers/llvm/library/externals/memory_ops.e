-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class MEMORY_OPS

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = memoryopsbegin) or else 
				(a_value = malloc) or else 
				(a_value = free) or else 
				(a_value = alloca) or else 
				(a_value = load) or else 
				(a_value = store) or else 
				(a_value = getelementptr) or else 
				(a_value = memoryopsend))
		end

feature -- Setters
	default_create,  set_memoryopsbegin is
	
		do
			value := memoryopsbegin
		end

	 set_malloc is
	
		do
			value := malloc
		end

	 set_free is
	
		do
			value := free
		end

	 set_alloca is
	
		do
			value := alloca
		end

	 set_load is
	
		do
			value := load
		end

	 set_store is
	
		do
			value := store
		end

	 set_getelementptr is
	
		do
			value := getelementptr
		end

	 set_memoryopsend is
	
		do
			value := memoryopsend
		end

feature -- Queries
	is_memoryopsbegin: BOOLEAN is
		
		do
			Result := (value=memoryopsbegin)
		end

	is_malloc: BOOLEAN is
		
		do
			Result := (value=malloc)
		end

	is_free: BOOLEAN is
		
		do
			Result := (value=free)
		end

	is_alloca: BOOLEAN is
		
		do
			Result := (value=alloca)
		end

	is_load: BOOLEAN is
		
		do
			Result := (value=load)
		end

	is_store: BOOLEAN is
		
		do
			Result := (value=store)
		end

	is_getelementptr: BOOLEAN is
		
		do
			Result := (value=getelementptr)
		end

	is_memoryopsend: BOOLEAN is
		
		do
			Result := (value=memoryopsend)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	memoryopsbegin: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "MemoryOpsBegin"
 			}"
 		end

	malloc: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Malloc"
 			}"
 		end

	free: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Free"
 			}"
 		end

	alloca: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Alloca"
 			}"
 		end

	load: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Load"
 			}"
 		end

	store: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Store"
 			}"
 		end

	getelementptr: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "GetElementPtr"
 			}"
 		end

	memoryopsend: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "MemoryOpsEnd"
 			}"
 		end

end

