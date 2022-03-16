-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class FOREIGN_PARAMETERS

feature {ANY}
   set (a_parameters: like parameters)
      require
         no_voids: a_parameters.for_all(agent (p: FOREIGN_OBJECT): BOOLEAN do Result := p /= Void end (?))
      do
         parameters := a_parameters
      ensure
         parameters = a_parameters
      end

   match_types (a_types: TRAVERSABLE[FOREIGN_TYPE]): BOOLEAN
      local
         i, offset: INTEGER
      do
         if parameters /= Void then
            from
               Result := a_types.count = parameters.count
               offset := a_types.lower - parameters.lower
               i := parameters.lower
            until
               not Result or else i > parameters.upper
            loop
               Result := parameters.item(i).match_type(a_types.item(i + offset))
               i := i + 1
            end
         end
      ensure
         not_set_is_wrong: parameters = Void implies not Result
      end

feature {FOREIGN_AGENT}
   as_arrayed_collection: ARRAYED_COLLECTION[POINTER]
      local
         i: INTEGER
      do
         if not parameters.is_empty then
            create {FAST_ARRAY[POINTER]} Result.with_capacity(parameters.count)
            from
               i := parameters.lower
            until
               i > parameters.upper
            loop
               Result.add_last(parameters.item(i).as_pointer)
               i := i + 1
            end
         end
      end

feature {}
   parameters: TRAVERSABLE[FOREIGN_OBJECT]

invariant
   no_voids: parameters /= Void implies parameters.for_all(agent (p: FOREIGN_OBJECT): BOOLEAN do Result := p /= Void end (?))

end -- class FOREIGN_PARAMETERS
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
