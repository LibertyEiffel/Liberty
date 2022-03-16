-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class HIERARCHIC_GRAPH_NODE[E_ -> HASHABLE]

insert
   HASHABLE
   PLATFORM

create {ANY}
   make

feature {ANY}
   make (i: like item)
      do
         if parents = Void then
            create parents.make(0)
            create children.make(0)
            create parents_edge.make(0)
            create children_edge.make(0)
         else
            deconnect_current
         end
         mark := False
         item := i
      ensure
         parents_count = 0
         children_count = 0
         item = i
      end

feature {ANY}
   item: E_

   max_rank: INTEGER

   min_rank: INTEGER

   parents: FAST_ARRAY[like Current]

   children: FAST_ARRAY[like Current]

   set_item (i: like item)
      do
         item := i
      end

   parents_count: INTEGER
      do
         Result := parents.count
      end

   children_count: INTEGER
      do
         Result := children.count
      end

   add_parent (node: like Current)
      require
         node /= Void
      local
         tmp: like children_edge
      do
         tmp := node.children_edge
         node.children.add_last(Current)
         parents.add_last(node)
         parents_edge.add_last(0)
         tmp.add_last(0)
      end

   add_child (node: like Current)
      require
         node /= Void
      local
         tmp: like parents_edge
      do
         tmp := node.parents_edge
         node.parents.add_last(Current)
         children.add_last(node)
         children_edge.add_last(0)
         tmp.add_last(0)
      end

   remove_parent (node: like Current)
      require
         has_parent(node)
      local
         i: INTEGER; tmp: like children_edge
      do
         i := node.children.fast_first_index_of(Current)
         tmp := node.children_edge
         node.children.remove(i)
         tmp.remove(i)
         i := parents.fast_first_index_of(node)
         parents.remove(i)
         parents_edge.remove(i)
      end

   has_parent_edge (id: INTEGER): BOOLEAN
      do
         Result := parents_edge.fast_has(id)
      end

   has_child_edge (id: INTEGER): BOOLEAN
      do
         Result := children_edge.fast_has(id)
      end

   remove_child (node: like Current)
      require
         has_child(node)
      local
         i: INTEGER; tmp: like parents_edge
      do
         i := node.parents.fast_first_index_of(Current)
         tmp := node.parents_edge
         node.parents.remove(i)
         tmp.remove(i)
         i := children.first_index_of(node)
         children.remove(i)
         children_edge.remove(i)
      end

   remove_parent_edge (id: INTEGER): like Current
         -- Return connected node.
      require
         has_parent_edge(id)
      local
         i: INTEGER; tmp: like children_edge
      do
         i := parents_edge.fast_first_index_of(id)
         Result := parents.item(i)
         tmp := Result.children_edge
         tmp.put(-1, tmp.fast_first_index_of(id))
         parents_edge.put(-1, i)
      ensure
         not has_parent_edge(id)
      end

   restore_parent_edge (id: INTEGER; node: like Current)
      require
         not has_parent_edge(id)
         has_parent_edge(-1)
         has_parent(node)
         not node.has_child_edge(id)
         node.has_child_edge(-1)
      local
         i: INTEGER; tmp1: like children; tmp2: like children_edge
      do
         from
            tmp1 := node.children
            tmp2 := node.children_edge
         until
            tmp1.item(i) = Current and then tmp2.item(i) = -1
         loop
            i := i + 1
         end
         tmp2.put(id, i)
         from
            i := 0
         until
            parents.item(i) = node and then parents_edge.item(i) = -1
         loop
            i := i + 1
         end
         parents_edge.put(id, i)
      ensure
         has_parent_edge(id)
      end

   remove_child_edge (id: INTEGER): like Current
         -- Return connected node.
      require
         has_child_edge(id)
      local
         i: INTEGER; tmp: like parents_edge
      do
         i := children_edge.fast_first_index_of(id)
         Result := children.item(i)
         tmp := Result.parents_edge
         tmp.put(-1, tmp.fast_first_index_of(id))
         children_edge.put(-1, i)
      ensure
         not has_child_edge(id)
      end

   restore_child_edge (id: INTEGER; node: like Current)
      require
         not has_child_edge(id)
         has_child_edge(-1)
         has_child(node)
         not node.has_parent_edge(id)
         node.has_parent_edge(-1)
      local
         i: INTEGER; tmp1: like parents; tmp2: like parents_edge
      do
         from
            tmp1 := node.parents
            tmp2 := node.parents_edge
         until
            tmp1.item(i) = Current and then tmp2.item(i) = -1
         loop
            i := i + 1
         end
         tmp2.put(id, i)
         from
            i := 0
         until
            children.item(i) = node and then children_edge.item(i) = -1
         loop
            i := i + 1
         end
         children_edge.put(id, i)
      ensure
         has_child_edge(id)
      end

   deep_reset_edges
         -- Set edge identifiers with values starting from 0.
      local
         max, i: INTEGER; node: like Current
      do
         max := internal_deep_reset_edges #// 2
         deep_unmark_connected
         i := internal_deep_init_edges(max)
         check
            i = 0
         end
         if has_parent_edge(max) then
            node := remove_parent_edge(max)
            restore_parent_edge(0, node)
         elseif has_child_edge(max) then
            node := remove_child_edge(max)
            restore_child_edge(0, node)
         end
         deep_unmark_connected
      end

   parent (i: INTEGER): like Current
      require
         i.in_range(1, parents_count)
      do
         Result := parents.item(i - 1)
      end

   child (i: INTEGER): like Current
      require
         i.in_range(1, children_count)
      do
         Result := children.item(i - 1)
      end

   has_parent (other: like Current): BOOLEAN
      do
         Result := parents.has(other)
      ensure
         Result = other.has_child(Current)
      end

   has_child (other: like Current): BOOLEAN
      do
         Result := children.has(other)
      ensure
         Result = other.has_parent(Current)
      end

   parent_edge (i: INTEGER): INTEGER
      require
         i.in_range(1, parents_count)
      do
         Result := parents_edge.item(i - 1)
      end

   child_edge (i: INTEGER): INTEGER
      require
         i.in_range(1, children_count)
      do
         Result := children_edge.item(i - 1)
      end

   has_cycle: BOOLEAN
      do
         Result := has_parent_cycle or else has_children_cycle
      end

   has_parent_cycle: BOOLEAN
      do
         Result := internal_has_parent_cycle
         clean_mark_score
      end

   has_children_cycle: BOOLEAN
      do
         Result := internal_has_children_cycle
         clean_mark_score
      end

   is_toplevel: BOOLEAN
      do
         Result := parents.is_empty
      ensure
         Result = (parents_count = 0)
      end

   is_leaf: BOOLEAN
      do
         Result := children.is_empty
      ensure
         Result = (children_count = 0)
      end

   is_connected_to (other: like Current): BOOLEAN
      require
         other /= Void
      do
         Result := internal_is_connected_to(other)
         deep_unmark_connected
      ensure
         Result = (distance(other) /= Maximum_integer)
      end

   distance (other: like Current): INTEGER
      require
         other /= Void
      local
         max: INTEGER
      do
         from
            Result := -1
            max := 4
         until
            Result /= -1
         loop
            Result := internal_distance(other, 0, max)
            max := max + max |>> 1
         end
         other.clean_mark_score
      ensure
         is_connected_to(other) = (distance(other) /= Maximum_integer)
      end

   set_rank
      require
         not has_cycle --TODO: no graph cycle
      do
         min_rank := 0
         max_rank := 0
         mark := True
         if not parents.is_empty then
            parents.first.internal_set_rank
         elseif not children.is_empty then
            children.first.internal_set_rank
         end
         deep_unmark_connected
      end

   add_connected_nodes_in (list: COLLECTION[HIERARCHIC_GRAPH_NODE[E_]])
         -- Add in `list' all nodes belonging to the same graph as `Current'
      require
         list /= Void
      do
         internal_add_connected_nodes_in(list)
         deep_unmark_connected
      end

   fill_path_to (path: COLLECTION[INTEGER]; destination: like Current)
         -- Add in `path' edges identifiers corresponding to a path
         -- from current node to `destination' node.
      require
         is_connected_to(destination)
         destination /= Current
      local
         dummy: BOOLEAN
      do
         dummy := internal_fill_path_to(path, destination, path.upper + 1)
         check
            dummy
         end
         deep_unmark_connected
      end

   hash_code: INTEGER
      do
         Result := item.hash_code
      end

