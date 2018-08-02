class LLVM_STRUCT_TYPE
-- A type representing a structure in LLVM.

-- It is also a COLLECTION of LLVM_TYPEs, the types of its fields.

inherit
   LLVM_COMPOSITE_TYPE
      --undefine fill_tagged_out_memory
      redefine copy end
      LLVM_TYPE_FACTORY
      -- TODO: evolve the primitive array-like features into a proper heir of C_ARRAY[LLVM_TYPE]
      --      undefine is_equal -- use is_equal from LLVM_TYPE
      --      redefine copy
      --      end
      ARRAYED_COLLECTION_HANDLER

create {ANY} make, in_context, from_external_pointer

feature {ANY} -- Creation
   make (some_elements: COLLECTION[LLVM_TYPE]; packed: BOOLEAN)
      require
         some_elements/=Void
         not some_elements.is_empty
      do
         handle := llvmstruct_type(collection_to_c_array(some_elements).storage.to_external, some_elements.count.to_natural_32, packed.to_integer)
         refresh_storage
      end

   in_context (a_context: LLVM_CONTEXT; some_elements: COLLECTION[LLVM_TYPE]; packed: BOOLEAN)
      require
         a_context/=Void
         some_elements/=Void
         not some_elements.is_empty
      do
         handle := llvmstruct_type_in_context(a_context.handle, collection_to_c_array(some_elements).storage.to_external, some_elements.count.to_natural_32, packed.to_integer)
         refresh_storage
      end

   copy (another: like Current)
      do
         handle:=another.handle
         refresh_storage
      end

feature {ANY} -- Packing
   is_packed: BOOLEAN
      do
         Result:=llvmis_packed_struct(handle).to_boolean
      end
feature {ANY} -- Element access
   elements_count: INTEGER_32
   element (an_index: INTEGER_32): LLVM_TYPE
      require valid_index: an_index.in_range(0,elements_count-1)
      do
         Result:=type_wrapper(storage.item(an_index))
      end

feature {} -- Implementation
   storage: NATIVE_ARRAY[POINTER]
         -- The addresses of Current's elements

   refresh_storage
         -- Initialize `storage' with the field types of the structure
      do
         elements_count := llvmcount_struct_element_types(handle).to_integer_32
         storage := storage.calloc(elements_count)
         llvmget_struct_element_types(handle, storage.to_pointer)
      end
   -- An LLVMStruct will (mostly) not change its elements, allowing to cache
   -- the result of an llvmget_struct_element_types.  Types are generally
   -- immutable, the one exception is when type refinement happens Check out
   -- LLVM's ProgrammersManual in the cyclic types section. refine type
   -- feature shalle be redefined.

invariant type_kind.is_struct_type_kind
end -- class LLVM_STRUCT_TYPE

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
