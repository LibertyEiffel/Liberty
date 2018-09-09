class LLVM_MEMORY_BUFFER

	-- Used to provide a module to JIT or interpreter. See the llvm::MemoryBuffer C++ class.


inherit
	OPAQUE_TYPE

insert CORE_EXTERNALS

create {ANY} from_external_pointer

end -- class LLVM_MEMORY_BUFFER
-- Copyright (C) 2010-2018: Paolo Redaelli
-- 
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
