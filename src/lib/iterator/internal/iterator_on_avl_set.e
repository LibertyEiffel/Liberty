class ITERATOR_ON_AVL_SET[E_]

inherit
   ITERATOR[E_]

insert
   AVL_TREE_ITERATOR[E_]

creation {ABSTRACT_AVL_SET}
   make

feature {ANY}
   start is
      do
         if set.root /= Void then
            nodes.push(set.root)
            generation := iterable_generation
            go_first
         end
      end

   is_off: BOOLEAN is
      do
         Result := cur = Void
      end

   item: E_ is
      local
         node: AVL_TREE_NODE[E_]
      do
         node ::= cur
         Result := node.item
      end

   next is
      do
         go_next
      end

feature {}
   make (a_set: like set) is
      require
         a_set /= Void
      do
         set := a_set
         create nodes.make
         start
      ensure
         set = a_set
      end

   set: ABSTRACT_AVL_SET[E_]

   iterable_generation: INTEGER is
      do
         Result := set.generation
      end

invariant
   set /= Void

end -- class ITERATOR_ON_AVL_SET