feature {HIERARCHIC_GRAPH_NODE}
   internal_has_parent_cycle: BOOLEAN
      local
         i: INTEGER
      do
         Result := mark
         mark := True
         if mark_score /= 1 then
            from
               i := parents.upper
            until
               i < parents.lower or else Result
            loop
               Result := parents.item(i).has_parent_cycle
               i := i - 1
            end
            mark_score := 1
         end
         mark := False
      end

   internal_has_children_cycle: BOOLEAN
      local
         i: INTEGER
      do
         Result := mark
         mark := True
         if mark_score /= 1 then
            from
               i := children.upper
            until
               i < children.lower or else Result
            loop
               Result := children.item(i).internal_has_children_cycle
               i := i - 1
            end
            mark_score := 1
         end
         mark := False
      end

   internal_is_connected_to (other: like Current): BOOLEAN
      require
         other /= Void
      local
         i: INTEGER
      do
         Result := parents.has(other) or else children.has(other)
         if not Result then
            mark := True
            from
               i := parents.upper
            until
               i < parents.lower or Result
            loop
               if not parents.item(i).mark then
                  Result := parents.item(i).internal_is_connected_to(other)
               end
               i := i - 1
            end
            from
               i := children.upper
            until
               i < children.lower or Result
            loop
               if not children.item(i).mark then
                  Result := children.item(i).internal_is_connected_to(other)
               end
               i := i - 1
            end
         end
      end

   internal_unmark_parents
      local
         i: INTEGER
      do
         mark := False
         from
            i := parents.upper
         until
            i < parents.lower
         loop
            parents.item(i).unmark
            i := i - 1
         end
      end

   internal_unmark_children
      local
         i: INTEGER
      do
         from
            i := children.upper
         until
            i < children.lower
         loop
            children.item(i).unmark
            i := i - 1
         end
      end

   internal_unmark_connected
         -- unmark parents and children
      local
         i: INTEGER
      do
         mark := False
         from
            i := parents.upper
         until
            i < parents.lower
         loop
            parents.item(i).unmark
            i := i - 1
         end
         from
            i := children.upper
         until
            i < children.lower
         loop
            children.item(i).unmark
            i := i - 1
         end
      end

   internal_deep_reset_edges: INTEGER
      local
         i: INTEGER; node: like Current
      do
         mark := True
         parents_edge.make(parents_edge.count)
         children_edge.make(children_edge.count)
         Result := parents_count + children_count
         from
            i := parents.upper
         until
            i < parents.lower
         loop
            node := parents.item(i)
            if not node.mark then
               Result := Result + node.internal_deep_reset_edges
            end
            i := i - 1
         end
         from
            i := children.upper
         until
            i < children.lower
         loop
            node := children.item(i)
            if not node.mark then
               Result := Result + node.internal_deep_reset_edges
            end
            i := i - 1
         end
      end

   internal_deep_init_edges (use: INTEGER): INTEGER
      local
         i, j: INTEGER; node: like Current; n_list: FAST_ARRAY[like Current]; e_list: FAST_ARRAY[INTEGER]
      do
         mark := True
         from
            Result := use
            i := parents_edge.upper
         until
            i < parents_edge.lower
         loop
            if parents_edge.item(i) = 0 then
               parents_edge.put(Result, i)
               from
                  n_list := parents.item(i).children
                  e_list := parents.item(i).children_edge
                  j := n_list.lower
               until
                  n_list.item(j) = Current and then e_list.item(j) = 0
               loop
                  j := j + 1
               end
               e_list.put(Result, j)
               Result := Result - 1
            end
            i := i - 1
         end
         from
            i := children_edge.upper
         until
            i < children_edge.lower
         loop
            if children_edge.item(i) = 0 then
               children_edge.put(Result, i)
               from
                  n_list := children.item(i).parents
                  e_list := children.item(i).parents_edge
                  j := n_list.lower
               until
                  n_list.item(j) = Current and then e_list.item(j) = 0
               loop
                  j := j + 1
               end
               e_list.put(Result, j)
               Result := Result - 1
            end
            i := i - 1
         end
         from
            i := parents.upper
         until
            i < parents.lower
         loop
            node := parents.item(i)
            if not node.mark then
               Result := node.internal_deep_init_edges(Result)
            end
            i := i - 1
         end
         from
            i := children.upper
         until
            i < children.lower
         loop
            node := children.item(i)
            if not node.mark then
               Result := node.internal_deep_init_edges(Result)
            end
            i := i - 1
         end
      end

   internal_distance (other: like Current; pos, max: INTEGER): INTEGER
         -- Returns Maximum_integer if inaccessibility detected
         -- Returns -1 when break needed
         -- Distance from current point otherwise
         -- Warning: max length and pos are from the search start.
      require
         max >= pos
         max < Maximum_integer
      local
         i: INTEGER; next_pos, best, d: INTEGER; break_found: BOOLEAN
      do
         if is_equal(other) then
            Result := 0
         elseif pos = max then
            Result := -1
         elseif mark_score /= 0 then
            Result := mark_score
         else
            mark := True
            Result := Maximum_integer
            next_pos := pos + 1
            best := max
            from
               i := parents.upper
            until
               i < parents.lower
            loop
               if not parents.item(i).mark then
                  d := parents.item(i).internal_distance(other, next_pos, best)
                  if d = -1 then
                     break_found := True
                  elseif d <= best - next_pos then
                     Result := d + 1
                     best := d + next_pos
                  end
               end
               i := i - 1
            end
            from
               i := children.upper
            until
               i < children.lower
            loop
               if not children.item(i).mark then
                  d := children.item(i).internal_distance(other, next_pos, best)
                  if d = -1 then
                     break_found := True
                  elseif d <= best - next_pos then
                     Result := d + 1
                     best := d + next_pos
                  end
               end
               i := i - 1
            end
            if Result < Maximum_integer then
               mark_score := Result
            elseif break_found then
               Result := -1
            end
            mark := False
         end
      ensure
      --|*** Result = -1 or Result = Maximum_integer or Result.in_range(0, max-pos)
      end

   clean_mark_score
      local
         i: INTEGER
      do
         mark_score := 0
         from
            i := parents.upper
         until
            i < parents.lower
         loop
            if parents.item(i).mark_score /= 0 then
               parents.item(i).clean_mark_score
            end
            i := i - 1
         end
         from
            i := children.upper
         until
            i < children.lower
         loop
            if children.item(i).mark_score /= 0 then
               children.item(i).clean_mark_score
            end
            i := i - 1
         end
      end

   internal_set_rank
      local
         min, max: INTEGER; i: INTEGER; max_changed: BOOLEAN
      do
         -- Search min/max values using parents/children
         from
            min := Minimum_integer
            i := parents.upper
         until
            i < parents.lower
         loop
            if parents.item(i).mark then
               min := min.max(parents.item(i).min_rank + 1)
            end
            i := i - 1
         end
         from
            max := Maximum_integer
            i := children.upper
         until
            i < children.lower
         loop
            if children.item(i).mark then
               max := max.min(children.item(i).max_rank - 1)
            end
            i := i - 1
         end
         check
            min /= Minimum_integer or max /= Maximum_integer
         end
         if min = Minimum_integer then
            min := max
         elseif max = Maximum_integer then
            max := min
         elseif min > max then
            min := max
         end
         if not mark then
            mark := True
            min_rank := min
            max_rank := max
            from
               i := parents.upper
            until
               i < parents.lower
            loop
               parents.item(i).internal_set_rank
               i := i - 1
            end
            from
               i := children.upper
            until
               i < children.lower
            loop
               children.item(i).internal_set_rank
               i := i - 1
            end
         else
            if max_rank /= max then
               max_changed := True
            end
            if min_rank /= min then
               min_rank := min
               max_rank := max
               from
                  i := children.upper
               until
                  i < children.lower
               loop
                  if children.item(i).mark then
                     children.item(i).internal_set_rank
                  end
                  i := i - 1
               end
            end
            if max_changed then
               max_rank := max
               from
                  i := parents.upper
               until
                  i < parents.lower
               loop
                  if parents.item(i).mark then
                     parents.item(i).internal_set_rank
                  end
                  i := i - 1
               end
            end
         end
      end

   internal_add_connected_nodes_in (list: COLLECTION[HIERARCHIC_GRAPH_NODE[E_]])
      local
         i: INTEGER
      do
         list.add_last(Current)
         mark := True
         from
            i := parents.upper
         until
            i < parents.lower
         loop
            if not parents.item(i).mark then
               parents.item(i).internal_add_connected_nodes_in(list)
            end
            i := i - 1
         end
         from
            i := children.upper
         until
            i < children.lower
         loop
            if not children.item(i).mark then
               children.item(i).internal_add_connected_nodes_in(list)
            end
            i := i - 1
         end
      end

   internal_fill_path_to (path: COLLECTION[INTEGER]; destination: like Current; position: INTEGER): BOOLEAN
      local
         i: INTEGER; pos: INTEGER; node: like Current
      do
         if destination = Current then
            path.force(0, position - 1)
            Result := True
         else
            mark := True
            pos := position + 1
            from
               i := parents.upper
            until
               i < parents.lower or else Result
            loop
               node := parents.item(i)
               if not node.mark and then parents_edge.item(i) /= -1 then
                  if node.internal_fill_path_to(path, destination, pos) then
                     path.put(parents_edge.item(i), position)
                     Result := True
                  end
               end
               i := i - 1
            end
            from
               i := children.upper
            until
               i < children.lower or else Result
            loop
               node := children.item(i)
               if not node.mark and then children_edge.item(i) /= -1 then
                  if node.internal_fill_path_to(path, destination, pos) then
                     path.put(children_edge.item(i), position)
                     Result := True
                  end
               end
               i := i - 1
            end
         end
      end

