deferred class WRAPPED_BY_A_CLASS
	-- A node of an XML file made by gccxml which is wrappable with a class.
	-- This class will contain the wrapping of this class and wrapped features
	-- of many child and/or related nodes.

inherit
	GCCXML_NODE
	NAMED_NODE

insert NAME_CONVERTER

feature
	emit_wrapper is
		deferred
		end

	class_name: STRING is
		-- the name of the Eiffel class that wraps Current. CamelCase is converted into CAMEL_CASE, `suffix' is added at the end, eventual trailing underscores are removed.
	local path: POSIX_PATH_NAME
	do
		if stored_class_name=Void then 
			-- The Eiffel class name for `c_name'; extension is removed,
			-- CamelCase is converted into CAMEL_CASE, dashes are converted to
			-- underscores, `suffix' is added at the endi, eventual; i.e.:
			-- class_name_from_header("/usr/include/foo/bar/maman.h").is_equal("MAMAN_EXTERNALS")
			create path.make_from_string(c_name.as_utf8)
			stored_class_name := path.last
			stored_class_name.remove_tail(path.extension.count)
			eiffellizer.substitute_all_in(stored_class_name)
			-- Remove trailing underscores
			from until stored_class_name.first/='_' loop stored_class_name.remove_first end
			-- Remove spurious underscores at the end
			from until stored_class_name.last/='_' loop stored_class_name.remove_last end
			stored_class_name.replace_all('-','_')
			stored_class_name.to_upper
			stored_class_name.append(suffix)
		end
		Result := stored_class_name
	ensure 
		non_void: Result/=Void
		is_valid_class_name(Result)
	end

feature {}
	stored_class_name: STRING

	output: TERMINAL_OUTPUT_STREAM

	suffix: STRING is
		-- The suffix that will be added to class_name, i.e. "_EXTERNALS", "_ENUM", "_STRUCT"
		deferred
		end
end -- class WRAPPED_BY_A_CLASS
