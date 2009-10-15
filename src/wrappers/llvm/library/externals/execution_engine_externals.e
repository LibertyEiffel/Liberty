-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class EXECUTION_ENGINE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	llvmgeneric_value_to_int (a_gen_val: POINTER; an_is_signed: INTEGER_32): NATURAL_64 is
 		-- LLVMGenericValueToInt (node at line 191)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGenericValueToInt"
		}"
		end

	llvmcreate_generic_value_of_float (a_ty: POINTER; a_n: REAL_64): POINTER is
 		-- LLVMCreateGenericValueOfFloat (node at line 458)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateGenericValueOfFloat"
		}"
		end

	llvmcreate_generic_value_of_pointer (a_p: POINTER): POINTER is
 		-- LLVMCreateGenericValueOfPointer (node at line 532)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateGenericValueOfPointer"
		}"
		end

	llvmadd_module_provider (an_ee: POINTER; a_mp: POINTER) is
 		-- LLVMAddModuleProvider (node at line 1298)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddModuleProvider"
		}"
		end

	llvmrun_function_as_main (an_ee: POINTER; a_f: POINTER; an_arg_c: NATURAL_32; an_arg_v: POINTER; an_env_p: POINTER): INTEGER_32 is
 		-- LLVMRunFunctionAsMain (node at line 1483)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRunFunctionAsMain"
		}"
		end

	llvmlink_in_jit is
 		-- LLVMLinkInJIT (node at line 1686)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMLinkInJIT()"
		}"
		end

	llvmget_pointer_to_global (an_ee: POINTER; a_global: POINTER): POINTER is
 		-- LLVMGetPointerToGlobal (node at line 1959)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPointerToGlobal"
		}"
		end

	llvmrun_static_constructors (an_ee: POINTER) is
 		-- LLVMRunStaticConstructors (node at line 2429)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRunStaticConstructors"
		}"
		end

	llvmremove_module_provider (an_ee: POINTER; a_mp: POINTER; an_out_mod: POINTER; an_out_error: POINTER): INTEGER_32 is
 		-- LLVMRemoveModuleProvider (node at line 2617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRemoveModuleProvider"
		}"
		end

	llvmrun_static_destructors (an_ee: POINTER) is
 		-- LLVMRunStaticDestructors (node at line 3294)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRunStaticDestructors"
		}"
		end

	llvmlink_in_interpreter is
 		-- LLVMLinkInInterpreter (node at line 3346)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMLinkInInterpreter()"
		}"
		end

	llvmget_execution_engine_target_data (an_ee: POINTER): POINTER is
 		-- LLVMGetExecutionEngineTargetData (node at line 3376)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetExecutionEngineTargetData"
		}"
		end

	llvmcreate_execution_engine (an_out_ee: POINTER; a_mp: POINTER; an_out_error: POINTER): INTEGER_32 is
 		-- LLVMCreateExecutionEngine (node at line 5288)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateExecutionEngine"
		}"
		end

	llvmadd_global_mapping (an_ee: POINTER; a_global: POINTER; an_addr: POINTER) is
 		-- LLVMAddGlobalMapping (node at line 5479)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddGlobalMapping"
		}"
		end

	llvmcreate_generic_value_of_int (a_ty: POINTER; a_n: NATURAL_64; an_is_signed: INTEGER_32): POINTER is
 		-- LLVMCreateGenericValueOfInt (node at line 6321)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateGenericValueOfInt"
		}"
		end

	llvmfind_function (an_ee: POINTER; a_name: POINTER; an_out_fn: POINTER): INTEGER_32 is
 		-- LLVMFindFunction (node at line 6756)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFindFunction"
		}"
		end

	llvmgeneric_value_to_float (a_ty_ref: POINTER; a_gen_val: POINTER): REAL_64 is
 		-- LLVMGenericValueToFloat (node at line 6835)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGenericValueToFloat"
		}"
		end

	llvmdispose_generic_value (a_gen_val: POINTER) is
 		-- LLVMDisposeGenericValue (node at line 6870)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeGenericValue"
		}"
		end

	llvmfree_machine_code_for_function (an_ee: POINTER; a_f: POINTER) is
 		-- LLVMFreeMachineCodeForFunction (node at line 7183)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFreeMachineCodeForFunction"
		}"
		end

	llvmdispose_execution_engine (an_ee: POINTER) is
 		-- LLVMDisposeExecutionEngine (node at line 7209)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeExecutionEngine"
		}"
		end

	llvmcreate_jitcompiler (an_out_jit: POINTER; a_mp: POINTER; an_opt_level: NATURAL_32; an_out_error: POINTER): INTEGER_32 is
 		-- LLVMCreateJITCompiler (node at line 7310)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateJITCompiler"
		}"
		end

	llvmrun_function (an_ee: POINTER; a_f: POINTER; a_num_args: NATURAL_32; an_args: POINTER): POINTER is
 		-- LLVMRunFunction (node at line 7547)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRunFunction"
		}"
		end

	llvmcreate_interpreter (an_out_interp: POINTER; a_mp: POINTER; an_out_error: POINTER): INTEGER_32 is
 		-- LLVMCreateInterpreter (node at line 7801)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateInterpreter"
		}"
		end

	llvmgeneric_value_to_pointer (a_gen_val: POINTER): POINTER is
 		-- LLVMGenericValueToPointer (node at line 8024)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGenericValueToPointer"
		}"
		end

	llvmgeneric_value_int_width (a_gen_val_ref: POINTER): NATURAL_32 is
 		-- LLVMGenericValueIntWidth (node at line 8288)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGenericValueIntWidth"
		}"
		end

	-- function wrap in namespace llvm skipped.
	-- function wrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.

end -- class EXECUTION_ENGINE_EXTERNALS
