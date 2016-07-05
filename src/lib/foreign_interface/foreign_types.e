-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class FOREIGN_TYPES

insert
   FFI_EXTERNALS
   ANY
        redefine
            copy,
            is_equal
        end

feature {ANY}
   copy (other: like Current)
       do
       end

   is_equal (other: like Current): BOOLEAN
      do
         Result := True
      end

feature {ANY} -- Types
   nothing: FOREIGN_TYPE
      once
         Result.set_ffi_type(address_of_ffi_type_void, Void, "nothing")
      end

   uint8: FOREIGN_TYPE
      once
         Result.set_ffi_type(address_of_ffi_type_uint8, agent new_uint8, "uint8")
      end

   sint8: FOREIGN_TYPE
      once
         Result.set_ffi_type(address_of_ffi_type_sint8, agent new_sint8, "sint8")
      end

   uint16: FOREIGN_TYPE
      once
         Result.set_ffi_type(address_of_ffi_type_uint16, agent new_uint16, "uint16")
      end

   sint16: FOREIGN_TYPE
      once
         Result.set_ffi_type(address_of_ffi_type_sint16, agent new_sint16, "sint16")
      end

   uint32: FOREIGN_TYPE
      once
         Result.set_ffi_type(address_of_ffi_type_uint32, agent new_uint32, "uint32")
      end

   sint32: FOREIGN_TYPE
      once
         Result.set_ffi_type(address_of_ffi_type_sint32, agent new_sint32, "sint32")
      end

   uint64: FOREIGN_TYPE
      once
         Result.set_ffi_type(address_of_ffi_type_uint64, agent new_uint64, "uint64")
      end

   sint64: FOREIGN_TYPE
      once
         Result.set_ffi_type(address_of_ffi_type_sint64, agent new_sint64, "sint64")
      end

   float: FOREIGN_TYPE
      once
         Result.set_ffi_type(address_of_ffi_type_float, agent new_float, "float")
      end

   double: FOREIGN_TYPE
      once
         Result.set_ffi_type(address_of_ffi_type_double, agent new_double, "double")
      end

   schar: FOREIGN_TYPE
      once
         Result.set_ffi_type(address_of_ffi_type_sint8, agent new_schar, "schar")
      end

   c_string, pointer: FOREIGN_TYPE
      once
         Result.set_ffi_type(address_of_ffi_type_pointer, agent new_pointer, "pointer")
      end

