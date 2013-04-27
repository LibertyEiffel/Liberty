-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class TARGET_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	llvmabialignment_of_type (an_argument_l604_c7: POINTER; an_argument_l605_c7: POINTER): NATURAL is
 		-- LLVMABIAlignmentOfType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMABIAlignmentOfType"
		}"
		end

	llvmabisize_of_type (an_argument_l2125_c7: POINTER; an_argument_l2126_c7: POINTER): NATURAL_64 is
 		-- LLVMABISizeOfType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMABISizeOfType"
		}"
		end

	llvmadd_target_data (an_argument_l958_c7: POINTER; an_argument_l959_c7: POINTER) is
 		-- LLVMAddTargetData
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddTargetData"
		}"
		end

	llvmbyte_order (an_argument_l2657_c7: POINTER): INTEGER is
 		-- LLVMByteOrder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMByteOrder"
		}"
		end

	llvmcall_frame_alignment_of_type (an_argument_l7204_c7: POINTER; an_argument_l7205_c7: POINTER): NATURAL is
 		-- LLVMCallFrameAlignmentOfType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCallFrameAlignmentOfType"
		}"
		end

	llvmcopy_string_rep_of_target_data (an_argument_l6367_c7: POINTER): POINTER is
 		-- LLVMCopyStringRepOfTargetData
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCopyStringRepOfTargetData"
		}"
		end

	llvmcreate_target_data (a_string_rep: POINTER): POINTER is
 		-- LLVMCreateTargetData
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateTargetData"
		}"
		end

	llvmdispose_target_data (an_argument_l3442_c7: POINTER) is
 		-- LLVMDisposeTargetData
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeTargetData"
		}"
		end

	llvmelement_at_offset (an_argument_l1025_c7: POINTER; a_struct_ty: POINTER; an_offset: NATURAL_64): NATURAL is
 		-- LLVMElementAtOffset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMElementAtOffset"
		}"
		end

	llvminitialize_all_target_infos is
 		-- LLVMInitializeAllTargetInfos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInitializeAllTargetInfos()"
		}"
		end

	llvminitialize_all_targets is
 		-- LLVMInitializeAllTargets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInitializeAllTargets()"
		}"
		end

	llvminitialize_native_target: INTEGER is
 		-- LLVMInitializeNativeTarget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInitializeNativeTarget()"
		}"
		end

	llvmint_ptr_type (an_argument_l5181_c7: POINTER): POINTER is
 		-- LLVMIntPtrType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIntPtrType"
		}"
		end

	llvminvalidate_struct_layout (an_argument_l4683_c7: POINTER; a_struct_ty: POINTER) is
 		-- LLVMInvalidateStructLayout
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInvalidateStructLayout"
		}"
		end

	llvmoffset_of_element (an_argument_l5176_c7: POINTER; a_struct_ty: POINTER; an_element: NATURAL): NATURAL_64 is
 		-- LLVMOffsetOfElement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMOffsetOfElement"
		}"
		end

	llvmpointer_size (an_argument_l4368_c7: POINTER): NATURAL is
 		-- LLVMPointerSize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPointerSize"
		}"
		end

	llvmpreferred_alignment_of_global (an_argument_l738_c7: POINTER; a_global_var: POINTER): NATURAL is
 		-- LLVMPreferredAlignmentOfGlobal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPreferredAlignmentOfGlobal"
		}"
		end

	llvmpreferred_alignment_of_type (an_argument_l2574_c7: POINTER; an_argument_l2575_c7: POINTER): NATURAL is
 		-- LLVMPreferredAlignmentOfType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPreferredAlignmentOfType"
		}"
		end

	llvmsize_of_type_in_bits (an_argument_l498_c7: POINTER; an_argument_l499_c7: POINTER): NATURAL_64 is
 		-- LLVMSizeOfTypeInBits
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSizeOfTypeInBits"
		}"
		end

	llvmstore_size_of_type (an_argument_l5777_c7: POINTER; an_argument_l5778_c7: POINTER): NATURAL_64 is
 		-- LLVMStoreSizeOfType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMStoreSizeOfType"
		}"
		end

	-- function unwrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.

end -- class TARGET_EXTERNALS
