class EXAMPLE1
   --
   -- This example shows how to know about the current date and time
   -- using class TIME.
   --

create {ANY}
   make

feature {}
   make
      local
         time: TIME
      do
         time.update
         io.put_string("Current date (")
         if time.is_local_time then
            io.put_string("local time")
         else
            io.put_string("universal time")
         end

         if time.is_summer_time_used then
            io.put_string(" summer time")
         end

         io.put_string("): ")
         io.put_string("%N   year: ")
         io.put_integer(time.year)
         io.put_string("%N   month: ")
         io.put_integer(time.month)
         io.put_string("%N   day: ")
         io.put_integer(time.day)
         io.put_string(" (")
         io.put_integer(time.year_day)
         io.put_string("th day of the year and ")
         io.put_integer(time.week_day)
         io.put_string("th day of the week)%N   hour: ")
         io.put_integer(time.hour)
         io.put_string("%N   minute: ")
         io.put_integer(time.minute)
         io.put_string("%N   second: ")
         io.put_integer(time.second)
         io.put_string("%N")
      end

end -- class EXAMPLE1
