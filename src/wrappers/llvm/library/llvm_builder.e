class LLVM_BUILDER
	-- An instruction builder representing a point within an LLVM_BASIC_BLOCK; it allows to build instructions using the C interface.

inherit C_STRUCT redefine default_create end 
insert CORE_EXTERNALS redefine default_create end 
creation in_context, default_create
feature -- Creation
	in_context (a_context: LLVM_CONTEXT) is
		-- Create an LLVM_BUILDER in `a_context'.
	require a_context/=Void
	do
		from_external_pointer(llvmcreate_builder_in_context(a_context.handle))
	end

	default_create is
		do
			from_external_pointer(llvmcreate_builder)
		end

feature -- Positioning
	set_position (a_block: LLVM_BASIC_BLOCK; an_instruction: LLVM_VALUE) is
		-- TODO: description
	require
		a_block/=Void
		an_instruction/=Void
	do
		llvmposition_builder(handle,a_block.handle,an_instruction.handle)
	end

	position_before (an_instruction: LLVM_INSTRUCTION) is
		-- Set Current position before `an_instruction'
	require an_instruction/=Void
	do
		llvmposition_builder_before(handle,an_instruction.handle)
	end
	
	position_at_end_of (a_block: LLVM_BASIC_BLOCK) is
		-- Set Current position at the end of `a_block'
	require a_block/=Void
	do
		llvmposition_builder_at_end(handle,a_block.handle)
	end

	insert_block: LLVM_BASIC_BLOCK is
	local p: POINTER
	do
		p := llvmget_insert_block(handle)
		if p.is_not_null then create Result.from_external_pointer(p) end
	end

	clear_insertion_position is
		do
			llvmclear_insertion_position(handle)
		end

	insert_instruction (an_instruction: LLVM_INSTRUCTION) is
	require an_instruction/=Void
	do
		llvminsert_into_builder(handle,an_instruction.handle)
	end

	insert_with_name (a_value: LLVM_VALUE; a_name: ABSTRACT_STRING) is
	require 
		a_value/=Void
		a_name/=Void
	do
		llvminsert_into_builder_with_name(handle,a_value.handle,a_name.to_external)
	end
feature {ANY} -- Terminators 
	return_void: LLVM_RETURN_INST is
		do
			create Result.from_external_pointer(llvmbuild_ret_void(handle))
		end
	
	return (a_value: LLVM_VALUE): LLVM_RETURN_INST is
		-- A "ret" instruction returing `a_value'
	require a_value/=Void
	do
		create Result.from_external_pointer(llvmbuild_ret(handle,a_value.handle))
	ensure Result/=Void
	end
	
	aggregate_return (some_values: COLLECTION[LLVM_VALUE]): LLVM_RETURN_INST is
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
	
	unconditional_branch (a_destination: LLVM_BASIC_BLOCK): LLVM_BRANCH_INST is
		-- An unconditional branch "br" instruction that transfer the control
		-- flow to a different basic block in the current function.
	require a_destination/=Void
	do
		create Result.from_external_pointer(llvmbuild_br(handle,a_destination.handle))
	ensure Result/=Void
	end

	conditional_branch (an_if: LLVM_VALUE; a_then, an_else: LLVM_BASIC_BLOCK): LLVM_BRANCH_INST is
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

	switch (a_value: LLVM_VALUE; an_else: LLVM_BASIC_BLOCK; a_number_of_cases: NATURAL_32): LLVM_SWITCH_INST is
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

	invoke (a_function: LLVM_FUNCTION_TYPE; some_arguments: COLLECTION[LLVM_VALUE]; a_then, a_catch: LLVM_BASIC_BLOCK; a_name: ABSTRACT_STRING): LLVM_INVOKE_INST is
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

	unwind: LLVM_VALUE is
		-- A newly created 'unwind' instruction that will unwind the stack, continuing control flow at the first callee in the dynamic call stack which used an invoke instruction to perform the call. This is primarily used to implement exception handling.
	do
		create Result.from_external_pointer(llvmbuild_unwind(handle))
	ensure Result/=Void
	end

	unreachable: LLVM_VALUE is
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
	add (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
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
		identical_type: a_left ~ a_right 
		integers_or_vectors: a_left.is_constant_int or a_left.is_constant_vector
		vectors_are_of_integers: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_integer
		do
			create Result.from_external_pointer
			(llvmbuild_add(handle,a_left.handle, a_right.handle, a_name.to_external))
		ensure 
			Result/=Void
			Result.type ~ a_left.type 
		end

	no_signed_wrap_addition, nsw_add (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_ADD_OPERATOR is
		-- A newly created `no-signed-wrap-add' instruction with `a_name' summing `a_left' and `a_right'. See `add' for further informations.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left ~ a_right 
		integers_or_vectors: a_left.is_constant_int or a_left.is_constant_vector
		vectors_are_of_integers: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer
		(llvmbuild_nswadd(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end

	float_add, fadd (a_left,a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
		-- The 'fadd' instruction returns the sum of its two operands that must
		-- be floating point or vector of floating point values and must have
		-- identical types. The value produced is the floating point sum of the
		-- two operands.
	require
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left ~ a_right 
		floating_points_or_vectors: a_left.is_constant_fp or a_left.is_constant_vector
		vectors_are_of_floats: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_floating_point
	do
		create Result.from_external_pointer
		(llvmbuild_fadd(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure 
		Result/=Void
		Result.type ~ a_left.type 
	end
	
	sub (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_SUB_OPERATOR is
		-- An integer subtraction operation on `a_left' and `a_right'.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left ~ a_right 
		integers_or_vectors: a_left.is_constant_int or a_left.is_constant_vector
		vectors_are_of_integers: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_sub(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end

	mul (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
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
		identical_type: a_left ~ a_right 
		integers_or_vectors: a_left.is_constant_int or a_left.is_constant_vector
		vectors_are_of_integers: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer
		(llvmbuild_mul(handle,a_left.handle, a_right.handle, a_name.to_external))
	ensure 
		Result/=Void
		Result.type ~ a_left.type 
	end

	float_multiplication, fmul (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
		-- The product of `a_left' and `a_right', labelled with `a_name'
	require
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left ~ a_right 
		floating_points_or_vectors: a_left.is_constant_fp or a_left.is_constant_vector
		vectors_are_of_floats: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_floating_point
	do
		create Result.from_external_pointer(llvmbuild_fmul(handle,a_left.handle,a_right.handle, a_name.to_external))
	ensure 
		Result/=Void
		Result.type ~ a_left.type 
	end

	udiv, unsigned_division (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
		-- The unsigned integer quotient of `a_left' divided by `a_right'. 

		-- Note that unsigned integer division and signed integer division are
		-- distinct operations; for signed integer division, use 'sdiv'.

		-- Division by zero leads to undefined behavior.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left ~ a_right 
		integers_or_vectors: a_left.is_constant_int or a_left.is_constant_vector
		vectors_are_of_integers: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_udiv(handle,a_left.handle,a_right.handle,a_name.to_external)) 
	ensure 
		Result/=Void
		Result.type ~ a_left.type 
	end

	signed_division (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
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
		identical_type: a_left ~ a_right 
		integers_or_vectors: a_left.is_constant_int or a_left.is_constant_vector
		vectors_are_of_integers: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_udiv(handle,a_left.handle,a_right.handle,a_name.to_external)) 
	ensure 
		Result/=Void
		Result.type ~ a_left.type 
	end

	exact_signed_division (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
		-- An "exact sdiv" operation, the exact, signed integer quotient of
		-- `a_left' and `a_right' rounded towards zero.

		-- The result value of the sdiv is undefined if the result would be
		-- rounded or if overflow would occur.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left ~ a_right 
		integers_or_vectors: a_left.is_constant_int or a_left.is_constant_vector
		vectors_are_of_integers: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_exact_sdiv(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure 
		Result/=Void
		Result.type ~ a_left.type 
	end
	
	float_division  (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
		-- An 'fdiv' instruction, the floating point quotient of `a_left' and `a_right'.
	require
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left ~ a_right 
		floating_points_or_vectors: a_left.is_constant_fp or a_left.is_constant_vector
		vectors_are_of_floats: a_left.is_constant_vector implies a_left.as_constant_vector.type.element_type.is_floating_point
	do
		create Result.from_external_pointer(llvmbuild_fdiv(handle,a_left.handle,a_right.handle, a_name.to_external))
	ensure 
		Result/=Void
		Result.type ~ a_left.type 
	end

	unsigned_remainder (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
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
		identical_type: a_left ~ a_right 
		integers_or_vectors_of_integers: a_left.is_constant_int or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_urem(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end

	signed_remainder (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
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
		identical_type: a_left ~ a_right 
		integers_or_vectors_of_integers: a_left.is_constant_int or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_srem(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end

	float_remainder (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
		-- An 'frem' instruction computing the remainder of the division of `a_left' and `a_right'.
		-- The remainder has the same sign as the dividend.
	require
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left ~ a_right 
		floating_points_or_vectors_of_floats: a_left.is_constant_fp or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_floating_point
	do
		create Result.from_external_pointer(llvmbuild_frem(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end		

	shift_left (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
		-- A 'shl' instruction that computes `a_left' shifted to the left by a number of bits specified in `a_right'.

		-- The value produced is op1 * 2op2 mod 2n, where n is the width of the result. If op2 is (statically or dynamically) negative or equal to or larger than the number of bits in op1, the result is undefined. If the arguments are vectors, each vector element of op1 is shifted by the corresponding shift amount in op2.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left ~ a_right 
		integers_or_vectors_of_integers: a_left.is_constant_int or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_shl(handle,a_left.handle,a_right.handle,a_name.to_external)) 
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end
	
	logical_shift_right (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
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
		identical_type: a_left ~ a_right 
		integers_or_vectors_of_integers: a_left.is_constant_int or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_lshr(handle,a_left.handle,a_right.handle,a_name.to_external)) 
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end

	arithmetic_shift_right (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
		-- An "ashr" instruction (arithmetic shift right), computing `a_left shifted to the right by the number of bits specified in `a_right' with sign extension. `a_right' is treated as an unsigned value. 

		-- This instruction always performs an arithmetic shift right operation, The most significant bits of the result will be filled with the sign bit of `a_left'. If `a_right' is (statically or dynamically) equal to or larger than the number of bits in `a_left', the result is undefined. If the arguments are vectors, each vector element of `a_left' is shifted by the corresponding shift amount in 'a_right'.
		require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left ~ a_right 
		integers_or_vectors_of_integers: a_left.is_constant_int or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
	do
		create Result.from_external_pointer(llvmbuild_ashr(handle,a_left.handle,a_right.handle,a_name.to_external)) 
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end

feature -- Logical operators
	logical_and (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
		-- An "and" instruction, the bitwise logical and of `a_left' and `a_right'.
		require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left ~ a_right 
		integers_or_vectors_of_integers: a_left.is_constant_int or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
		do
			create Result.from_external_pointer(llvmbuild_and(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end

	logical_or (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
		-- An "or" instruction, the bitwise logical or of `a_left' and `a_right'.
		require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left ~ a_right 
		integers_or_vectors_of_integers: a_left.is_constant_int or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
		do
			create Result.from_external_pointer(llvmbuild_or(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end
		
	logical_xor (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
		-- A "xor" instruction, the bitwise exclusive logical or of `a_left' and `a_right'.
		require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		identical_type: a_left ~ a_right 
		integers_or_vectors_of_integers: a_left.is_constant_int or else a_left.is_constant_vector and then a_left.as_constant_vector.type.element_type.is_integer
		do
			create Result.from_external_pointer(llvmbuild_xor(handle,a_left.handle,a_right.handle,a_name.to_external))
	ensure
		Result/=Void
		Result.type ~ a_left.type 
	end
	
	logical_neg (a_value: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
		-- TODO: provide description, semating, preconditions and postconditions.
	require a_value/=Void
 	do
		create Result.from_external_pointer(llvmbuild_neg(handle,a_value.handle,null_or_string(a_name)))
	ensure Result/=Void
	end
	
	logical_not (a_value: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
		-- TODO: provide description, semating, preconditions and postconditions.
	require a_value/=Void
 	do
		create Result.from_external_pointer(llvmbuild_not(handle,a_value.handle, null_or_string(a_name)))
	ensure Result/=Void
	end

feature {ANY} -- Memory
	malloc (a_type: LLVM_TYPE; a_name: ABSTRACT_STRING): LLVM_MALLOC_INST is
		-- A 'malloc' instruction allocating memory for `a_type' on the system heap and returning a pointer to it. The object is always allocated in the generic address space (address space zero). Memory is allocated using the system "malloc" function, and a pointer is returned. The result of a zero byte allocation is undefined. The result is null if there is insufficient memory available.

		-- TODO: LLVM assembly language allows to specify the alignment of the allocation but I coudln't figure how to implement if using the C bindings we are relying on. 
	require
		a_type/=Void
		-- TODO type must be sized
	do
		create Result.from_external_pointer(llvmbuild_malloc(handle, a_type.handle,a_name.to_external))
	ensure Result/=Void
	end


	array_malloc (a_type: LLVM_TYPE; a_number: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_MALLOC_INST is
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

	alloca (a_type: LLVM_TYPE; a_name: ABSTRACT_STRING): LLVM_ALLOCA_INST is
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
		create Result.from_external_pointer(llvmbuild_alloca(handle,a_type.handle,null_or_string(a_name)))
	ensure	
		Result/=Void
	end

	array_alloca (a_type: LLVM_TYPE; a_number: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_ALLOCA_INST is
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
		create Result.from_external_pointer(llvmbuild_array_alloca(handle,a_type.handle,a_number.handle,null_or_string(a_name)))
	ensure
		Result/=Void
	end

	llvm_free (a_value: LLVM_VALUE): LLVM_FREE_INST is
		require
			a_value/=Void
		do
			create Result.from_external_pointer(llvmbuild_free(handle, a_value.handle))
		ensure Result/=Void
		end

	-- LLVMValueRef LLVMBuildFree(LLVMBuilderRef, LLVMValueRef PointerVal);
-- LLVMValueRef LLVMBuildLoad(LLVMBuilderRef, LLVMValueRef PointerVal,
--                            const char *Name);
-- LLVMValueRef LLVMBuildStore(LLVMBuilderRef, LLVMValueRef Val, LLVMValueRef Ptr);
-- LLVMValueRef LLVMBuildGEP(LLVMBuilderRef B, LLVMValueRef Pointer,
--                           LLVMValueRef *Indices, unsigned NumIndices,
--                           const char *Name);
-- LLVMValueRef LLVMBuildInBoundsGEP(LLVMBuilderRef B, LLVMValueRef Pointer,
--                                   LLVMValueRef *Indices, unsigned NumIndices,
--                                   const char *Name);
-- LLVMValueRef LLVMBuildStructGEP(LLVMBuilderRef B, LLVMValueRef Pointer,
--                                 unsigned Idx, const char *Name);
-- LLVMValueRef LLVMBuildGlobalString(LLVMBuilderRef B, const char *Str,
--                                    const char *Name);
-- LLVMValueRef LLVMBuildGlobalStringPtr(LLVMBuilderRef B, const char *Str,
--                                       const char *Name);
-- 
feature -- Casts
-- LLVMValueRef LLVMBuildTrunc(LLVMBuilderRef, LLVMValueRef Val,
--                             LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildZExt(LLVMBuilderRef, LLVMValueRef Val,
--                            LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildSExt(LLVMBuilderRef, LLVMValueRef Val,
--                            LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildFPToUI(LLVMBuilderRef, LLVMValueRef Val,
--                              LLVMTypeRef DestTy, const char *Name);
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
-- LLVMValueRef LLVMBuildBitCast(LLVMBuilderRef, LLVMValueRef Val,
--                               LLVMTypeRef DestTy, const char *Name);
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
feature -- Comparisons
-- LLVMValueRef LLVMBuildICmp(LLVMBuilderRef, LLVMIntPredicate Op,
--                            LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
-- LLVMValueRef LLVMBuildFCmp(LLVMBuilderRef, LLVMRealPredicate Op,
--                            LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
-- 
feature -- Miscellaneous instructions
-- LLVMValueRef LLVMBuildPhi(LLVMBuilderRef, LLVMTypeRef Ty, const char *Name);
-- LLVMValueRef LLVMBuildCall(LLVMBuilderRef, LLVMValueRef Fn,
--                            LLVMValueRef *Args, unsigned NumArgs,
--                            const char *Name);
-- LLVMValueRef LLVMBuildSelect(LLVMBuilderRef, LLVMValueRef If,
--                              LLVMValueRef Then, LLVMValueRef Else,
--                              const char *Name);
-- LLVMValueRef LLVMBuildVAArg(LLVMBuilderRef, LLVMValueRef List, LLVMTypeRef Ty,
--                             const char *Name);
-- LLVMValueRef LLVMBuildExtractElement(LLVMBuilderRef, LLVMValueRef VecVal,
--                                      LLVMValueRef Index, const char *Name);
-- LLVMValueRef LLVMBuildInsertElement(LLVMBuilderRef, LLVMValueRef VecVal,
--                                     LLVMValueRef EltVal, LLVMValueRef Index,
--                                     const char *Name);
-- LLVMValueRef LLVMBuildShuffleVector(LLVMBuilderRef, LLVMValueRef V1,
--                                     LLVMValueRef V2, LLVMValueRef Mask,
--                                     const char *Name);
-- LLVMValueRef LLVMBuildExtractValue(LLVMBuilderRef, LLVMValueRef AggVal,
--                                    unsigned Index, const char *Name);
-- LLVMValueRef LLVMBuildInsertValue(LLVMBuilderRef, LLVMValueRef AggVal,
--                                   LLVMValueRef EltVal, unsigned Index,
--                                   const char *Name);
-- 
-- LLVMValueRef LLVMBuildIsNull(LLVMBuilderRef, LLVMValueRef Val,
--                              const char *Name);
-- LLVMValueRef LLVMBuildIsNotNull(LLVMBuilderRef, LLVMValueRef Val,
--                                 const char *Name);
-- LLVMValueRef LLVMBuildPtrDiff(LLVMBuilderRef, LLVMValueRef LHS,
--                               LLVMValueRef RHS, const char *Name);
-- 
-- 
feature {} 
	struct_size: INTEGER is
		do
			not_yet_implemented
		end

	dispose is 
		do
			llvmdispose_builder(handle)
		end

end -- class LLVM_BUILDER	
