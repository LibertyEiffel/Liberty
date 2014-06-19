class TEST_COPY_EXPANDED
-- Test the copying of an expanded object which have redefined the copy feature

insert
   EIFFELTEST_TOOLS

create {ANY}
   make

feature {ANY}
   make
      do
         source.set(42)
         assert(source.value = 42)
         copied.set(1000)
         assert(copied.value = 1000)
         copied.copy(source)
         label_assert("copied.value shall be 43", copied.value = 43)

         source.set(10)
         assert(source.value = 10)
         copied.set(1000)
         assert(copied.value = 1000)
         copied := source
         label_assert("copied.value shall be 11", copied.value = 11)
      end

   copied, source: COPY_REDEFINED

end -- class TEST_COPY_EXPANDED
