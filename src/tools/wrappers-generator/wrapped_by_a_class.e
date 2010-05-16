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
	deferred 
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
