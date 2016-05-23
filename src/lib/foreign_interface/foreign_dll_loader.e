-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class FOREIGN_DLL_LOADER

insert
   DYNAMIC_LINKING_LOADER

feature {ANY}
   library (filename: ABSTRACT_STRING): FOREIGN_DLL
         -- The Result may be Void if the library is not found.
      require
         filename /= Void
      local
         dllname: FIXED_STRING
         dso: DYNAMIC_SHARED_OBJECT
      do
         dllname := filename.intern
         Result := loaded_dll.fast_reference_at(dllname)
         if Result = Void then
            dso := new_dynamic_shared_object(dllname, rtld_lazy | rtld_global | rtld_deepbind)
            if dso /= Void then
               check
                  dso.name = dllname
               end
               create Result.make(dso)
               loaded_dll.put(Result, dllname)
            end
         end
      ensure
         Result /= Void implies Result.filename.is_equal(filename)
      end

feature {FOREIGN_DLL_HANDLER}
   loaded_dll: DICTIONARY[FOREIGN_DLL, FIXED_STRING]
      once
         create {HASHED_DICTIONARY[FOREIGN_DLL, FIXED_STRING]} Result.with_capacity(2)
      end

end -- class FOREIGN_DLL_LOADER
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
