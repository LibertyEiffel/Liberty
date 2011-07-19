class GIMP_CLIENT
--
-- This class talks to a standard Script-Fu Gimp server (localhost:10008).
--
-- Contrarily to SOCKETS which polls its client socket, it also waits for an answer using the sequencer
-- (less CPU-involved).
--
inherit
	JOB

insert
	ARGUMENTS

creation {ANY}
   make

feature {}
	ios: SOCKET_INPUT_OUTPUT_STREAM

	buffer: STRING

   make is
      local
         tcp: TCP_ACCESS
			host: LOCALHOST
			count: INTEGER_16
      do
			if argument_count < 1 then
				std_error.put_line("Missing argument")
				die_with_code(1)
			end

			-- standard Gimp server settings: localhost:10008
         create host.make
         create tcp.make(host, 10008)

         ios := tcp.stream
			if ios = Void then
				std_error.put_line(tcp.error)
				die_with_code(1)
			elseif ios.is_connected then
				-- send the request using the server protocol
				count := argument(1).count.to_integer_16
				ios.put_character('G')
				ios.put_character((count // 256).to_character)
				ios.put_character((count \\ 256).to_character)
            ios.put_string(argument(1))
				ios.flush
				-- now wait for an answer
				wait_answer
				-- and disconnect
            ios.disconnect
			else
				std_error.put_line("Socket not connected!")
				die_with_code(1)
         end
      end

	wait_answer is
		local
			stack: LOOP_STACK
		do
			create buffer.with_capacity(4096)
			create stack.make
			stack.add_job(Current)
			stack.run
		end

feature {LOOP_ITEM}
	prepare (events: EVENTS_SET) is
		do
			if ios.is_connected then
				events.expect(ios.event_can_read)
			else
				done := True
			end
		end

	is_ready (events: EVENTS_SET): BOOLEAN is
		do
			Result := not done and then events.event_occurred(ios.event_can_read)
		end

	continue is
		do
			buffer.clear_count
			ios.read_available_in(buffer, buffer.capacity)
			std_output.put_string(buffer)
			std_output.flush
		end

	done: BOOLEAN

	restart is
		do
			done := False
		end

end
