class TEST_DEEP_TWIN_ARRAY2

insert EIFFELTEST_TOOLS

create {}
   make

feature {}
   integers, some_primes: COLLECTION[INTEGER_8]
   array, another, a_third: COLLECTION[STRING]
   label, label2, label3: ABSTRACT_STRING

   make
      do
         some_primes := <<2,3,5,7,11,13,17,23>>
         integers := some_primes.deep_twin
         integers.print_on(io)
         assert (integers.is_deep_equal(some_primes))

         array := <<"First", "Second", "Third">>
         another := array.twin
         a_third := array.deep_twin
         array.first.append(" element")
         assert (array.first ~ "First element")
         assert (array.is_deep_equal(another))
         assert (not array.is_deep_equal(a_third))

         label := ("array is #(1)" # &array)
         label.print_on(io)
         assert ( label.is_equal("array is {ARRAY[STRING]:[First element Second Third]}"))
         label2 := ("another is #(1)" # &another)
         label2.print_on(io)
         assert ( label2.is_equal("another is {ARRAY[STRING]:[First element Second Third]}"))
         label3 := ("a_third is #(1)" # &a_third)
         label3.print_on(io)
         assert ( label3.is_equal("a_third is {ARRAY[STRING]:[First Second Third]}"))
      end

end
