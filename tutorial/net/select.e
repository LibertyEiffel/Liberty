-- This example will show how you may wait some data in INPUT_STREAM
class SELECT

create {ANY}
   make

feature {ANY}
   events: EVENTS_SET

   make
         -- Connect to the server started by the SOCKETS class in the same cluster. You must compile and start
         -- it first.
      do
         connect_to(once "localhost", 2001)
         create events.make
         io.put_line(once "Here we go...")
         read(1000)
         read(1000)
         ios.put_string(once "|...<* HELLO 1 *>...|%N|...<* HELLO 2 *>...|%N")
         ios.put_string(once "|...<* HELLO 3 *>...|%N|...<* HELLO 4 *>...|%N")
         ios.put_string(once "|...<* HELLO 5 *>...|%N|...<* HELLO 6 *>...|%N")
         ios.put_string(once "|...<* HELLO 7 *>...|%N|...<* HELLO 8 *>...|%N")
         ios.flush
         read(1000)
         read(1000)
         disconnect
      end

   read (ms: INTEGER)
      local
         time_events: TIME_EVENTS
      do
         events.expect(time_events.timeout(ms))
         events.expect(ios.event_can_read)
         events.wait
         if events.event_occurred(ios.event_can_read) then
            check
               ios.can_read_line
            end
            ios.read_line
            from
            until
               ios.end_of_input
            loop
               io.put_string(once "INPUT> ")
               io.put_line(ios.last_string.twin)
               ios.read_line
            end
         else
            io.put_line(once "INPUT> ...NONE...")
         end

         events.reset
      end
      -----------------------------------------------------------
      -- standard features, nothing new here :)
      -----------------------------------------------------------

   ios: SOCKET_INPUT_OUTPUT_STREAM

   connect_to (host: STRING; port: INTEGER)
         -- connect TCP stream to destination host and port
      local
         tcp: TCP_ACCESS; tcp_host: HOST
      do
         create tcp_host.make(host)
         create tcp.make(tcp_host, port, True)
         ios := tcp.stream
         if ios = Void or else not is_connected then
            std_output.put_line(tcp.error)
            die_with_code(1)
         end
      end

   is_connected: BOOLEAN
         -- is the stream connected
      do
         Result := ios.is_connected
      end

   disconnect
         -- disconnect the stream
      require
         is_connected
      do
         ios.disconnect
      ensure
         not is_connected
      end

end -- class SELECT
