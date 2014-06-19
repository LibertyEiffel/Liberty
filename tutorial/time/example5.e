class EXAMPLE5
   --
   -- Using different languages: TIME_IN_FRENCH, TIME_IN_ENGLISH, TIME_IN_ITALIAN, TIME_IN_GERMAN, ...
   --

create {ANY}
   make

feature {}
   make
      do
         io.put_string("The French format :%N")
         create {TIME_IN_FRENCH} time_formatter
         show_time
         io.put_string("The English format :%N")
         create {TIME_IN_ENGLISH} time_formatter
         show_time
         io.put_string("The Italian format :%N")
         create {TIME_IN_ITALIAN} time_formatter
         show_time
         io.put_string("The German format :%N")
         create {TIME_IN_GERMAN} time_formatter
         show_time
         io.put_string("The Spanish format :%N")
         create {TIME_IN_SPANISH} time_formatter
         show_time
      end

   time_formatter: TIME_FORMATTER

   show_time
      local
         time: TIME
      do
         time.update
         time_formatter.set_time(time)
         time_formatter.set_short_mode(False)
         io.put_string("        " + time_formatter.to_string + "%N        ")
         time_formatter.set_short_mode(True)
         io.put_string(time_formatter.to_string + "%N")
      end

end -- class EXAMPLE5
