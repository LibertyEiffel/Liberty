-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class EXECUTIONENGINE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	llvmadd_global_mapping (an_ee: POINTER; a_global: POINTER; an_addr: POINTER)
 		-- LLVMAddGlobalMapping
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddGlobalMapping"
		}"
		end

	llvmadd_module (an_ee: POINTER; a_m: POINTER)
 		-- LLVMAddModule
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddModule"
		}"
		end

	llvmadd_module_provider (an_ee: POINTER; a_mp: POINTER)
 		-- LLVMAddModuleProvider
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddModuleProvider"
		}"
		end

	llvmcreate_execution_engine (an_out_ee: POINTER; a_mp: POINTER; an_out_error: POINTER): INTEGER
 		-- LLVMCreateExecutionEngine
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateExecutionEngine"
		}"
		end

	llvmcreate_execution_engine_for_module (an_out_ee: POINTER; a_m: POINTER; an_out_error: POINTER): INTEGER
 		-- LLVMCreateExecutionEngineForModule
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateExecutionEngineForModule"
		}"
		end

	llvmcreate_generic_value_of_float (a_ty: POINTER; a_n: REAL): POINTER
 		-- LLVMCreateGenericValueOfFloat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateGenericValueOfFloat"
		}"
		end

	llvmcreate_generic_value_of_int (a_ty: POINTER; a_n: NATURAL_64; an_is_signed: INTEGER): POINTER
 		-- LLVMCreateGenericValueOfInt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateGenericValueOfInt"
		}"
		end

	llvmcreate_generic_value_of_pointer (a_p: POINTER): POINTER
 		-- LLVMCreateGenericValueOfPointer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateGenericValueOfPointer"
		}"
		end

	llvmcreate_interpreter (an_out_interp: POINTER; a_mp: POINTER; an_out_error: POINTER): INTEGER
 		-- LLVMCreateInterpreter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateInterpreter"
		}"
		end

	llvmcreate_interpreter_for_module (an_out_interp: POINTER; a_m: POINTER; an_out_error: POINTER): INTEGER
 		-- LLVMCreateInterpreterForModule
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateInterpreterForModule"
		}"
		end

	llvmcreate_jitcompiler (an_out_jit: POINTER; a_mp: POINTER; an_opt_level: NATURAL; an_out_error: POINTER): INTEGER
 		-- LLVMCreateJITCompiler
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateJITCompiler"
		}"
		end

	llvmcreate_jitcompiler_for_module (an_out_jit: POINTER; a_m: POINTER; an_opt_level: NATURAL; an_out_error: POINTER): INTEGER
 		-- LLVMCreateJITCompilerForModule
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateJITCompilerForModule"
		}"
		end

	llvmdispose_execution_engine (an_ee: POINTER)
 		-- LLVMDisposeExecutionEngine
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeExecutionEngine"
		}"
		end

	llvmdispose_generic_value (a_gen_val: POINTER)
 		-- LLVMDisposeGenericValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeGenericValue"
		}"
		end

	llvmfind_function (an_ee: POINTER; a_name: POINTER; an_out_fn: POINTER): INTEGER
 		-- LLVMFindFunction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFindFunction"
		}"
		end

	llvmfree_machine_code_for_function (an_ee: POINTER; a_f: POINTER)
 		-- LLVMFreeMachineCodeForFunction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFreeMachineCodeForFunction"
		}"
		end

	llvmgeneric_value_int_width (a_gen_val_ref: POINTER): NATURAL
 		-- LLVMGenericValueIntWidth
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGenericValueIntWidth"
		}"
		end

	llvmgeneric_value_to_float (a_ty_ref: POINTER; a_gen_val: POINTER): REAL
 		-- LLVMGenericValueToFloat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGenericValueToFloat"
		}"
		end

	llvmgeneric_value_to_int (a_gen_val: POINTER; an_is_signed: INTEGER): NATURAL_64
 		-- LLVMGenericValueToInt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGenericValueToInt"
		}"
		end

	llvmgeneric_value_to_pointer (a_gen_val: POINTER): POINTER
 		-- LLVMGenericValueToPointer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGenericValueToPointer"
		}"
		end

	llvmget_execution_engine_target_data (an_ee: POINTER): POINTER
 		-- LLVMGetExecutionEngineTargetData
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetExecutionEngineTargetData"
		}"
		end

	llvmget_pointer_to_global (an_ee: POINTER; a_global: POINTER): POINTER
 		-- LLVMGetPointerToGlobal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPointerToGlobal"
		}"
		end

	llvmlink_in_interpreter
 		-- LLVMLinkInInterpreter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMLinkInInterpreter()"
		}"
		end

	llvmlink_in_jit
 		-- LLVMLinkInJIT
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMLinkInJIT()"
		}"
		end

	llvmrecompile_and_relink_function (an_ee: POINTER; a_fn: POINTER): POINTER
 		-- LLVMRecompileAndRelinkFunction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRecompileAndRelinkFunction"
		}"
		end

	llvmremove_module (an_ee: POINTER; a_m: POINTER; an_out_mod: POINTER; an_out_error: POINTER): INTEGER
 		-- LLVMRemoveModule
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRemoveModule"
		}"
		end

	llvmremove_module_provider (an_ee: POINTER; a_mp: POINTER; an_out_mod: POINTER; an_out_error: POINTER): INTEGER
 		-- LLVMRemoveModuleProvider
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRemoveModuleProvider"
		}"
		end

	llvmrun_function (an_ee: POINTER; a_f: POINTER; a_num_args: NATURAL; an_args: POINTER): POINTER
 		-- LLVMRunFunction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRunFunction"
		}"
		end

	llvmrun_function_as_main (an_ee: POINTER; a_f: POINTER; an_arg_c: NATURAL; an_arg_v: POINTER; an_env_p: POINTER): INTEGER
 		-- LLVMRunFunctionAsMain
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRunFunctionAsMain"
		}"
		end

	llvmrun_static_constructors (an_ee: POINTER)
 		-- LLVMRunStaticConstructors
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRunStaticConstructors"
		}"
		end

	llvmrun_static_destructors (an_ee: POINTER)
 		-- LLVMRunStaticDestructors
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRunStaticDestructors"
		}"
		end

	-- function unwrap in unwrapped namespace llvm skipped.
	-- function unwrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.

end -- class EXECUTIONENGINE_EXTERNALS
