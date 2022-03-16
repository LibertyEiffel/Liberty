class LLVM_PASS_MANAGER

inherit
	C_STRUCT
	-- ANY_MEMORY_HANDLING_CLASS

insert CORE_EXTERNALS

create {ANY} from_external_pointer

feature {ANY} 
	struct_size: like size_t
		do
			not_yet_implemented
		end

end -- class LLVM_PASS_MANAGER
-- Copyright (C) 2010-2022: Paolo Redaelli
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
