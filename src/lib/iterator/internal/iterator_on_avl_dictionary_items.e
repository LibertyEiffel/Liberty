class ITERATOR_ON_AVL_DICTIONARY_ITEMS[V_, K_]

inherit
   ITERATOR[V_]

insert
   AVL_TREE_ITERATOR[K_]

create {ABSTRACT_AVL_DICTIONARY}
   make

feature {ANY}
   start
      do
         if dico.root /= Void then
            go_first(dico.root)
            generation := iterable_generation
         end
      end

   is_off: BOOLEAN
      do
         Result := cur = Void
      end

   item: V_
      local
         node: ABSTRACT_AVL_DICTIONARY_NODE[V_, K_]
      do
         node ::= cur
         Result := node.value
      end

   next
      do
         go_next
      end

feature {}
   make (a_dico: like dico)
      do
         dico := a_dico
         nodes := new_nodes
         start
      ensure
         dico = a_dico
      end

   dico: ABSTRACT_AVL_DICTIONARY[V_, K_]

feature {ANY}
   iterable_generation: INTEGER
      do
         Result := dico.generation
      end

end -- class ITERATOR_ON_AVL_DICTIONARY_ITEMS
