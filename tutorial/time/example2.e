class EXAMPLE2
   --
   -- This example shows how to know about time variation using
   -- class TIME.
   --

create {ANY}
   make

feature {}
   make
      local
         time1, time2: TIME; clock: CLOCK; clock_value1, clock_value2, periods: INTEGER; seconds: REAL
      do
         if clock.value >= 0 then
            clock_value1 := clock.value
         end
         time1.update
         from
            time2.update
         until
            time2 > time1
         loop
            time2.update
         end

         clock_value2 := clock.value
         io.put_string("Elapsed time: ")
         io.put_real_format(time1.elapsed_seconds(time2).floor, 0)
         io.put_string(" seconds%N")
         if clock_value1 >= 0 then
            io.put_string("Elapsed time in number of clock periods: ")
            periods := clock_value2 - clock_value1
            io.put_integer(periods)
            io.put_string(" (sec: ")
            seconds := periods / clock.periods_per_second
            io.put_real(seconds)
            io.put_string(")%N")
         end
      end

end -- class EXAMPLE2
