class TEST_FIXED
   -- Stress fixed strings obtained from C, to discover possible memory leaks or double freeing of memory.

insert
   MEMORY
   EXCEPTIONS
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         mem_usage: INTEGER
      do
         mem_usage := allocated_bytes
         n.times(agent
            do
               n.times(agent
                  do
                     create foo.from_external(foo_ptr)
                  end)
               full_collect
            end)

         debug
            print("Memory usage for " + (n * n).out + " allocations: " + (allocated_bytes - mem_usage).out + " bytes.%N")
         end
         assert(foo.is_equal("my-const-string"))
      end

   n: INTEGER_32 16

   foo: FIXED_STRING

   foo_ptr: POINTER
      external "C inline"
      alias "[
         "my-const-string"
         ]"
      end

end -- class TEST_FIXED
