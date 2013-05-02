class LLVM_REAL_TYPE
-- Float: 32bit
-- Double: 64 bit
-- X86: 80 bit
-- fp128: 128bit with 112 bit of mantissa
-- ppc_fp128: 128 bit (two 64 bits)

inherit LLVM_TYPE

create {ANY}
   from_external_pointer,
   as_float, as_float_in_context,
   as_double, as_double_in_context,
   as_x86, as_x86_in_context,
   with_128bits, with_128bits_in_context
      -- TODO: allow creation of fp128 and ppc_fp128

feature {} -- Creation
   as_float is
      do
         handle := llvmfloat_type
      end

   as_float_in_context (a_context: LLVM_CONTEXT) is
      require a_context/=Void
      do
         handle:=llvmfloat_type_in_context(a_context.handle)
      end

   as_double is
      do
         handle := llvmdouble_type
      end

   with_128bits is
      do
         handle := llvmfp128type
      end

   with_128bits_in_context (a_context: LLVM_CONTEXT) is
      require a_context/=Void
      do
         handle:=llvmfp128type_in_context(a_context.handle)
      end

   as_double_in_context (a_context: LLVM_CONTEXT) is
      require a_context/=Void
      do
         handle:=llvmdouble_type_in_context(a_context.handle)
      end

   as_x86 is
      do
         handle := llvmx86fp80type
      end

   as_x86_in_context (a_context: LLVM_CONTEXT) is
      require a_context/=Void
      do
         handle:=llvmx86fp80type_in_context(a_context.handle)
      end

   -- TODO: write a correct invariant type.is_real_type_kind
end -- class LLVM_REAL_TYPE

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
