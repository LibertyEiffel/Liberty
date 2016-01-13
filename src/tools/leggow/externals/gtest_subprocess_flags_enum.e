-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GTEST_SUBPROCESS_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (err_low_level | 
				in_low_level | 
				out_external_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_err
               do
                       value := value.bit_or(err_low_level)
               end

	unset_err
               do
                       value := value.bit_xor(err_low_level)
               end

	set_in
               do
                       value := value.bit_or(in_low_level)
               end

	unset_in
               do
                       value := value.bit_xor(in_low_level)
               end

	set_out_external
               do
                       value := value.bit_or(out_external_low_level)
               end

	unset_out_external
               do
                       value := value.bit_xor(out_external_low_level)
               end

feature {ANY} -- Queries
       is_err: BOOLEAN
               do
                       Result := (value=err_low_level)
               end

       is_in: BOOLEAN
               do
                       Result := (value=in_low_level)
               end

       is_out_external: BOOLEAN
               do
                       Result := (value=out_external_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     err_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_SUBPROCESS_INHERIT_STDERR"
                       }"
               end

     in_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_SUBPROCESS_INHERIT_STDIN"
                       }"
               end

     out_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_SUBPROCESS_INHERIT_STDOUT"
                       }"
               end


end -- class GTEST_SUBPROCESS_FLAGS_ENUM
