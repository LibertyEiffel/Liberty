deferred class ZMQ_SOCKET_TYPES
	-- ØMQ socket types
feature {} -- Socket types
	zmq_p2p: INTEGER_32 is
		-- A socket type to  communicate with a single peer. Allows for only
		-- a single connect or a single bind. There's no message  routing or
		-- message filtering involved.

        -- Compatible peer sockets: ZMQ_P2P.
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ZMQ_P2P"
		}"
		end

	zmq_pub: INTEGER_32 is
		-- A socket type to  distribute  data. Recv fuction is not
		-- implemented for this socket type.  Messages  are  distributed  in
		-- fanout fashion to all the peers.

		-- Compatible peer sockets: ZMQ_SUB.
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ZMQ_PUB"
		}"
		end

	zmq_sub: INTEGER_32 is
		-- A socket type to  subscribe  for  data. Send function is not
		-- implemented for this socket type. Initially, socket is
		-- subscribed for  no  messages.  Use ZMQ_SUBSCRIBE option to
		-- specify which messages to subscribe for.

		-- Compatible peer sockets: ZMQ_PUB.
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ZMQ_SUB"
		}"
		end

	zmq_req: INTEGER_32 is
		-- A socket type to send requests and  receive  replies.  Requests
		-- are load-balanced  among  all  the peers. This socket type allows
		-- only an alternated sequence of send's and recv's.

		-- Compatible peer sockets: ZMQ_REP, ZMQ_XREP.
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ZMQ_REQ"
		}"
		end

	zmq_rep: INTEGER_32 is
		-- A socket type to receive requests and send replies. This socket
		-- type allows only an alternated sequence of recv's and send's.
		-- Each send is routed to the peer  that  issued  the  last
		-- received request.

		-- Compatible peer sockets: ZMQ_REQ, ZMQ_XREQ.
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ZMQ_REP"
		}"
		end

	zmq_xreq: INTEGER_32 is
		-- A special  socket  type to be used in request/reply middleboxes
		-- such as zmq_queue(7).  Requests forwarded using  this  socket
		-- type  should  be  tagged  by  a proper postix identifying the
		-- original requester.  Replies  received  by  this  socket  are
		-- tagged  with  a  proper  postfix that can be use to route the
		-- reply back to the original requester.

		-- Compatible peer sockets: ZMQ_REP, ZMQ_XREP.
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ZMQ_XREQ"
		}"
		end

	zmq_xrep: INTEGER_32 is 
		-- A special socket type to be used in  request/reply  middleboxes such  as  zmq_queue(7).   Requests received using this socket are already properly  tagged  with  postfix  identifying  the original  requester. When sending a reply via XREP socket the message should be tagged with a postfix from a  corresponding request.

		-- Compatible peer sockets: ZMQ_REQ, ZMQ_XREQ.
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ZMQ_XREP"
		}"
		end

	zmq_upstream: INTEGER_32 is
		-- Socket  to  receive messages from up the stream. Messages are
		-- fair-queued from among all the connected peers. Send function is
		-- not implemented for this socket type.

        -- Compatible peer sockets: ZMQ_DOWNSTREAM.
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ZMQ_UPSTREAM"
		}"
		end

	zmq_downstream: INTEGER_32 is
		-- A socket type to  send messages down stream. Messages are
		-- load-balanced among all the connected peers. Send function is not
		-- implemented for this socket type.

		-- Compatible peer sockets: ZMQ_UPSTREAM.
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ZMQ_DOWNSTREAM"
		}"
		end

end -- class ZMQ_SOCKET_TYPES
