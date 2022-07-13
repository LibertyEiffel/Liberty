-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class FFI_ABI_ENUM

-- Wrapper of enum ffi_abi defined in file /usr/include/ffitarget-x86_64.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = default_abi_low_level)  or else
				(a_value = fastcall_low_level)  or else
				(a_value = first_abi_low_level)  or else
				(a_value = last_abi_low_level)  or else
				(a_value = stdcall_low_level)  or else
				(a_value = sysv_low_level)  or else
				(a_value = thiscall_low_level)  or else
				(a_value = unix64_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_default_abi
               do
                       value := default_abi_low_level
               end

	set_fastcall
               do
                       value := fastcall_low_level
               end

	set_first_abi
               do
                       value := first_abi_low_level
               end

	set_last_abi
               do
                       value := last_abi_low_level
               end

	set_stdcall
               do
                       value := stdcall_low_level
               end

	set_sysv
               do
                       value := sysv_low_level
               end

	set_thiscall
               do
                       value := thiscall_low_level
               end

	set_unix64
               do
                       value := unix64_low_level
               end

feature {ANY} -- Queries
       is_default_abi: BOOLEAN
               do
                       Result := (value=default_abi_low_level)
               end

       is_fastcall: BOOLEAN
               do
                       Result := (value=fastcall_low_level)
               end

       is_first_abi: BOOLEAN
               do
                       Result := (value=first_abi_low_level)
               end

       is_last_abi: BOOLEAN
               do
                       Result := (value=last_abi_low_level)
               end

       is_stdcall: BOOLEAN
               do
                       Result := (value=stdcall_low_level)
               end

       is_sysv: BOOLEAN
               do
                       Result := (value=sysv_low_level)
               end

       is_thiscall: BOOLEAN
               do
                       Result := (value=thiscall_low_level)
               end

       is_unix64: BOOLEAN
               do
                       Result := (value=unix64_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     default_abi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "FFI_DEFAULT_ABI"
                       }"
               end

     fastcall_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "FFI_FASTCALL"
                       }"
               end

     first_abi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "FFI_FIRST_ABI"
                       }"
               end

     last_abi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "FFI_LAST_ABI"
                       }"
               end

     stdcall_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "FFI_STDCALL"
                       }"
               end

     sysv_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "FFI_SYSV"
                       }"
               end

     thiscall_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "FFI_THISCALL"
                       }"
               end

     unix64_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "FFI_UNIX64"
                       }"
               end


end -- class FFI_ABI_ENUM
