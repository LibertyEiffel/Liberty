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
		 copied.set(1000)
		 copied.copy(source)
         label_assert("copied.value shall be 43", copied.value = 43)
	
		 source.set (10)
		 copied := source
		 copied.set(1000)
         label_assert("copied.value shall be 11", copied.value = 11)
	 end

   copied, source: COPY_REDEFINED

end -- class TEST_COPY_EXPANDED
