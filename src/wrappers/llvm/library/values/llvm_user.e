deferred class LLVM_USER
	-- Ancestor of constants, operators and instructions (and meta-database).

	-- The User class is the common base class of all LLVM nodes that may refer
	-- to Values. It exposes a list of "Operands" that are all of the Values
	-- that the User is referring to. The User class itself is a subclass of
	-- Value.

	-- The operands of a User point directly to the LLVM Value that it refers
	-- to. Because LLVM uses Static Single Assignment (SSA) form, there can
	-- only be one definition referred to, allowing this direct connection.
	-- This connection provides the use-def information in LLVM.

inherit LLVM_VALUE
feature {ANY} -- TODO:Important Public Members of the User class
-- The User class exposes the operand list in two ways: through an index access interface and through an iterator based interface.
-- 
-- operand (an_index: NATURAL_32): LLVM_VALUE is Value *getOperand(unsigned i)
-- unsigned getNumOperands()
-- These two methods expose the operands of the User in a convenient form for direct access.
-- 
-- User::op_iterator - Typedef for iterator over the operand list
-- op_iterator op_begin() - Get an iterator to the start of the operand list.
-- op_iterator op_end() - Get an iterator to the end of the operand list.
-- Together, these methods make up the iterator based interface to the operands of a User.
end -- class LLVM_USER

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

