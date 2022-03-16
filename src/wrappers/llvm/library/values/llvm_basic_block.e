class LLVM_BASIC_BLOCK
	-- LLVM Basic Block Representation.

	-- This represents a single basic block in LLVM. A basic
	-- block is simply a container of instructions that
	-- execute sequentially. Basic blocks are Values because
	-- they are referenced by instructions such as branches
	-- and switch tables.

	-- The type of a BasicBlock is "Type::LabelTy" because
	-- the basic block represents a label to which a branch
	-- can jump.

	-- well formed basic block is formed of a list of
	-- non-terminating instructions followed by a single
	-- TerminatorInst instruction. TerminatorInst's may not
	-- occur in the middle of basic blocks, and must
	-- terminate the blocks. The BasicBlock class allows
	-- malformed basic blocks to occur because it may be
	-- useful in the intermediate stage of constructing or
	-- modifying a program. However, the verifier will ensure
	-- that basic blocks are "well formed".
inherit LLVM_VALUE
insert 	LLVM_VALUE_WRAPPER_FACTORY 
create {WRAPPER, WRAPPER_HANDLER} from_external_pointer
create {ANY} appended_in_context, inserted_in_context, appended_to, inserted_before
feature {} -- Creation
	appended_in_context (a_context: LLVM_CONTEXT; a_function: LLVM_FUNCTION; a_name: ABSTRACT_STRING)
	-- TODO: documentation
	-- TODO: `a_function' may be an more general LLVM_VALUE but any actual
	-- usage of something other that an LLVM_FUNCTION is not clear to me. 
	require 
		a_context/=Void
		a_function/=Void
		a_name/=Void
	do
		handle:=llvmappend_basic_block_in_context
		(a_context.handle, a_function.handle, a_name.to_external)
	ensure name_not_changed: a_name.is_equal(old a_name)
	end

	inserted_in_context (a_context: LLVM_CONTEXT; a_block: LLVM_BASIC_BLOCK; a_name: ABSTRACT_STRING)
		-- TODO: doc.
	require
		a_context/=Void
		a_block/=Void
		a_name/=Void
	do
		handle:=llvminsert_basic_block_in_context
		(a_context.handle, a_block.handle, a_name.to_external)
	ensure name_not_changed: a_name.is_equal(old a_name)
	end

	appended_to (a_value: LLVM_VALUE; a_name: ABSTRACT_STRING)
		-- TODO: doc
	require 
		a_value/=Void
		a_name/=Void
	do
		handle:=llvmappend_basic_block(a_value.handle,a_name.to_external)
		ensure name_not_changed: a_name.is_equal(old a_name)
	end
	
	inserted_before (a_block: LLVM_BASIC_BLOCK; a_name: ABSTRACT_STRING)
		-- TODO: doc
	require
		a_block/=Void
		a_name/=Void
	do
		handle:=llvminsert_basic_block(a_block.handle,a_name.to_external)
	ensure name_not_changed: a_name.is_equal(old a_name)
	end

feature	{ANY} -- queries
	-- TODO: the following feature may not be necessary "as_value: LLVM_VALUE
	-- is -- Current basic block as a value do LLVMValueRef
	-- LLVMBasicBlockAsValue(LLVMBasicBlockRef BB);:w" and

	parent: LLVM_VALUE
		--- The value that contains Current block
		do
			Result:=value_wrapper_or_void(llvmget_basic_block_parent(handle))
		end

	next: LLVM_BASIC_BLOCK
		-- The block after Current. May be Void
	local p: POINTER
	do
		p:=llvmget_next_basic_block(handle)
		if p.is_not_null then 
			create Result.from_external_pointer(p)
		end
	end

	previous: LLVM_BASIC_BLOCK
		-- The block before Current. May be Void
	local p: POINTER
	do
		p:= llvmget_previous_basic_block(handle)
		if p.is_not_null then
			create Result.from_external_pointer(p)
		end
	end

	delete
		-- Delete current block.
	do
		llvmdelete_basic_block(handle)
		handle := default_pointer
	ensure is_deleted
	end

	is_deleted: BOOLEAN
		-- Has Current been deleted?
	do
		Result:=handle.is_null
	end

-- void LLVMDeleteBasicBlock(LLVMBasicBlockRef BB);
feature {ANY} -- Iterating over instructions
	new_iterator: ITERATOR[LLVM_INSTRUCTION]
		do
			create {ITERATOR_OVER_INSTRUCTIONS} Result.from_block(Current)
		ensure Result/=Void
		end
end -- class LLVM_BASIC_BLOCK

-- Copyright (C) 2009-2022: Paolo Redaelli, partially derived from LLVM documentation
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

