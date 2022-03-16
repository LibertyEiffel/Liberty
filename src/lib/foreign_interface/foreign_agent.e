-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class FOREIGN_AGENT

feature {ANY}
   call (parameters: FOREIGN_PARAMETERS)
      require
         parameters.match_types(parameter_types)
         result_type = types.nothing
      local
         null: POINTER
      do
         ffi_call.invoke(null, parameters.as_arrayed_collection)
      end

   item (parameters: FOREIGN_PARAMETERS): FOREIGN_OBJECT
      require
         parameters.match_types(parameter_types)
         result_type /= types.nothing
      do
         Result := result_type.new
         ffi_call.invoke(Result.as_pointer, parameters.as_arrayed_collection)
      ensure
         Result.match_type(result_type)
      end

   parameter_types: TRAVERSABLE[FOREIGN_TYPE]
   result_type: FOREIGN_TYPE

feature {}
   ffi_call: FFI_CALL
   types: FOREIGN_TYPES

   prepare (a_function: POINTER)
      require
         ffi_call = Void
         a_function.is_not_null
      local
         p: FAST_ARRAY[POINTER]
         i: INTEGER
      do
         if not parameter_types.is_empty then
            create p.with_capacity(parameter_types.count)
            from
               i := parameter_types.lower
            until
               i > parameter_types.upper
            loop
               p.add_last(parameter_types.item(i).ffi_type)
               i := i + 1
            end
         end
         create ffi_call.prepare(a_function, result_type.ffi_type, p)
      ensure
         ffi_call /= Void
      end

invariant
   ffi_call /= Void
   parameter_types /= Void

end -- class FOREIGN_AGENT
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
