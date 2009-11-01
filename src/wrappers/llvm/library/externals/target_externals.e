-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class TARGET_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	llvmcreate_target_data (a_string_rep: POINTER): POINTER is
 		-- LLVMCreateTargetData (node at line 49)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateTargetData"
		}"
		end

	llvmcopy_string_rep_of_target_data (an_argument_l339_c7: POINTER): POINTER is
 		-- LLVMCopyStringRepOfTargetData (node at line 338)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCopyStringRepOfTargetData"
		}"
		end

	llvmsize_of_type_in_bits (an_argument_l393_c7: POINTER; an_argument_l394_c7: POINTER): NATURAL_64 is
 		-- LLVMSizeOfTypeInBits (node at line 392)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSizeOfTypeInBits"
		}"
		end

	llvmabialignment_of_type (an_argument_l503_c7: POINTER; an_argument_l504_c7: POINTER): NATURAL_32 is
 		-- LLVMABIAlignmentOfType (node at line 502)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMABIAlignmentOfType"
		}"
		end

	llvmpreferred_alignment_of_global (an_argument_l615_c7: POINTER; a_global_var: POINTER): NATURAL_32 is
 		-- LLVMPreferredAlignmentOfGlobal (node at line 614)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPreferredAlignmentOfGlobal"
		}"
		end

	llvmadd_target_data (an_argument_l837_c7: POINTER; an_argument_l838_c7: POINTER) is
 		-- LLVMAddTargetData (node at line 836)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddTargetData"
		}"
		end

	llvmelement_at_offset (an_argument_l936_c7: POINTER; a_struct_ty: POINTER; an_offset: NATURAL_64): NATURAL_32 is
 		-- LLVMElementAtOffset (node at line 935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMElementAtOffset"
		}"
		end

	llvmabisize_of_type (an_argument_l2051_c7: POINTER; an_argument_l2052_c7: POINTER): NATURAL_64 is
 		-- LLVMABISizeOfType (node at line 2050)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMABISizeOfType"
		}"
		end

	llvmpreferred_alignment_of_type (an_argument_l2463_c7: POINTER; an_argument_l2464_c7: POINTER): NATURAL_32 is
 		-- LLVMPreferredAlignmentOfType (node at line 2462)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPreferredAlignmentOfType"
		}"
		end

	llvmbyte_order (an_argument_l2537_c7: POINTER): INTEGER_32 is
 		-- LLVMByteOrder (node at line 2536)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMByteOrder"
		}"
		end

	llvmdispose_target_data (an_argument_l3280_c7: POINTER) is
 		-- LLVMDisposeTargetData (node at line 3279)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeTargetData"
		}"
		end

	llvminitialize_all_target_infos is
 		-- LLVMInitializeAllTargetInfos (node at line 3900)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInitializeAllTargetInfos()"
		}"
		end

	llvmpointer_size (an_argument_l4515_c7: POINTER): NATURAL_32 is
 		-- LLVMPointerSize (node at line 4514)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPointerSize"
		}"
		end

	llvminvalidate_struct_layout (an_argument_l4829_c7: POINTER; a_struct_ty: POINTER) is
 		-- LLVMInvalidateStructLayout (node at line 4828)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInvalidateStructLayout"
		}"
		end

	llvmoffset_of_element (an_argument_l5266_c7: POINTER; a_struct_ty: POINTER; an_element: NATURAL_32): NATURAL_64 is
 		-- LLVMOffsetOfElement (node at line 5265)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMOffsetOfElement"
		}"
		end

	llvmint_ptr_type (an_argument_l5271_c7: POINTER): POINTER is
 		-- LLVMIntPtrType (node at line 5270)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIntPtrType"
		}"
		end

	llvmstore_size_of_type (an_argument_l5847_c7: POINTER; an_argument_l5848_c7: POINTER): NATURAL_64 is
 		-- LLVMStoreSizeOfType (node at line 5846)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMStoreSizeOfType"
		}"
		end

	llvmcall_frame_alignment_of_type (an_argument_l7094_c7: POINTER; an_argument_l7095_c7: POINTER): NATURAL_32 is
 		-- LLVMCallFrameAlignmentOfType (node at line 7093)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCallFrameAlignmentOfType"
		}"
		end

	llvminitialize_native_target: INTEGER_32 is
 		-- LLVMInitializeNativeTarget (node at line 7512)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInitializeNativeTarget()"
		}"
		end

	llvminitialize_all_targets is
 		-- LLVMInitializeAllTargets (node at line 7569)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInitializeAllTargets()"
		}"
		end

	-- function wrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.

end -- class TARGET_EXTERNALS
