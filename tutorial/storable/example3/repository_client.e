class REPOSITORY_CLIENT
   --
   -- A simple client that displays the contents of the repository, asks for a new variable and puts it back in
   -- the repository.
   --
   -- See REPOSITORY_SERVER: the server must be started
   --

create {ANY}
   make

feature {}
   repository: REPOSITORY[STRING]

   make
      do
         open_repository
         display_repository
         ask_new_variable
         display_repository
         repository.commit
         close_repository
      end

feature {} -- Implementation
   ios: SOCKET_INPUT_OUTPUT_STREAM

   open_repository
         -- Open the repository
      local
         access: TCP_ACCESS
      do
         -- Create the client socket
         create access.make(create {LOCALHOST}.make, 2001, True)
         sedb_breakpoint
         -- Ensure that readings from the sockets at that access point are synchronous (because we don't use
         -- the sequencer mechanics, we need some low-level system to ensure that we have data to read)

         ios := access.stream
         if ios = Void then
            if access.error = Void then
               std_error.put_line("An error occurred. What?")
            else
               std_error.put_line(access.error)
            end
            die_with_code(1)
         end

         check
            ios.is_connected
         end
         -- Read the repository from that socket (the server must be started)
         create {XML_STREAM_REPOSITORY[STRING]} repository.connect_to(ios, ios)
         repository.update
      end

   close_repository
      do
         ios.disconnect
      end

   display_repository
         -- Display the contents of the repository
      local
         i: INTEGER
      do
         -- Display the repository
         from
            i := repository.lower
         until
            i > repository.upper
         loop
            std_output.put_string(repository.key(i))
            std_output.put_string(once ": ")
            std_output.put_string(repository.item(i))
            std_output.put_new_line
            i := i + 1
         end
      end

   ask_new_variable
         -- Ask for a new variable and put it in the repository
      local
         name, value: STRING
      do
         -- Ask the variable name
         std_output.put_string(once "new variable name: ")
         std_input.read_line
         name := std_input.last_string.twin
         -- Ask the variable value

         std_output.put_string(once "new variable value: ")
         std_input.read_line
         value := std_input.last_string.twin
         -- Modify the repository

         repository.put(value, name)
      end

end -- class REPOSITORY_CLIENT
