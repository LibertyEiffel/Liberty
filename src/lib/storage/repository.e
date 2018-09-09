-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class REPOSITORY[O_ -> STORABLE]
   --
   -- A REPOSITORY for objects of type O_ can be viewed as a DICTIONARY[O_, STRING] (i.e. objects of type
   -- O_ are stored using key names which are actually ordinary STRINGs).
   -- Also note that stored objects of type O_ are always non-Void objects.
   --
   -- A repository is meant to be stored on a physical store (say, a stream, a file, a database and so on).
   --
   -- See also XML_FILE_REPOSITORY, XML_STREAM_REPOSITORY.
   --

feature {ANY} -- Getting and setting objects in the repository:
   frozen has (object_name: STRING): BOOLEAN
         -- Is `object_name' the name of some stored object.
      require
         not object_name.is_empty
      do
         Result := repository.has(object_name)
      end

   frozen at (object_name: STRING): O_
         -- Return the object currently associated to `object_name'.
      require
         has(object_name)
      do
         Result := repository.at(object_name)
      ensure
         Result /= Void
      end

   frozen add (object: O_; object_name: STRING)
         -- Add a new `object' in the `Current' repository.
      require
         object /= Void
         new_reference: not has(object_name)
      do
         repository.add(object, object_name)
      ensure
         reference_stored: object = at(object_name)
      end

   frozen put (object: O_; object_name: STRING) assign at
         -- Update or add a new `object' in the `Current' repository.
      require
         object /= Void
      do
         repository.put(object, object_name)
      ensure
         reference_stored: object = at(object_name)
      end

   remove (object_name: STRING)
         -- Remove entry `object_name' from the `Current' repository.
      require
         has(object_name)
      do
         repository.remove(object_name)
      ensure
         not has(object_name)
      end

feature {ANY} -- Counting:
   count: INTEGER
         -- Actual `count' of stored elements.
      do
         Result := repository.count
      end

   is_empty: BOOLEAN
         -- Is it empty ?
      do
         Result := count = 0
      ensure
         Result = (count = 0)
      end

feature {ANY} -- Iterating facilities:
   lower: INTEGER 1

   upper: INTEGER
      do
         Result := count
      ensure
         Result = count
      end

   valid_index (index: INTEGER): BOOLEAN
      do
         Result := 1 <= index and then index <= count
      ensure
         Result = index.in_range(lower, upper)
      end

   item (index: INTEGER): O_
      require
         valid_index(index)
      do
         Result := repository.item(index)
      ensure
         Result = at(key(index))
      end

   key (index: INTEGER): STRING
      require
         valid_index(index)
      do
         Result := repository.key(index)
      ensure
         at(Result) = item(index)
      end

   new_iterator_on_items: ITERATOR[O_]
      do
         Result := repository.new_iterator_on_items
      ensure
         Result /= Void
      end

   new_iterator_on_keys: ITERATOR[STRING]
      do
         Result := repository.new_iterator_on_keys
      ensure
         Result /= Void
      end

   key_map_in (buffer: COLLECTION[STRING])
         -- Append in `buffer', all available keys (this may be useful to
         -- speed up the traversal).
      require
         buffer /= Void
      do
         repository.key_map_in(buffer)
      ensure
         buffer.count = count + old buffer.count
      end

   item_map_in (buffer: COLLECTION[O_])
         -- Append in `buffer', all available items (this may be useful to
         -- speed up the traversal).
      require
         buffer /= Void
      do
         repository.item_map_in(buffer)
      ensure
         buffer.count = count + old buffer.count
      end

feature {ANY} -- Really storing data:
   update
         -- Update the repository objects. Get all objects from the physical store.
      require
         is_updateable
      deferred
      end

   commit
         -- Commit all the repository objects to the physical store.
      require
         is_commitable
      deferred
      end

   is_connected: BOOLEAN
         -- True if the repository is connected to a physical store.
      deferred
      end

   is_updateable: BOOLEAN
         -- True if the repository can be updated from data in the physical store.
      deferred
      ensure
         Result implies is_connected
      end

   is_commitable: BOOLEAN
         -- True if the repository can be committed to the underlying physical store.
      deferred
      ensure
         Result implies is_connected
      end

feature {} -- Implementation
   repository: DICTIONARY[O_, STRING]

   objects_are_expanded: BOOLEAN
      local
         o: O_
      do
         Result := o /= Void
      end

invariant
   repository /= Void
   reference_storables: not objects_are_expanded

end -- class REPOSITORY
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
