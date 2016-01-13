-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GFILE_TEST_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (exists_low_level | 
				is_dir_low_level | 
				is_executable_low_level | 
				is_regular_low_level | 
				is_symlink_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_exists
               do
                       value := value.bit_or(exists_low_level)
               end

	unset_exists
               do
                       value := value.bit_xor(exists_low_level)
               end

	set_is_dir
               do
                       value := value.bit_or(is_dir_low_level)
               end

	unset_is_dir
               do
                       value := value.bit_xor(is_dir_low_level)
               end

	set_is_executable
               do
                       value := value.bit_or(is_executable_low_level)
               end

	unset_is_executable
               do
                       value := value.bit_xor(is_executable_low_level)
               end

	set_is_regular
               do
                       value := value.bit_or(is_regular_low_level)
               end

	unset_is_regular
               do
                       value := value.bit_xor(is_regular_low_level)
               end

	set_is_symlink
               do
                       value := value.bit_or(is_symlink_low_level)
               end

	unset_is_symlink
               do
                       value := value.bit_xor(is_symlink_low_level)
               end

feature {ANY} -- Queries
       is_exists: BOOLEAN
               do
                       Result := (value=exists_low_level)
               end

       is_is_dir: BOOLEAN
               do
                       Result := (value=is_dir_low_level)
               end

       is_is_executable: BOOLEAN
               do
                       Result := (value=is_executable_low_level)
               end

       is_is_regular: BOOLEAN
               do
                       Result := (value=is_regular_low_level)
               end

       is_is_symlink: BOOLEAN
               do
                       Result := (value=is_symlink_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     exists_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_TEST_EXISTS"
                       }"
               end

     is_dir_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_TEST_IS_DIR"
                       }"
               end

     is_executable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_TEST_IS_EXECUTABLE"
                       }"
               end

     is_regular_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_TEST_IS_REGULAR"
                       }"
               end

     is_symlink_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_TEST_IS_SYMLINK"
                       }"
               end


end -- class GFILE_TEST_ENUM
