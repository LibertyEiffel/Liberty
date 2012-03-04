class ZMQ_EXAMPLE_CLIENT
creation make
feature 
	context: ZMQ_CONTEXT
	socket: ZMQ_REQ_SOCKET
	message, answer: ZMQ_STRING_MESSAGE

	make is
		local 
		do
			use_zmq
			create context -- Initialise 0MQ context 
			socket := context.new_req_socket -- to send requests and receive replies
			-- Connect it to port 5555 on localhost using the TCP transport
			socket.connect ("tcp://localhost:5555") 
			-- Construct an example message with our query
			create message.from_string("SELECT * FROM mytable")
			socket.send(message)

			from until False loop -- forever
				create message.from_string("SELECT * FROM mytable")
				socket.send(message)

				-- Receive and display the result
				create answer
				socket.receive(answer)
				if socket.is_successful then
					("Received answer: '"|answer|"'.%N").print_on(std_output)
				else 
					("Got an error%N").print_on(std_output)
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
