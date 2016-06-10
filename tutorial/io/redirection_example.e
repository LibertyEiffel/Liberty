class REDIRECTION_EXAMPLE
   --
   -- Shows how to redirect `std_input_stream', `std_output_stream' and `std_error_stream'.
   --

create {ANY}
   make

feature {}
   make
      local
         log_name: STRING; log_file: TEXT_FILE_WRITE
      do
         log_name := "redirection_example.log"
         io.put_string("Output redirected on %"" + log_name + "%".%N")
         create log_file.connect_to(log_name)
         if log_file.is_connected then
            standard_streams.set_std_output(log_file)
            standard_streams.std_output.put_string("This is not on the screen!%N")
            log_file.put_string("This is not on the screen!%N")
            standard_streams.restore_std_output
            log_file.disconnect
            standard_streams.std_output.put_string("Do not forget to remove the %"" + log_name + "%" file.%N")
         else
            std_output.put_string("Cannot write %"" + log_name + "%" in the current working directory.%N")
         end
      end

end -- class REDIRECTION_EXAMPLE
