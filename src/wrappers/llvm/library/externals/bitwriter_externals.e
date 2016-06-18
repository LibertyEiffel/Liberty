-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class BITWRITER_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	llvmwrite_bitcode_to_fd (a_m: POINTER; a_fd: INTEGER; a_should_close: INTEGER; an_unbuffered: INTEGER): INTEGER
 		-- LLVMWriteBitcodeToFD
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMWriteBitcodeToFD"
		}"
		end

	llvmwrite_bitcode_to_file (a_m: POINTER; a_path: POINTER): INTEGER
 		-- LLVMWriteBitcodeToFile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMWriteBitcodeToFile"
		}"
		end

	llvmwrite_bitcode_to_file_handle (a_m: POINTER; a_handle: INTEGER): INTEGER
 		-- LLVMWriteBitcodeToFileHandle
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMWriteBitcodeToFileHandle"
		}"
		end


end -- class BITWRITER_EXTERNALS
