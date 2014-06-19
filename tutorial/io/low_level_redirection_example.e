class LOW_LEVEL_REDIRECTION_EXAMPLE

insert
   STREAM_HANDLER

create {}
   make

feature {}
   make
      do
         std_input.redirect_from("low_level_redirection_example.e")
         check
            std_input.redirection_succeeded
         end
         std_output.redirect_to("low_level_redirection_example.log")
         check
            std_output.redirection_succeeded
         end
         from
            std_input.read_line
         until
            std_input.end_of_input
         loop
            std_output.put_line(std_input.last_string)
            std_input.read_line
         end

         std_input.restore_default_input
         std_output.restore_default_output
      end

end -- class LOW_LEVEL_REDIRECTION_EXAMPLE
