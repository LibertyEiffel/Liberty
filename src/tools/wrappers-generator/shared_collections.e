deferred class SHARED_COLLECTIONS
	-- Shared collections of various kinds of XML nodes

feature
	enum_values: HASHED_DICTIONARY[C_ENUM_VALUE, UNICODE_STRING] is once create Result.make end
	enumerations: HASHED_DICTIONARY[C_ENUM, UNICODE_STRING] is once create Result.make end
	files: HASHED_DICTIONARY[C_FILE, UNICODE_STRING] is once create Result.make end
	functions: FUNCTIONS is
		-- grouped in lists by the id of the file they are defined in, i.e. "f0" "f12"
		once create Result.make end
	fundamentals: HASHED_DICTIONARY[C_FUNDAMENTAL_TYPE, UNICODE_STRING] is once create Result.make end
	namespaces: HASHED_DICTIONARY[C_NAMESPACE, UNICODE_STRING] is once create Result.make end
	structures: HASHED_DICTIONARY[C_STRUCT, UNICODE_STRING] is once create Result.make end
	typedefs: TYPEDEFS is once create Result.make end
	types: HASHED_DICTIONARY[TYPED_NODE, UNICODE_STRING] is once create Result.make end
	composed_types: HASHED_DICTIONARY[COMPOSED_NODE, UNICODE_STRING] is once create Result.make end
	unions: HASHED_DICTIONARY[C_UNION, UNICODE_STRING] is once create Result.make end
	-- Temporary phased out 
	-- fields: HASHED_DICTIONARY[C_FIELD, UNICODE_STRING] is once create Result.make end
	-- fields are locally stored into each structure.

feature
	flags: WORDS is
		-- Enumerations that will be forcefully wrapped as a flag.
	do
		create Result.make
	end

	avoided: WORDS is
		-- Symbols that will not be wrapped.
	do
		create Result.make
	end

feature {} -- Buffers
	-- Temporary buffers used to build enumerations and structures external classes
	queries: FORMATTER is once create Result end 

	setters: FORMATTER is once create Result end 

	low_level_values: FORMATTER is once create Result end 

	validity_query: FORMATTER is once create Result end 

end

