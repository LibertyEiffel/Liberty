indexing
	description: "Signal callback: a object that receive a signal when it is emitted and call its callback feature"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

	
deferred class CALLBACK
inherit
	G_CLOSURE
		redefine make
		end

feature
	make is
		do
			handle := g_cclosure_new_swap ($callback,
													 Current.to_pointer, -- as user_data
													 default_pointer -- i.e.: NULL as destroy callback
													 )
		end
	signal_name: STRING is
			-- The name of the signal that Current callback will connect to.
		deferred
		end

	handler_id: INTEGER_64
			-- The numerical id of Current 
 end
	
