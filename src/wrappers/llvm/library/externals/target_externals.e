-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class TARGET_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	llvmcreate_target_data (a_string_rep: POINTER): POINTER is
 		-- LLVMCreateTargetData (node at line 58)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateTargetData"
		}"
		end

	llvmsize_of_type_in_bits (an_argument_l464_c7: POINTER; an_argument_l465_c7: POINTER): NATURAL_64 is
 		-- LLVMSizeOfTypeInBits (node at line 463)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSizeOfTypeInBits"
		}"
		end

	llvmabialignment_of_type (an_argument_l570_c7: POINTER; an_argument_l571_c7: POINTER): NATURAL_32 is
 		-- LLVMABIAlignmentOfType (node at line 569)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMABIAlignmentOfType"
		}"
		end

	llvmpreferred_alignment_of_global (an_argument_l679_c7: POINTER; a_global_var: POINTER): NATURAL_32 is
 		-- LLVMPreferredAlignmentOfGlobal (node at line 678)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPreferredAlignmentOfGlobal"
		}"
		end

	llvmadd_target_data (an_argument_l922_c7: POINTER; an_argument_l923_c7: POINTER) is
 		-- LLVMAddTargetData (node at line 921)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddTargetData"
		}"
		end

	llvmelement_at_offset (an_argument_l1021_c7: POINTER; a_struct_ty: POINTER; an_offset: NATURAL_64): NATURAL_32 is
 		-- LLVMElementAtOffset (node at line 1020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMElementAtOffset"
		}"
		end

	llvmabisize_of_type (an_argument_l2145_c7: POINTER; an_argument_l2146_c7: POINTER): NATURAL_64 is
 		-- LLVMABISizeOfType (node at line 2144)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMABISizeOfType"
		}"
		end

	llvmpreferred_alignment_of_type (an_argument_l2576_c7: POINTER; an_argument_l2577_c7: POINTER): NATURAL_32 is
 		-- LLVMPreferredAlignmentOfType (node at line 2575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPreferredAlignmentOfType"
		}"
		end

	llvmbyte_order (an_argument_l2650_c7: POINTER): INTEGER is
 		-- LLVMByteOrder (node at line 2649)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMByteOrder"
		}"
		end

	llvmdispose_target_data (an_argument_l3392_c7: POINTER) is
 		-- LLVMDisposeTargetData (node at line 3391)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeTargetData"
		}"
		end

	llvminitialize_all_target_infos is
 		-- LLVMInitializeAllTargetInfos (node at line 3665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInitializeAllTargetInfos()"
		}"
		end

	llvmpointer_size (an_argument_l4619_c7: POINTER): NATURAL_32 is
 		-- LLVMPointerSize (node at line 4618)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPointerSize"
		}"
		end

	llvminvalidate_struct_layout (an_argument_l4948_c7: POINTER; a_struct_ty: POINTER) is
 		-- LLVMInvalidateStructLayout (node at line 4947)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInvalidateStructLayout"
		}"
		end

	llvmoffset_of_element (an_argument_l5404_c7: POINTER; a_struct_ty: POINTER; an_element: NATURAL_32): NATURAL_64 is
 		-- LLVMOffsetOfElement (node at line 5403)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMOffsetOfElement"
		}"
		end

	llvmint_ptr_type (an_argument_l5409_c7: POINTER): POINTER is
 		-- LLVMIntPtrType (node at line 5408)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIntPtrType"
		}"
		end

	llvmstore_size_of_type (an_argument_l6011_c7: POINTER; an_argument_l6012_c7: POINTER): NATURAL_64 is
 		-- LLVMStoreSizeOfType (node at line 6010)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMStoreSizeOfType"
		}"
		end

	llvmcopy_string_rep_of_target_data (an_argument_l6540_c7: POINTER): POINTER is
 		-- LLVMCopyStringRepOfTargetData (node at line 6539)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCopyStringRepOfTargetData"
		}"
		end

	llvmcall_frame_alignment_of_type (an_argument_l7321_c7: POINTER; an_argument_l7322_c7: POINTER): NATURAL_32 is
 		-- LLVMCallFrameAlignmentOfType (node at line 7320)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCallFrameAlignmentOfType"
		}"
		end

	llvminitialize_native_target: INTEGER_32 is
 		-- LLVMInitializeNativeTarget (node at line 7757)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInitializeNativeTarget()"
		}"
		end

	llvminitialize_all_targets is
 		-- LLVMInitializeAllTargets (node at line 7820)
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
