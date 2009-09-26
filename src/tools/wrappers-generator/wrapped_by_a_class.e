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
		-- the name of the Eiffel class that wraps Current.
	do
		if stored_class_name=Void then compute_class_name end
		Result := stored_class_name
	end

feature {}
	stored_class_name: STRING

	compute_class_name is
		local path: POSIX_PATH_NAME
		do
			-- The Eiffel class name for 'c_name'; extension is removed,
			-- CamelCase is converted into CAMEL_CASE, dashes are converted to
			-- underscores, "EXTERNALS" is added at the end; i.e.:
			-- class_name_from_header("/usr/include/foo/bar/maman.h").is_equal("MAMAN_EXTERNALS")
			create path.make_from_string(c_name.as_utf8)
			stored_class_name := path.last
			stored_class_name.remove_tail(path.extension.count)
			check
				no_final_dot_if_this_fails_add_one_above: stored_class_name.last/='.' 
			end
			eiffellizer.substitute_all_in(stored_class_name)
			stored_class_name.replace_all('-','_')
			stored_class_name.to_upper
			stored_class_name.append(once "_EXTERNALS")
		ensure 
			stored_class_name/=Void
			is_valid_class_name(stored_class_name)
		end

end -- class WRAPPED_BY_A_CLASS
