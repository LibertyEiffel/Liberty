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
	EIFFEL_OWNED redefine default_create, dispose end 

insert 
	ZMQEXTERNALS undefine default_create end
	ZMQ_SOCKET_TYPES undefine default_create end

creation {ANY} default_create
feature {} -- Creation
	default_create is
		-- Context creation; currently only non-threaded programs are handled.
	do
		from_external_pointer(zmq_init(1,1,0))
	end
feature {} -- Disposing
	dispose is
		local res: INTEGER
		do
			res := zmq_term(handle)
			-- TODO: handle return value
		end
feature {ANY} -- Socket creations
	new_p2p_socket: ZMQ_SOCKET is
 		-- A new P2P socket  to  communicate with a single peer. Allows for only a single connect or a single bind. There's no  message  routing or message filtering involved.

		-- Compatible peer sockets: ZMQ_P2P.
	do
		create Result.from_external_pointer(zmq_socket(handle,zmq_p2p))
	ensure Result/=Void
	end

    --   ZMQ_PUB
    --          Socket  to  distribute  data. Recv fuction is not implemented
    --          for this socket type.  Messages  are  distributed  in  fanout
    --          fashion to all the peers.

    --          Compatible peer sockets: ZMQ_SUB.


    --   ZMQ_SUB
    --          Socket  to  subscribe  for  data. Send function is not imple‐
    --          mented for this socket type. Initially, socket is  subscribed
    --          for  no  messages.  Use ZMQ_SUBSCRIBE option to specify which
    --          messages to subscribe for.

    --          Compatible peer sockets: ZMQ_PUB.


	new_req_socket: ZMQ_SOCKET is
		-- A new socket to send requests and receive replies. Requests are
		-- load-balanced  among  all  the peers. This socket type allows
		-- only an alternated sequence of send's and recv's.

		--          Compatible peer sockets: ZMQ_REP, ZMQ_XREP.
	do
		create Result.from_external_pointer(zmq_socket(handle,zmq_req))
	ensure Result/=Void
	end


	new_rep_socket: ZMQ_SOCKET is
		-- A new socket to receive requests and send replies. This socket type
		-- allows only an alternated sequence of recv's and send's. Each send
		-- is routed to the peer  that  issued  the  last  received request.

		-- Compatible peer sockets: ZMQ_REQ, ZMQ_XREQ.
	do
		create Result.from_external_pointer(zmq_socket(handle,zmq_rep))
	ensure Result/=Void
	end


    --   ZMQ_XREQ
    --          Special  socket  type to be used in request/reply middleboxes
    --          such as zmq_queue(7).  Requests forwarded using  this  socket
    --          type  should  be  tagged  by  a proper postix identifying the
    --          original requester.  Replies  received  by  this  socket  are
    --          tagged  with  a  proper  postfix that can be use to route the
    --          reply back to the original requester.

    --          Compatible peer sockets: ZMQ_REP, ZMQ_XREP.


    --   ZMQ_XREP
    --          Special socket type to be used in  request/reply  middleboxes
    --          such  as  zmq_queue(7).   Requests received using this socket
    --          are already properly  tagged  with  postfix  identifying  the
    --          original  requester. When sending a reply via XREP socket the
    --          message should be tagged with a postfix from a  corresponding
    --          request.

    --          Compatible peer sockets: ZMQ_REQ, ZMQ_XREQ.


    --   ZMQ_UPSTREAM
    --          Socket  to  receive messages from up the stream. Messages are
    --          fair-queued from among all the connected peers. Send function
    --          is not implemented for this socket type.

    --          Compatible peer sockets: ZMQ_DOWNSTREAM.


    --   ZMQ_DOWNSTREAM
    --          Socket  to  send messages down stream. Messages are load-bal‐
    --          anced among all the connected peers.  Send  function  is  not
    --          implemented for this socket type.

    --          Compatible peer sockets: ZMQ_UPSTREAM.


-- zmq_socket RETURN VALUE
--       Function  returns  socket handle is successful. Otherwise it returns
--       NULL and sets errno to one of the values below.
--
--ERRORS
--       EINVAL invalid socket type.
--
--       EMTHREAD
--              the number of application threads allowed to own 0MQ  sockets
--              was exceeded. See app_threads parameter to zmq_init function.

feature {} -- Implementation
	struct_size: INTEGER is
		do
			raise("ØMQ design hides the size of its structures")
		end

end -- class ZMQ_CONTEXT

