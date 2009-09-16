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
	structures: HASHED_DICTIONARY[C_STRUCT, UNICODE_STRING] is once create Result.make end
	typedefs: HASHED_DICTIONARY[C_TYPEDEF, UNICODE_STRING] is once create Result.make end
	types: HASHED_DICTIONARY[LIBERTY_TYPED, UNICODE_STRING] is once create Result.make end
	unions: HASHED_DICTIONARY[C_UNION, UNICODE_STRING] is once create Result.make end
	fields: HASHED_DICTIONARY[C_FIELD, UNICODE_STRING] is once create Result.make end
end

