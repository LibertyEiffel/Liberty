class ITERATOR_ON_AVL_DICTIONARY[V_, K_]

inherit
   ITERATOR[TUPLE[V_, K_]]

insert
   AVL_TREE_ITERATOR[K_]

create {ABSTRACT_AVL_DICTIONARY}
   make

feature {ANY}
   start is
      do
         if dico.root /= Void then
            nodes.push(dico.root)
            generation := iterable_generation
            go_first
         end
      end

   is_off: BOOLEAN is
      do
         Result := cur = Void
      end

   item: TUPLE[V_, K_] is
      local
         node: ABSTRACT_AVL_DICTIONARY_NODE[V_, K_]
      do
         node ::= cur
         Result := [node.value, node.key]
      end

   next is
      do
         go_next
      end

feature {}
   make (a_dico: like dico) is
      do
         dico := a_dico
         create nodes.make
         start
      ensure
         dico = a_dico
      end

   dico: ABSTRACT_AVL_DICTIONARY[V_, K_]

feature {ANY}
   iterable_generation: INTEGER is
      do
         Result := dico.generation
      end

end -- class ITERATOR_ON_AVL_DICTIONARY
