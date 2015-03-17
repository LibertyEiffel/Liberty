class CAT

create {ANY}
   make

feature {}
   make
      local
         pf: PROCESS_FACTORY; p: PROCESS
      do
         p := pf.execute("cat", Void)
         from
            std_input.read_line
         until
            std_input.end_of_input
         loop
            p.input.put_string(std_input.last_string)
            p.input.put_new_line
            p.output.read_line
            std_output.put_string(p.output.last_string)
            std_output.put_new_line
            std_input.read_line
         end

         p.input.disconnect
         p.wait
         std_output.put_integer(p.status)
         std_output.put_new_line
      end

end -- class CAT
