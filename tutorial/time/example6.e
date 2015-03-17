class EXAMPLE6
   --
   -- Using BASIC_TIME with the FILE_TOOLS class.
   --

create {ANY}
   make

feature {}
   make
      local
         time: TIME; time_in_english: TIME_IN_ENGLISH
      do
         io.put_string("Last modification of file %"example6.e%":%N")
         time := file_tools.last_change_of("example6.e")
         create time_in_english
         time_in_english.set_time(time)
         io.put_string(time_in_english.to_string)
         io.put_string("%N")
      end

   file_tools: FILE_TOOLS
      once
         create Result
      end

end -- class EXAMPLE6