feature {ANY} -- Objects factory
   create_uint8 (data: NATURAL_8): FOREIGN_OBJECT
      do
         create {FOREIGN_TYPED_OBJECT[NATURAL_8]} Result.make(uint8, data)
      end

   create_sint8 (data: INTEGER_8): FOREIGN_OBJECT
      do
         create {FOREIGN_TYPED_OBJECT[INTEGER_8]} Result.make(sint8, data)
      end

   create_uint16 (data: NATURAL_16): FOREIGN_OBJECT
      do
         create {FOREIGN_TYPED_OBJECT[NATURAL_16]} Result.make(uint16, data)
      end

   create_sint16 (data: INTEGER_16): FOREIGN_OBJECT
      do
         create {FOREIGN_TYPED_OBJECT[INTEGER_16]} Result.make(sint16, data)
      end

   create_uint32 (data: NATURAL_32): FOREIGN_OBJECT
      do
         create {FOREIGN_TYPED_OBJECT[NATURAL_32]} Result.make(uint32, data)
      end

   create_sint32 (data: INTEGER_32): FOREIGN_OBJECT
      do
         create {FOREIGN_TYPED_OBJECT[INTEGER_32]} Result.make(sint32, data)
      end

   create_uint64 (data: NATURAL_64): FOREIGN_OBJECT
      do
         create {FOREIGN_TYPED_OBJECT[NATURAL_64]} Result.make(uint64, data)
      end

   create_sint64 (data: INTEGER_64): FOREIGN_OBJECT
      do
         create {FOREIGN_TYPED_OBJECT[INTEGER_64]} Result.make(sint64, data)
      end

   create_float (data: REAL_32): FOREIGN_OBJECT
      do
         create {FOREIGN_TYPED_OBJECT[REAL_32]} Result.make(float, data)
      end

   create_double (data: REAL_64): FOREIGN_OBJECT
      do
         create {FOREIGN_TYPED_OBJECT[REAL_64]} Result.make(double, data)
      end

   create_schar (data: CHARACTER): FOREIGN_OBJECT
      do
         create {FOREIGN_TYPED_OBJECT[CHARACTER]} Result.make(schar, data)
      end

   create_string (a_string: ABSTRACT_STRING): FOREIGN_OBJECT
         -- A newly allocated FOREIGN_OBJECT referring to the interned buffer of `a_string'
      do
         create {FOREIGN_TYPED_OBJECT[POINTER]} Result.make(pointer, a_string.intern.to_external)
      end

   create_pointer (data: POINTER): FOREIGN_OBJECT
      do
         create {FOREIGN_TYPED_OBJECT[POINTER]} Result.make(pointer, data)
      end

feature {} -- Objects conversion back from the external call
   new_uint8: FOREIGN_OBJECT
      local
         data: NATURAL_8
      do
         create {FOREIGN_TYPED_OBJECT[NATURAL_8]} Result.make(uint8, data)
      end

   new_sint8: FOREIGN_OBJECT
      local
         data: INTEGER_8
      do
         create {FOREIGN_TYPED_OBJECT[INTEGER_8]} Result.make(sint8, data)
      end

   new_uint16: FOREIGN_OBJECT
      local
         data: NATURAL_16
      do
         create {FOREIGN_TYPED_OBJECT[NATURAL_16]} Result.make(uint16, data)
      end

   new_sint16: FOREIGN_OBJECT
      local
         data: INTEGER_16
      do
         create {FOREIGN_TYPED_OBJECT[INTEGER_16]} Result.make(sint16, data)
      end

   new_uint32: FOREIGN_OBJECT
      local
         data: NATURAL_32
      do
         create {FOREIGN_TYPED_OBJECT[NATURAL_32]} Result.make(uint32, data)
      end

   new_sint32: FOREIGN_OBJECT
      local
         data: INTEGER_32
      do
         create {FOREIGN_TYPED_OBJECT[INTEGER_32]} Result.make(sint32, data)
      end

   new_uint64: FOREIGN_OBJECT
      local
         data: NATURAL_64
      do
         create {FOREIGN_TYPED_OBJECT[NATURAL_64]} Result.make(uint64, data)
      end

   new_sint64: FOREIGN_OBJECT
      local
         data: INTEGER_64
      do
         create {FOREIGN_TYPED_OBJECT[INTEGER_64]} Result.make(sint64, data)
      end

   new_float: FOREIGN_OBJECT
      local
         data: REAL_32
      do
         create {FOREIGN_TYPED_OBJECT[REAL_32]} Result.make(float, data)
      end

   new_double: FOREIGN_OBJECT
      local
         data: REAL_64
      do
         create {FOREIGN_TYPED_OBJECT[REAL_64]} Result.make(double, data)
      end

   new_schar: FOREIGN_OBJECT
      local
         data: CHARACTER
      do
         create {FOREIGN_TYPED_OBJECT[CHARACTER]} Result.make(schar, data)
      end

   new_pointer: FOREIGN_OBJECT
      local
         data: POINTER
      do
         create {FOREIGN_TYPED_OBJECT[POINTER]} Result.make(pointer, data)
      end

   new_c_string: FOREIGN_OBJECT
      local
         data: POINTER
      do
         create {FOREIGN_TYPED_OBJECT[POINTER]} Result.make(pointer, data)
      end

end -- class FOREIGN_TYPES
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
