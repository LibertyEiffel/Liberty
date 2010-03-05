class ZMQ_EXAMPLE_CLIENT
creation make
feature 
	make is
		local context: ZMQ_CONTEXT; socket: ZMQ_SOCKET; message, answer: ZMQ_STRING_MESSAGE
		do
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

		end
end -- ZMQ_EXAMPLE_CLIENT
