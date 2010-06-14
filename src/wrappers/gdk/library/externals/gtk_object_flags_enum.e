-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_OBJECT_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (in_destruction_low_level | 
				reserved_1_low_level | 
				reserved_2_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_in_destruction is
		do
			value := value.bit_or(in_destruction_low_level)
		end

	unset_in_destruction is
		do
			value := value.bit_xor(in_destruction_low_level)
		end

	set_reserved_1 is
		do
			value := value.bit_or(reserved_1_low_level)
		end

	unset_reserved_1 is
		do
			value := value.bit_xor(reserved_1_low_level)
		end

	set_reserved_2 is
		do
			value := value.bit_or(reserved_2_low_level)
		end

	unset_reserved_2 is
		do
			value := value.bit_xor(reserved_2_low_level)
		end

feature -- Queries
	is_in_destruction: BOOLEAN is
		do
			Result := (value=in_destruction_low_level)
		end

	is_reserved_1: BOOLEAN is
		do
			Result := (value=reserved_1_low_level)
		end

	is_reserved_2: BOOLEAN is
		do
			Result := (value=reserved_2_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	in_destruction_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_IN_DESTRUCTION"
 			}"
 		end

	reserved_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RESERVED_1"
 			}"
 		end

	reserved_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RESERVED_2"
 			}"
 		end


end -- class GTK_OBJECT_FLAGS_ENUM
