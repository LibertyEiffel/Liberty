class LLVM_BUILDER
	-- An instruction builder represents point within an LLVM_BASIC_BLOCK where it builds instructions.
	
	-- TODO: many preconditions requires its arguments to be of a specific type
	-- (most often integers, floating point numbers or vectors of integers or
	-- floats). Replace them - if possible - with more specific types of
	-- arguments.  
	-- Note: Internally it uses the C interface so it doesn't has full-fledged
	-- access to the entire C++ API.

inherit 
	C_STRUCT redefine default_create end 
		ARRAYED_COLLECTION_HANDLER redefine default_create end

insert CORE_EXTERNALS redefine default_create end 
create {ANY} in_context, default_create, at_end_of
feature {ANY} -- Creation
	in_context (a_context: LLVM_CONTEXT)
		-- Create an LLVM_BUILDER in `a_context'.
	require a_context/=Void
	do
		from_external_pointer(llvmcreate_builder_in_context(a_context.handle))
	end

	default_create
		do
			from_external_pointer(llvmcreate_builder)
		end

	at_end_of (a_block: LLVM_BASIC_BLOCK)
		-- Create a new builder positioned at the end of `a_block'; this
		-- commodity creation feature is a shortcut for (equivalent to) "create
		-- Result; Result.position_at_end_of(a_block)"
	require a_block/=Void
	do
		default_create
		position_at_end_of(a_block)
	end

feature {ANY} -- Positioning
	set_position (a_block: LLVM_BASIC_BLOCK; an_instruction: LLVM_VALUE)
		-- TODO: description
	require
		a_block/=Void
		an_instruction/=Void
	do
		llvmposition_builder(handle,a_block.handle,an_instruction.handle)
	end

	position_before (an_instruction: LLVM_INSTRUCTION)
		-- Set Current position before `an_instruction'
	require an_instruction/=Void
	do
		llvmposition_builder_before(handle,an_instruction.handle)
	end
	
	position_at_end_of (a_block: LLVM_BASIC_BLOCK)
		-- Set Current position at the end of `a_block'
	require a_block/=Void
	do
		llvmposition_builder_at_end(handle,a_block.handle)
	end

	insert_block: LLVM_BASIC_BLOCK
	local p: POINTER
	do
		p := llvmget_insert_block(handle)
		if p.is_not_null then create Result.from_external_pointer(p) end
	end

	clear_insertion_position
		do
			llvmclear_insertion_position(handle)
		end

	insert_instruction (an_instruction: LLVM_INSTRUCTION)
	require an_instruction/=Void
	do
		llvminsert_into_builder(handle,an_instruction.handle)
	end

	insert_with_name (a_value: LLVM_VALUE; a_name: ABSTRACT_STRING)
	require 
		a_value/=Void
		a_name/=Void
	do
		llvminsert_into_builder_with_name(handle,a_value.handle,a_name.to_external)
	end
feature {ANY} -- Terminators 
	return_void: LLVM_RETURN_INST
		do
			create Result.from_external_pointer(llvmbuild_ret_void(handle))
		end
	
	return (a_value: LLVM_VALUE): LLVM_RETURN_INST
		-- A "ret" instruction returing `a_value'
	require a_value/=Void
	do
		create Result.from_external_pointer(llvmbuild_ret(handle,a_value.handle))
	ensure Result/=Void
	end
	
	aggregate_return (some_values: COLLECTION[LLVM_VALUE]): LLVM_RETURN_INST
		-- A "ret" instruction returning `some_values'.
	require some_values/=Void; not some_values.is_empty
	local sv: FAST_ARRAY[POINTER]; i: ITERATOR[LLVM_VALUE]
	do
		create sv.with_capacity(some_values.count)
		from i:=some_values.new_iterator; i.start 
		until i.is_off loop
			sv.add_last(i.item.handle); i.next
		end
		create Result.from_external_pointer
		(llvmbuild_aggregate_ret(handle,sv.to_external,some_values.count.to_natural_32))
	ensure Result/=Void
	end
	
	unconditional_branch (a_destination: LLVM_BASIC_BLOCK): LLVM_BRANCH_INST
		-- An unconditional branch "br" instruction that transfer the control
		-- flow to a different basic block in the current function.
	require a_destination/=Void
	do
		create Result.from_external_pointer(llvmbuild_br(handle,a_destination.handle))
	ensure Result/=Void
	end

	conditional_branch (an_if: LLVM_VALUE; a_then, an_else: LLVM_BASIC_BLOCK): LLVM_BRANCH_INST
		-- A conditional branch "br" instruction that will pass control flow to
		-- `a_then' if `an_if' evaluates to True, to `an_else' otherwise
	require 
		an_if/=Void
		a_then/=Void
		an_else/=Void
	do
		create Result.from_external_pointer (llvmbuild_cond_br
		(handle, an_if.handle, a_then.handle, an_else.handle))
	ensure Result/=Void
	end

	switch (a_value: LLVM_VALUE; an_else: LLVM_BASIC_BLOCK; a_number_of_cases: NATURAL_32): LLVM_SWITCH_INST
		-- A 'switch' instruction, used to transfer control flow to one of
		-- several different places. It is a generalization of the 'br'
		-- instruction, allowing a branch to occur to one of many possible
		-- destinations. `an_else' is executed when `a_value' will not match
		-- one of the cases added later with `add_case' which must be exactly
		-- `a_number_of_cases'.
	require 
		a_value/=Void
		an_else/=Void
	do
		create Result.from_external_pointer
		(llvmbuild_switch(handle,a_value.handle,an_else.handle,a_number_of_cases))
	ensure Result/=Void
	end

	invoke (a_function: LLVM_FUNCTION_TYPE; some_arguments: COLLECTION[LLVM_VALUE]; a_then, a_catch: LLVM_BASIC_BLOCK; a_name: ABSTRACT_STRING): LLVM_INVOKE_INST
		-- An "invoke" instruction. If `a_function' is parameterless `some_arguments' is not used and can be Void. 
		-- TODO: specify the meaning of `a_then' and `a_catch'.
		require
			a_function/=Void
			a_then/=Void
			a_catch/=Void
			a_name/=Void
			some_arguments=Void implies a_function.parameters_count=0
			some_arguments/=Void implies a_function.parameters_count>0 and not some_arguments.is_empty
		local args: FAST_ARRAY[POINTER]; args_p: POINTER
		do
			if some_arguments/=Void and then not some_arguments.is_empty then
				args:=collection_to_c_array(some_arguments)
				args_p := args.to_external
			end
			create Result.from_external_pointer
			(llvmbuild_invoke(handle,a_function.handle,
			args_p,args.count.to_natural_32,
			a_then.handle,a_catch.handle, a_name.to_external))
		ensure Result/=Void
		end

	unreachable: LLVM_VALUE
		-- A newly create 'unreachable' instruction; it has no defined
		-- semantics. This instruction is used to inform the optimizer that a
		-- particular portion of the code is not reachable. This can be used to
		-- indicate that the code after a no-return function cannot be reached,
		-- and other facts.
	do
		create Result.from_external_pointer (llvmbuild_unreachable(handle))
	ensure Result/=Void
	end

