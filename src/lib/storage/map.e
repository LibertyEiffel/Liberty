-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class MAP[V_, K_]
   --
   -- Read-only associative memory. Values of type `V_' are stored using Keys of type `K_'.
   --
   -- See also DICTIONARY
   --

inherit
   TRAVERSABLE[V_]
      rename
         new_iterator as new_iterator_on_items,
         for_each as for_each_item,
         do_all as do_all_items,
         for_all as for_all_items,
         exists as exists_item,
         aggregate as aggregate_items
      undefine
         copy
      redefine
         is_equal, out_in_tagged_out_memory
      end

feature {ANY} -- Counting:
   is_empty: BOOLEAN
         -- Is it empty?
      do
         Result := count = 0
      end

feature {ANY} -- Basic access:
   has (k: K_): BOOLEAN
         -- Is there a value currently associated with key `k'?
         --
         -- See also `fast_has', `at'.
      require
         k /= Void
      deferred
      end

   at (k: K_): V_
         -- Return the value associated to key `k'.
         --
         -- See also `fast_at', `reference_at', `has'.
      require
         has(k)
      deferred
      end

   frozen infix "@" (k: K_): V_
         -- The infix notation which is actually a synonym for `at'.
      require
         has(k)
      do
         Result := at(k)
      ensure
         definition: Result = at(k)
      end

   reference_at (k: K_): V_
         -- Return Void or the value associated with key `k'. Actually, this feature is useful only
         -- when the type of values (the type V_) is a reference type, to avoid using `has' just
         -- followed by `at' to get the corresponding value with the very best performances.
         --
         -- See also `fast_reference_at', `at', `has'.
      require
         k /= Void
         values_are_not_expanded: Result = Void
      deferred
      ensure
         has(k) implies Result = at(k)
      end

   fast_has (k: K_): BOOLEAN
         -- Is there a value currently associated with key `k'?
         -- Using basic `=' for comparison.
         --
         -- See also `has', `at', `fast_at'.
      require
         k /= Void
      deferred
      end

   fast_at (k: K_): V_
         -- Return the value associated to key `k' using basic `=' for comparison.
         --
         -- See also `at', `reference_at', `fast_reference_at'.
      require
         fast_has(k)
      deferred
      end

   fast_reference_at (k: K_): V_
         -- Same work as `reference_at', but basic `=' is used for comparison.
         --
         -- See also `reference_at', `at', `has'.
      require
         k /= Void
         values_are_reference: Result = Void
      deferred
      ensure
         fast_has(k) implies Result = fast_at(k)
      end

feature {ANY} -- Looking and searching some value:
   occurrences (v: V_): INTEGER
         -- Number of occurrences using `is_equal' for comparison.
         --
         -- See also `fast_occurrences', `fast_has', `has'.
      local
         i: INTEGER; safe_equal: SAFE_EQUAL[V_]
      do
         from
            i := lower
         until
            i > upper
         loop
            if safe_equal.test(v, item(i)) then
               Result := Result + 1
            end
            i := i + 1
         end
      ensure
         Result >= 0
      end

   fast_occurrences (v: V_): INTEGER
         -- Number of occurrences using basic `=' for comparison.
         --
         -- See also `occurrences', `fast_has', `has'.
      local
         i: INTEGER
      do
         from
            i := lower
         until
            i > upper
         loop
            if v = item(i) then
               Result := Result + 1
            end
            i := i + 1
         end
      ensure
         Result >= 0
      end

   key_at (v: V_): K_
         -- Retrieve the key used for value `v' using `is_equal' for comparison.
         --
         -- See also `fast_key_at', `at'.
      require
         occurrences(v) = 1
      local
         i: INTEGER; safe_equal: SAFE_EQUAL[V_]
      do
         from
            i := lower
         until
            safe_equal.test(v, item(i))
         loop
            i := i + 1
         end
         Result := key(i)
      ensure
         (create {SAFE_EQUAL[V_]}).test(at(Result), v)
      end

   fast_key_at (v: V_): K_
         -- Retrieve the key used for value `v' using `=' for comparison.
         --
         -- See also `key_at', `at'.
      require
         fast_occurrences(v) = 1
      local
         i: INTEGER
      do
         from
            i := lower
         until
            v = item(i)
         loop
            i := i + 1
         end
         Result := key(i)
      ensure
         at(Result) = v
      end

