-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_BUFFER_ALLOCATION_SCHEME_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = doubleit_low_level)  or else
				(a_value = exact_low_level)  or else
				(a_value = immutable_low_level)  or else
				(a_value = io_low_level) )
		end

feature -- Setters
	default_create,
	set_doubleit is
		do
			value := doubleit_low_level
		end

	set_exact is
		do
			value := exact_low_level
		end

	set_immutable is
		do
			value := immutable_low_level
		end

	set_io is
		do
			value := io_low_level
		end

feature -- Queries
	doubleit: BOOLEAN is
		do
			Result := (value=doubleit_low_level)
		end

	exact: BOOLEAN is
		do
			Result := (value=exact_low_level)
		end

	immutable: BOOLEAN is
		do
			Result := (value=immutable_low_level)
		end

	io: BOOLEAN is
		do
			Result := (value=io_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	doubleit_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_BUFFER_ALLOC_DOUBLEIT"
 			}"
 		end

	exact_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_BUFFER_ALLOC_EXACT"
 			}"
 		end

	immutable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_BUFFER_ALLOC_IMMUTABLE"
 			}"
 		end

	io_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_BUFFER_ALLOC_IO"
 			}"
 		end


end -- class XML_BUFFER_ALLOCATION_SCHEME_ENUM
