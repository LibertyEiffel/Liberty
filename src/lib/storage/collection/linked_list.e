-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LINKED_LIST[E_]
   --
   -- One way linked list implementation with internal automatic cached memorization of the last access.
   -- Because of the last access memory cache, the traversal of a LINKED_LIST from the `lower' index to the
   -- `upper' index using `item' is quite efficient. As one can expect, adding element using `add_first' or
   -- `add_last' is really efficient too, actually, the total number of elements (i.e. `count') as well as a
   -- reference to the last cell is also cached automatically. Keep in mind that LINKED_LIST uses a one way
   -- linked storage from `lower' to `upper', so traversing a LINKED_LIST from `upper' to `lower' will be
   -- extremely time consuming (also consider TWO_WAY_LINKED_LIST).
   --

inherit
   COLLECTION[E_]
      redefine default_create
      end

insert
   LINKED_COLLECTION[E_]
      redefine default_create
      end

create {ANY}
   default_create, make, from_collection, manifest_creation

feature {}
   default_create
      do
         make
      end

feature {LINKED_LIST, ITERATOR_ON_LINKED_LIST}
   first_link: LINKED_LIST_NODE[E_]
         -- Void when empty or gives access to the first element.

feature {LINKED_LIST}
   last_link: like first_link
         -- Void when empty or gives access to the last element.

   mem_idx: INTEGER

   mem_lnk: like first_link
         -- To speed up accessing, `mem_idx' and `mem_lnk' is the memory of the last access done.
         -- For example, after item(1), `mem_idx' is 1 and `mem_lnk' is `first_link'.
         -- When list is empty, `first_link' is Void as well as `mem_lnk' and `mem_idx' is 0

