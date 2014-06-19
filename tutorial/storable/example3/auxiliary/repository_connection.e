class REPOSITORY_CONNECTION
   --
   -- Handle one connection to the REPOSITORY_SERVER.
   --

inherit
   CONNECTION
      redefine set_io
      end

create {REPOSITORY_SERVER}
   make

feature {LOOP_ITEM}
   continue
      do
         server.update_from_io_stream(ios)
         if not ios.is_connected then
            if ios.error /= Void then
               std_error.put_line(ios.error)
            end
            std_error.put_line(once "Client disconnected")
         end
      end

feature {SERVER}
   set_io (a_io: like ios)
      do
         Precursor(a_io)
         a_io.when_disconnect(agent handle_disconnect(?))
         -- Start by sending the repository
         std_error.put_line(once "Sending repository")
         server.write_to_io_stream(a_io)
         a_io.flush
         std_error.put_line(once "Repository sent")
      end

feature {}
   server: REPOSITORY_SERVER

   handle_disconnect (a_io: like ios)
      require
         a_io = ios
         done
      do
         server.connection_done(Current)
      end

   make (a_server: like server)
      require
         a_server /= Void
      do
         std_error.put_line(once "New connection")
         server := a_server
      ensure
         server = a_server
      end

invariant
   server /= Void

end -- class REPOSITORY_CONNECTION
