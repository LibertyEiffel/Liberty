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
			count as parameters_count,
			is_empty as is_parameterless
			new_iterator as new_parameter_iterator,
			do_all as do_all_parameters
			for_all as for_all_parameters
			exists as exists_parameter
		undefine is_equal, copy, out_in_tagged_out_memory, fill_tagged_out_memory
		end

insert LLVM_VALUE_WRAPPER_FACTORY 

create {ANY} make 
create {WRAPPER, WRAPPER_HANDLER} from_external_pointer

feature {} -- Creation
	make (a_return_type: LLVM_TYPE; some_parameters: WRAPPER_COLLECTION[LLVM_TYPE]) is
    local some_wrappers: WRAPPER_COLLECTION[LLVM_TYPE]
	do
		from_external_pointer
		(llvmfunction_type
		(null_or(a_return_type),
		 null_or_array(some_parameters),
		 some_parameters.count.to_natural_32,
		0 -- i.e. False, non-variadic
		))
	end

feature {ANY} -- Calling convention
	calling_convention: LLVMCALL_CONV_ENUM is
		do
			Result.change_value(llvmget_function_call_conv(handle).to_integer_32)
		end
			
	set_calling_convention (a_calling_convention: LLVMCALL_CONV_ENUM) is
		-- Set calling convention
	do
		llvmset_function_call_conv(handle, a_calling_convention.value.to_natural_32)	
	end	
feature {ANY} -- Iterating over blocks

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
	
	basic_blocks_count: NATURAL_32 is
		do
			Result := llvmcount_basic_blocks(handle)
		end

	-- TODO: basic_blocks: COLLECTION[LLVM_BASIC_BLOCK] may be not efficiently
	-- implemented, so "void LLVMGetBasicBlocks(LLVMValueRef Fn,
	-- LLVMBasicBlockRef *BasicBlocks);" is not wrapped. It would require that
	-- the given array is stable, while it is mutable since instructions may be
	-- added anytime. To implement this feature we shall directly access C++
	-- API.

	new_block_iterator: ITERATOR_OVER_BASIC_BLOCKS is
		-- A new iterator over blocks composing the function.
	do
		create Result.from_function(Current)
	ensure Result/=Void
	end
	
	entry_basic_block: LLVM_BASIC_BLOCK is
		-- Entry block of function
	local p: POINTER
	do
		p := llvmget_entry_basic_block(handle)
		if p.is_not_null then
			create Result.from_external_pointer(p)
		end
	end

feature {ANY} -- Parameters
	parameters_count: INTEGER is
		-- The number of parameters. TODO: should be NATURAL
		do
			Result:=llvmcount_params(handle).to_integer_32
		end

	is_parameterless: BOOLEAN is do Result:=(parameters_count=0) end

	-- Note: "void LLVMGetParams(LLVMValueRef Fn,
	-- LLVMValueRef *Params);" will not be wrapped because
	-- the C interface doe not allow an efficient
	-- implementation see the note about basic blocks.

	is_valid_parameter_index (an_index: INTEGER): BOOLEAN is
		do
			Result := an_index.in_range(0, parameters_count)
		end

	parameter (an_index: INTEGER): LLVM_VALUE is
		-- The parameter at `an_index'
		-- TODO: `an_index' should be a NATURAL_32 as in C it's an unsigned. 
		require is_valid_parameter_index(an_index)
		local p: POINTER
		do
			p := llvmget_param(handle,an_index.to_natural_32)
			check
				p.is_not_null 
			end
			Result:=value_wrapper(p)
		ensure Result/=Void
		end
	
	new_parameter_iterator: ITERATOR_OVER_FUNCTION_PARAMETERS is
		-- A newly allocated iterator over Current function's parameters.
		do
			create Result.from_function(Current)
		end

-- LLVMValueRef LLVMGetFirstParam(LLVMValueRef Fn);
-- LLVMValueRef LLVMGetLastParam(LLVMValueRef Fn);
-- LLVMValueRef LLVMGetNextParam(LLVMValueRef Arg);
-- LLVMValueRef LLVMGetPreviousParam(LLVMValueRef Arg);
-- void LLVMAddAttribute(LLVMValueRef Arg, LLVMAttribute PA);
-- void LLVMRemoveAttribute(LLVMValueRef Arg, LLVMAttribute PA);
-- void LLVMSetParamAlignment(LLVMValueRef Arg, unsigned align);

feature {ANY} -- Deleting
	delete is
		-- Delete Current function. 
	do
		llvmdelete_function(handle)
		handle := default_pointer
	ensure
		unusable: is_deleted
	end

	is_deleted: BOOLEAN is
		-- Has Current function already been deleted?
	do
		Result:=handle.is_null
	end
feature {ANY} -- Miscellaneous
	intrinsic_id: NATURAL_32 is
		do
			Result:=llvmget_intrinsic_id(handle)
		end

	gc: FIXED_STRING is
		-- wraps LLVMGetGC. TODO: provide a better name and description
		do
			create Result.from_external(llvmget_gc(handle))
		ensure Result/=Void
		end

	set_gc (a_name: ABSTRACT_STRING) is
		-- wraps LLVMSetGC. TODO: provide better name and description
	do
		llvmset_gc(handle,a_name.to_external)
	ensure set: a_name.is_equal(gc)
	end

	add_attribute (an_attribute: LLVMATTRIBUTE_ENUM) is
	do
		llvmadd_function_attr(handle,an_attribute.value)
	end

	remove_attribute (an_attribute: LLVMATTRIBUTE_ENUM) is
	do
		llvmremove_function_attr(handle,an_attribute.value)
	end

end -- class LLVM_FUNCTION

-- Copyright 2009 Paolo Redaelli
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

