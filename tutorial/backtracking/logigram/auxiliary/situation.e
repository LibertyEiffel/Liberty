-- See the Copyright notice at the end of this file.
--
class SITUATION

inherit
   BACKTRACKING

feature {ANY}
   description: DESCRIPTION

   dimension: INTEGER

   pdim: INTEGER

   wdim: INTEGER

   permut: ARRAY[PERMUT]

   solution: FAST_ARRAY[PERMUT]

   p, q: PERMUT

   situation: FAST_ARRAY[BIT_STRING]

   undo_masks: FAST_ARRAY[BIT_STRING]

   undo_index: FAST_ARRAY[INTEGER]

   undo_top: INTEGER

   nrsol: INTEGER

   make (the_desc: like description)
      require
         the_desc.is_valid
      do
         description := the_desc
         dimension := description.dimension
         pdim := fact(dimension)
         create p.make(dimension)
         create q.make(dimension)
         create permut.with_capacity(pdim, 1)
         make_permut(0)
         check
            permut.count = pdim
         end
         wdim := description.group_count
         wdim := wdim * (wdim - 1) // 2
         create situation.with_capacity(wdim)
         from
         until
            situation.count >= wdim
         loop
            situation.add_last(create {BIT_STRING}.make(pdim))
         end

         create undo_index.with_capacity(100)
         create undo_masks.with_capacity(100)
         create solution.with_capacity(description.group_count)
         from
         until
            solution.count = description.group_count
         loop
            solution.add_last(create {PERMUT}.make(dimension))
         end
      end

   solve
      local
         builder: MASK_BUILDER
      do
         create builder.make(Current)
         situation.for_each(agent {BIT_STRING}.set_all)
         nrsol := 0
         from
            set_current_node(description.constraints.build_nodes(builder))
            search_first
         until
            is_off
         loop
            success
            search_next
         end

         print("%N")
         print(nrsol.out)
         print(" solution")
         if nrsol > 1 then
            print("s")
         end

         print("%N%N")
      end

   index (g1, g2: GROUP): INTEGER
         -- The index of the group pair
      require
         g1 /= g2
      do
         if g1.index < g2.index then
            Result := index_integer(g1.index, g2.index)
         else
            Result := index_integer(g2.index, g1.index)
         end
      end

   index_integer (g1, g2: INTEGER): INTEGER
         -- the index of the pair
      require
         g1 < g2
      do
         Result := g1 + g2 * (g2 - 1) // 2
      end

   context_clear
      do
         undo_index.clear_count
         undo_top := undo_index.upper
      end

   context_push
      do
         undo_index.add_last(undo_top)
         undo_top := undo_index.upper
         from
         until
            undo_top <= undo_masks.upper
         loop
            undo_masks.add_last(create {BIT_STRING}.make(pdim))
         end
      end

   context_restore
      do
         from
         until
            undo_index.upper = undo_top
         loop
            situation.item(undo_index.last).copy(undo_masks.item(undo_index.upper))
            undo_index.remove_last
         end
      end

   context_restore_and_pop
      do
         context_restore
         undo_top := undo_index.last
         undo_index.remove_last
      end

   context_cut
         -- no cut allowed
      do
         check
            False
         end
      end

   change (idx: INTEGER; mask: BIT_STRING): BOOLEAN
      local
         value: BIT_STRING
      do
         value := situation.item(idx)
         undo_index.add_last(idx)
         from
         until
            undo_index.upper <= undo_masks.upper
         loop
            undo_masks.add_last(create {BIT_STRING}.make(pdim))
         end

         undo_masks.item(undo_index.upper).copy(value)
         value.and_mask(mask)
         Result := not value.all_cleared
      end

   success
      local
         i: INTEGER; x: PERMUT
      do
         from
            x := solution.item(0)
            i := 0
         until
            i = dimension
         loop
            x.put(i, i)
            i := i + 1
         end
         try_solution(1)
      end

   try_solution (idx: INTEGER)
         -- if idx is a valid group index then test if that group 'idx'
      require
         idx > 0
      local
         i, j: INTEGER; b: BIT_STRING
      do
         if idx = description.group_count then
            nrsol := nrsol + 1
            print_solution
         else
            b := situation.item(index_integer(0, idx))
            from
               i := 1
            until
               i > pdim
            loop
               if b.item(i) then
                  solution.put(permut.item(i), idx)
                  from
                     j := 1
                  until
                     j = idx or else not is_ok(j, idx)
                  loop
                     j := j + 1
                  end

                  if j = idx then
                     try_solution(idx + 1)
                  end
               end
               i := i + 1
            end
         end
      end

   is_ok (mid, last: INTEGER): BOOLEAN
      require
         mid > 0
         last > mid
      local
         j, k: INTEGER; xmid, xlast: PERMUT
      do
         xlast := solution.item(last)
         xmid := solution.item(mid)
         from
            j := 0
         until
            j = dimension
         loop
            p.put(xlast.item(j), xmid.item(j))
            j := j + 1
         end

         k := index_of_permut(p)
         Result := situation.item(index_integer(mid, last)).item(k)
      end

   index_of_permut (x: PERMUT): INTEGER
         -- the index of the permutation 'x'
         -- side effect: alter q
      local
         i, j, k: INTEGER
      do
         -- q is set to 1 2 3 4 ...
         from
            i := 0
         until
            i = dimension
         loop
            q.put(i, i)
            i := i + 1
         end

         from
            i := 0
         until
            i = dimension
         loop
            j := x.item(i)
            Result := Result * (dimension - i) + q.item(j)
            from
               k := j + 1
            until
               k = dimension
            loop
               q.put(q.item(k) - 1, k)
               k := k + 1
            end

            i := i + 1
         end

         Result := Result + 1
         check
            permut.item(Result).is_equal(x)
         end
      end

   print_solution
      do
         print("%N")
         print_dash_line
         print_head_line
         print_dash_line
         print_content_lines
         print_dash_line
      end

   print_dash_line
      local
         lgr, g, i: INTEGER
      do
         from
            print("+")
            g := 0
         until
            g = description.group_count
         loop
            from
               description.goto_index(g)
               lgr := description.group.width + 2
               i := 0
            until
               i = lgr
            loop
               print("-")
               i := i + 1
            end
            print("+")
            g := g + 1
         end
         print("%N")
      end

   print_head_line
      local
         lgr, g, i: INTEGER
      do
         from
            print("|")
            g := 0
         until
            g = description.group_count
         loop
            from
               description.goto_index(g)
               lgr := description.group.width - description.group.name.count
               check
                  lgr >= 0
               end
               print(" ")
               print(description.group.name)
               i := 0
            until
               i = lgr
            loop
               print(" ")
               i := i + 1
            end
            print(" |")
            g := g + 1
         end
         print("%N")
      end

   print_content_lines
      local
         lig, g, lgr, i: INTEGER; x: PERMUT
      do
         from
            lig := 0
         until
            lig = dimension
         loop
            from
               print("|")
               g := 0
            until
               g = description.group_count
            loop
               description.goto_index(g)
               x := solution.item(g)
               description.group.goto_index(x.item(lig))
               from
                  lgr := description.group.width - description.group.item.name.count
                  print(" ")
                  print(description.group.item.name)
                  i := 0
               until
                  i = lgr
               loop
                  print(" ")
                  i := i + 1
               end

               print(" |")
               g := g + 1
            end
            print("%N")
            lig := lig + 1
         end
      end

   print_group_pair (g1, g2: GROUP)
      local
         j, k: INTEGER; b: BIT_STRING; x: PERMUT
      do
         print("%NGROUP%T")
         print(g1.name)
         print("%T")
         print(g2.name)
         print("%N")
         print("%N")
         b := situation.item(index(g1, g2))
         from
            j := 1
         until
            j > pdim
         loop
            if b.item(j) then
               x := permut.item(j)
               from
                  k := 0
               until
                  k = dimension
               loop
                  g1.goto_index(k)
                  g2.goto_index(x @ k)
                  print("%T")
                  print(g1.item.name)
                  print("%T")
                  print(g2.item.name)
                  print("%N")
                  k := k + 1
               end

               print("%N")
            end
            j := j + 1
         end
      end

feature {}
   fact (n: INTEGER): INTEGER
      do
         if n > 1 then
            Result := n * fact(n - 1)
         else
            Result := 1
         end
      end

   make_permut (pos: INTEGER)
      local
         i, j: INTEGER
      do
         if pos = dimension then
            permut.add_last(create {PERMUT}.from_collection(p))
         else
            from
               i := 0
            until
               i = dimension
            loop
               from
                  j := 0
               until
                  j = pos or else p.item(j) = i
               loop
                  j := j + 1
               end
               if j = pos then
                  p.put(i, pos)
                  make_permut(pos + 1)
               end

               i := i + 1
            end
         end
      end

end -- class SITUATION
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is free software, which comes along with SmartEiffel. This software is distributed in the hope that it will be
-- useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-- You can modify it as you want, provided this footer is kept unaltered, and a notification of the changes is added.
-- You are allowed to redistribute it and sell it, alone or as a part of another product.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
