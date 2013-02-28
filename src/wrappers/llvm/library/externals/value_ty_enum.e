-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class VALUE_TY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = argument_val_low_level)  or else
				(a_value = basic_block_val_low_level)  or else
				(a_value = function_val_low_level)  or else
				(a_value = global_alias_val_low_level)  or else
				(a_value = global_variable_val_low_level)  or else
				(a_value = undef_value_val_low_level)  or else
				(a_value = block_address_val_low_level)  or else
				(a_value = constant_expr_val_low_level)  or else
				(a_value = constant_aggregate_zero_val_low_level)  or else
				(a_value = constant_int_val_low_level)  or else
				(a_value = constant_fpval_low_level)  or else
				(a_value = constant_array_val_low_level)  or else
				(a_value = constant_struct_val_low_level)  or else
				(a_value = constant_union_val_low_level)  or else
				(a_value = constant_vector_val_low_level)  or else
				(a_value = constant_pointer_null_val_low_level)  or else
				(a_value = mdnode_val_low_level)  or else
				(a_value = mdstring_val_low_level)  or else
				(a_value = named_mdnode_val_low_level)  or else
				(a_value = inline_asm_val_low_level)  or else
				(a_value = pseudo_source_value_val_low_level)  or else
				(a_value = fixed_stack_pseudo_source_value_val_low_level)  or else
				(a_value = instruction_val_low_level)  or else
				(a_value = constant_first_val_low_level)  or else
				(a_value = constant_last_val_low_level) )
		end

feature -- Setters
	default_create,
	set_argument_val is
		do
			value := argument_val_low_level
		end

	set_basic_block_val is
		do
			value := basic_block_val_low_level
		end

	set_function_val is
		do
			value := function_val_low_level
		end

	set_global_alias_val is
		do
			value := global_alias_val_low_level
		end

	set_global_variable_val is
		do
			value := global_variable_val_low_level
		end

	set_undef_value_val is
		do
			value := undef_value_val_low_level
		end

	set_block_address_val is
		do
			value := block_address_val_low_level
		end

	set_constant_expr_val is
		do
			value := constant_expr_val_low_level
		end

	set_constant_aggregate_zero_val is
		do
			value := constant_aggregate_zero_val_low_level
		end

	set_constant_int_val is
		do
			value := constant_int_val_low_level
		end

	set_constant_fpval is
		do
			value := constant_fpval_low_level
		end

	set_constant_array_val is
		do
			value := constant_array_val_low_level
		end

	set_constant_struct_val is
		do
			value := constant_struct_val_low_level
		end

	set_constant_union_val is
		do
			value := constant_union_val_low_level
		end

	set_constant_vector_val is
		do
			value := constant_vector_val_low_level
		end

	set_constant_pointer_null_val is
		do
			value := constant_pointer_null_val_low_level
		end

	set_mdnode_val is
		do
			value := mdnode_val_low_level
		end

	set_mdstring_val is
		do
			value := mdstring_val_low_level
		end

	set_named_mdnode_val is
		do
			value := named_mdnode_val_low_level
		end

	set_inline_asm_val is
		do
			value := inline_asm_val_low_level
		end

	set_pseudo_source_value_val is
		do
			value := pseudo_source_value_val_low_level
		end

	set_fixed_stack_pseudo_source_value_val is
		do
			value := fixed_stack_pseudo_source_value_val_low_level
		end

	set_instruction_val is
		do
			value := instruction_val_low_level
		end

	set_constant_first_val is
		do
			value := constant_first_val_low_level
		end

	set_constant_last_val is
		do
			value := constant_last_val_low_level
		end

