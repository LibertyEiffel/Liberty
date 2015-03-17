class TEST_WMH06
   -- From: Wai-Ming Ho <waimingh@irisa.fr>

insert
   MEMORY

create {}
   make

feature {}
   make
      local
         i: INTEGER; memory: ARRAY[AUX_WMH06]; item: AUX_WMH06
      do
         create memory.make(1, max)
         from
            i := 0
         until
            i >= max_loop
         loop
            create item.make
            memory.put(item, i \\ max + 1)
            i := i + 1
            if i \\ max = 0 then
               full_collect
            end
         end
      end

feature {}
   max: INTEGER 40

   max_loop: INTEGER 4000

end -- class TEST_WMH06
