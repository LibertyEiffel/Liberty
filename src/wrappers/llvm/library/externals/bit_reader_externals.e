-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class BIT_READER_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	llvmparse_bitcode (a_mem_buf: POINTER; an_out_module: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMParseBitcode (node at line 3233)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMParseBitcode"
		}"
		end

	llvmparse_bitcode_in_context (a_context_ref: POINTER; a_mem_buf: POINTER; an_out_module: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMParseBitcodeInContext (node at line 4941)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMParseBitcodeInContext"
		}"
		end

	llvmget_bitcode_module_provider (a_mem_buf: POINTER; an_out_mp: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMGetBitcodeModuleProvider (node at line 6272)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBitcodeModuleProvider"
		}"
		end

	llvmget_bitcode_module_provider_in_context (a_context_ref: POINTER; a_mem_buf: POINTER; an_out_mp: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMGetBitcodeModuleProviderInContext (node at line 6453)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBitcodeModuleProviderInContext"
		}"
		end


end -- class BIT_READER_EXTERNALS