feature -- Queries
	argument_val: BOOLEAN is
		do
			Result := (value=argument_val_low_level)
		end

	basic_block_val: BOOLEAN is
		do
			Result := (value=basic_block_val_low_level)
		end

	function_val: BOOLEAN is
		do
			Result := (value=function_val_low_level)
		end

	global_alias_val: BOOLEAN is
		do
			Result := (value=global_alias_val_low_level)
		end

	global_variable_val: BOOLEAN is
		do
			Result := (value=global_variable_val_low_level)
		end

	undef_value_val: BOOLEAN is
		do
			Result := (value=undef_value_val_low_level)
		end

	block_address_val: BOOLEAN is
		do
			Result := (value=block_address_val_low_level)
		end

	constant_expr_val: BOOLEAN is
		do
			Result := (value=constant_expr_val_low_level)
		end

	constant_aggregate_zero_val: BOOLEAN is
		do
			Result := (value=constant_aggregate_zero_val_low_level)
		end

	constant_int_val: BOOLEAN is
		do
			Result := (value=constant_int_val_low_level)
		end

	constant_fpval: BOOLEAN is
		do
			Result := (value=constant_fpval_low_level)
		end

	constant_array_val: BOOLEAN is
		do
			Result := (value=constant_array_val_low_level)
		end

	constant_struct_val: BOOLEAN is
		do
			Result := (value=constant_struct_val_low_level)
		end

	constant_union_val: BOOLEAN is
		do
			Result := (value=constant_union_val_low_level)
		end

	constant_vector_val: BOOLEAN is
		do
			Result := (value=constant_vector_val_low_level)
		end

	constant_pointer_null_val: BOOLEAN is
		do
			Result := (value=constant_pointer_null_val_low_level)
		end

	mdnode_val: BOOLEAN is
		do
			Result := (value=mdnode_val_low_level)
		end

	mdstring_val: BOOLEAN is
		do
			Result := (value=mdstring_val_low_level)
		end

	named_mdnode_val: BOOLEAN is
		do
			Result := (value=named_mdnode_val_low_level)
		end

	inline_asm_val: BOOLEAN is
		do
			Result := (value=inline_asm_val_low_level)
		end

	pseudo_source_value_val: BOOLEAN is
		do
			Result := (value=pseudo_source_value_val_low_level)
		end

	fixed_stack_pseudo_source_value_val: BOOLEAN is
		do
			Result := (value=fixed_stack_pseudo_source_value_val_low_level)
		end

	instruction_val: BOOLEAN is
		do
			Result := (value=instruction_val_low_level)
		end

	constant_first_val: BOOLEAN is
		do
			Result := (value=constant_first_val_low_level)
		end

	constant_last_val: BOOLEAN is
		do
			Result := (value=constant_last_val_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	argument_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ArgumentVal"
 			}"
 		end

	basic_block_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "BasicBlockVal"
 			}"
 		end

	function_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FunctionVal"
 			}"
 		end

	global_alias_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GlobalAliasVal"
 			}"
 		end

	global_variable_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GlobalVariableVal"
 			}"
 		end

	undef_value_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UndefValueVal"
 			}"
 		end

	block_address_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "BlockAddressVal"
 			}"
 		end

	constant_expr_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantExprVal"
 			}"
 		end

	constant_aggregate_zero_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantAggregateZeroVal"
 			}"
 		end

	constant_int_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantIntVal"
 			}"
 		end

	constant_fpval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantFPVal"
 			}"
 		end

	constant_array_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantArrayVal"
 			}"
 		end

	constant_struct_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantStructVal"
 			}"
 		end

	constant_union_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantUnionVal"
 			}"
 		end

	constant_vector_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantVectorVal"
 			}"
 		end

	constant_pointer_null_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantPointerNullVal"
 			}"
 		end

	mdnode_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "MDNodeVal"
 			}"
 		end

	mdstring_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "MDStringVal"
 			}"
 		end

	named_mdnode_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "NamedMDNodeVal"
 			}"
 		end

	inline_asm_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "InlineAsmVal"
 			}"
 		end

	pseudo_source_value_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PseudoSourceValueVal"
 			}"
 		end

	fixed_stack_pseudo_source_value_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FixedStackPseudoSourceValueVal"
 			}"
 		end

	instruction_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "InstructionVal"
 			}"
 		end

	constant_first_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantFirstVal"
 			}"
 		end

	constant_last_val_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ConstantLastVal"
 			}"
 		end


end -- class VALUE_TY_ENUM
