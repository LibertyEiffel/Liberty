class ZMQ_EXAMPLE_CLIENT
insert
	UNISTD_EXTERNALS -- Some low-level Posix calls
creation make
feature 
	context: ZMQ_CONTEXT
	socket: ZMQ_REQ_SOCKET
	message, answer: ZMQ_STRING_MESSAGE

	make is
		local  now: TIME; exc: ZMQ_EXCEPTION
		do
			use_zmq
			create context -- Initialise 0MQ context 
			socket := context.new_req_socket -- to send requests and receive replies
			-- Connect it to port 5555 on localhost using the TCP transport
			socket.connect ("tcp://localhost:5555") 
			from until socket.is_unsuccessful loop -- forever
				-- Construct an example message with our query
				create message.from_string("Greetings from process " + &getpid)
				socket.send(message)
				now.update;
				if socket.is_successful then -- Receive and display the result
					("#(1): message sent, waiting for reply%N" # &now).print_on(std_output);
					create answer
					socket.wait_for(answer)
					if socket.is_successful then ("#(1): received answer '#(2)'.%N" # &now # answer).print_on(std_output)
					else 
						exc := socket.zmq_exception;
						("#(1): unsuccessful receive '#(2)' (code #(3))%N" # &now # exc.description # & exc.error_code).print_on(std_output)
					end
				else exc := socket.zmq_exception; ("#(1): unsuccessful send '#(2)' (code #(3))%N" # &now # exc.description # & exc.error_code).print_on(std_output)
				end
			end
		end

	use_zmq is
		-- Dummy plugin feature to work around SE bug. At time of writing (2012-02-20) if you don't invoke it the smarteiffel compiler will not compile in ømq wrappers
		external "plug_in"
		alias "{
			location: "../library/externals/"
			module_name: "plugin"
			feature_name: "/*bug-workaround*/"
		}"
		end

end -- ZMQ_EXAMPLE_CLIENT
