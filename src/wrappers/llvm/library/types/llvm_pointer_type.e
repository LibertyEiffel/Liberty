class LLVM_POINTER_TYPE
-- A type representing a pointer to a specified type
inherit LLVM_SEQUENCE_TYPE

create {ANY} make, from_external_pointer
feature {ANY} -- Creation
   make (a_type: LLVM_TYPE)
         -- Creates a pointer type referring to `a_type'

         -- TODO: the C call has an undocumented/misunderstood `unsigned
         -- AddressSpace' argument, currently fixed to 0.
      require a_type/=Void
      do
         handle:=llvmpointer_type(a_type.handle, 0.to_natural_32)
      end

   address_space: NATURAL_32
         -- The address space of the pointer
      do
         Result:=llvmget_pointer_address_space(handle)
      end
invariant type_kind.is_pointer_type_kind
end -- class LLVM_POINTER_TYPE

-- Copyright (C) 2009-2017: Paolo Redaelli

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