feature {ANY}
   make
      do
         if free_nodes = Void then
            -- It is a brand new one:
            free_nodes ::= common_free_nodes.fast_reference_at(generating_type)
            if free_nodes = Void then
               create free_nodes.set_item(Void)
               common_free_nodes.add(free_nodes, generating_type)
            end
         else
            clear_count
         end
         next_generation
      ensure
         count = 0
      end

   is_empty: BOOLEAN
      do
         Result := first_link = Void
      end

   add_first (element: like item)
      do
         if first_link = Void then
            first_link := new_node(element, Void)
            upper := 1
            last_link := first_link
            mem_idx := 1
            mem_lnk := first_link
         else
            first_link := new_node(element, first_link)
            upper := upper + 1
            mem_idx := mem_idx + 1
         end
         next_generation
      end

   add_last (element: like item)
      local
         lnk: like first_link
      do
         if first_link = Void then
            first_link := new_node(element, Void)
            upper := 1
            last_link := first_link
            mem_idx := 1
            mem_lnk := first_link
         else
            lnk := new_node(element, Void)
            last_link.set_next(lnk)
            upper := upper + 1
            last_link := lnk
         end
         next_generation
      end

   add (element: like item; index: INTEGER)
      local
         link: like first_link
      do
         if index = 1 then
            add_first(element)
         elseif index = upper + 1 then
            add_last(element)
         else
            if index - 1 /= mem_idx then
               go_item(index - 1)
            end
            link := new_node(element, mem_lnk.next)
            mem_lnk.set_next(link)
            upper := upper + 1
         end
         next_generation
      end

   remove_first
      do
         if upper = 1 then
            first_link := dispose_node(first_link)
            check
               first_link = Void
            end
            last_link := Void
            mem_lnk := Void
            mem_idx := 0
            upper := 0
         else
            first_link := dispose_node(first_link)
            if mem_idx = 1 then
               mem_lnk := first_link
            else
               mem_idx := mem_idx - 1
            end
            upper := upper - 1
         end
         next_generation
      end

   remove (index: INTEGER)
      local
         link: like first_link
      do
         if index = 1 then
            remove_first
         elseif index = upper then
            remove_last
         else
            if index - 1 /= mem_idx then
               go_item(index - 1)
            end
            link := mem_lnk.next
            mem_lnk.set_next(dispose_node(link))
            upper := upper - 1
         end
         next_generation
      end

   first: like item
      do
         Result := first_link.item
      end

   last: like item
      do
         Result := last_link.item
      end

   item (index: INTEGER): E_
      do
         if index /= mem_idx then
            go_item(index)
         end
         Result := mem_lnk.item
      end

   put (element: like item; index: INTEGER)
      do
         if index /= mem_idx then
            go_item(index)
         end
         mem_lnk.set_item(element)
         next_generation
      end

   count: INTEGER
      do
         Result := upper
      end

   set_all_with (v: like item)
      do
         if first_link /= Void then
            first_link.set_all_with(v)
         end
         next_generation
      end

   copy (other: like Current)
      do
         from_collection(other)
      end

   fast_is_equal (other: like Current): BOOLEAN
      local
         lnk1, lnk2: like first_link
      do
         if Current = other then
            Result := True
         elseif upper = other.upper then
            from
               Result := True
               lnk1 := first_link
               lnk2 := other.first_link
            until
               lnk1 = Void or not Result
            loop
               Result := lnk1.item = lnk2.item
               lnk1 := lnk1.next
               lnk2 := lnk2.next
            end
         end
      end

   is_equal (other: like Current): BOOLEAN
      local
         lnk1, lnk2: like first_link; safe_equal: SAFE_EQUAL[E_]
      do
         if Current = other then
            Result := True
         elseif upper = other.upper then
            from
               Result := True
               lnk1 := first_link
               lnk2 := other.first_link
            until
               lnk1 = Void or not Result
            loop
               Result := safe_equal.test(lnk1.item, lnk2.item)
               lnk1 := lnk1.next
               lnk2 := lnk2.next
            end
         end
      end

   index_of (x: like item; start_index: INTEGER): INTEGER
      local
         safe_equal: SAFE_EQUAL[E_]
      do
         from
            Result := start_index
         until
            Result > upper or else safe_equal.test(x, item(Result))
         loop
            Result := Result + 1
         end
      end

   reverse_index_of (element: like item; start_index: INTEGER): INTEGER
      local
         safe_equal: SAFE_EQUAL[E_]; temporary_idx, new_mem_idx: like mem_idx
         temporary_lnk, new_mem_lnk: like mem_lnk
      do
         from
            temporary_idx := lower
            temporary_lnk := first_link
         until
            temporary_idx > start_index
         loop
            if safe_equal.test(element, temporary_lnk.item) then
               new_mem_idx := temporary_idx
               new_mem_lnk := temporary_lnk
            end
            temporary_idx := temporary_idx + 1
            temporary_lnk := temporary_lnk.next
         end
         if new_mem_lnk = Void then
            Result := lower - 1
         else
            Result := new_mem_idx
            mem_lnk := new_mem_lnk
            mem_idx := new_mem_idx
         end
      end

   fast_index_of (x: like item; start_index: INTEGER): INTEGER
      local
         u: like upper
      do
         from
            Result := start_index
            u := upper
         until
            Result > u or else x = item(Result)
         loop
            Result := Result + 1
         end
      end

   fast_reverse_index_of (element: like item; start_index: INTEGER): INTEGER
      local
         temporary_idx, new_mem_idx: like mem_idx; temporary_lnk, new_mem_lnk: like mem_lnk
      do
         from
            temporary_idx := lower
            temporary_lnk := first_link
         until
            temporary_idx > start_index
         loop
            if element = temporary_lnk.item then
               new_mem_idx := temporary_idx
               new_mem_lnk := temporary_lnk
            end
            temporary_idx := temporary_idx + 1
            temporary_lnk := temporary_lnk.next
         end
         if new_mem_lnk = Void then
            Result := lower - 1
         else
            Result := new_mem_idx
            mem_lnk := new_mem_lnk
            mem_idx := new_mem_idx
         end
      end

   clear_count, clear_count_and_capacity
      local
         lnk: like first_link
      do
         if first_link /= Void then
            from
               lnk := first_link
               first_link := Void
               mem_idx := 0
               mem_lnk := Void
               upper := 0
               last_link := Void
            until
               lnk = Void
            loop
               lnk := dispose_node(lnk)
            end
         end
         next_generation
      ensure then
         upper = 0
      end

   from_collection (model: TRAVERSABLE[like item])
      local
         i, up: INTEGER
      do
         if free_nodes = Void then
            free_nodes ::= common_free_nodes.fast_reference_at(generating_type)
            if free_nodes = Void then
               create free_nodes.set_item(Void)
               common_free_nodes.add(free_nodes, generating_type)
            end
         end
         clear_count
         from
            i := model.lower
            up := model.upper
         until
            i > up
         loop
            add_last(model.item(i))
            i := i + 1
         end
         next_generation
      end

   slice (low, up: INTEGER): like Current
      local
         lnk: like first_link; i: INTEGER
      do
         from
            create Result.make
            if mem_idx /= low then
               go_item(low)
            end
            lnk := mem_lnk
            i := up - low + 1
         until
            i = 0
         loop
            Result.add_last(lnk.item)
            lnk := lnk.next
            i := i - 1
         end
      end

   occurrences (element: like item): INTEGER
      local
         lnk: like first_link; safe_equal: SAFE_EQUAL[E_]
      do
         from
            lnk := first_link
         until
            lnk = Void
         loop
            if safe_equal.test(element, lnk.item) then
               Result := Result + 1
            end
            lnk := lnk.next
         end
      end

   fast_occurrences (element: like item): INTEGER
      local
         lnk: like first_link
      do
         from
            lnk := first_link
         until
            lnk = Void
         loop
            if element = lnk.item then
               Result := Result + 1
            end
            lnk := lnk.next
         end
      end

   force (element: like item; index: INTEGER)
      local
         v: like item
      do
         from
         until
            index <= upper
         loop
            add_last(v)
         end
         put(element, index)
      end

   all_default: BOOLEAN
      local
         l: like first_link; d: like item
      do
         from
            Result := True
            l := first_link
         until
            not Result or else l = Void
         loop
            d := l.item
            if d /= Void then
               Result := d.is_default
            end
            l := l.next
         end
      end

   remove_last
      do
         if upper = 1 then
            first_link := dispose_node(first_link)
            check
               first_link = Void
            end
            last_link := Void
            mem_lnk := Void
            mem_idx := 0
            upper := 0
         else
            if upper - 1 /= mem_idx then
               go_item(upper - 1)
            end
            upper := upper - 1
            last_link := mem_lnk
            last_link.set_next(dispose_node(last_link.next))
         end
         next_generation
      end

   replace_all (old_value, new_value: like item)
      local
         i: INTEGER; safe_equal: SAFE_EQUAL[E_]
      do
         from
            i := lower
         until
            i > upper
         loop
            if safe_equal.test(item(i), old_value) then
               put(new_value, i)
            end
            i := i + 1
         end
      end

   fast_replace_all (old_value, new_value: like item)
      local
         i: INTEGER
      do
         from
            i := lower
         until
            i > upper
         loop
            if item(i) = old_value then
               put(new_value, i)
            end
            i := i + 1
         end
      end

   new_iterator: ITERATOR[E_]
      do
         create {ITERATOR_ON_LINKED_LIST[E_]} Result.make(Current)
      end

   reverse
      local
         prev, lnk, next: like first_link
      do
         from
            lnk := first_link
         until
            lnk = Void
         loop
            next := lnk.next
            lnk.set_next(prev)
            prev := lnk
            lnk := next
         end
         last_link := first_link
         first_link := prev
         if mem_idx /= 0 then
            mem_idx := count - mem_idx + 1
         end
         next_generation
      end

