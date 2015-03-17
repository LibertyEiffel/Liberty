class EXAMPLE3
   --
   -- Using the TIME_IN_ENGLISH class.
   --

create {ANY}
   make

feature {}
   make
      local
         time: TIME; format: TIME_IN_ENGLISH
      do
         time.update
         create format
         format.set_time(time)
         io.put_string("The complete format :%N")
         format.set_short_mode(False)
         format.print_on(io)
         io.put_new_line
         io.put_string("The short format :%N")
         format.set_short_mode(True)
         format.print_on(io)
         io.put_new_line
      end

end -- class EXAMPLE3
