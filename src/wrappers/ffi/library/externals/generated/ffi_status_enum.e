-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class FFI_STATUS_ENUM

-- Wrapper of enum ffi_status defined in file /usr/include/ffi-x86_64.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = bad_abi_low_level)  or else
				(a_value = bad_typedef_low_level)  or else
				(a_value = ok_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bad_abi
               do
                       value := bad_abi_low_level
               end

	set_bad_typedef
               do
                       value := bad_typedef_low_level
               end

	set_ok
               do
                       value := ok_low_level
               end

feature {ANY} -- Queries
       is_bad_abi: BOOLEAN
               do
                       Result := (value=bad_abi_low_level)
               end

       is_bad_typedef: BOOLEAN
               do
                       Result := (value=bad_typedef_low_level)
               end

       is_ok: BOOLEAN
               do
                       Result := (value=ok_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     bad_abi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "FFI_BAD_ABI"
                       }"
               end

     bad_typedef_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "FFI_BAD_TYPEDEF"
                       }"
               end

     ok_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "FFI_OK"
                       }"
               end


end -- class FFI_STATUS_ENUM
