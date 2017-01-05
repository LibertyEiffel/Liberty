deferred class ZMQ_SOCKET_TYPES
	-- ØMQ socket types identifier. See ZMQ_SOCKET heirs for their descriptions

insert ANY undefine copy, is_equal end
feature {} -- Socket types
	zmq_p2p: INTEGER_32
		external "plug_in"
		alias "{
			location: "externals/generated"
			module_name: "plugin"
			feature_name: "ZMQ_P2P"
		}"
		end

	zmq_pub: INTEGER_32
		external "plug_in"
		alias "{
			location: "externals/generated"
			module_name: "plugin"
			feature_name: "ZMQ_PUB"
		}"
		end

	zmq_sub: INTEGER_32
		external "plug_in"
		alias "{
			location: "externals/generated"
			module_name: "plugin"
			feature_name: "ZMQ_SUB"
		}"
		end

	zmq_req: INTEGER_32
		external "plug_in"
		alias "{
			location: "externals/generated"
			module_name: "plugin"
			feature_name: "ZMQ_REQ"
		}"
		end

	zmq_rep: INTEGER_32
		external "plug_in"
		alias "{
			location: "externals/generated"
			module_name: "plugin"
			feature_name: "ZMQ_REP"
		}"
		end

	zmq_dealer: INTEGER_32
		external "plug_in"
		alias "{
			location: "externals/generated"
			module_name: "plugin"
			feature_name: "ZMQ_DEALER"
		}"
		end

	zmq_router: INTEGER_32 
		external "plug_in"
		alias "{
			location: "externals/generated"
			module_name: "plugin"
			feature_name: "ZMQ_ROUTER"
		}"
		end

	zmq_pull: INTEGER_32
		external "plug_in"
		alias "{
			location: "externals/generated"
			module_name: "plugin"
			feature_name: "ZMQ_PULL"
		}"
		end

	zmq_push: INTEGER_32
		external "plug_in"
		alias "{
			location: "externals/generated"
			module_name: "plugin"
			feature_name: "ZMQ_PUSH"
		}"
		end
	
	zmq_pair: INTEGER_32
		external "plug_in"
		alias "{
			location: "externals/generated"
			module_name: "plugin"
			feature_name: "ZMQ_PAIR"
		}"
		end

end -- class ZMQ_SOCKET_TYPES

-- Zero MQ Liberty Wrappers

-- Copyright (C) 2010-2017: Paolo Redaelli 

-- This liberty is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 3 of the License, or (at your option) any later version.
-- 
-- This liberty is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with this liberty; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

