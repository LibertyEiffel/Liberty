class LLVM_FUNCTION
	-- A function in LLVM 

	-- The Function class represents a single procedure in LLVM. It is actually
	-- one of the more complex classes in the LLVM heirarchy because it must
	-- keep track of a large amount of data. The Function class keeps track of
	-- a list of BasicBlocks, a list of formal Arguments, and a SymbolTable.

	-- The list of BasicBlocks is the most commonly used part of Function
	-- objects. The list imposes an implicit ordering of the blocks in the
	-- function, which indicate how the code will be layed out by the backend.
	-- Additionally, the first BasicBlock is the implicit entry node for the
	-- Function. It is not legal in LLVM to explicitly branch to this initial
	-- block. There are no implicit exit nodes, and in fact there may be
	-- multiple exit nodes from a single Function. If the BasicBlock list is
	-- empty, this indicates that the Function is actually a function
	-- declaration: the actual body of the function hasn't been linked in yet.

	-- In addition to a list of BasicBlocks, the Function class also keeps
	-- track of the list of formal Arguments that the function receives. This
	-- container manages the lifetime of the Argument nodes, just like the
	-- BasicBlock list does for the BasicBlocks.

	-- The SymbolTable is a very rarely used LLVM feature that is only used
	-- when you have to look up a value by name. Aside from that, the
	-- SymbolTable is used internally to make sure that there are not conflicts
	-- between the names of Instructions, BasicBlocks, or Arguments in the
	-- function body.

	-- Note that Function is a GlobalValue and therefore also a Constant. The
	-- value of the function is its address (after linking) which is guaranteed
	-- to be constant.

	-- Eiffel specific note: variadic functions - functions accepting a
	-- variable number of arguments - are not supported. 

inherit 
	LLVM_GLOBAL_VALUE
	ITERABLE[LLVM_VALUE]
		-- to provide iteration over parameters
		rename 
			new_iterator as new_parameter_iterator,
			do_all as do_all_parameters
			for_all as for_all_parameters
			exists as exists_parameter
		undefine is_equal, copy 
		end
insert 
	LLVM_VALUE_FACTORY 

creation {ANY} make 
creation {WRAPPER, WRAPPER_HANDLER} from_external_pointer

feature 
	make (a_return_type: LLVM_TYPE; some_parameters: WRAPPER_COLLECTION[LLVM_TYPE]) is
	do
		from_external_pointer
		(llvmfunction_type
		(null_or(a_return_type),
		 null_or_array(some_parameters),
		 some_parameters.count.to_natural_32,
		0 -- i.e. False, non-variadic
		))
	end

feature -- 
	calling_convention: LLVMCALL_CONV_ENUM is
		do
			Result.change_value(llvmget_function_call_conv(handle).to_integer_32)
		end
			
	set_calling_convention (a_calling_convention: LLVMCALL_CONV_ENUM) is
		-- Set calling convention
	do
		llvmset_function_call_conv(handle, a_calling_convention.value.to_natural_32)	
	end	
