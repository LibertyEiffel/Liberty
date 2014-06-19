class EXAMPLE4
   --
   -- Using the TIME_IN_FRENCH class.
   --

create {ANY}
   make

feature {}
   make
      local
         time: TIME; format: TIME_IN_FRENCH
      do
         time.update
         create format
         format.set_time(time)
         io.put_string("Le grand format :%N")
         format.set_short_mode(False)
         format.print_on(io)
         io.put_new_line
         io.put_string("Le petit format :%N")
         format.set_short_mode(True)
         format.print_on(io)
         io.put_new_line
      end

end -- class EXAMPLE4
