-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class CLARG_WITH_ARGS[E_]

inherit
   TRAVERSABLE[E_]
      undefine
         out_in_tagged_out_memory
      end
   COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[E_]]
      rename
         item as items
      undefine
         out_in_tagged_out_memory
      end

insert
   CLARG_PARSER
      redefine
         optional, positional
      end

feature {ANY}
   items: TRAVERSABLE[E_]
      do
         Result := Current
      end

   is_repeatable: BOOLEAN True

   is_set: BOOLEAN
      do
         Result := not set.is_empty
      end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
   prepare_parse
      do
         set.clear_count
      end

   is_set_at (context: COMMAND_LINE_CONTEXT): BOOLEAN
      do
         Result := set.has(context)
      end

   undo_parse (context: COMMAND_LINE_CONTEXT)
      do
         set.remove(context)
      end

   set_data (context: COMMAND_LINE_CONTEXT; data: STRING)
      do
         set.add(decode(data), context)
      end

feature {}
   decode (data: STRING): E_
      require
         is_valid_data(data)
      deferred
      end

feature {ANY} -- TRAVERSABLE:
   count: INTEGER
      do
         Result := set.count
      end

   is_empty: BOOLEAN
      do
         Result := set.is_empty
      end

   lower: INTEGER
      do
         Result := set.lower
      end

   upper: INTEGER
      do
         Result := set.upper
      end

   item (i: INTEGER): E_
      do
         Result := set.item(i)
      end

   first: like item
      do
         Result := set.first
      end

   last: like item
      do
         Result := set.last
      end

   new_iterator: ITERATOR[E_]
      do
         Result := set.new_iterator_on_items
      end

feature {}
   set: AVL_DICTIONARY[E_, COMMAND_LINE_CONTEXT]

   optional (a_short, a_long, a_name, a_usage: ABSTRACT_STRING)
      do
         create set.make
         Precursor(a_short, a_long, a_name, a_usage)
      end

   positional (a_name, a_usage: ABSTRACT_STRING)
      do
         create set.make
         Precursor(a_name, a_usage)
      end

invariant
   set /= Void

end -- class CLARG_WITH_ARGS
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
