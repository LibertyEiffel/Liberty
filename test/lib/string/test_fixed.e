class TEST_FIXED
   -- Stress fixed strings obtained from C, to discover possible memory leaks or double freeing of memory.

insert
   MEMORY
   EXCEPTIONS
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         mem_usage: INTEGER
      do
         mem_usage := allocated_bytes
         n.times(agent is
            do
               n.times(agent is
                  do
                     create foo.from_external(foo_ptr)
                  end)
               full_collect
            end)

         print("Memory usage for " + (n * n).out + " allocations: " + (allocated_bytes - mem_usage).out + " bytes.%N")
         assert(foo.is_equal("my-const-string"))
      end

   n: INTEGER_32 is 512

   foo: FIXED_STRING

   foo_ptr: POINTER is
      external "C inline"
      alias "[
         "my-const-string"
         ]"
      end

end -- class TEST_FIXED
