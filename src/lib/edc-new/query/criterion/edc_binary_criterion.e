class EDC_BINARY_CRITERION

inherit
   EDC_CRITERION

feature {}
   make (one, two: EDC_CRITERION)
      require
         one /= Void
         two /= Void
         one /= two
      do
         list := {FAST_ARRAY[EDC_CRITERION] << one, two >>}
      ensure
         list.count = 2
         list.first = one
         list.last = two
      end

   list: FAST_ARRAY[EDC_CRITERION]

invariant
   list.count > 1

end -- class EDC_BINARY_CRITERION
