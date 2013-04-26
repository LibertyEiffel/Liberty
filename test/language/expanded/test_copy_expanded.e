class TEST_COPY_EXPANDED
   -- Test the copying of an expanded object which have redefined the copy feature

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make is
      do
         source.set(42)
         copied.copy(source)
         label_assert("copied.value shall be 43", copied.value = 43)
         copied := source
         label_assert("copied.value shall be 43", copied.value = 43)
      end

   copied, source: COPY_REDEFINED

end -- class TEST_COPY_EXPANDED
