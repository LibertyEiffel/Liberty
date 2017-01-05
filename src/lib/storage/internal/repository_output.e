-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class REPOSITORY_OUTPUT

insert
   INTERNALS_HANDLER

feature {REPOSITORY_IMPL}
   is_connected: BOOLEAN
      deferred
      end

   start_write
      require
         is_connected
      deferred
      end

   end_write
      require
         is_connected
      deferred
      end

   write_reference (ref: INTEGER; name: STRING)
      require
         is_connected
         ref > 0
      deferred
      end

   write_transient_reference (ref: STRING; name: STRING)
      require
         is_connected
         not ref.is_empty
      deferred
      end

   start_layout (ref: INTEGER; type: STRING)
      require
         is_connected
         ref >= 0
         not type.is_empty
      deferred
      end

   end_layout
      require
         is_connected
      deferred
      end

   write_character_layout_object (internals: INTERNALS; name: STRING)
      require
         is_connected
         internals.type_generating_type.is_equal(once "CHARACTER")
      deferred
      end

   write_boolean_layout_object (internals: INTERNALS; name: STRING)
      require
         is_connected
         internals.type_generating_type.is_equal(once "BOOLEAN")
      deferred
      end

   write_integer_8_layout_object (internals: INTERNALS; name: STRING)
      require
         is_connected
         internals.type_generating_type.is_equal(once "INTEGER_8")
      deferred
      end

   write_integer_16_layout_object (internals: INTERNALS; name: STRING)
      require
         is_connected
         internals.type_generating_type.is_equal(once "INTEGER_16")
      deferred
      end

   write_integer_32_layout_object (internals: INTERNALS; name: STRING)
      require
         is_connected
         internals.type_generating_type.is_equal(once "INTEGER_32")
      deferred
      end

   write_integer_64_layout_object (internals: INTERNALS; name: STRING)
      require
         is_connected
         internals.type_generating_type.is_equal(once "INTEGER_64")
      deferred
      end

   write_integer_layout_object (internals: INTERNALS; name: STRING)
      require
         is_connected
         internals.type_generating_type.is_equal(once "INTEGER")
      deferred
      end

   write_real_32_layout_object (internals: INTERNALS; name: STRING)
      require
         is_connected
         internals.type_generating_type.is_equal(once "REAL_32")
      deferred
      end

   write_real_64_layout_object (internals: INTERNALS; name: STRING)
      require
         is_connected
         internals.type_generating_type.is_equal(once "REAL_64")
      deferred
      end

   write_real_80_layout_object (internals: INTERNALS; name: STRING)
      require
         is_connected
         internals.type_generating_type.is_equal(once "REAL_80")
      deferred
      end

   write_real_128_layout_object (internals: INTERNALS; name: STRING)
      require
         is_connected
         internals.type_generating_type.is_equal(once "REAL_128")
      deferred
      end

   write_real_layout_object (internals: INTERNALS; name: STRING)
      require
         is_connected
         internals.type_generating_type.is_equal(once "REAL")
      deferred
      end

   write_real_expanded_layout_object (internals: INTERNALS; name: STRING)
      require
         is_connected
         internals.type_generating_type.is_equal(once "REAL_EXPANDED")
      deferred
      end

   start_array_layout (array: INTERNALS; name: STRING)
      require
         is_connected
         array.type_is_native_array
         array.type_attribute_count > 0
      deferred
      end

   end_array_layout (array: INTERNALS; name: STRING)
      require
         is_connected
      deferred
      end

   start_embedded_layout (layout: INTERNALS; name: STRING)
      require
         is_connected
         layout.type_is_expanded
         not layout.type_is_native_array
         layout.type_attribute_count > 0
      deferred
      end

   end_embedded_layout (layout: INTERNALS; name: STRING)
      require
         is_connected
      deferred
      end

end -- class REPOSITORY_OUTPUT
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
