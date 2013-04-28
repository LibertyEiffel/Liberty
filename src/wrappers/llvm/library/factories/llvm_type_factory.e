deferred class LLVM_TYPE_FACTORY
-- A factory of LLVM_TYPEs

inherit
   WRAPPER_FACTORY[LLVM_TYPE]
      rename
         wrapper as type_wrapper,
         wrapper_or_void as type_wrapper_or_void
      end
insert
   CORE_EXTERNALS
   EXCEPTIONS undefine copy, is_equal end

feature {WRAPPER, WRAPPER_HANDLER}
   type_wrappers: HASHED_DICTIONARY [LLVM_TYPE, POINTER] is once create Result.make end

   type_wrapper (a_pointer: POINTER): LLVM_TYPE is
         -- The LLVM_TYPE for `a_pointer' of the fittest type.
      local a_type: LLVMTYPEKIND_ENUM
      do
         a_type.change_value(llvmget_type_kind(a_pointer))
         -- The following long conditional instruction ideally should be an
         -- inspect instruction but current compiler don't allow instructions
         -- like "when.a_type.void_type_kind_low_level .....
         if a_type.is_llvmvoid_type_kind  then create {LLVM_VOID_TYPE} Result.from_external_pointer(a_pointer)
         elseif a_type.is_llvmdouble_type_kind  then create {LLVM_REAL_TYPE} Result.from_external_pointer(a_pointer)
         elseif a_type.is_llvmx86_fp80type_kind  then create {LLVM_REAL_TYPE} Result.from_external_pointer(a_pointer)
            --elseif a_type.is_llvmfp_128type_kind  then create {} Result
            --elseif a_type.is_llvmppc__fp_128type_kind  then create {} Result
         elseif a_type.is_llvmlabel_type_kind  then create {LLVM_LABEL_TYPE} Result.from_external_pointer(a_pointer)
         elseif a_type.is_llvminteger_type_kind  then create {LLVM_INTEGER_TYPE} Result.from_external_pointer(a_pointer)
         elseif a_type.is_llvmfunction_type_kind  then create {LLVM_FUNCTION_TYPE} Result.from_external_pointer(a_pointer)
         elseif a_type.is_llvmstruct_type_kind  then create {LLVM_STRUCT_TYPE} Result.from_external_pointer(a_pointer)
         elseif a_type.is_llvmarray_type_kind  then create {LLVM_ARRAY_TYPE} Result.from_external_pointer(a_pointer)
         elseif a_type.is_llvmpointer_type_kind  then create {LLVM_POINTER_TYPE} Result.from_external_pointer(a_pointer)
         elseif a_type.is_llvmopaque_type_kind  then create {LLVM_OPAQUE_TYPE} Result.from_external_pointer(a_pointer)
         elseif a_type.is_llvmvector_type_kind  then create {LLVM_VECTOR_TYPE} Result.from_external_pointer(a_pointer)
            --elseif a_type.is_llvmmetadata_type_kind  then create {} Result
         else raise("LLVM_TYPE_FACTORY.wrapper: unknown type")
         end
      end
end -- class LLVM_TYPE_FACTORY
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