feature {}
   invariant_checking_mode: REFERENCE[BOOLEAN]
      once
         create Result
      end

   valid_parents: BOOLEAN
      local
         i: INTEGER; element: like Current
      do
         from
            i := parents.upper
            Result := True
         until
            i < parents.lower
         loop
            element := parents.item(i)
            Result := Result and then parents.fast_occurrences(element) = element.children.fast_occurrences(Current)
            i := i - 1
         end
         Result := Result and parents.count = parents_edge.count
      end

   valid_children: BOOLEAN
      local
         i: INTEGER; element: like Current
      do
         from
            i := children.upper
            Result := True
         until
            i < children.lower
         loop
            element := children.item(i)
            Result := Result and then children.fast_occurrences(element) = element.parents.fast_occurrences(Current)
            i := i - 1
         end
         Result := Result and children.count = children_edge.count
      end

   valid_parents_and_children: BOOLEAN
      do
         if not invariant_checking_mode.item then
            set_invariant_checking_mode(True)
            Result := valid_parents
            check
               Result
            end
            Result := Result and valid_children
            set_invariant_checking_mode(False)
         end
      ensure
         assertion_only: Result
      end

   set_invariant_checking_mode (new_mode: BOOLEAN)
      require
         new_mode /= invariant_checking_mode.item
      do
         invariant_checking_mode.set_item(new_mode)
      end

   deconnect_current
      local
         i, j: INTEGER; tmp: like parents
      do
         from
            i := parents.upper
         until
            i < parents.lower
         loop
            from
               tmp := parents.item(i).children
               j := tmp.upper
            until
               tmp.item(j) = Current
            loop
               j := j - 1
            end
            parents.item(i).children_edge.remove(j)
            tmp.remove(j)
            i := i - 1
         end
         from
            i := children.upper
         until
            i < children.lower
         loop
            from
               tmp := children.item(i).parents
               j := tmp.upper
            until
               tmp.item(j) = Current
            loop
               j := j - 1
            end
            children.item(i).parents_edge.remove(j)
            tmp.remove(j)
            i := i - 1
         end
         parents.make(0)
         children.make(0)
         parents_edge.make(0)
         children_edge.make(0)
      end

feature {HIERARCHIC_GRAPH_NODE} --|*** feature?
   parents_edge: FAST_ARRAY[INTEGER]

   children_edge: FAST_ARRAY[INTEGER]

   mark: BOOLEAN

   unmark
      do
         mark := False
      end

   set_mark
      do
         mark := True
      end

   deep_unmark_connected
         -- deep unmark parents and children (paths stops at unmarked nodes)
      local
         i: INTEGER
      do
         mark := False
         from
            i := parents.upper
         until
            i < parents.lower
         loop
            if parents.item(i).mark then
               parents.item(i).deep_unmark_connected
            end
            i := i - 1
         end
         from
            i := children.upper
         until
            i < children.lower
         loop
            if children.item(i).mark then
               children.item(i).deep_unmark_connected
            end
            i := i - 1
         end
      end

feature {HIERARCHIC_GRAPH_NODE}
   mark_score: INTEGER

invariant
   valid_parents_and_children

end -- class HIERARCHIC_GRAPH_NODE
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
