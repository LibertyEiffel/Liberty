class ZMQ_EXAMPLE_SERVER
	-- Port of the server of the simple example at http://www.zeromq.org/area:docs-v20
insert MEMORY -- To check for memory leaks
creation {} make
feature
	context: ZMQ_CONTEXT
	socket: ZMQ_REP_SOCKET
	request, answer: ZMQ_STRING_MESSAGE

	make is
		do
			--use_zmq
			create context
			socket := context.new_rep_socket
			-- Bind to the TCP transport and port 5555 on the 'lo' interface
			socket.bind("tcp://*:5555")

			from until False loop -- i.e. "forever do"
				create request
				socket.receive(request)
				if socket.is_successful then
					("Received request: '"+request+"'.%N").print_on(std_output)
					create answer.from_string(answer_body)
					socket.send(answer) -- Send back our canned answer
					full_collect -- To clean up Eiffel side and see if memory is leaked on C side
				else 
				end
			end
		end

		answer_body: STRING is "OK"

	use_zmq is
		-- Dummy plugin feature to work around SE bug. At time of writing (2012-02-20) if you don't invoke it the smarteiffel compiler will not compile in ømq wrappers
		external "plug_in"
		alias "{
			location: "../library/externals/"
			module_name: "plugin"
			feature_name: "/*bug-workaround*/"
		}"
		end

end -- class ZMQ_EXAMPLE_SERVER
