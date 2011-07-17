class EXAMPLE0
	-- Signal example0
	-- This example show use of SIGNAL_0. This signal only mean that an
	-- event occured.

creation {ANY}
	make

feature {}
	event: SIGNAL_0

	make is
		do
			create event.make
			register
			io.put_string("Event occur for first time:%N")
			event.emit
			io.put_string("Event occur for second time:%N")
			event.emit
		end

	register is
			-- In real examples, other objects will connect to the event so
			-- arbitrary function of they choise may be executed when the
			-- event occur.
		do
			event.connect(agent io.put_string("Event occur...%N"))
			-- functions with arguments may be used!!! Simply give their values.
			event.connect(agent foo)
		end

	foo is
		do
			io.put_string(once "This function makes what is to be%
			    % done for this event%N")
		end

end -- class EXAMPLE0
