deferred class STDLIB_MORE_EXTERNALS
	-- Temporary workaround until wrappers-generator can wrap things in places where it shall belong and not where implementations actually defines them
insert STANDARD_C_LIBRARY_TYPES
feature 	
	memcpy (a_dest, a_src: POINTER; a_size: like size_t): POINTER is
		-- Temporary workaroung
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "memcpy"
		}"
		end


end 
