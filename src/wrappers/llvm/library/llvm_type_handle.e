class LLVM_TYPE_HANDLE
	-- When building recursive types using (TODO) LLVMRefineType, LLVM_TYPE
	-- values may become invalid; LLVM_TYPE_HANDLE may be used to resolve this
	-- problem. See the llvm::AbstractTypeHolder class in the documentation of
	-- the C++ òobrary.
 
inherit 
	OPAQUE_TYPE
	EIFFEL_OWNED 

insert LLVM_TYPE_FACTORY

create {ANY} from_type, from_external_pointer

feature {ANY} 
	from_type (a_type: LLVM_TYPE)
		-- `a_type' is potentially an abstract type.
	require a_type/=Void
	do
		handle:=llvmcreate_type_handle(a_type.handle)
	end

	type: LLVM_TYPE
		-- Current resolved into an effective type. 
	do
		Result:=type_wrapper(llvmresolve_type_handle(handle))
	end

	-- TODO: provide refining support:  void LLVMRefineType(LLVMTypeRef AbstractTy, LLVMTypeRef ConcreteTy);

end -- class LLVM_TYPE_HANDLE

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

