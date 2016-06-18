deferred class LLVM_INSTRUCTION
	-- The Instruction class is the common base class for all LLVM
	-- instructions. It provides only a few methods, but is a very commonly
	-- used class. The primary data tracked by the Instruction class itself is
	-- the opcode (instruction type) and the parent BasicBlock the Instruction
	-- is embedded into. To represent a specific type of instruction, one of
	-- many subclasses of Instruction are used.

	-- Because the Instruction class subclasses the User class, its operands
	-- can be accessed in the same way as for other Users (with the
	-- getOperand()/getNumOperands() and op_begin()/op_end() methods).

	-- An important file for the Instruction class is the llvm/Instruction.def
	-- file. This file contains some meta-data about the various different
	-- types of instructions in LLVM. It describes the enum values that are
	-- used as opcodes (for example Instruction::Add and Instruction::ICmp), as
	-- well as the concrete sub-classes of Instruction that implement the
	-- instruction (for example BinaryOperator and CmpInst). Unfortunately, the
	-- use of macros in this file confuses doxygen, so these enum values don't
	-- show up correctly in the doxygen output.

	-- Important Subclasses of the Instruction class are:
	
	-- BinaryOperator represents all two operand instructions whose operands must be the same type, except for the comparison instructions.
	
	-- CastInst, the parent of the 12 casting instructions. It provides common operations on cast instructions.
	
	-- CmpInst respresents the two comparison instructions, ICmpInst (integer opreands), and FCmpInst (floating point operands).
	
	-- TerminatorInst is the parent of all terminator instructions (those which can terminate a block).

inherit LLVM_USER

feature {ANY} -- TODO: Important Public Members of the Instruction class
	parent: LLVM_BASIC_BLOCK
		-- The parent block containing Current instruction
	do
		create Result.from_external_pointer(llvmget_param_parent(handle))
	end

-- bool mayWriteToMemory()
-- Returns true if the instruction writes to memory, i.e. it is a call,free,invoke, or store.
-- 
-- unsigned getOpcode()
-- Returns the opcode for the Instruction.
-- 
-- Instruction *clone() const
-- Returns another instance of the specified instruction, identical in all ways to the original except that the instruction has no parent (ie it's not embedded into a BasicBlock), and it has no name
-- 

end -- class LLVM_INSTRUCTION

-- Copyright 2009 LLVM Team and 2009 Paolo Redaelli

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

