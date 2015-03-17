class AUX_NA_ELEMENT

inherit
   DISPOSABLE

insert
   EIFFELTEST_TOOLS

create {ANY}
   make

feature {ANY}
   dispose_count: COUNTER
      once
         create Result
      end

   dispose_done_for_current: BOOLEAN

   make(i: INTEGER)
      do
         no := i
      end

   dispose
      do
         dispose_count.next
         assert(not dispose_done_for_current)
         dispose_done_for_current := True
      end

   no: INTEGER
end  -- class AUX_NA_ELEMENT
