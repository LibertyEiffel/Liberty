class SERIAL
   -- This example shows how to use TERMINAL_SETTINGS.
   -- it reads and modifies baud rates of terminal settings, compare with stty

insert
	ARGUMENTS

create {ANY}
   make

feature {}
   make
      local
         stream: BINARY_FILE_READ
         device: STRING
      do
         if argument_count = 1 then
            
            device := argument(1)
            std_output.put_string("connecting to '" + device + "'%N")
            create stream.connect_to(device)
            if stream.is_connected then
               std_output.put_line("input_speed = " + stream.terminal_settings.input_speed.out)
               std_output.put_line("output_speed = " + stream.terminal_settings.output_speed.out)

               std_output.put_line("trying to set output_speed = 9600...")
               stream.terminal_settings.set_output_speed(9600)

               std_output.put_line("last_error = " + stream.terminal_settings.last_error.out)
               std_output.put_line("last_error_description = " + stream.terminal_settings.last_error_description)
               stream.disconnect
               std_output.put_string("device closed%N")
            else
               std_error.put_string("connection failed%N")
            end
         else
            -- no device given
            std_output.put_string("give device as parameter: ./serial <device>%N")
         end
         
      end

end
