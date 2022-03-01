class TEST_DEEP_TWIN_LIST

insert EIFFELTEST_TOOLS

create {}
   make

feature {}
   integers, some_primes: COLLECTION[INTEGER_8]
   list, another, third: COLLECTION[STRING]
   label, label2, label3: ABSTRACT_STRING
   
   make
      do
         some_primes := {LINKED_LIST[INTEGER_8] <<2,3,5,7,11,13,17,23>>}
         integers := some_primes.deep_twin
         integers.print_on(io); io.put_new_line
         assert (integers.is_deep_equal(some_primes))

         list := {LINKED_LIST[STRING] <<"First", "Second", "Third">>}
         another := list.twin
         third := list.deep_twin
         list.first.append(" element")
         assert (list.first ~ "First element")
         assert (list.is_equal(another))
         assert (not list.is_deep_equal(third))

         label := ("list is #(1)" # &list)
         label.print_on(io); io.put_new_line

         assert ( label.is_equal("list is {LINKED_LIST[STRING]:[First element Second Third]}"))
         label2 := ("another is #(1)" # &another)
         label2.print_on(io); io.put_new_line

         assert ( label2.is_equal("another is {LINKED_LIST[STRING]:[First element Second Third]}"))
         label3 := ("a_third is #(1)" # &third)
         label3.print_on(io); io.put_new_line

         assert ( label3.is_equal("third is {LINKED_LIST[STRING]:[First Second Third]}"))
      end

end
