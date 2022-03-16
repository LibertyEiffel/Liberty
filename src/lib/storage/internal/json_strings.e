-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class JSON_STRINGS

insert
   JSON_HANDLER

feature {JSON_HANDLER}
   json_star: JSON_STRING
      once
         create Result.make(U"*")
      end

   json_type: JSON_STRING
      once
         create Result.make(U"type")
      end

   json_repository: JSON_STRING
      once
         create Result.make(U"repository")
      end

   json_version: JSON_STRING
      once
         create Result.make(U"version")
      end

   json_data: JSON_STRING
      once
         create Result.make(U"data")
      end

   json_refs: JSON_STRING
      once
         create Result.make(U"refs")
      end

   json_basic: JSON_STRING
      once
         create Result.make(U"basic")
      end

   json_value: JSON_STRING
      once
         create Result.make(U"value")
      end

   json_array: JSON_STRING
      once
         create Result.make(U"array")
      end

   json_capacity: JSON_STRING
      once
         create Result.make(U"capacity")
      end

   json_layout: JSON_STRING
      once
         create Result.make(U"layout")
      end

   json_ref: JSON_STRING
      once
         create Result.make(U"ref")
      end

   json_embedded: JSON_STRING
      once
         create Result.make(U"embedded")
      end

   json_type_character: JSON_STRING
      once
         create Result.make(U"CHARACTER")
      end

   json_type_boolean: JSON_STRING
      once
         create Result.make(U"BOOLEAN")
      end

   json_type_integer_8: JSON_STRING
      once
         create Result.make(U"INTEGER_8")
      end

   json_type_integer_16: JSON_STRING
      once
         create Result.make(U"INTEGER_16")
      end

   json_type_integer_32: JSON_STRING
      once
         create Result.make(U"INTEGER_32")
      end

   json_type_integer_64: JSON_STRING
      once
         create Result.make(U"INTEGER_64")
      end

   json_type_integer: JSON_STRING
      once
         create Result.make(U"INTEGER")
      end

   json_type_real_32: JSON_STRING
      once
         create Result.make(U"REAL_32")
      end

   json_type_real_64: JSON_STRING
      once
         create Result.make(U"REAL_64")
      end

   json_type_real_80: JSON_STRING
      once
         create Result.make(U"REAL_80")
      end

   json_type_real_128: JSON_STRING
      once
         create Result.make(U"REAL_128")
      end

   json_type_real_expanded: JSON_STRING
      once
         create Result.make(U"REAL_EXPANDED")
      end

   json_type_real: JSON_STRING
      once
         create Result.make(U"REAL")
      end

   json_array_element_type (type: ABSTRACT_STRING): JSON_STRING
      require
         type.has_prefix(once "NATIVE_ARRAY[")
         type.has_suffix(once "]")
      local
         element_type: STRING; str: FIXED_STRING
      do
         str := type.intern
         Result := json_array_element_types.fast_reference_at(str)
         if Result = Void then
            element_type := once ""
            element_type.make_from_string(type)
            element_type.remove_prefix(once "NATIVE_ARRAY[")
            element_type.remove_suffix(once "]")
            create Result.from_string(element_type)
            json_array_element_types.add(Result, str)
         end
      end

   json_string (a_string: ABSTRACT_STRING): JSON_STRING
      local
         str: FIXED_STRING
      do
         str := a_string.intern
         Result := json_strings.fast_reference_at(str)
         if Result = Void or else not Result.is_valid then
            create Result.from_string(str)
            json_strings.put(Result, str)
         end
      ensure
         Result.is_valid
      end

feature {}
   json_array_element_types: HASHED_DICTIONARY[JSON_STRING, FIXED_STRING]
      once
         create Result.make
      end

   json_strings: HASHED_DICTIONARY[JSON_STRING, FIXED_STRING]
      once
         create Result.make
      end

end -- class JSON_STRINGS
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
