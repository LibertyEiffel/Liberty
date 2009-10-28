-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class HTTP_CONNECTION
	--
	-- Handle one connection to the HTTP_SERVER. The real HTTP protocol is defined here.
	--

inherit
	CONNECTION
		redefine
			set_io, prepare, is_ready, done
		end

insert
	RECYCLABLE
	DISPOSABLE

feature {LOOP_ITEM}
	prepare (events: EVENTS_SET) is
		local
			t: TIME_EVENTS
		do
			inspect
				answer_state
			when answer_state_read then
				events.expect(ios.event_can_read)
			when answer_state_prepare, answer_state_write then
				if method_handler = Void then
					events.expect(t.timeout(0))
				else
					method_handler.expect(events)
				end
			end
		end

	is_ready (events: EVENTS_SET): BOOLEAN is
		do
			inspect
				answer_state
			when answer_state_read then
				Result := events.event_occurred(ios.event_can_read)
			when answer_state_prepare, answer_state_write then
				Result := method_handler = Void or else method_handler.is_ready(events)
			end
		end

	done: BOOLEAN is
		do
			if ios.is_connected then
				inspect
					answer_state
				when answer_state_read then
					check not Result end
				when answer_state_prepare, answer_state_write then
					Result := method_handler /= Void and then method_handler.done
				end
			else
				Result := True
			end
		end

	continue is
		local
			c: CHARACTER
			log: STRING
		do
			inspect
				answer_state
			when answer_state_read then
				if read_buffer = Void then
					create read_buffer.make_empty
				end
				from
					ios.read_character
				until
					ios.end_of_input or else not ios.can_read_character
				loop
					c := ios.last_character
					if state = state_body then
						content_count := content_count + 1
					end
					inspect
						c
					when '%R' then
						-- ignore
					when '%N' then
						call_state
					else
						read_buffer.extend(c)
					end
					ios.read_character
				end
				if ios.end_of_input or else content_count >= content_length then
					if not read_buffer.is_empty then
						call_state
					end
					answer_state := answer_state_prepare
				end
			when answer_state_prepare then
				if method_handler = Void then
					answer_state := answer_state_write
				else
					method_handler.prepare_answer
					if method_handler.prepare_ok then
						answer_state := answer_state_write
					end
				end
			when answer_state_write then
				if method_handler = Void then
					answer_state := answer_state_read
				else
					method_handler.answer(ios)
					if method_handler.done then
						log := once ""
						log.copy(request_line)
						log.extend(' ')
						method_handler.code.append_in(log)
						server.log(log)
						ios.disconnect
						answer_state := answer_state_read
					end
				end
			end
		end

feature {}
	answer_state: INTEGER
	answer_state_read: INTEGER is 0
	answer_state_prepare: INTEGER is 1
	answer_state_write: INTEGER is 2

	read_buffer: STRING
	content_length: INTEGER
	content_count: INTEGER

feature {HTTP_SERVER}
	set_server (a_server: like server) is
		do
			server := a_server
			state := state_request_line
			answer_state := answer_state_read
			if method_handler /= Void then
				method_handler.begin_answer
			end
			content_length := 0
		end

feature {SERVER}
	set_io (a_io: like ios) is
		do
			Precursor(a_io)
			a_io.when_disconnect(agent handle_disconnect)
		end

feature {}
	server: HTTP_SERVER

	handle_disconnect (a_io: like ios) is
		require
			a_io = ios
			done
		do
			disconnected := True
			server.connection_done(Current)
		end

feature {} -- The HTTP protocol (see RFC 2616)
	state: INTEGER

	state_request_line: INTEGER is 0
	state_header: INTEGER is 1
	state_body: INTEGER is 2

	method_handler: HTTP_METHOD_HANDLER
	request_line: STRING

	call_state is
		require
			answer_state = answer_state_read
		do
			inspect
				state
			when state_request_line then
				a_request_line(read_buffer)
			when state_header then
				a_header(read_buffer)
			when state_body then
				a_body(read_buffer)
			end
			read_buffer.clear_count
		end

	a_request_line (line: STRING) is
		require
			answer_state = answer_state_read
		local
			i, j: INTEGER
			method, uri, version: STRING
		do
			i := line.first_index_of(' ')
			j := line.index_of(' ', i + 1)
			method := once ""
			method.copy_substring(line, 1, i - 1)
			method.to_upper
			uri := once ""
			if j = 0 then
				uri.copy_substring(line, i + 1, line.count)
				version := once "HTTP/1.0"
			else
				uri.copy_substring(line, i + 1, j - 1)
				version := once ""
				version.copy_substring(line, j + 1, line.count)
			end
			request_line.copy(method)
			request_line.extend(' ')
			request_line.append(uri)
			state := state_header
			method_handler := get_method_handler(method, uri, version)
			if method_handler /= Void then
				method_handler.begin_answer
			end
		end

	a_header (line: STRING) is
		do
			if line.is_empty then
				state := state_body
			else
				parse_header(line)
				inspect
					header_key
				when "content-length" then
					if header_value.is_integer then
						content_length := header_value.to_integer
					end
				else
					-- ignored
				end
				method_handler.add_header(line.twin)
			end
		end

	header_key: STRING
	header_value: STRING

	parse_header (line: STRING) is
		local
			i: INTEGER
		do
			if header_key = Void then
				check
					header_value = Void
				end
				create header_key.make_empty
				create header_value.make_empty
			else
				header_key.clear_count
				header_value.clear_count
			end
			i := line.first_index_of(':')
			if line.valid_index(i) then
				header_key.copy_substring(line, 1, i - 1)
				from
				until
					i > line.upper or else not line.item(i).is_separator
				loop
					i := i + 1
				end
				header_value.copy_substring(line, i, line.upper)
			end
		end

	a_body (line: STRING) is
		do
			if line.is_empty then
				answer_state := answer_state_prepare
			else
				method_handler.add_body(line.twin)
			end
		end

feature {}
	get_method_handler (method, uri, version: STRING): HTTP_METHOD_HANDLER is
		require
			method.as_upper.is_equal(method)
		deferred
		ensure
			Result.method.is_equal(method) or else ({HTTP_NO_METHOD_HANDLER} ?:= Result)
		end

	disconnected: BOOLEAN

feature {RECYCLING_POOL}
	recycle is
		do
			if not disconnected then
				handle_disconnect(ios)
			end
		end

feature {}
	dispose is
		do
			if not disconnected then
				handle_disconnect(ios)
			end
		end

invariant
	request_line /= Void

end -- class HTTP_CONNECTION
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
