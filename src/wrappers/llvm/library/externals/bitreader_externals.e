-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class BITREADER_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	llvmget_bitcode_module (a_mem_buf: POINTER; an_out_m: POINTER; an_out_message: POINTER): INTEGER is
 		-- LLVMGetBitcodeModule
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBitcodeModule"
		}"
		end

	llvmget_bitcode_module_in_context (a_context_ref: POINTER; a_mem_buf: POINTER; an_out_m: POINTER; an_out_message: POINTER): INTEGER is
 		-- LLVMGetBitcodeModuleInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBitcodeModuleInContext"
		}"
		end

	llvmget_bitcode_module_provider (a_mem_buf: POINTER; an_out_mp: POINTER; an_out_message: POINTER): INTEGER is
 		-- LLVMGetBitcodeModuleProvider
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBitcodeModuleProvider"
		}"
		end

	llvmget_bitcode_module_provider_in_context (a_context_ref: POINTER; a_mem_buf: POINTER; an_out_mp: POINTER; an_out_message: POINTER): INTEGER is
 		-- LLVMGetBitcodeModuleProviderInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBitcodeModuleProviderInContext"
		}"
		end

	llvmparse_bitcode (a_mem_buf: POINTER; an_out_module: POINTER; an_out_message: POINTER): INTEGER is
 		-- LLVMParseBitcode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMParseBitcode"
		}"
		end

	llvmparse_bitcode_in_context (a_context_ref: POINTER; a_mem_buf: POINTER; an_out_module: POINTER; an_out_message: POINTER): INTEGER is
 		-- LLVMParseBitcodeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMParseBitcodeInContext"
		}"
		end


end -- class BITREADER_EXTERNALS
