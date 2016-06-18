-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class VALUE_TY_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = argument_val_low_level)  or else
				(a_value = basic_block_val_low_level)  or else
				(a_value = block_address_val_low_level)  or else
				(a_value = constant_aggregate_zero_val_low_level)  or else
				(a_value = constant_array_val_low_level)  or else
				(a_value = constant_data_array_val_low_level)  or else
				(a_value = constant_data_vector_val_low_level)  or else
				(a_value = constant_expr_val_low_level)  or else
				(a_value = constant_first_val_low_level)  or else
				(a_value = constant_fpval_low_level)  or else
				(a_value = constant_int_val_low_level)  or else
				(a_value = constant_last_val_low_level)  or else
				(a_value = constant_pointer_null_val_low_level)  or else
				(a_value = constant_struct_val_low_level)  or else
				(a_value = constant_vector_val_low_level)  or else
				(a_value = fixed_stack_pseudo_source_value_val_low_level)  or else
				(a_value = function_val_low_level)  or else
				(a_value = global_alias_val_low_level)  or else
				(a_value = global_variable_val_low_level)  or else
				(a_value = inline_asm_val_low_level)  or else
				(a_value = instruction_val_low_level)  or else
				(a_value = mdnode_val_low_level)  or else
				(a_value = mdstring_val_low_level)  or else
				(a_value = pseudo_source_value_val_low_level)  or else
				(a_value = undef_value_val_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_argument_val
		do
			value := argument_val_low_level
		end

	set_basic_block_val
		do
			value := basic_block_val_low_level
		end

	set_block_address_val
		do
			value := block_address_val_low_level
		end

	set_constant_aggregate_zero_val
		do
			value := constant_aggregate_zero_val_low_level
		end

	set_constant_array_val
		do
			value := constant_array_val_low_level
		end

	set_constant_data_array_val
		do
			value := constant_data_array_val_low_level
		end

	set_constant_data_vector_val
		do
			value := constant_data_vector_val_low_level
		end

	set_constant_expr_val
		do
			value := constant_expr_val_low_level
		end

	set_constant_first_val
		do
			value := constant_first_val_low_level
		end

	set_constant_fpval
		do
			value := constant_fpval_low_level
		end

	set_constant_int_val
		do
			value := constant_int_val_low_level
		end

	set_constant_last_val
		do
			value := constant_last_val_low_level
		end

	set_constant_pointer_null_val
		do
			value := constant_pointer_null_val_low_level
		end

	set_constant_struct_val
		do
			value := constant_struct_val_low_level
		end

	set_constant_vector_val
		do
			value := constant_vector_val_low_level
		end

	set_fixed_stack_pseudo_source_value_val
		do
			value := fixed_stack_pseudo_source_value_val_low_level
		end

	set_function_val
		do
			value := function_val_low_level
		end

	set_global_alias_val
		do
			value := global_alias_val_low_level
		end

	set_global_variable_val
		do
			value := global_variable_val_low_level
		end

	set_inline_asm_val
		do
			value := inline_asm_val_low_level
		end

	set_instruction_val
		do
			value := instruction_val_low_level
		end

	set_mdnode_val
		do
			value := mdnode_val_low_level
		end

	set_mdstring_val
		do
			value := mdstring_val_low_level
		end

	set_pseudo_source_value_val
		do
			value := pseudo_source_value_val_low_level
		end

	set_undef_value_val
		do
			value := undef_value_val_low_level
		end

feature {ANY} -- Queries
	is_argument_val: BOOLEAN
		do
			Result := (value=argument_val_low_level)
		end

	is_basic_block_val: BOOLEAN
		do
			Result := (value=basic_block_val_low_level)
		end

	is_block_address_val: BOOLEAN
		do
			Result := (value=block_address_val_low_level)
		end

	is_constant_aggregate_zero_val: BOOLEAN
		do
			Result := (value=constant_aggregate_zero_val_low_level)
		end

	is_constant_array_val: BOOLEAN
		do
			Result := (value=constant_array_val_low_level)
		end

	is_constant_data_array_val: BOOLEAN
		do
			Result := (value=constant_data_array_val_low_level)
		end

	is_constant_data_vector_val: BOOLEAN
		do
			Result := (value=constant_data_vector_val_low_level)
		end

	is_constant_expr_val: BOOLEAN
		do
			Result := (value=constant_expr_val_low_level)
		end

	is_constant_first_val: BOOLEAN
		do
			Result := (value=constant_first_val_low_level)
		end

	is_constant_fpval: BOOLEAN
		do
			Result := (value=constant_fpval_low_level)
		end

	is_constant_int_val: BOOLEAN
		do
			Result := (value=constant_int_val_low_level)
		end

	is_constant_last_val: BOOLEAN
		do
			Result := (value=constant_last_val_low_level)
		end

	is_constant_pointer_null_val: BOOLEAN
		do
			Result := (value=constant_pointer_null_val_low_level)
		end

	is_constant_struct_val: BOOLEAN
		do
			Result := (value=constant_struct_val_low_level)
		end

	is_constant_vector_val: BOOLEAN
		do
			Result := (value=constant_vector_val_low_level)
		end

	is_fixed_stack_pseudo_source_value_val: BOOLEAN
		do
			Result := (value=fixed_stack_pseudo_source_value_val_low_level)
		end

	is_function_val: BOOLEAN
		do
			Result := (value=function_val_low_level)
		end

	is_global_alias_val: BOOLEAN
		do
			Result := (value=global_alias_val_low_level)
		end

	is_global_variable_val: BOOLEAN
		do
			Result := (value=global_variable_val_low_level)
		end

	is_inline_asm_val: BOOLEAN
		do
			Result := (value=inline_asm_val_low_level)
		end

	is_instruction_val: BOOLEAN
		do
			Result := (value=instruction_val_low_level)
		end

	is_mdnode_val: BOOLEAN
		do
			Result := (value=mdnode_val_low_level)
		end

	is_mdstring_val: BOOLEAN
		do
			Result := (value=mdstring_val_low_level)
		end

	is_pseudo_source_value_val: BOOLEAN
		do
			Result := (value=pseudo_source_value_val_low_level)
		end

	is_undef_value_val: BOOLEAN
		do
			Result := (value=undef_value_val_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	argument_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ArgumentVal"
 			}"
 		end

	basic_block_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "BasicBlockVal"
 			}"
 		end

	block_address_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "BlockAddressVal"
 			}"
 		end

	constant_aggregate_zero_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantAggregateZeroVal"
 			}"
 		end

	constant_array_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantArrayVal"
 			}"
 		end

	constant_data_array_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantDataArrayVal"
 			}"
 		end

	constant_data_vector_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantDataVectorVal"
 			}"
 		end

	constant_expr_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantExprVal"
 			}"
 		end

	constant_first_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantFirstVal"
 			}"
 		end

	constant_fpval_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantFPVal"
 			}"
 		end

	constant_int_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantIntVal"
 			}"
 		end

	constant_last_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantLastVal"
 			}"
 		end

	constant_pointer_null_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantPointerNullVal"
 			}"
 		end

	constant_struct_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantStructVal"
 			}"
 		end

	constant_vector_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantVectorVal"
 			}"
 		end

	fixed_stack_pseudo_source_value_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FixedStackPseudoSourceValueVal"
 			}"
 		end

	function_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FunctionVal"
 			}"
 		end

	global_alias_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GlobalAliasVal"
 			}"
 		end

	global_variable_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GlobalVariableVal"
 			}"
 		end

	inline_asm_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "InlineAsmVal"
 			}"
 		end

	instruction_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "InstructionVal"
 			}"
 		end

	mdnode_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "MDNodeVal"
 			}"
 		end

	mdstring_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "MDStringVal"
 			}"
 		end

	pseudo_source_value_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PseudoSourceValueVal"
 			}"
 		end

	undef_value_val_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UndefValueVal"
 			}"
 		end


end -- class VALUE_TY_ENUM
