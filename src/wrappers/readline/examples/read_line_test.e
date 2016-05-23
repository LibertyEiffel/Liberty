class READ_LINE_TEST

inherit
   ANY

insert
   READ_LINE

create {ANY}
   make

feature {ANY}
   make
      do
         prompt := "Liberty> "
         from
            read_line
         until
            last_line = Void or else last_line.is_empty -- handles Ctrl-D to exit
         loop
            if last_line /= Void then
               if last_line.count > 3 then
                  print("Adding `")
                  print(last_line)
                  print("' to history.%N")
                  history.add(last_line)
               else
                  print("Got `")
                  print(last_line)
                  print("'.%N")
               end
            end
            read_line
         end
         print("History entries:")
         history.for_each(agent print_entry(?))
      end

   print_entry (x: HISTORY_ENTRY)
      do
         if x /= Void then
            print("'" + x.line + "'%N")
         end
      end

end -- class READ_LINE_TEST
