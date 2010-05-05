-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILE_TEST_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (is__regular_low_level | 
				is__dir_low_level | 
				is__executable_low_level | 
				exists_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_is__regular is
		do
			value := value.bit_or(is__regular_low_level)
		end

	unset_is__regular is
		do
			value := value.bit_xor(is__regular_low_level)
		end

	set_is__dir is
		do
			value := value.bit_or(is__dir_low_level)
		end

	unset_is__dir is
		do
			value := value.bit_xor(is__dir_low_level)
		end

	set_is__executable is
		do
			value := value.bit_or(is__executable_low_level)
		end

	unset_is__executable is
		do
			value := value.bit_xor(is__executable_low_level)
		end

	set_exists is
		do
			value := value.bit_or(exists_low_level)
		end

	unset_exists is
		do
			value := value.bit_xor(exists_low_level)
		end

feature -- Queries
	is_is__regular: BOOLEAN is
		do
			Result := (value=is__regular_low_level)
		end

	is_is__dir: BOOLEAN is
		do
			Result := (value=is__dir_low_level)
		end

	is_is__executable: BOOLEAN is
		do
			Result := (value=is__executable_low_level)
		end

	is_exists: BOOLEAN is
		do
			Result := (value=exists_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	is__regular_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_FILE_TEST_IS_REGULAR"
 			}"
 		end

	is__dir_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_FILE_TEST_IS_DIR"
 			}"
 		end

	is__executable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_FILE_TEST_IS_EXECUTABLE"
 			}"
 		end

	exists_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_FILE_TEST_EXISTS"
 			}"
 		end


end -- class GFILE_TEST_ENUM