feature {ANY} -- To provide iterating facilities:
   lower: INTEGER 1

   upper: INTEGER
      do
         Result := count
      ensure
         count = Result - lower + 1
      end

   item (index: INTEGER): V_
      deferred
      ensure
         Result = at(key(index))
      end

   key (index: INTEGER): K_
      require
         valid_index(index)
      deferred
      ensure
         at(Result) = item(index)
      end

   first: V_
      do
         Result := item(lower)
      end

   last: V_
      do
         Result := item(upper)
      end

   new_iterator_on_items: ITERATOR[V_]
      deferred
      ensure then
         Result /= Void
      end

   new_iterator_on_keys: ITERATOR[K_]
      deferred
      ensure
         Result /= Void
      end

   new_iterator: ITERATOR[TUPLE[V_, K_]]
      deferred
      ensure
         Result /= Void
      end

   key_map_in (buffer: COLLECTION[K_])
         -- Append in `buffer', all available keys (this may be useful to
         -- speed up the traversal).
         --
         -- See also `item_map_in'.
      require
         buffer /= Void
      do
         buffer.append_traversable(keys)
      ensure
         buffer.count = count + old buffer.count
      end

   item_map_in (buffer: COLLECTION[V_])
         -- Append in `buffer', all available items (this may be useful to
         -- speed up the traversal).
         --
         -- See also `key_map_in'.
      require
         buffer /= Void
      do
         buffer.append_traversable(items)
      ensure
         buffer.count = count + old buffer.count
      end

   keys: TRAVERSABLE[K_]
         -- An iterable of this map keys
      do
         if keys_memory = Void then
            create keys_memory.from_map(Current)
         end
         Result := keys_memory
      ensure
         Result.count = count
      end

   items: TRAVERSABLE[V_]
         -- An iterable of this map values
         -- Usually returns Current because MAP is TRAVERSABLE.
      do
         Result := Current
      ensure
         Result.count = count
      end

feature {ANY}
   fast_is_equal (other: like Current): BOOLEAN
         -- Do both dictionaries have the same set of associations?
         -- Keys are compared with `is_equal' and values are compared
         -- with the basic = operator.
         --
         -- See also `is_equal'.
      local
         i: INTEGER; k: K_
      do
         if Current = other then
            Result := True
         elseif count = other.count then
            from
               Result := True
               i := 1
            until
               not Result or else i > count
            loop
               k := key(i)
               if other.has(k) then
                  if other.at(k) /= item(i) then
                     Result := False
                  else
                     i := i + 1
                  end
               else
                  Result := False
               end
            end
         end
      ensure
         Result implies count = other.count
      end

   is_equal (other: like Current): BOOLEAN
         -- Do both dictionaries have the same set of associations?
         -- Both keys and values are compared with `is_equal'.
         --
         -- See also `fast_is_equal'.
      local
         i: INTEGER; k: K_; safe_equal: SAFE_EQUAL[V_]
      do
         if Current = other then
            Result := True
         elseif count = other.count then
            from
               Result := True
               i := 1
            until
               not Result or else i > count
            loop
               k := key(i)
               if other.has(k) then
                  if not safe_equal.test(other.at(k), item(i)) then
                     Result := False
                  else
                     i := i + 1
                  end
               else
                  Result := False
               end
            end
         end
      end

   is_equal_map (other: like Current): BOOLEAN
         -- Do both collections have the same `lower', `upper', and
         -- items?
         -- Feature `is_equal' is used for comparison of items.
      obsolete "Use `is_equal' instead."
      do
         Result := is_equal(other)
      end

