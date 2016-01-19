class LLVM_INTEGER_TYPE
-- Integer representation type in LLVM.

-- It represents integer types, including the built-in 1-bit. 8-bit,
-- 16-bit, 32-bit and 64-bit.

-- The underlying C++ function to get or create an IntegerType pointer is
-- "const IntegerType *IntegerType::get ( LLVMContext & C, unsigned
-- NumBits )" and is a static method and it's the primary way of
-- constructing an IntegerType. If an IntegerType with the same NumBits
-- value was previously instantiated, that instance will be returned.
-- Otherwise a new one will be created. Only one instance with a given
-- NumBits value is ever created.

inherit
   LLVM_TYPE

create {WRAPPER, WRAPPER_HANDLER} from_external_pointer
create {ANY}
   with_1_bit, with_1_bit_in_context,
   with_8_bits, with_8_bits_in_context,
   with_16_bits, with_16_bits_in_context,
   with_32_bits, with_32_bits_in_context,
   with_64_bits, with_64_bits_in_context,
   with_bits, with_bits_in_context

feature {} -- Creation in a specific context
   with_1_bit_in_context (a_context: LLVM_CONTEXT) is
      require
         a_context /= Void
      do
         handle := llvmint1type_in_context(a_context.handle)
      end

   with_8_bits_in_context (a_context: LLVM_CONTEXT) is
      require
         a_context /= Void
      do
         handle := llvmint8type_in_context(a_context.handle)
      end

   with_16_bits_in_context (a_context: LLVM_CONTEXT) is
      require
         a_context /= Void
      do
         handle := llvmint16type_in_context(a_context.handle)
      end

   with_32_bits_in_context (a_context: LLVM_CONTEXT) is
      require
         a_context /= Void
      do
         handle := llvmint32type_in_context(a_context.handle)
      end

   with_64_bits_in_context (a_context: LLVM_CONTEXT) is
      require
         a_context /= Void
      do
         handle := llvmint1type_in_context(a_context.handle)
      end

   with_bits_in_context (a_bit_count: NATURAL_32) is
      do
         handle := llvmint_type(a_bit_count)
      end


feature {} -- Creation in global context
   with_1_bit is
      do
         handle := llvmint1type
      end

   with_8_bits is
      do
         handle := llvmint8type
      end

   with_16_bits is
      do
         handle := llvmint16type
      end

   with_32_bits is
      do
         handle := llvmint32type
      end

   with_64_bits is
      do
         handle := llvmint64type
      end

   with_bits (a_bit_count: NATURAL_32) is
      do
         handle := llvmint_type(a_bit_count)
      end

feature {ANY}
   width: NATURAL_32 is
      do
         Result := llvmget_int_type_width(handle)
      end

invariant
   type_kind.is_integer_type_kind

end -- class LLVM_INTEGER_TYPE


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
