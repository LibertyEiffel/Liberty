deferred class LLVM_CAST_INST
	-- The base class for all instructions that perform data casts. It is
	-- simply provided so that instruction category testing can be performed
	-- with code like (in C++ TODO to be trnslated): if(isa<CastInst>(Instr)) {
	-- ... }

inherit LLVM_UNARY_INST

end -- class LLVM_CAST_INST

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

