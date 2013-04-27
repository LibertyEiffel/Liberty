-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMCALLCONV_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = llvmccall_conv_low_level)  or else
				(a_value = llvmcold_call_conv_low_level)  or else
				(a_value = llvmfast_call_conv_low_level)  or else
				(a_value = llvmx86fastcall_call_conv_low_level)  or else
				(a_value = llvmx86stdcall_call_conv_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_llvmccall_conv is
		do
			value := llvmccall_conv_low_level
		end

	set_llvmcold_call_conv is
		do
			value := llvmcold_call_conv_low_level
		end

	set_llvmfast_call_conv is
		do
			value := llvmfast_call_conv_low_level
		end

	set_llvmx86fastcall_call_conv is
		do
			value := llvmx86fastcall_call_conv_low_level
		end

	set_llvmx86stdcall_call_conv is
		do
			value := llvmx86stdcall_call_conv_low_level
		end

feature {ANY} -- Queries
	is_llvmccall_conv: BOOLEAN is
		do
			Result := (value=llvmccall_conv_low_level)
		end

	is_llvmcold_call_conv: BOOLEAN is
		do
			Result := (value=llvmcold_call_conv_low_level)
		end

	is_llvmfast_call_conv: BOOLEAN is
		do
			Result := (value=llvmfast_call_conv_low_level)
		end

	is_llvmx86fastcall_call_conv: BOOLEAN is
		do
			Result := (value=llvmx86fastcall_call_conv_low_level)
		end

	is_llvmx86stdcall_call_conv: BOOLEAN is
		do
			Result := (value=llvmx86stdcall_call_conv_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmccall_conv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMCCallConv"
 			}"
 		end

	llvmcold_call_conv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMColdCallConv"
 			}"
 		end

	llvmfast_call_conv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFastCallConv"
 			}"
 		end

	llvmx86fastcall_call_conv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMX86FastcallCallConv"
 			}"
 		end

	llvmx86stdcall_call_conv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMX86StdcallCallConv"
 			}"
 		end


end -- class LLVMCALLCONV_ENUM
