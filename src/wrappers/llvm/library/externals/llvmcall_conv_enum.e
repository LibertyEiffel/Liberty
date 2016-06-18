-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMCALL_CONV_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = ccall_conv_low_level)  or else
				(a_value = cold_call_conv_low_level)  or else
				(a_value = fast_call_conv_low_level)  or else
				(a_value = x86fastcall_call_conv_low_level)  or else
				(a_value = x86stdcall_call_conv_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_ccall_conv
		do
			value := ccall_conv_low_level
		end

	set_cold_call_conv
		do
			value := cold_call_conv_low_level
		end

	set_fast_call_conv
		do
			value := fast_call_conv_low_level
		end

	set_x86fastcall_call_conv
		do
			value := x86fastcall_call_conv_low_level
		end

	set_x86stdcall_call_conv
		do
			value := x86stdcall_call_conv_low_level
		end

feature {ANY} -- Queries
	is_ccall_conv: BOOLEAN
		do
			Result := (value=ccall_conv_low_level)
		end

	is_cold_call_conv: BOOLEAN
		do
			Result := (value=cold_call_conv_low_level)
		end

	is_fast_call_conv: BOOLEAN
		do
			Result := (value=fast_call_conv_low_level)
		end

	is_x86fastcall_call_conv: BOOLEAN
		do
			Result := (value=x86fastcall_call_conv_low_level)
		end

	is_x86stdcall_call_conv: BOOLEAN
		do
			Result := (value=x86stdcall_call_conv_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ccall_conv_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMCCallConv"
 			}"
 		end

	cold_call_conv_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMColdCallConv"
 			}"
 		end

	fast_call_conv_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFastCallConv"
 			}"
 		end

	x86fastcall_call_conv_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMX86FastcallCallConv"
 			}"
 		end

	x86stdcall_call_conv_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMX86StdcallCallConv"
 			}"
 		end


end -- class LLVMCALL_CONV_ENUM
