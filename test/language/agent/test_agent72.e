class TEST_AGENT72
-- test nested closures

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         a1.for_each(agent (i: INTEGER_8)
                     do
                        assert(a2.exists(agent (j: INTEGER_8): BOOLEAN
                                         do
                                            Result := (j = 2 ^ i)
                                         end (?)))
                     end (?))
      end

   a1: FAST_ARRAY[INTEGER_8]
      once
         Result := {FAST_ARRAY[INTEGER_8] << 1, 2, 3 >>}
      end

   a2: FAST_ARRAY[INTEGER_8]
      once
         Result := {FAST_ARRAY[INTEGER_8] << 2, 4, 8 >>}
      end

end -- class TEST_AGENT72
