-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMCALL_CONV_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = ccallconv_low_level)  or else
				(a_value = coldcallconv_low_level)  or else
				(a_value = x86stdcallcallconv_low_level)  or else
				(a_value = x86fastcallcallconv_low_level) )
		end

feature -- Setters
	default_create,
	set_ccallconv is
		do
			value := ccallconv_low_level
		end

	set_coldcallconv is
		do
			value := coldcallconv_low_level
		end

	set_x86stdcallcallconv is
		do
			value := x86stdcallcallconv_low_level
		end

	set_x86fastcallcallconv is
		do
			value := x86fastcallcallconv_low_level
		end

feature -- Queries
	is_ccallconv: BOOLEAN is
		do
			Result := (value=ccallconv_low_level)
		end

	is_coldcallconv: BOOLEAN is
		do
			Result := (value=coldcallconv_low_level)
		end

	is_x86stdcallcallconv: BOOLEAN is
		do
			Result := (value=x86stdcallcallconv_low_level)
		end

	is_x86fastcallcallconv: BOOLEAN is
		do
			Result := (value=x86fastcallcallconv_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ccallconv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMCCallConv"
 			}"
 		end

	coldcallconv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMColdCallConv"
 			}"
 		end

	x86stdcallcallconv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMX86StdcallCallConv"
 			}"
 		end

	x86fastcallcallconv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMX86FastcallCallConv"
 			}"
 		end


end -- class LLVMCALL_CONV_ENUM