feature {ANY} -- Arithmetic
	add (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- A newly created `add' instruction with `a_name' summing `a_left' and `a_right'.
		-- The two arguments to the 'add' instruction must be integer or vector
		-- of integer values. Both arguments must have identical types.
		
		-- If the sum has unsigned overflow, the result returned is the
		-- mathematical result modulo 2n, where n is the bit width of the
		-- result.

		-- Because LLVM integers use a two's complement representation, this
		-- instruction is appropriate for both signed and unsigned integers.

		-- The "nuw" and "nsw" variant of this instruction stand for "No
		-- Unsigned Wrap" and "No Signed Wrap", respectively. If the nuw and/or
		-- nsw keywords are present, the result value of the add is undefined
		-- if unsigned and/or signed overflow, respectively, occurs.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		integers_or_vectors: a_left.type.is_integer or a_left.is_constant_vector
		vectors_are_of_integers: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_integer
		do
			create Result.from_external_pointer
			(llvmbuild_add(handle,a_left.handle, a_right.handle, a_name.to_external))
		ensure 
			Result/=Void
			Result.type ~ a_left.type 
		end

	no_signed_wrap_addition, nsw_add (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_ADD_OPERATOR
		-- A newly created `no-signed-wrap-add' instruction with `a_name' summing `a_left' and `a_right'. See `add' for further informations.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		integers_or_vectors: a_left.type.is_integer or a_left.is_constant_vector
		vectors_are_of_integers: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer
		(llvmbuild_nswadd(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end

	float_add, fadd (a_left,a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- The 'fadd' instruction returns the sum of its two operands that must
		-- be floating point or vector of floating point values and must have
		-- identical types. The value produced is the floating point sum of the
		-- two operands.
	require
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		floating_points_or_vectors: a_left.is_constant_fp or a_left.is_constant_vector
		vectors_are_of_floats: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_floating_point
	do
		create Result.from_external_pointer
		(llvmbuild_fadd(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure 
		Result/=Void
		Result.type ~ a_left.type 
	end
	
	sub (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_SUB_OPERATOR
		-- An integer subtraction operation on `a_left' and `a_right'.
	require 
		a_left/=Void
		a_right/=Void
		identical_type: a_left.type ~ a_right.type 
		integers_or_vectors: a_left.type.is_integer or a_left.is_constant_vector
		vectors_are_of_integers: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_sub(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end

	mul (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- Create a 'mul' instruction that multiplyies `a_left' and `a_right', with `a_name'. 

		-- If the result of the multiplication has unsigned overflow, the
		-- result returned is the mathematical result modulo 2n, where n is the
		-- bit width of the result.

		-- Because LLVM integers use a two's complement representation, and the
		-- result is the same width as the operands, this instruction returns
		-- the correct result for both signed and unsigned integers. If a full
		-- product (e.g. i32xi32->i64) is needed, the operands should be
		-- sign-extended or zero-extended as appropriate to the width of the
		-- full product.

		-- nuw and nsw variants stand for "No Unsigned Wrap" and "No Signed
		-- Wrap", respectively. If the nuw and/or nsw keywords are present, the
		-- result value of the mul is undefined if unsigned and/or signed
		-- overflow, respectively, occurs.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		integers_or_vectors: a_left.type.is_integer or a_left.is_constant_vector
		vectors_are_of_integers: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer
		(llvmbuild_mul(handle,a_left.handle, a_right.handle, a_name.to_external))
	ensure 
		Result/=Void
		Result.type ~ a_left.type 
	end

	float_multiplication, fmul (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- The product of `a_left' and `a_right', labelled with `a_name'
	require
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		floating_points_or_vectors: a_left.is_constant_fp or a_left.is_constant_vector
		vectors_are_of_floats: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_floating_point
	do
		create Result.from_external_pointer(llvmbuild_fmul(handle,a_left.handle,a_right.handle, a_name.to_external))
	ensure 
		Result/=Void
		Result.type ~ a_left.type 
	end

	udiv, unsigned_division (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- The unsigned integer quotient of `a_left' divided by `a_right'. 

		-- Note that unsigned integer division and signed integer division are
		-- distinct operations; for signed integer division, use 'sdiv'.

		-- Division by zero leads to undefined behavior.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		integers_or_vectors: a_left.type.is_integer or a_left.is_constant_vector
		vectors_are_of_integers: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_udiv(handle,a_left.handle,a_right.handle,a_name.to_external)) 
	ensure 
		Result/=Void
		Result.type ~ a_left.type 
	end

	signed_division (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- The signed integer quotient of `a_left' and `a_right' rounded towards zero.

		-- Note that signed integer division and unsigned integer division are
		-- distinct operations; for unsigned integer division, use 'udiv'.

		-- Division by zero leads to undefined behavior. Overflow also leads to
		-- undefined behavior; this is a rare case, but can occur, for example,
		-- by doing a 32-bit division of -2147483648 by -1.

		-- TODO: If the exact keyword is present, the result value of the sdiv
		-- is undefined if the result would be rounded or if overflow would
		-- occur.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		integers_or_vectors: a_left.type.is_integer or a_left.is_constant_vector
		vectors_are_of_integers: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_udiv(handle,a_left.handle,a_right.handle,a_name.to_external)) 
	ensure 
		Result/=Void
		Result.type ~ a_left.type 
	end

	exact_signed_division (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- An "exact sdiv" operation, the exact, signed integer quotient of
		-- `a_left' and `a_right' rounded towards zero.

		-- The result value of the sdiv is undefined if the result would be
		-- rounded or if overflow would occur.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		integers_or_vectors: a_left.type.is_integer or a_left.is_constant_vector
		vectors_are_of_integers: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_exact_sdiv(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure 
		Result/=Void
		Result.type ~ a_left.type 
	end
	
	float_division  (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- An 'fdiv' instruction, the floating point quotient of `a_left' and `a_right'.
	require
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		floating_points_or_vectors: a_left.is_constant_fp or a_left.is_constant_vector
		vectors_are_of_floats: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_floating_point
	do
		create Result.from_external_pointer(llvmbuild_fdiv(handle,a_left.handle,a_right.handle, a_name.to_external))
	ensure 
		Result/=Void
		Result.type ~ a_left.type 
	end

	unsigned_remainder (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- A 'urem' instruction computing the unsigned integer remainder of the
		-- unsigned division of `a_left' and `a_right'.To get the remainder an
		-- unsigned division is always performed.

		-- Note that unsigned integer remainder and signed integer remainder
		-- are distinct operations; for signed integer remainder, use `srem'.

		-- Taking the remainder of a division by zero leads to undefined behavior.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		integers_or_vectors_of_integers: a_left.type.is_integer or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_urem(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end

	signed_remainder (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- A 'srem' instruction computing the signed integer remainder of the
		-- signed division of `a_left' and `a_right'.To get the remainder an
		-- signed division is always performed.

		-- This instruction returns the remainder of a division (where the
		-- result has the same sign as the dividend, `a_left'), not the modulo
		-- operator (where the result has the same sign as the divisor,
		-- 'a_right') of a value. For more information about the difference,
		-- see The Math Forum. For a table of how this is implemented in
		-- various languages, please see
		-- http://en.wikipedia.org/wiki/Modulo_operation

		-- Note that signed integer remainder and unsigned integer remainder
		-- are distinct operations; for unsigned integer remainder, use `urem'.

		-- Taking the remainder of a division by zero leads to undefined
		-- behavior. Overflow also leads to undefined behavior; this is a rare
		-- case, but can occur, for example, by taking the remainder of a
		-- 32-bit division of -2147483648 by -1. (The remainder doesn't
		-- actually overflow, but this rule lets srem be implemented using
		-- instructions that return both the result of the division and the
		-- remainder.)	
		
		-- Note that unsigned integer remainder and signed integer remainder
		-- are distinct operations; for signed integer remainder, use `srem'.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		integers_or_vectors_of_integers: a_left.type.is_integer or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_srem(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end

	float_remainder (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- An 'frem' instruction computing the remainder of the division of `a_left' and `a_right'.
		-- The remainder has the same sign as the dividend.
	require
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		floating_points_or_vectors_of_floats: a_left.is_constant_fp or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_floating_point
	do
		create Result.from_external_pointer(llvmbuild_frem(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end		

	shift_left (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- A 'shl' instruction that computes `a_left' shifted to the left by a number of bits specified in `a_right'.

		-- The value produced is op1 * 2op2 mod 2n, where n is the width of the result. If op2 is (statically or dynamically) negative or equal to or larger than the number of bits in op1, the result is undefined. If the arguments are vectors, each vector element of op1 is shifted by the corresponding shift amount in op2.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		integers_or_vectors_of_integers: a_left.type.is_integer or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_shl(handle,a_left.handle,a_right.handle,a_name.to_external)) 
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end
	
	logical_shift_right (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- A "lshr" instruction (logical shift right), computing `a_left' shifted to the right by the number of bits specified in `a_right' with zero fill.

		-- This instruction always performs a logical shift right operation.
		-- The most significant bits of the result will be filled with zero
		-- bits after the shift. If op2 is (statically or dynamically) equal to
		-- or larger than the number of bits in op1, the result is undefined.
		-- If the arguments are vectors, each vector element of op1 is shifted
		-- by the corresponding shift amount in op2.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		integers_or_vectors_of_integers: a_left.type.is_integer or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_lshr(handle,a_left.handle,a_right.handle,a_name.to_external)) 
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end

	arithmetic_shift_right (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- An "ashr" instruction (arithmetic shift right), computing `a_left shifted to the right by the number of bits specified in `a_right' with sign extension. `a_right' is treated as an unsigned value. 

		-- This instruction always performs an arithmetic shift right operation, The most significant bits of the result will be filled with the sign bit of `a_left'. If `a_right' is (statically or dynamically) equal to or larger than the number of bits in `a_left', the result is undefined. If the arguments are vectors, each vector element of `a_left' is shifted by the corresponding shift amount in 'a_right'.
		require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		integers_or_vectors_of_integers: a_left.type.is_integer or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_ashr(handle,a_left.handle,a_right.handle,a_name.to_external)) 
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end

feature {ANY} -- Logical operators
	logical_and (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- An "and" instruction, the bitwise logical and of `a_left' and `a_right'.
		require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		integers_or_vectors_of_integers: a_left.type.is_integer or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
		do
			create Result.from_external_pointer(llvmbuild_and(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end

	logical_or (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- An "or" instruction, the bitwise logical or of `a_left' and `a_right'.
		require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		integers_or_vectors_of_integers: a_left.type.is_integer or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
		do
			create Result.from_external_pointer(llvmbuild_or(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end
		
	logical_xor (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- A "xor" instruction, the bitwise exclusive logical or of `a_left' and `a_right'.
		require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left.type ~ a_right.type 
		integers_or_vectors_of_integers: a_left.type.is_integer or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
		do
			create Result.from_external_pointer(llvmbuild_xor(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end
	
	logical_neg (a_value: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- TODO: provide description, semating, preconditions and postconditions.
	require a_value/=Void
 	do
		create Result.from_external_pointer(llvmbuild_neg(handle,a_value.handle,a_name.to_external))
	ensure Result/=Void
	end
	
	logical_not (a_value: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE
		-- TODO: provide description, semating, preconditions and postconditions.
	require a_value/=Void
 	do
		create Result.from_external_pointer(llvmbuild_not(handle,a_value.handle, a_name.to_external))
	ensure Result/=Void
	end

feature {ANY} -- Memory
	malloc_inst (a_type: LLVM_TYPE; a_name: ABSTRACT_STRING): LLVM_MALLOC_INST
		-- A 'malloc' instruction allocating memory for `a_type' on the system heap and returning a pointer to it. The object is always allocated in the generic address space (address space zero). Memory is allocated using the system "malloc" function, and a pointer is returned. The result of a zero byte allocation is undefined. The result is null if there is insufficient memory available.

		-- TODO: LLVM assembly language allows to specify the alignment of the allocation but I coudln't figure how to implement if using the C bindings we are relying on. 
	require
		a_type/=Void
		-- TODO type must be sized
	do
		create Result.from_external_pointer(llvmbuild_malloc(handle, a_type.handle,a_name.to_external))
	ensure Result/=Void
	end


	array_malloc (a_type: LLVM_TYPE; a_number: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_MALLOC_INST
		-- A 'malloc' instruction allocateing memory from the system heap for
		-- `a_number' of objects of `a_type' returing a pointer to it. The
		-- object is always allocated in the generic address space (address
		-- space zero). The result of a zero byte allocation is undefined. The
		-- result is null if there is insufficient memory available.
	require
		a_type/=Void
		-- TODO type must be sized
		a_number/=Void
		a_number.type.is_integer
		a_name/=Void
	do
		create Result.from_external_pointer(llvmbuild_array_malloc(handle,a_type.handle, a_number.handle, a_name.to_external))
	ensure
		Result/=Void
	end

	alloca_inst (a_type: LLVM_TYPE; a_name: ABSTRACT_STRING): LLVM_ALLOCA_INST
		-- An "alloca" instruction allocating memory for an instance of
		-- `a_type' on the stack frame of the currently executing function, to
		-- be automatically released when this function returns to its caller.
		-- The object is always allocated in the generic address space (address
		-- space zero).

		-- The operation is undefined if there is insufficient stack space for
		-- the allocation. 'alloca'd memory is automatically released when the
		-- function returns. The 'alloca' instruction is commonly used to
		-- represent automatic variables that must have an address available.
		-- When the function returns (either with the ret or unwind
		-- instructions), the memory is reclaimed. Allocating zero bytes is
		-- legal, but the result is undefined.
	require 
		a_type/=Void
		-- TODO: a_type.is_sized
	do
		create Result.from_external_pointer(llvmbuild_alloca(handle,a_type.handle,a_name.to_external))
	ensure	
		Result/=Void
	end

	array_alloca (a_type: LLVM_TYPE; a_number: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_ALLOCA_INST
		-- An "alloca" instruction allocating memory for `a_number' of instances of
		-- `a_type' on the stack frame of the currently executing function, to
		-- be automatically released when this function returns to its caller.
		-- See `alloca' for further informations.
	require 
		a_type/=Void
		-- TODO: a_type.is_sized
		a_number/=Void
		a_number.type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_array_alloca(handle,a_type.handle,a_number.handle,a_name.to_external))
	ensure
		Result/=Void
	end

	llvm_free (a_value: LLVM_VALUE): LLVM_FREE_INST
		-- A 'free' instruction returning memory back to the unused memory heap
		-- to be reallocated in the future.

		-- Access to the memory pointed to by the pointer is no longer defined
		-- after this instruction executes. If the pointer is null, the
		-- operation is a noop.
	require
		a_value/=Void
		a_value.type.is_pointer
		-- TODO: a value was allocated with a 'malloc' instruction
	do
		create Result.from_external_pointer(llvmbuild_free(handle, a_value.handle))
	ensure Result/=Void
	end

 	load (a_location: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_LOAD_INST
		-- A 'load' instruction that will read from memory `a_location' that
		-- specifies the memory address from which to load.
	
		-- TODO: LLVM allows to mark the load as volatile; this is currently
		-- not supported. If the load is marked as volatile, then the optimizer
		-- is not allowed to modify the number or order of execution of this
		-- load with other volatile load and store instructions.
 
		-- Semantics: The location of memory pointed to is loaded. If the value
		-- being loaded is of scalar type then the number of bytes read does
		-- not exceed the minimum number of bytes needed to hold all bits of
		-- the type. For example, loading an i24 reads at most three bytes.
		-- When loading a value of a type like i20 with a size that is not an
		-- integral number of bytes, the result is undefined if the value was
		-- not originally written using a store of the same type.
	require 
		a_location/=Void
		-- TODO: a_location.is_pointer
		-- TODO: The pointer must point to a first class type. 
	do
		create Result.from_external_pointer(llvmbuild_load(handle,a_location.handle,a_name.to_external))
	ensure Result/=Void
	end

	store (a_value: LLVM_VALUE; a_pointer: LLVM_VALUE): LLVM_STORE_INST
		-- A 'store' instruction that will update memory at `an_address' to
		-- contain `a_value'. 
		
		-- If `a_value' is of scalar type then the number of bytes written does
		-- not exceed the minimum number of bytes needed to hold all bits of
		-- the type. For example, storing an i24 writes at most three bytes.
		-- When writing a value of a type like i20 with a size that is not an
		-- integral number of bytes, it is unspecified what happens to the
		-- extra bits that do not belong to the type, but they will typically
		-- be overwritten. 

		-- TODO: volatile store is currently not supported so the following
		-- does not apply. If the store is marked as volatile, then the
		-- optimizer is not allowed to modify the number or order of execution
		-- of this store with other volatile load and store instructions.

		-- TODO: LLVM support specific alignement but it is currently not provided. The following does not apply.The optional constant "align" argument specifies the alignment of the operation (that is, the alignment of the memory address). A value of 0 or an omitted "align" argument means that the operation has the preferential alignment for the target. It is the responsibility of the code emitter to ensure that the alignment information is correct. Overestimating the alignment results in an undefined behavior. Underestimating the alignment may produce less efficient code. An alignment of 1 is always safe.
	require
		a_value/=Void
		a_pointer/=Void
		-- TODO: a_pointer.is_pointer 
		-- TODO: a_pointer must be a pointer to the same type of a_value which must be a first class type.
	do
		create Result.from_external_pointer(llvmbuild_store(handle,a_value.handle,a_pointer.handle))
	ensure	
		Result/=Void
	end

	get_element_pointer (a_pointer: LLVM_VALUE; some_indices: COLLECTION[LLVM_VALUE]; a_name: ABSTRACT_STRING): LLVM_GEP_OPERATOR
		-- A "get element pointer" intruction 

	require
		-- TODO: a_pointer should point to what?
		a_name/=Void
	local indices: FAST_ARRAY[POINTER]
	do
		-- Intentionally avoiding WRAPPER_COLLECTION to avoid tricks with native arrays
		indices := collection_to_c_array(some_indices)
		create Result.from_external_pointer(llvmbuild_gep(handle, a_pointer.handle, indices.to_external, some_indices.count.to_natural_32, a_name.to_external))
	ensure Result/=Void
	end
	

	-- TODO: wrap LLVMValueRef LLVMBuildInBoundsGEP(LLVMBuilderRef B, LLVMValueRef Pointer,
	--                                   LLVMValueRef *Indices, unsigned NumIndices,
	--                                   const char *Name);

	get_struct_element_pointer (a_pointer: LLVM_VALUE; an_index: NATURAL_32; a_name: ABSTRACT_STRING): LLVM_GEP_OPERATOR
		-- "getelementpointer" of a structure field
	require 
		-- TODO: a_pointer should point to a struct
		a_name/=Void
	do
		-- LLVMValueRef LLVMBuildStructGEP(LLVMBuilderRef B, LLVMValueRef Pointer,
		--                                 unsigned Idx, const char *Name);
		create Result.from_external_pointer(llvmbuild_struct_gep(handle,a_pointer.handle, an_index, a_name.to_external))
	ensure 
		Result/=Void
	end

	global_string (a_string, a_name: ABSTRACT_STRING): LLVM_GLOBAL_VARIABLE
		-- A global string with the content of `a_string' referrable by `a_name'.
	do
		create Result.from_external_pointer(llvmbuild_global_string
		(handle,a_string.to_external, a_name.to_external))
	ensure
		Result/=Void
	end

	-- TODO: discover the difference between LLVMBuildGlobalString and LLVMBuildGlobalStringPtr from Liberty point of view.

	-- LLVMValueRef LLVMBuildGlobalStringPtr(LLVMBuilderRef B, const char *Str,
	--                                       const char *Name);
	-- 
feature {ANY} -- Casts
	trunc (a_value: LLVM_VALUE; a_destination_type: LLVM_INTEGER_TYPE; a_name: ABSTRACT_STRING): LLVM_TRUNC_INST
		-- A "trunc" instruction; `a_value' an integer type larger than
		-- `a_destination_type' will be truncated to the size of
		-- `a_destination_type'. Equal sized types are not allowed.

		-- The "trunc" instruction truncates the high order bits in value and
		-- converts the remaining bits to `a_destination_type'. Since the
		-- source size must be larger than the destination size, "trunc" cannot
		-- be a no-op cast. It will always truncate bits.
		require 
			a_value/=Void
			value_is_integer: a_value.type.is_integer
			-- TODO: value_width_larger_than_destination: a_value.type
			a_destination_type/=Void
			a_name/=Void
		do
			create Result.from_external_pointer(llvmbuild_trunc(handle,a_value.handle,a_destination_type.handle,a_name.to_external))
		ensure 
			Result/=Void
			Result.type ~ a_destination_type
		end

	zero_extend, zext (a_value: LLVM_VALUE; a_destination_type: LLVM_INTEGER_TYPE; a_name: ABSTRACT_STRING): LLVM_ZEXT_INST
		-- A "zext" instruction; it will fill the high order bits of `a_value' until it reaches the size of `a_destination_type'. 
		-- When zero extending from an "i1", the result will always be either 0 or 1.
		require
			a_value/=Void
			a_destination_type/=Void
			a_name/=Void
		do
			create Result.from_external_pointer(llvmbuild_zext(handle,a_value.handle,a_destination_type.handle,a_name.to_external))
		ensure
			Result/=Void
		end

	sign_extend, sext (a_value: LLVM_VALUE; a_destination_type: LLVM_TYPE; a_label: ABSTRACT_STRING): LLVM_SEXT_INST
		-- A new "sext" instruction, that will sign extend `a_value' to until fits `a_destination_type'.

		-- `a_value' must be of an integer type; also `a_destination_type' shall be of integer type.
		-- The bit size of the value must be smaller than the bit size of the destination type, ty2.

		-- A "sext" instruction performs a sign extension by copying the sign
		-- bit (highest order bit) of the value until it reaches the bit size
		-- of the type ty2.

		-- When sign extending from i1, the extension always results in -1 or 0.
		require
			a_value/=Void
			a_destination_type/=Void
			a_label/=Void
			--TODO a_value is an integer
			-- TODO: a_destination_type shall be an integer type
		do
			create Result.from_external_pointer
			(llvmbuild_sext(handle,a_value.handle,a_destination_type.handle,a_label.to_external))
		ensure Result/=Void
		end

	floating_point_to_unsigned_integer, fptoui (a_value: LLVM_VALUE; a_type: LLVM_TYPE; a_label: ABSTRACT_STRING): LLVM_FPTOUI_INST
		-- A new "fptoui" instruction that converts the floating point `a_value' to its unsigned integer equivalent of `a_type'.

		-- `a_value' must be a scalar or vector floating point value, and `a_type' must be an integer type. If ty is a vector floating point type, ty2 must be a vector integer type with the same number of elements as ty

		-- The 'fptoui' instruction converts its floating point operand into the nearest (rounding towards zero) unsigned integer value. If the value cannot fit in ty2, the results are undefined.
	require 
		a_value/=Void
		a_type/=Void
		a_label/=Void
		float_or_float_vector: a_value.type.is_floating_point or a_value.type.is_vector and then a_value.type.as_vector.element_type.is_floating_point
		when_vector_destination_is_vector: a_value.type.is_vector implies a_type.is_vector and then a_value.type.as_vector.size = a_type.as_vector.size
	do
		create Result.from_external_pointer(llvmbuild_fpto_ui(handle,a_value.handle,a_type.handle,a_label.to_external))
	ensure Result/=Void
	end

-- LLVMValueRef LLVMBuildFPToSI(LLVMBuilderRef, LLVMValueRef Val,
--                              LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildUIToFP(LLVMBuilderRef, LLVMValueRef Val,
--                              LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildSIToFP(LLVMBuilderRef, LLVMValueRef Val,
--                              LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildFPTrunc(LLVMBuilderRef, LLVMValueRef Val,
--                               LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildFPExt(LLVMBuilderRef, LLVMValueRef Val,
--                             LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildPtrToInt(LLVMBuilderRef, LLVMValueRef Val,
--                                LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildIntToPtr(LLVMBuilderRef, LLVMValueRef Val,
--                                LLVMTypeRef DestTy, const char *Name);
	bit_cast (a_value: LLVM_VALUE; a_destination_type: LLVM_TYPE; a_name: ABSTRACT_STRING): LLVM_BITCAST_INST
		-- An instruction casting `a_value' into `a_destination_type'.
	require
		a_value/=Void
		a_destination_type/=Void
		a_name/=Void
	do
		create Result.from_external_pointer(llvmbuild_bit_cast(handle,a_value.handle,a_destination_type.handle,a_name.to_external))
	ensure Result/=Void
	end

-- LLVMValueRef LLVMBuildZExtOrBitCast(LLVMBuilderRef, LLVMValueRef Val,
--                                     LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildSExtOrBitCast(LLVMBuilderRef, LLVMValueRef Val,
--                                     LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildTruncOrBitCast(LLVMBuilderRef, LLVMValueRef Val,
--                                      LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildPointerCast(LLVMBuilderRef, LLVMValueRef Val,
--                                   LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildIntCast(LLVMBuilderRef, LLVMValueRef Val,
--                               LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildFPCast(LLVMBuilderRef, LLVMValueRef Val,
--                              LLVMTypeRef DestTy, const char *Name);
-- 
feature {ANY} -- Comparisons
	icmp (a_predicate: LLVMINT_PREDICATE_ENUM; a_left,a_right: LLVM_VALUE;a_name: ABSTRACT_STRING): LLVM_ICMP_INST
		-- An 'icmp' instruction that will return a boolean value or a vector of boolean values based on comparison of its two integer, integer vector, or pointer operands. `a_predicate' is the condition code indicating the kind of comparison to perform. In LLVM assembler it is not a value, but a keyword. The possible condition code are:

		--   1. eq: equal
		--   2. ne: not equal
		--   3. ugt: unsigned greater than
		--   4. uge: unsigned greater or equal
		--   5. ult: unsigned less than
		--   6. ule: unsigned less or equal
		--   7. sgt: signed greater than
		--   8. sge: signed greater or equal
		--   9. slt: signed less than
		--  10. sle: signed less or equal
		
		--The remaining two arguments must be integer or pointer or integer vector typed. They must also be identical types.
		--Semantics:
		--
		--The 'icmp' compares op1 and op2 according to the condition code given as cond. The comparison performed always yields either an i1 or vector of i1 result, as follows:
		--
		--   1. eq: yields true if the operands are equal, false otherwise. No sign interpretation is necessary or performed.
		--   2. ne: yields true if the operands are unequal, false otherwise. No sign interpretation is necessary or performed.
		--   3. ugt: interprets the operands as unsigned values and yields true if op1 is greater than op2.
		--   4. uge: interprets the operands as unsigned values and yields true if op1 is greater than or equal to op2.
		--   5. ult: interprets the operands as unsigned values and yields true if op1 is less than op2.
		--   6. ule: interprets the operands as unsigned values and yields true if op1 is less than or equal to op2.
		--   7. sgt: interprets the operands as signed values and yields true if op1 is greater than op2.
		--   8. sge: interprets the operands as signed values and yields true if op1 is greater than or equal to op2.
		--   9. slt: interprets the operands as signed values and yields true if op1 is less than op2.
		--  10. sle: interprets the operands as signed values and yields true if op1 is less than or equal to op2.
		--
		--If the operands are pointer typed, the pointer values are compared as if they were integers.
		--
		--If the operands are integer vectors, then they are compared element by element. The result is an i1 vector with the same number of elements as the values being compared. Otherwise, the result is an i1.
		--
		require 
			a_left/=Void
			a_right=Void
			same_type: a_left.type ~ a_right.type 
			same_size_vectors: a_left.is_constant_vector implies a_left.as_constant_vector.type.size = a_right.as_constant_vector.type.size
		do
			create Result.from_external_pointer(llvmbuild_icmp(handle,a_predicate.value,
			a_left.handle,a_right.handle,a_name.to_external))
		ensure 
			Result/=Void
			-- TODO: result type is an i1 or a vector 
			-- TODO: a_left.is_constant_vector implies the-result-of-the-instruction.is_constant_vector and then a_left.as_constant_vector.type.size = Result.as
		end

	fcmp (a_predicate: LLVMREAL_PREDICATE_ENUM; a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_FCMP_INST
		-- Floating point comparison. 

		-- TODO: adapt main LLVM documentation
	require
		a_left/=Void
		a_right/=Void
		a_name/=Void
		same_type: a_left.type ~ a_right.type
		-- TODO: provide remaining preconditions
	do
		create Result.from_external_pointer
		(llvmbuild_fcmp(handle, a_predicate.value, a_left.handle, a_right.handle, a_name.to_external))
	ensure 
		Result/=Void
	end

feature {ANY} -- Miscellaneous instructions

	-- LLVMValueRef LLVMBuildPhi(LLVMBuilderRef, LLVMTypeRef Ty, const char *Name);

	call (a_function: LLVM_FUNCTION; some_arguments: COLLECTION[LLVM_VALUE]; a_name: ABSTRACT_STRING): LLVM_CALL_INST
		-- A "call" instruction that will invoke `a_function' with `some_arguments'

		-- TODO: adapt main LLVM doc
	require
		a_function/=Void
		some_arguments/=Void 
		-- TODO: allow some_arguments=Void for argument-less functions.
		a_name/=Void
	do
		create Result.from_external_pointer
		(llvmbuild_call(handle, a_function.handle, collection_to_c_array(some_arguments).storage.to_external,some_arguments.count.to_natural_32,a_name.to_external))
	ensure 
		Result/=Void
	end

	select_inst (an_if, a_then, an_else: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_SELECT_INST
		-- A new 'select' instruction which choose one value based on a condition, without branching.

		-- The 'select' instruction requires an 'i1' value or a vector of 'i1' values indicating the condition, and two values of the same first class type. If the val1/val2 are vectors and the condition is a scalar, then entire vectors are selected, not individual elements.

		-- If the condition is an i1 and it evaluates to 1, the instruction returns the first value argument; otherwise, it returns the second value argument. If the condition is a vector of i2, then the value arguments must be vectors of the same size, and the selection is done element by element.
	require 
		an_if /= Void
		a_then /= Void
		an_else /= Void
		a_name /= Void
		an_if_is_boolean: {LLVM_INTEGER_TYPE} ?:= an_if.type
	do
		create Result.from_external_pointer(llvmbuild_select(handle,an_if.handle,a_then.handle,an_else.handle,a_name.to_external))
	ensure
		Result/=Void
	end

	-- LLVMValueRef LLVMBuildVAArg(LLVMBuilderRef, LLVMValueRef List, LLVMTypeRef Ty,
--                             const char *Name);
feature {ANY} -- Instructions on vectors
	extract_element(a_vector: LLVM_VALUE; an_index: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_EXTRACT_VALUE_INST
		-- An "extract_element" instruction that will extract the element of `a_vector' referred by `an_index'.

		-- TODO: C API requires an_index to be a LLVMValueRef; currently Liberty wrappers do not distinguish them.
	require
		a_vector/=Void
		an_index/=Void
		a_name/=Void
	do
		create Result.from_external_pointer(llvmbuild_extract_element
		(handle,a_vector.handle,an_index.handle, a_name.to_external))
	ensure Result/=Void
	end

	insert_element (a_vector: LLVM_VALUE; an_element: LLVM_VALUE; an_index: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_INSERT_ELEMENT_INST
		-- An "insertelement" instruction that will insert `an_element' into
		-- `a_vector' at `an_index'. The result of this instruction will be a
		-- vector of the same type as `a_vector'; its element values will be
		-- those of `a_vector' except at position `an_index', where it gets
		-- `an_element'. If `an_index' exceeds the length of `a_vector', the
		-- results are undefined (TODO: perhaps this shall be changed into a
		-- precondition).

	require 
		a_vector/=Void
		an_element/=Void
		an_index/=Void
		a_vector.type.is_vector
		an_element_fits_into_a_vector: a_vector.type.as_vector.element_type.is_equal(an_element.type)
	do
		create Result.from_external_pointer(llvmbuild_insert_element
		(handle, a_vector.handle, an_element.handle, an_index.handle, a_name.to_external))
	ensure Result/=Void
	end

	shuffle_vector (a_vector, another_vector: LLVM_VALUE; a_mask: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_SHUFFLE_VECTOR_INST
		-- A "shufflevector" instruction that will construct a permutation of
		-- elements from `a_vector' and `another_vector', returning a vector
		-- with the same element type as the input and length that is the same
		-- as the shuffle mask.
		
		-- The third argument is a shuffle mask whose element type is always
		-- 'i32'. The result of the instruction is a vector whose length is the
		-- same as the shuffle mask and whose element type is the same as the
		-- element type of the first two operands.
		
		-- The shuffle mask operand is required to be a constant vector with
		-- either constant integer or undef values. (TODO: turn it into a precondition).
		
		-- The elements of the two input vectors are numbered from left to
		-- right across both of the vectors. The shuffle mask operand
		-- specifies, for each element of the result vector, which element of
		-- the two input vectors the result element gets. The element selector
		-- may be undef (meaning "don't care") and the second operand may be
		-- undef if performing a shuffle from only one vector.
	require
		a_vector/=Void
		another_vector/=Void
		a_mask/=Void
		a_name/=Void
		vectors_fits: a_vector.type ~ another_vector.type
		both_are_vectors: a_vector.type.is_vector and another_vector.type.is_vector
		same_element_type: a_vector.type.as_vector.element_type ~ another_vector.type.as_vector.element_type
		mask_is_a_vector_of_32bit_integers: a_mask.type.is_vector and then a_mask.type.as_vector.element_type.is_integer and then a_mask.type.as_vector.element_type.as_integer.width.to_integer_32 = 32
	do
		create Result.from_external_pointer(llvmbuild_shuffle_vector
		(handle, a_vector.handle,another_vector.handle, a_mask.handle, a_name.to_external))
	ensure Result/=Void
	end

feature {ANY} -- Instructions on aggregates (structures or arrays)
	extract_value (an_aggregate: LLVM_VALUE; an_index: NATURAL_32; a_name: ABSTRACT_STRING): LLVM_EXTRACT_VALUE_INST
		-- An "extractvalue" instruction that will extract the value of a struct field or array element from `an_aggregate' value.
	require
		an_aggregate/=Void
		a_name/=Void
		an_aggregate.type.is_struct or an_aggregate.type.is_array
	do
		create Result.from_external_pointer(llvmbuild_extract_value
		(handle, an_aggregate.handle, an_index, a_name.to_external))
	ensure	 Result/=Void
	end
		
	insert_value (an_aggregate: LLVM_VALUE; an_element: LLVM_VALUE; an_index: NATURAL_32; a_name: ABSTRACT_STRING): LLVM_INSERT_VALUE_INST
		-- An "insertvalue" instruction that will insert `an_element' at
		-- `an_index' into a struct field or array element in `an_aggregate'.

		-- The first operand of an 'insertvalue' instruction is a value of struct or array type. The second operand is a first-class value to insert. The following operands are constant indices indicating the position at which to insert the value in a similar manner as indices in a 'getelementptr' instruction. The value to insert must have the same type as the value identified by the indices.

		-- The result is an aggregate of the same type as val. Its value is that of val except that the value at the position specified by the indices is that of elt.
	require 
		an_aggregate/=Void
		an_element/=Void
		a_name/=Void
		an_aggregate.type.is_struct or an_aggregate.type.is_array
		an_element_fits_at_an_index: an_element.type.is_equal(an_aggregate.type.as_struct.element(an_index.to_integer_32))
	do
		create Result.from_external_pointer(llvmbuild_insert_value
		(handle,an_aggregate.handle,an_element.handle,an_index,a_name.to_external))
	ensure Result/=Void
	end

	-- LLVMValueRef LLVMBuildIsNull(LLVMBuilderRef, LLVMValueRef Val,
--                              const char *Name);
-- LLVMValueRef LLVMBuildIsNotNull(LLVMBuilderRef, LLVMValueRef Val,
--                                 const char *Name);
-- LLVMValueRef LLVMBuildPtrDiff(LLVMBuilderRef, LLVMValueRef LHS,
--                               LLVMValueRef RHS, const char *Name);
-- 
-- 
feature {} 
	struct_size: like size_t
		do
			not_yet_implemented
		end

	dispose
		do
			llvmdispose_builder(handle)
		end

end -- class LLVM_BUILDER	
-- Copyright (C) 2009-2018: ,2010,2013 Paolo Redaelli - 2013 Cyril Adrian 

-- This file is part of LLVM wrappers for Liberty Eiffel.
--
-- This library is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--

