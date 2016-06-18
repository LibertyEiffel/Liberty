class LLVM_FUNCTION_TYPE
-- A type representing a function.

-- It is a COLLECTION of LLVM_TYPEs, the types of its arguments.

-- TODO: ask

inherit
   LLVM_TYPE
      --undefine fill_tagged_out_memory
      redefine copy end
  LLVM_TYPE_FACTORY
      -- TODO: enable access to the type of the argument of the function; it may be a
      -- C_ARRAY[LLVM_TYPE]
      --      undefine is_equal -- use is_equal from LLVM_TYPE
      --      redefine copy
      --      end
      -- but we shall ask LLVM developers if parameter list may change during
      -- object's lifetime. In that case how to be notied?If they may change it
      -- can hardly be a C_ARRAY, since it can change under our feets.

insert
   WRAPPER_HANDLER
   ARRAYED_COLLECTION_HANDLER

create {ANY} make, from_external_pointer

feature {ANY}
   make (a_return_type: LLVM_TYPE; some_parameters: COLLECTION[LLVM_TYPE]; a_variadic_function: BOOLEAN)
         -- Create a function type with `a_return_type' and `some_parameters'
         -- Variadic functions, allowed by LLVM don't fit Eiffel design rules therefore are not supported

         -- TODO: currently `some_parameters' items will be copied into a newly
         -- allocated C array passed to LLVM.  This is plainly inefficient yet avoid
         -- tricky bugs with current compiler. In future if `some_parameters'
         -- conforms to a C_ARRAY its storage will be used directly;
      require
         a_return_type/=Void
         some_parameters/=Void
      do
         handle := llvmfunction_type
         (a_return_type.handle,
         collection_to_c_array(some_parameters).storage.to_external,
         some_parameters.count.to_natural_32, 0)
         -- 0 stands for an eventual `a_variadic_function'.to_integer_32; if
         -- `a_variadic_function' is True the Result will be variadic.
      end

   copy (another: like Current)
      do
         handle:=another.handle
         --storage:=storage.calloc(another.count)
         --storage.copy_from(another.storage,another.upper)
      end
feature {ANY}
   return_type: LLVM_TYPE
      do
         Result:=type_wrapper(llvmget_return_type(handle))
      end

   parameters_count: INTEGER_32
         -- The number of parameters accepted by Current function
      do
         Result:=llvmcount_params(handle).to_integer_32
         -- Note: the underlying C function have perhaps been renamed to unsigned LLVMCountParamTypes(LLVMTypeRef FunctionTy);
      end

   -- TODO: wrap void LLVMGetParamTypes(LLVMTypeRef FunctionTy, LLVMTypeRef
   -- *Dest); into parameters: COLLECTION[LLVM_TYPE]; actually it shall
   -- require direct access to C++ API to implement it soundly, efficiently
   -- and correctly.

   is_var_arg: BOOLEAN
         -- Does Current function accept a variable number of arguments?

         -- Note: even if Liberty does not have variable-arguments calls we may handle functions compiled from other languages.
      do
         Result:=llvmis_function_var_arg(handle).to_boolean
      end

invariant type_kind.is_function_type_kind
end -- LLVM_FUNCTION_TYPE

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
