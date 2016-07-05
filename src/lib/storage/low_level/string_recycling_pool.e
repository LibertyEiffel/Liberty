-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class STRING_RECYCLING_POOL
   --
   -- Remember that STRING_RECYCLING_ITEM is expanded. It explains that some algorithms look like they could
   -- be simplified. In fact they '''cannot'''.
   --

insert
   PLATFORM
      export
         {STRING_RECYCLING_POOL} all
      end
   MEMORY
      export
         {STRING_RECYCLING_POOL} all
      end
   STRING_HANDLER
      export
         {STRING_RECYCLING_POOL} all
      end

create {ANY}
   make

feature {ANY}
   new: STRING
         -- A brand new STRING with a small default capacity.
      do
         Result := best_fit(32)
      ensure
         Result.is_empty
      end

   best_fit (capacity: INTEGER): STRING
         -- A STRING with a capacity at least as great as the given `capacity'.
      local
         i: INTEGER; gc: BOOLEAN
         item: STRING_RECYCLING_ITEM
      do
         gc := collecting
         collection_off
         if not strings.is_empty then
            item.set_capacity(capacity)
            i := items_comparator.insert_index(strings, item)
            if strings.valid_index(i) then
               from
                  Result := strings.item(i).item
               until
                  (Result /= Void and then Result.capacity >= capacity) or else i = strings.lower
               loop
                  i := i - 1
                  Result := strings.item(i).item
               end
               if Result /= Void then
                  -- remember STRING_RECYCLING_ITEM is expanded
                  item := strings.item(i)
                  item.set_item(Void)
                  strings.put(item, i)
                  if Result.capacity < capacity then
                     -- Rmk, 2015-12-20: wouldn't it be good to have
                     -- the GC active already here?
                     Result.ensure_capacity(capacity)
                  end
               end
            end
         end
         if gc then
            -- restore the GC ''before'' creating Result (if need be) to let it do its work
            collection_on
         end
         if Result = Void then
            create Result.make(capacity)
         end
      ensure
         Result.is_empty
         Result.capacity >= capacity
      end

   new_twin (string: STRING): STRING
         -- A copy of the given `string'.
      require
         string /= Void
      do
         Result := best_fit(string.count)
         Result.copy(string)
      ensure
         Result /= string
         Result.is_equal(string)
      end

   recycle (string: STRING)
         -- Recycles the `string'. Note that you should not use the `string' again ''(don't keep any reference
         -- on it)'', but use `new', `best_fit' or `new_twin' to obtain a new STRING.
      local
         i: INTEGER
         item: STRING_RECYCLING_ITEM
      do
         -- I think there is no need to stop the GC
         string.recycle
         recycling_item.set_item(string)
         if strings.is_empty then
            strings.add_last(recycling_item)
            recycling_item := item -- a brand new one (because we need to reset the weak reference)
         else
            i := items_comparator.insert_index(strings, recycling_item)
            if strings.valid_index(i) and then strings.item(i).item = Void then
               -- remember STRING_RECYCLING_ITEM is expanded
               item := strings.item(i)
               item.set_item(string)
               strings.put(item, i)
               recycling_item.set_item(Void) -- will be reused
            else
               strings.add(item, i)
               recycling_item := item -- a brand new one (because we need to reset the weak reference)
            end
         end
      end

feature {}
   recycling_item: STRING_RECYCLING_ITEM

   strings: FAST_ARRAY[STRING_RECYCLING_ITEM]
         -- The recycled strings

   make
      do
         create strings.make(0)
      end

   items_comparator: STRING_RECYCLING_ITEM_SORTER

invariant
   items_comparator.is_sorted(strings)

end -- class STRING_RECYCLING_POOL
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
