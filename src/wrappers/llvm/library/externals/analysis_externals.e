-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class ANALYSIS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	llvmverify_function (a_fn: POINTER; an_action: INTEGER): INTEGER
 		-- LLVMVerifyFunction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMVerifyFunction"
		}"
		end

	llvmverify_module (a_m: POINTER; an_action: INTEGER; an_out_message: POINTER): INTEGER
 		-- LLVMVerifyModule
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMVerifyModule"
		}"
		end

	llvmview_function_cfg (a_fn: POINTER)
 		-- LLVMViewFunctionCFG
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMViewFunctionCFG"
		}"
		end

	llvmview_function_cfgonly (a_fn: POINTER)
 		-- LLVMViewFunctionCFGOnly
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMViewFunctionCFGOnly"
		}"
		end


end -- class ANALYSIS_EXTERNALS
