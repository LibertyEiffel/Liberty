class TEST_AGENT70

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   data: AVL_DICTIONARY[STRING, INTEGER]
      once
         create Result.make
         Result.add("foo", 1)
         Result.add("bar", 0)
         Result.add("duck", 2)
      end

   make
      local
         i: INTEGER
         checker: PREDICATE[TUPLE[STRING, INTEGER]]
         expected: FAST_ARRAY[STRING]
      do
         expected := {FAST_ARRAY[STRING] << "bar", "foo", "duck" >> }
         checker := agent do_check(?, ?, expected)
         assert(data.for_all(checker))

         data.add("kouak", 3)
         expected.add_last("kouak")

         from
            i := data.lower
         until
            i > data.upper
         loop
            label_assert(i.out, checker.item([data.item(i), data.key(i)]))
            i := i + 1
         end
      end

   do_check (actual: STRING; index: INTEGER; expected: INDEXABLE[STRING]): BOOLEAN
      do
         Result := actual.is_equal(expected.item(index))
      end

end
