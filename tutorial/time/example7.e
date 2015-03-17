class EXAMPLE7
   --
   -- Using MICROSECOND_TIME to get more accuracy.
   --

create {ANY}
   make

feature {}
   make
      local
         mt1, mt2: MICROSECOND_TIME; string: STRING
      do
         io.put_string("Time to create a new small STRING:%N")
         mt1.update
         create string.make(12)
         mt2.update
         print_microsecond_time(mt1)
         print_microsecond_time(mt2)
      end

   print_microsecond_time (mt: MICROSECOND_TIME)
      do
         time_in_english.set_short_mode(True)
         time_in_english.set_time(mt.time)
         io.put_string(time_in_english.to_string + " " + mt.time.second.to_string + " seconds and " + mt.microsecond.to_string + " microseconds%N")
      end

   time_in_english: TIME_IN_ENGLISH
      once
         create Result
      end

end -- class EXAMPLE7
