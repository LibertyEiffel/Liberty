class ZMQ_EXAMPLE_CLIENT
insert
	MULTIPROCESSING
	ANY

create {ANY} make
feature {ANY} 
	context: ZMQ_CONTEXT
	socket: ZMQ_REQ_SOCKET
	message, answer: ZMQ_STRING_MESSAGE

	make
		local  now: TIME; exc: ZMQ_EXCEPTION; my_pid: ABSTRACT_STRING
		do
			my_pid := & process_id
			create context -- Initialise 0MQ context 
			socket := context.new_req_socket -- to send requests and receive replies
			-- Connect it to port 5555 on localhost using the TCP transport
			socket.connect ("tcp://localhost:5555") 
			from until socket.is_unsuccessful loop -- forever
				-- Construct an example message with our query
				create message.from_string("Starting clint process #" + my_pid)
				socket.send(message)
				now.update;
				if socket.is_successful then -- Receive and display the result
					("#(1) client #(2): message sent, waiting for reply%N" # &now # my_pid).print_on(std_output);
					create answer
					socket.wait_for(answer)
					if socket.is_successful then ("#(1) client #(2): received answer '#(3)'.%N" # &now # my_pid # answer).print_on(std_output)
					else 
						exc := socket.zmq_exception;
						("#(1) client #(2): unsuccessful receive '#(3)' (code #(4))%N" 
						# &now # my_pid # exc.description # & exc.error_code).print_on(std_output)
					end
				else exc := socket.zmq_exception; ("#(1) client #(2): unsuccessful send '#(3)' (code #(4))%N" 
					# &now # my_pid # exc.description # & exc.error_code).print_on(std_output)
				end
			end
		end

end -- ZMQ_EXAMPLE_CLIENT
