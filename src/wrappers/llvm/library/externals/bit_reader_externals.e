-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class BIT_READER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	llvmget_bitcode_module (a_mem_buf: POINTER; an_out_m: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMGetBitcodeModule
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBitcodeModule"
		}"
		end

	llvmget_bitcode_module_in_context (a_context_ref: POINTER; a_mem_buf: POINTER; an_out_m: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMGetBitcodeModuleInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBitcodeModuleInContext"
		}"
		end

	llvmget_bitcode_module_provider (a_mem_buf: POINTER; an_out_mp: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMGetBitcodeModuleProvider
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBitcodeModuleProvider"
		}"
		end

	llvmget_bitcode_module_provider_in_context (a_context_ref: POINTER; a_mem_buf: POINTER; an_out_mp: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMGetBitcodeModuleProviderInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBitcodeModuleProviderInContext"
		}"
		end

	llvmparse_bitcode (a_mem_buf: POINTER; an_out_module: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMParseBitcode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMParseBitcode"
		}"
		end

	llvmparse_bitcode_in_context (a_context_ref: POINTER; a_mem_buf: POINTER; an_out_module: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMParseBitcodeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMParseBitcodeInContext"
		}"
		end


end -- class BIT_READER_EXTERNALS
