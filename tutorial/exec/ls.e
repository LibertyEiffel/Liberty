class LS

create {ANY}
   make

feature {}
   make
      local
         pf: PROCESS_FACTORY; p: PROCESS
      do
         p := pf.execute("ls", {FAST_ARRAY[STRING] << "-l" >> })
         from
            check
               p.output.is_connected
            end
            p.output.read_line
         until
            p.output.end_of_input
         loop
            std_output.put_string(p.output.last_string)
            std_output.put_new_line
            p.output.read_line
         end

         from
            check
               p.error.is_connected
            end
            p.error.read_line
         until
            p.error.end_of_input
         loop
            std_output.put_string(p.error.last_string)
            std_output.put_new_line
            p.error.read_line
         end

         p.wait
         if p.status /= 0 then
            std_error.put_string("Process finished with status ")
            std_error.put_integer(p.status)
            std_error.put_new_line
         end
      end

end -- class LS
