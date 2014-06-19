class ITERATOR_ON_AVL_SET[E_]

inherit
   ITERATOR[E_]

insert
   AVL_TREE_ITERATOR[E_]

create {ABSTRACT_AVL_SET}
   make

feature {ANY}
   start
      do
         if set.root /= Void then
            generation := iterable_generation
            go_first(set.root)
         end
      end

   is_off: BOOLEAN
      do
         Result := cur = Void
      end

   item: E_
      local
         node: ABSTRACT_AVL_SET_NODE[E_]
      do
         node ::= cur
         Result := node.item
      end

   next
      do
         go_next
      end

feature {}
   make (a_set: like set)
      require
         a_set /= Void
      do
         set := a_set
         nodes := new_nodes
         start
      ensure
         set = a_set
      end

   set: ABSTRACT_AVL_SET[E_]

feature {ANY}
   iterable_generation: INTEGER
      do
         Result := set.generation
      end

invariant
   set /= Void

end -- class ITERATOR_ON_AVL_SET
