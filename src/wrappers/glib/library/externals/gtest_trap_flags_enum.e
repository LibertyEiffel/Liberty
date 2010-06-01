-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTEST_TRAP_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (out_external_low_level | 
				in_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_out_external is
		do
			value := value.bit_or(out_external_low_level)
		end

	unset_out_external is
		do
			value := value.bit_xor(out_external_low_level)
		end

	set_in is
		do
			value := value.bit_or(in_low_level)
		end

	unset_in is
		do
			value := value.bit_xor(in_low_level)
		end

feature -- Queries
	is_out_external: BOOLEAN is
		do
			Result := (value=out_external_low_level)
		end

	is_in: BOOLEAN is
		do
			Result := (value=in_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	out_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TEST_TRAP_SILENCE_STDOUT"
 			}"
 		end

	in_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TEST_TRAP_INHERIT_STDIN"
 			}"
 		end


end -- class GTEST_TRAP_FLAGS_ENUM