feature -- Iterating over blocks

	-- `first', `last' from LLVM_FUNCTION and `next', `previous' from
	-- LLVM_BASIC_BLOCK allow to iterate over blocks. A proper ITERATOR shall
	-- be provided (TODO).

	-- Note: a feature like "blocks: COLLECTION[LLVM_BASIC_BLOCK]" is not
	-- offered even if there are functions like "llvmcount_basic_blocks" and
	-- "llvmget_basic_blocks" because its content may be invalidated adding
	-- some blocks; there is not efficient way to monitor changes standing my
	-- insufficient current knowledge of LLVM. Paolo 2009-10-20.

	first: LLVM_BASIC_BLOCK is 
		-- The first block
	local p: POINTER
	do
		p := llvmget_first_basic_block(handle)
		if p.is_not_null then 
			create Result.from_external_pointer(p)
		end
	end
	
	last: LLVM_BASIC_BLOCK is
		-- The last block
	local p: POINTER
	do
		p:=llvmget_last_basic_block(handle)
		if p.is_not_null then
			create Result.from_external_pointer(p)
		end
	end

	new_block_iterator: BIDIRECTIONAL_ITERATOR[LLVM_BASIC_BLOCK] is
		-- A new iterator over blocks composing the function.
	do
		create {ITERATOR_OVER_BASIC_BLOCKS} Result.from_value(Current)
	ensure Result/=Void
	end
-- unsigned LLVMCountBasicBlocks(LLVMValueRef Fn);
-- void LLVMGetBasicBlocks(LLVMValueRef Fn, LLVMBasicBlockRef *BasicBlocks);
-- LLVMBasicBlockRef LLVMGetFirstBasicBlock(LLVMValueRef Fn);
-- LLVMBasicBlockRef LLVMGetLastBasicBlock(LLVMValueRef Fn);
-- LLVMBasicBlockRef LLVMGetNextBasicBlock(LLVMBasicBlockRef BB);
-- LLVMBasicBlockRef LLVMGetPreviousBasicBlock(LLVMBasicBlockRef BB);
	
	entry_basic_block: LLVM_BASIC_BLOCK is
		-- Entry block of function
	local p: POINTER
	do
		p := llvmget_entry_basic_block(handle)
		if p.is_not_null then
			create Result.from_external_pointer(p)
		end
	end

feature -- Parameters
	parameters_count: NATURAL_32 is
		do
			Result:=llvmcount_params(handle)
		end

	-- Note: "void LLVMGetParams(LLVMValueRef Fn,
	-- LLVMValueRef *Params);" will not be wrapped because
	-- the C interface doe not allow an efficient
	-- implementation.

	is_valid_parameter_index (an_index: NATURAL_32): BOOLEAN is
		do
			Result := an_index.in_range(0.to_natural_32, parameters_count)
		end

	parameter (an_index: NATURAL_32): LLVM_VALUE is
		require is_valid_parameter_index(an_index)
		local p: POINTER
		do
			p := llvmget_param(handle,an_index)
			check
				p.is_not_null 
			end
			Result:=value_wrapper(p)
		ensure Result/=Void
		end
	
	new_parameter_iterator: BIDIRECTIONAL_ITERATOR[LLVM_VALUE] is
		-- A newly allocated iterator over Current function's parameters.
		do
			create {ITERATOR_OVER_FUNCTION_PARAMETERS}
			Result.from_function(Current)
		end

-- LLVMValueRef LLVMGetFirstParam(LLVMValueRef Fn);
-- LLVMValueRef LLVMGetLastParam(LLVMValueRef Fn);
-- LLVMValueRef LLVMGetNextParam(LLVMValueRef Arg);
-- LLVMValueRef LLVMGetPreviousParam(LLVMValueRef Arg);
-- void LLVMAddAttribute(LLVMValueRef Arg, LLVMAttribute PA);
-- void LLVMRemoveAttribute(LLVMValueRef Arg, LLVMAttribute PA);
-- void LLVMSetParamAlignment(LLVMValueRef Arg, unsigned align);

feature -- TODO: Important Public Members of the Function class
-- Function(const FunctionType *Ty, LinkageTypes Linkage, const std::string &N = "", Module* Parent = 0)
-- Constructor used when you need to create new Functions to add the the program. The constructor must specify the type of the function to create and what type of linkage the function should have. The FunctionType argument specifies the formal arguments and return value for the function. The same FunctionType value can be used to create multiple functions. The Parent argument specifies the Module in which the function is defined. If this argument is provided, the function will automatically be inserted into that module's list of functions.
-- 
-- bool isDeclaration()
-- Return whether or not the Function has a body defined. If the function is "external", it does not have a body, and thus must be resolved by linking with a function defined in a different translation unit.
-- 
-- Function::iterator - Typedef for basic block list iterator
-- Function::const_iterator - Typedef for const_iterator.
-- begin(), end() size(), empty()
-- These are forwarding methods that make it easy to access the contents of a Function object's BasicBlock list.
-- 
-- Function::BasicBlockListType &getBasicBlockList()
-- Returns the list of BasicBlocks. This is necessary to use when you need to update the list or perform a complex action that doesn't have a forwarding method.
-- 
-- Function::arg_iterator - Typedef for the argument list iterator
-- Function::const_arg_iterator - Typedef for const_iterator.
-- arg_begin(), arg_end() arg_size(), arg_empty()
-- These are forwarding methods that make it easy to access the contents of a Function object's Argument list.
-- 
-- Function::ArgumentListType &getArgumentList()
-- Returns the list of Arguments. This is necessary to use when you need to update the list or perform a complex action that doesn't have a forwarding method.
-- 
-- BasicBlock &getEntryBlock()
-- Returns the entry BasicBlock for the function. Because the entry block for the function is always the first block, this returns the first block of the Function.
-- 
-- Type *getReturnType()
-- FunctionType *getFunctionType()
-- This traverses the Type of the Function and returns the return type of the function, or the FunctionType of the actual function.
-- 
-- SymbolTable *getSymbolTable()
-- Return a pointer to the SymbolTable for this Function.
end -- class LLVM_FUNCTION

-- Copyright 2009 Paolo Redaelli
