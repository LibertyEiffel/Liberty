class ZMQ_CONTEXT
	-- An ØMQ Context where ØMQ sockets live within.
	
	-- Each 0MQ socket  lives  within  a  specific  context.  Creating  and
	-- destroying context is a counterpart of library
	-- initialisation/deinitialisation as used elsewhere. Ability to create
	-- multiple  contexts saves  the  day  when an application happens to
	-- link (indirectly and involuntarily) with several instances of 0MQ.

	-- Implementation notes: the fact that ØMQ can work in a threaded
	-- enviroment is currently hidden by this Liberty wrappers

	-- TODO: add support for pollability (ZMQ_POLL)
inherit 
	C_STRUCT redefine default_create end
	EIFFEL_OWNED redefine default_create end 
insert 
	ZMQEXTERNALS
creation {ANY} default_create
feature {} -- Creation
	default_create is
		-- Context creation; currently only non-threaded programs are handled.
	do
		from_external_pointer(zmq_init(1,1,0))
	end

feature {ANY} -- Socket creations
end -- class ZMQ_CONTEXT