feature {}
   go_item (i: INTEGER)
      require
         valid_index(i)
         mem_idx /= i
         mem_idx > 0
         mem_lnk /= Void
      do
         if mem_idx > i then
            mem_idx := 1
            mem_lnk := first_link
         end
         from
         until
            i = mem_idx
         loop
            mem_lnk := mem_lnk.next
            mem_idx := mem_idx + 1
         end
      ensure
         mem_idx = i
         mem_lnk /= Void
      end

   free_nodes: WEAK_REFERENCE[LINKED_LIST_NODE[E_]]
         -- If any, they are ready to be recycled.

   common_free_nodes: DICTIONARY[WEAK_REFERENCE[ANY_LINKED_LIST_NODE], STRING]
      once
         create {HASHED_DICTIONARY[WEAK_REFERENCE[ANY_LINKED_LIST_NODE], STRING]} Result.make
      end

   dispose_node (node: LINKED_LIST_NODE[E_]): LINKED_LIST_NODE[E_]
         -- Add `node' in the `free_nodes' list.
      require
         node /= Void
      local
         default_value: E_
      do
         Result := node.next
         node.make(default_value, free_nodes.item)
         free_nodes.set_item(node)
      ensure
         Result = old node.next
      end

   new_node (e: E_; next: LINKED_LIST_NODE[E_]): LINKED_LIST_NODE[E_]
         -- Recycle from `free_nodes' or create a new one.
      do
         Result := free_nodes.item
         if Result = Void then
            create Result.make(e, next)
         else
            free_nodes.set_item(Result.next)
            Result.make(e, next)
         end
      end

invariant
   empty_status: first_link = Void implies last_link = Void and upper = 0 and mem_idx = 0 and mem_lnk = Void
   not_empty_status: first_link /= Void implies last_link /= Void and upper > 0 and mem_idx > 0 and mem_lnk /= Void

end -- class LINKED_LIST
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
