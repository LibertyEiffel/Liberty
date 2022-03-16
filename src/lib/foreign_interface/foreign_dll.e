-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class FOREIGN_DLL

create {FOREIGN_DLL_LOADER}
   make

feature {ANY}
   filename: FIXED_STRING
      do
         Result ::= dso.name
      end

   function (name: ABSTRACT_STRING; a_parameter_types: TRAVERSABLE[FOREIGN_TYPE]; a_result_type: FOREIGN_TYPE): FOREIGN_AGENT
      require
         name /= Void
      local
         fn_name: FIXED_STRING
         p: POINTER
      do
         fn_name := name.intern
         Result := functions.fast_reference_at(fn_name)
         if Result = Void then
            p := dso.symbol(fn_name)
            if p.is_not_null then
               create {FOREIGN_DLL_FUNCTION} Result.make(p, a_parameter_types, a_result_type)
            end
         else
            check
               a_parameter_types = Void implies Result.parameter_types = Void
               a_parameter_types /= Void implies Result.parameter_types /= Void and then Result.parameter_types.is_equal(a_parameter_types)
               Result.result_type = a_result_type
            end
         end
      end

feature {}
   make (a_dso: like dso)
      require
         a_dso /= Void
      do
         dso := a_dso
         create {HASHED_DICTIONARY[FOREIGN_DLL_FUNCTION, FIXED_STRING]} functions.make
      ensure
         dso = a_dso
      end

feature {FOREIGN_DLL_HANDLER}
   dso: DYNAMIC_SHARED_OBJECT
   functions: DICTIONARY[FOREIGN_DLL_FUNCTION, FIXED_STRING]

invariant
   dso /= Void
   functions /= Void

end -- class FOREIGN_DLL
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
