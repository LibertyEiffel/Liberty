-- See the Copyright notice at the end of this file.
--
expanded class XML_DTD_MEMORY

feature {} -- Memory management
   dtd_validators_pool: RECYCLING_POOL[XML_DTD_VALIDATOR] is
      do
         create Result.make
      end

   new_dtd_validator (root_node_name: UNICODE_STRING): XML_DTD_VALIDATOR is
      do
         if dtd_validators_pool.is_empty then
            create Result.make(root_node_name)
         else
            Result := dtd_validators_pool.item
            Result.make(root_node_name)
         end
      ensure
         Result /= Void
         Result.root_name = root_node_name
      end

   recycle_dtd_validator (a_validator: XML_DTD_VALIDATOR) is
      do
         dtd_validators_pool.recycle(a_validator)
      end

   string_pool: RECYCLING_POOL[UNICODE_STRING] is
      once
         create Result.make
      end

   new_empty_string: UNICODE_STRING is
      do
         if string_pool.is_empty then
            create Result.make_empty
         else
            Result := string_pool.item
            Result.clear_count
         end
      ensure
         Result /= Void
      end

   new_string (s: UNICODE_STRING): UNICODE_STRING is
      require
         s /= Void
      do
         if string_pool.is_empty then
            Result := s.twin
         else
            Result := string_pool.item
            Result.copy(s)
         end
      ensure
         Result.is_equal(s)
      end

   free_string (a_string: like new_string) is
      require
         a_string /= Void
      do
         string_pool.recycle(a_string)
      end

   url_pool: RECYCLING_POOL[URL] is
      once
         create Result.make
      end

   buffer_pool: RECYCLING_POOL[UNICODE_PARSER_BUFFER] is
      once
         create Result.make
      end

end -- class XML_DTD_MEMORY
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
