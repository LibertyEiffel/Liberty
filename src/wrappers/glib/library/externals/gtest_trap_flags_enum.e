-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTEST_TRAP_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (silence__stdout_low_level | 
				inherit__stdin_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_silence__stdout is
		do
			value := value.bit_or(silence__stdout_low_level)
		end

	unset_silence__stdout is
		do
			value := value.bit_xor(silence__stdout_low_level)
		end

	set_inherit__stdin is
		do
			value := value.bit_or(inherit__stdin_low_level)
		end

	unset_inherit__stdin is
		do
			value := value.bit_xor(inherit__stdin_low_level)
		end

feature -- Queries
	is_silence__stdout: BOOLEAN is
		do
			Result := (value=silence__stdout_low_level)
		end

	is_inherit__stdin: BOOLEAN is
		do
			Result := (value=inherit__stdin_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	silence__stdout_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TEST_TRAP_SILENCE_STDOUT"
 			}"
 		end

	inherit__stdin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TEST_TRAP_INHERIT_STDIN"
 			}"
 		end


end -- class GTEST_TRAP_FLAGS_ENUM
