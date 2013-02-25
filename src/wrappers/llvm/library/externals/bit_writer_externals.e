-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class BIT_WRITER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	llvmwrite_bitcode_to_file (a_m: POINTER; a_path: POINTER): INTEGER_32 is
 		-- LLVMWriteBitcodeToFile (node at line 2940)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMWriteBitcodeToFile"
		}"
		end

	llvmwrite_bitcode_to_file_handle (a_m: POINTER; a_handle: INTEGER_32): INTEGER_32 is
 		-- LLVMWriteBitcodeToFileHandle (node at line 2985)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMWriteBitcodeToFileHandle"
		}"
		end

	llvmwrite_bitcode_to_fd (a_m: POINTER; a_fd: INTEGER_32; a_should_close: INTEGER_32; an_unbuffered: INTEGER_32): INTEGER_32 is
 		-- LLVMWriteBitcodeToFD (node at line 5731)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMWriteBitcodeToFD"
		}"
		end


end -- class BIT_WRITER_EXTERNALS
