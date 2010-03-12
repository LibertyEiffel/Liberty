class ZMQ_EXAMPLE_CLIENT
creation make
feature 
	make is
		local context: ZMQ_CONTEXT; socket: ZMQ_SOCKET; message, answer: ZMQ_STRING_MESSAGE; query: FIXED_STRING
		do
			foo
			create context -- Initialise 0MQ context with one application and one I/O thread
			socket := context.new_req_socket -- to send requests and receive replies
			-- Connect it to port 5555 on localhost using the TCP transport
			socket.connect ("tcp://localhost:5555") 
			-- Construct an example message with our query
			create message.with_string("SELECT * FROM mytable".intern)
			socket.send(message)

			-- Receive and display the result
			create answer
			socket.receive(answer)
			("Received answer: '"+answer.to_string+"'. (Note: DbC says that concatenating into ropes with '|' triggers some bugs; Paolo solve them!) %N").print_on(std_output)

			-- Forever loop
			from query:="SELECT * FROM mytable".intern until False loop
				create message.with_string(query)
				socket.send(message)

				-- Receive and display the result
				create answer
				socket.receive(answer)
				-- ("Received answer: '"+answer.to_string+"'.%N").print_on(std_output)
			end
		end
	foo is
		-- Dummy plugin feature to work around SE bug
		external "plug_in"
		alias "{
			location: "../library/externals/"
			module_name: "plugin"
			feature_name: "/*bug-workaround*/"
		}"
		end

end -- ZMQ_EXAMPLE_CLIENT
