class ZMQ_SUB_SOCKET
	-- A socket of type ZMQ_SUB, used by a subscriber to subscribe to data
	-- distributed by a publisher. Initially a ZMQ_SUB socket is not subscribed
	-- to any messages, use the ZMQ_SUBSCRIBE option of zmq_setsockopt(3) to
	-- specify which messages to subscribe to.
	
	-- Table 6. Summary of ZMQ_SUB characteristics Compatible peer sockets
	-- ZMQ_PUB
	--
	-- Direction		       Unidirectional
	--
	-- Send/receive pattern        Receive only
	--
	-- Incoming routing strategy   Fair-queued
	--
	-- Outgoing routing strategy   N/A
	--
	-- ZMQ_HWM option action       Drop

inherit ZMQ_RECEIVING_SOCKET
create {ZMQ_CONTEXT} from_external_pointer
feature {ANY} -- Message subscribing
	subscribe_to_all
		do
			not_yet_implemented
		end


	subscribe_to (a_prefix: ABSTRACT_STRING)
		-- 		   ZMQ_SUBSCRIBE: Establish message filter
		--        The ZMQ_SUBSCRIBE option shall establish a new message filter on a ZMQ_SUB socket. Newly created ZMQ_SUB sockets shall filter
		--        out all incoming messages, therefore you should call this option to establish an initial message filter.
		-- 
		--        An empty option_value of length zero shall subscribe to all incoming messages. A non-empty option_value shall subscribe to all
		--        messages beginning with the specified prefix. Multiple filters may be attached to a single ZMQ_SUB socket, in which case a
		--        message shall be accepted if it matches at least one filter.
		-- 
		-- 
		--        Option value type	 binary data
		-- 
		--        Option value unit	 N/A
		-- 
		--        Default value		 N/A
		-- 
		--        Applicable socket types	 ZMQ_SUB
	do
		not_yet_implemented
	end

	-- 
	-- 
	--    ZMQ_UNSUBSCRIBE: Remove message filter
	--        The ZMQ_UNSUBSCRIBE option shall remove an existing message filter on a ZMQ_SUB socket. The filter specified must match an
	--        existing filter previously established with the ZMQ_SUBSCRIBE option. If the socket has several instances of the same filter
	--        attached the ZMQ_UNSUBSCRIBE option shall remove only one instance, leaving the rest in place and functional.
	-- 
	-- 
	--        Option value type	 binary data
	-- 
	--        Option value unit	 N/A
	-- 
	--        Default value		 N/A
	-- 
	--        Applicable socket types	 ZMQ_SUB
	-- 
end               	  

-- Zero MQ Liberty Wrappers

-- Copyright (C) 2012-2016: Paolo Redaelli, 2013 Cyril Adrian 

-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 3 of the License, or (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                   	  
         	   	    
                    	  
         	   	    
                    	  
         	   	    
                    	  
               	    
                	  
