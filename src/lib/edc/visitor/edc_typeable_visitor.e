-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2022: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
-- associated documentation files (the "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
-- following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
-- USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://ese.sourceforge.net
-- -----------------------------------------------------------------------------------------------------------
deferred class EDC_TYPEABLE_VISITOR

inherit
   VISITOR

feature {ESE_TYPED_VISITABLE, VISITOR}
   as_typed (item_type_generator: STRING): VISITOR
      do
         Result := typed_visitors.reference_at(item_type_generator)
         if Result = Void then
            inspect
               item_type_generator
            when "EDC_BLOB" then
               Result := new_blob_visitor
            when "INTEGER", "INTEGER_32" then
               Result := new_integer_visitor
            when "CHARACTER" then
               Result := new_character_visitor
            when "STRING" then
               Result := new_string_visitor
            when "TIME" then
               Result := new_time_visitor
            end
            typed_visitors.put(Result, item_type_generator)
         end
      end

feature {}
   typed_visitors: HASHED_DICTIONARY[VISITOR, STRING]
      once
         create Result.make
      end

   new_blob_visitor: ESE_TYPED_VISITOR[EDC_BLOB]
      deferred
      end

   new_character_visitor: ESE_TYPED_VISITOR[CHARACTER]
      deferred
      end

   new_integer_visitor: ESE_TYPED_VISITOR[INTEGER]
      deferred
      end

   new_string_visitor: ESE_TYPED_VISITOR[STRING]
      deferred
      end

   new_time_visitor: ESE_TYPED_VISITOR[TIME]
      deferred
      end

end -- class EDC_TYPEABLE_VISITOR
