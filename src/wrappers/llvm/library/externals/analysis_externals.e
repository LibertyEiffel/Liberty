-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class ANALYSIS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	llvmview_function_cfgonly (a_fn: POINTER) is
 		-- LLVMViewFunctionCFGOnly (node at line 2091)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMViewFunctionCFGOnly"
		}"
		end

	llvmverify_module (a_m: POINTER; an_action: INTEGER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMVerifyModule (node at line 2698)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMVerifyModule"
		}"
		end

	llvmverify_function (a_fn: POINTER; an_action: INTEGER): INTEGER_32 is
 		-- LLVMVerifyFunction (node at line 4777)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMVerifyFunction"
		}"
		end

	llvmview_function_cfg (a_fn: POINTER) is
 		-- LLVMViewFunctionCFG (node at line 6392)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMViewFunctionCFG"
		}"
		end


end -- class ANALYSIS_EXTERNALS
