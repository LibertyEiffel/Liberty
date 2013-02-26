-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class BIT_READER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	llvmget_bitcode_module_in_context (a_context_ref: POINTER; a_mem_buf: POINTER; an_out_m: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMGetBitcodeModuleInContext (node at line 48)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBitcodeModuleInContext"
		}"
		end

	llvmget_bitcode_module (a_mem_buf: POINTER; an_out_m: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMGetBitcodeModule (node at line 3007)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBitcodeModule"
		}"
		end

	llvmparse_bitcode_in_context (a_context_ref: POINTER; a_mem_buf: POINTER; an_out_module: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMParseBitcodeInContext (node at line 5068)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMParseBitcodeInContext"
		}"
		end

	llvmget_bitcode_module_provider (a_mem_buf: POINTER; an_out_mp: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMGetBitcodeModuleProvider (node at line 6467)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBitcodeModuleProvider"
		}"
		end

	llvmget_bitcode_module_provider_in_context (a_context_ref: POINTER; a_mem_buf: POINTER; an_out_mp: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMGetBitcodeModuleProviderInContext (node at line 6642)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBitcodeModuleProviderInContext"
		}"
		end

	llvmparse_bitcode (a_mem_buf: POINTER; an_out_module: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMParseBitcode (node at line 7834)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMParseBitcode"
		}"
		end


end -- class BIT_READER_EXTERNALS
