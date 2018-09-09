deferred class LLVM_OVERFLOWING_BINARY_OPERATOR
	-- Common anchestor of integer arithmetic operators which may overflow:
	-- addition, subtraction and multiplication. The SDiv instruction is not
	-- included althought it may overflow.

inherit LLVM_OPERATOR
end -- class LLVM_OVERFLOWING_BINARY_OPERATOR

-- Copyright (C) 2009-2018: Paolo Redaelli

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

