class ZMQ_EXAMPLE_SERVER
	-- Port of the server of the simple example at http://www.zeromq.org/area:docs-v20
insert 
	MULTIPROCESSING 
	ANY
create {} make
feature {ANY}
	context: ZMQ_CONTEXT
	socket: ZMQ_REP_SOCKET
	request, answer: ZMQ_STRING_MESSAGE

	make
		local now: TIME; exc: ZMQ_EXCEPTION; my_pid: ABSTRACT_STRING; endpoint: STRING
		do
			my_pid := & process_id
			create context
			socket := context.new_rep_socket
			-- Bind to the TCP transport and port 5555 on the 'lo' interface
			-- endpoint := once "tcp://*:5555"
			--socket.bind(endpoint)
			socket.bind("tcp://*:5555")
			
			if socket.is_successful then
				now.update;
				("#(1): server online%N" # &now).print_on(std_output)
				from until socket.is_unsuccessful loop -- i.e. "forever do"
					("#(1): server (pid #(2)) listening%N" # &now # my_pid).print_on(std_output)
					create request
					socket.wait_for(request)
					now.update
					if socket.is_successful then
						("#(1): server #(2) received request '#(3)'.%N" # &now # my_pid # request).print_on(std_output)
						create answer.from_string(answer_template # my_pid)
						now.update;
						("#(1): server #(2) answering '#(3)'.%N" # &now # my_pid # answer).print_on(std_output)
						socket.send(answer) -- Send back our canned answer
					else 
						exc := socket.zmq_exception;
						("#(1): unsuccessful receive '#(2)' (code #(3))%N" # &now # exc.description # & exc.error_code).print_on(std_output)
					end
				end
			else ("#(1): unsuccessful bind '#(2)'%N" # &now # socket.zmq_exception.description).print_on(std_output)
			end
		end

		answer_template: STRING "Greetings by server ##(1)."

end -- class ZMQ_EXAMPLE_SERVER
