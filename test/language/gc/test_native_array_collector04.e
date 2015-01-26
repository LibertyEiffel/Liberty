class TEST_NATIVE_ARRAY_COLLECTOR04

insert
   EIFFELTEST_TOOLS
   NATIVE_ARRAY_COLLECTOR[AUX_NA_ELEMENT]

create {}
   make

feature {ANY}
   make
      local
         ele: AUX_NA_ELEMENT
      do
         capacity := 20
         -- allocate a native array and store a reference to it in a 
         -- member variable
         honeypot := honeypot.calloc(capacity)

         -- now fill in 16 elements
         from
            count := 0
         until
            count >= 16
         loop
            honeypot.put(create {AUX_NA_ELEMENT}.make(count), count)
            count := count + 1
         end
         create ele.make(-1)
         call

         label_assert("no elements disposed", ele.dispose_count.item = 0)
      end

   call
      local
         local_na: NATIVE_ARRAY[AUX_NA_ELEMENT]
      do
         -- store a local copy of the reference
         local_na := honeypot
         -- allocate a new array
         honeypot := honeypot.calloc(capacity)
         count := 0
         -- copy 8 elements
         from
         until
            count >= 8
         loop
            honeypot.put(local_na.item(count), count)
            count := count + 1
         end

         -- GC should not free the elements only referenced by the 
         -- local NATIVE_ARRAY
         full_collect
         
      end
   
   mark_native_arrays
      local
         i: INTEGER
      do
         from
            i := 0
         until
            i < count
         loop
            mark_item(honeypot, i)
            i := i + 1
         end
      end

   capacity: INTEGER
         -- size of the NATIVE_ARRAY
   
   count: INTEGER
         -- the number of used elements

   honeypot: NATIVE_ARRAY[AUX_NA_ELEMENT]

   full_collect
      local
         m: MEMORY
      do
         generate_garbage
         m.full_collect
      end

   generate_garbage
      local
         i: INTEGER; s: STRING
         ele: AUX_NA_ELEMENT
      do
         from
            i := 1
         until
            i = 300
         loop
            create ele.make(-i)
            create s.make_from_string("quark                       ends here")
            i := i + 1
         end
      end

end -- class TEST_NATIVE_ARRAY_COLLECTOR04
