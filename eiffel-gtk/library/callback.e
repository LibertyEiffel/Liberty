indexing
	description: "Signal callback: a object that receive a signal when it is emitted and call its callback feature"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

	
deferred class CALLBACK
inherit G_CLOSURE
insert G_SIGNAL_EXTERNALS

feature
	make is
		do
			-- Using the _swap version is the key here. When the callback
			-- is invoked the first parameter of the C function will be
			-- the address of Eiffel's Current
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
	
