-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class INTERNALS_HANDLER
   --
   -- All classes that use INTERNALS must be descendants of INTERNALS_HANDLER.
   --

feature {}
   frozen valid_generating_type_for_internals (type: STRING): BOOLEAN
      require
         type /= Void
      external "built_in"
      ensure
         Result implies not type.has_prefix(once "NATIVE_ARRAY")
      end

   frozen internals_from_generating_type (type: STRING): INTERNALS
      require
         valid_generating_type_for_internals(type)
      external "built_in"
      ensure
         Result /= Void
         Result.object_can_be_modified
      end

   frozen valid_generating_type_for_native_array_internals (type: STRING): BOOLEAN
      require
         type /= Void
      external "built_in"
      ensure
         Result implies type.has_prefix(once "NATIVE_ARRAY")
      end

   frozen native_array_internals_from_generating_type (type: STRING; capacity: INTEGER): INTERNALS
      require
         valid_generating_type_for_native_array_internals(type)
      external "built_in"
      ensure
         Result /= Void
         Result.object_can_be_modified
      end

end -- class INTERNALS_HANDLER
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
