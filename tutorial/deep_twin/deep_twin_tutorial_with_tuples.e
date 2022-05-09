class DEEP_TWIN_TUTORIAL_WITH_TUPLES
   -- Any object hierarchy can be entirely duplicated using the deep_twin.
   -- "deep_twin" is a new object with the dynamic type of Current.  The new
   -- object structure is recursively duplicated from the one attached to
   -- `Current'.

create {ANY}
   main

feature {ANY}
   main
      do

         print("Currently the compiler does not handle deep twinning of TUPLEs.%N")
         die_with_code(0)

         -- tree := new_tree;
         -- ("Let's take a `tree' of TUPLES like #(1) and duplicate it with `twin'%N" # &tree).print_on(std_output)
         -- another := tree.twin;

         -- ("[
         -- Another tree items are actually the same of the original tree:
         -- another.item_1 = tree.item_1? #(1)
         -- another.item_2 = tree.item_2? #(2)
         -- another.item_3 = tree.item_3? #(3)

         -- Note: a BOOLEAN is not directly printable, but we can obtain use & to get a lazy, printable representation 
         -- ]" 
         -- # &(another.item_1 = tree.item_1) 
         -- # &(another.item_2 = tree.item_2)
         -- # &(another.item_3 = tree.item_3)).print_on(io)

         -- a_twin := tree.deep_twin;
         -- ("[
         -- Now we create a_twin using `deep_twin': see as tree items are actually different objects than those of the original tree:
         -- a_twin.item_1 = tree.item_1? #(1)
         -- a_twin.item_2 = tree.item_2? #(2)
         -- a_twin.item_3 = tree.item_3? #(3)

         -- ]" 
         -- # &(a_twin.item_1 = tree.item_1) 
         -- # &(a_twin.item_2 = tree.item_2)
         -- # &(a_twin.item_3 = tree.item_3)).print_on(io)
      end

   tree, another, a_twin: like new_tree

   new_tree: TUPLE [STRING, TUPLE, TUPLE]
      do
         f := ["F", 22]
         e := ["E", 12]
         d := ["D", 42]
         c := ["C", d, e ]
         b := ["B", 3]
         a := ["A", b, c]
         Result := ["Root", a,f]
      end

   a,b,c,d,e,f: TUPLE 

   ring: TUPLE
      do
      end

end -- class DEEP_TWIN_TUTORIAL_WITH_TUPLES
