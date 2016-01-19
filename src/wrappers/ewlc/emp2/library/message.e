deferred class MESSAGE

feature {}
	port: MESSAGE_PORT -- The message port that contains the message

	contained_in_message_port: BOOLEAN is 
		deferred 
		end 

	
invariant
		contained_in_message_port
end
