-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ARG_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (readable_low_level | 
				construct_low_level | 
				construct_only_low_level | 
				child_arg_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_readable is
		do
			value := value.bit_or(readable_low_level)
		end

	unset_readable is
		do
			value := value.bit_xor(readable_low_level)
		end

	set_construct is
		do
			value := value.bit_or(construct_low_level)
		end

	unset_construct is
		do
			value := value.bit_xor(construct_low_level)
		end

	set_construct_only is
		do
			value := value.bit_or(construct_only_low_level)
		end

	unset_construct_only is
		do
			value := value.bit_xor(construct_only_low_level)
		end

	set_child_arg is
		do
			value := value.bit_or(child_arg_low_level)
		end

	unset_child_arg is
		do
			value := value.bit_xor(child_arg_low_level)
		end

feature -- Queries
	is_readable: BOOLEAN is
		do
			Result := (value=readable_low_level)
		end

	is_construct: BOOLEAN is
		do
			Result := (value=construct_low_level)
		end

	is_construct_only: BOOLEAN is
		do
			Result := (value=construct_only_low_level)
		end

	is_child_arg: BOOLEAN is
		do
			Result := (value=child_arg_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	readable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_ARG_READABLE"
 			}"
 		end

	construct_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_ARG_CONSTRUCT"
 			}"
 		end

	construct_only_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_ARG_CONSTRUCT_ONLY"
 			}"
 		end

	child_arg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_ARG_CHILD_ARG"
 			}"
 		end


end -- class GTK_ARG_FLAGS_ENUM