feature {ANY} -- Display support:
   out_in_tagged_out_memory
      local
         i: INTEGER; k: like key; v: like item
      do
         tagged_out_memory.extend('{')
         tagged_out_memory.append(generating_type)
         tagged_out_memory.append(once ":[")
         from
            i := lower
         until
            i > upper
         loop
            k := key(i)
            if k = Void then
               tagged_out_memory.append(once "Void")
            else
               k.out_in_tagged_out_memory
            end
            tagged_out_memory.extend('=')
            v := item(i)
            if v = Void then
               tagged_out_memory.append(once "Void")
            else
               v.out_in_tagged_out_memory
            end
            if i < upper then
               tagged_out_memory.extend(' ')
            end
            i := i + 1
         end
         tagged_out_memory.append(once "]}")
      end

feature {ANY} -- Agents based features:
   for_each (action: PROCEDURE[TUPLE[V_, K_]])
         -- Apply `action' to every [V_, K_] associations of `Current'.
         --
         -- See also `for_all', `exist'.
      require
         action /= Void
      local
         i: INTEGER; v: V_; k: K_
      do
         from
            i := lower
         until
            i > upper
         loop
            v := item(i)
            k := key(i)
            action.call([v, k])
            i := i + 1
         end
      end

   frozen do_all (action: ROUTINE[TUPLE[V_, K_]])
         -- Apply `action' to every [V_, K_] associations of `Current'.
         --
         -- See also `for_all', `exist'.
      obsolete "This feature is not secure because it accepts a FUNCTION, the result of which is lost. Plese use `for_each` instead."
      require
         action /= Void
      local
         p: PROCEDURE[TUPLE[V_, K_]]
      do
         if p ?:= action then
            p ::= action
         else
            p := agent (v: V_; k: K_) do action.call([v, k]) end (?, ?)
         end
         for_each(p)
      end

   for_all (test: PREDICATE[TUPLE[V_, K_]]): BOOLEAN
         -- Do all [V_, K_] associations satisfy `test'?
         --
         -- See also `for_each', `exist'.
      require
         test /= Void
      local
         i: INTEGER; v: V_; k: K_
      do
         from
            Result := True
            i := lower
         until
            not Result or else i > upper
         loop
            v := item(i)
            k := key(i)
            Result := test.item([v, k])
            i := i + 1
         end
      end

   exists (test: PREDICATE[TUPLE[V_, K_]]): BOOLEAN
         -- Does at least one [V_, K_] association satisfy `test'?
         --
         -- See also `for_all', `for_each'.
      require
         test /= Void
      local
         i: INTEGER; v: V_; k: K_
      do
         from
            i := lower
         until
            Result or else i > upper
         loop
            v := item(i)
            k := key(i)
            Result := test.item([v, k])
            i := i + 1
         end
      end

   aggregate (action: FUNCTION[TUPLE[V_, V_, K_], V_]; initial: V_): V_
         -- Aggregate all the elements starting from the initial value.
         --
         -- See also `for_each', `for_all', `exists'.
      require
         action /= Void
      local
         i: INTEGER; v: V_; k: K_
      do
         from
            Result := initial
            i := lower
         until
            i > upper
         loop
            v := item(i)
            k := key(i)
            Result := action.item([Result, v, k])
            i := i + 1
         end
      end

feature {ANY} -- Other features:
   internal_key (k: K_): K_
         -- Retrieve the internal key object which correspond to the existing
         -- entry `k' (the one memorized into the `Current' dictionary).
         --
         -- See also `has', `fast_has'.
      require
         has(k)
      deferred
      ensure
         Result.is_equal(k)
      end

feature {}
   keys_memory: DICTIONARY_KEY_TRAVERSER[V_, K_]

end -- class MAP
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
