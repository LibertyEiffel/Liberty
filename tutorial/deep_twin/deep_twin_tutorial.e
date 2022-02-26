class DEEP_TWIN_TUTORIAL
   -- Any object hierarchy can be entirely duplicated using the deep_twin.
   -- "deep_twin" is a new object with the dynamic type of Current.  The new
   -- object structure is recursively duplicated from the one attached to
   -- `Current'.

create {ANY}
   main

feature {ANY}
   array, another, third: COLLECTION[STRING]

   main
      do
         -- array := {LINKED_array[STRING] <<"First", "Second", "Third">>}
         array := <<"First", "Second", "Third">>
         ("Let's take some strings #(1) and duplicate it with `twin'%N" # &array).print_on(std_output)
         another := array.twin;

         ("[
         Another array items are actually the same of the original array:
         another@1 = array.item(1)? #(1)
         another@2 = array.item(2)? #(2)
         another@3 = array.item(3)? #(3)

         Note: a BOOLEAN is not directly printable, but we can obtain use & to get a lazy, printable representation 
         TODO: yes, I know people fond of other languages would have written another[1] = array[1]. We're working on it

         ]" 
         # &(another@1 = array.item(1))
         # &(another@2 = array.item(2))
         # &(another@3 = array.item(3))).print_on(io)

         third := array.deep_twin;
         ("[
         Now we create third using `deep_twin': see as array items are actually different objects than those of the original array:
         third@1 = array.item(1)? #(1)
         third@2 = array.item(2)? #(2)
         third@3 = array.item(3)? #(3)

         ]" 
         # &(third@1 = array.item(1)) 
         # &(third@2 = array.item(2))
         # &(third@3 = array.item(3))).print_on(io)
         
         -- Let's change some of them
         array.first.append(" element")
         array.last.append(" and last")
         another.add_last("Fourth")

         (
         ("[ 
         Let's append something to the elements of array and a fourth element to another: "#(1)"
         another, which has been created using twin is a different points to the same elements of array, so its contents are changed too: #(2)
         third, created with deep twin is changed: #(3)

         ]" # &array # &another 
            ) #  &third
            ).print_on(io)


      end
end -- class DEEP_TWIN_TUTORIAL
