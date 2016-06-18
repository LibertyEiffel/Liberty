-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
expanded class EZMQ_ZMQ
   --
   -- Access to the zmq C interface. To be inserted into interested classes.
   --

insert
   EZMQ

feature {ANY} -- Exceptions
   on_send_error (action: PROCEDURE[TUPLE[INTEGER, EZMQ_SOCKET, ABSTRACT_STRING, EZMQ_FLAGS]])
      do
         if action /= Void then
            send_error_action_ref.item := action
         else
            send_error_action_ref.item := default_send_error_action
         end
      end

   on_receive_error (action: PROCEDURE[TUPLE[INTEGER, EZMQ_SOCKET, INTEGER, EZMQ_FLAGS]])
      do
         if action /= Void then
            receive_error_action_ref.item := action
         else
            receive_error_action_ref.item := default_receive_error_action
         end
      end

   on_bind_error (action: PROCEDURE[TUPLE[INTEGER, EZMQ_TYPE, EZMQ_ENDPOINT]])
      do
         if action /= Void then
            bind_error_action_ref.item := action
         else
            bind_error_action_ref.item := default_bind_error_action
         end
      end

   on_connect_error (action: PROCEDURE[TUPLE[INTEGER, EZMQ_TYPE, EZMQ_ENDPOINT]])
      do
         if action /= Void then
            connect_error_action_ref.item := action
         else
            connect_error_action_ref.item := default_connect_error_action
         end
      end

   on_disconnect_error (action: PROCEDURE[TUPLE[INTEGER, EZMQ_SOCKET]])
      do
         if action /= Void then
            disconnect_error_action_ref.item := action
         else
            disconnect_error_action_ref.item := default_disconnect_error_action
         end
      end

   on_poll_error (action: PROCEDURE[TUPLE[INTEGER, EZMQ_HUB]])
      do
         if action /= Void then
            poll_error_action_ref.item := action
         else
            poll_error_action_ref.item := default_poll_error_action
         end
      end

feature {} -- Exceptions
   default_error (msg: STRING; res: INTEGER)
      local
         x: EXCEPTIONS
         s: STRING
      do
         s := once ""
         s.copy(msg)
         s.append(once ": ")
         res.append_in(s)
         x.throw(create {EZMQ_EXCEPTION}.make(s))
      end

   send_error_action_ref: REFERENCE[PROCEDURE[TUPLE[INTEGER, EZMQ_SOCKET, ABSTRACT_STRING, EZMQ_FLAGS]]]
      once
         create Result.set_item(default_send_error_action)
      end

   send_error_action: PROCEDURE[TUPLE[INTEGER, EZMQ_SOCKET, ABSTRACT_STRING, EZMQ_FLAGS]]
      do
         Result := send_error_action_ref.item
      end

   default_send_error_action: PROCEDURE[TUPLE[INTEGER, EZMQ_SOCKET, ABSTRACT_STRING, EZMQ_FLAGS]]
      once
         Result := agent default_error("Send error", {INTEGER})
      end

   receive_error_action_ref: REFERENCE[PROCEDURE[TUPLE[INTEGER, EZMQ_SOCKET, INTEGER, EZMQ_FLAGS]]]
      once
         create Result.set_item(default_receive_error_action)
      end

   receive_error_action: PROCEDURE[TUPLE[INTEGER, EZMQ_SOCKET, INTEGER, EZMQ_FLAGS]]
      do
         Result := receive_error_action_ref.item
      end

   default_receive_error_action: PROCEDURE[TUPLE[INTEGER, EZMQ_SOCKET, INTEGER, EZMQ_FLAGS]]
      once
         Result := agent default_error("Receive error: ", {INTEGER})
      end

   bind_error_action_ref: REFERENCE[PROCEDURE[TUPLE[INTEGER, EZMQ_TYPE, EZMQ_ENDPOINT]]]
      once
         create Result.set_item(default_bind_error_action)
      end

   bind_error_action: PROCEDURE[TUPLE[INTEGER, EZMQ_TYPE, EZMQ_ENDPOINT]]
      do
         Result := bind_error_action_ref.item
      end

   default_bind_error_action: PROCEDURE[TUPLE[INTEGER, EZMQ_TYPE, EZMQ_ENDPOINT]]
      once
         Result := agent default_error("Bind error: ", {INTEGER})
      end

   connect_error_action_ref: REFERENCE[PROCEDURE[TUPLE[INTEGER, EZMQ_TYPE, EZMQ_ENDPOINT]]]
      once
         create Result.set_item(default_connect_error_action)
      end

   connect_error_action: PROCEDURE[TUPLE[INTEGER, EZMQ_TYPE, EZMQ_ENDPOINT]]
      do
         Result := connect_error_action_ref.item
      end

   default_connect_error_action: PROCEDURE[TUPLE[INTEGER, EZMQ_TYPE, EZMQ_ENDPOINT]]
      once
         Result := agent default_error("Connect error: ", {INTEGER})
      end

   disconnect_error_action_ref: REFERENCE[PROCEDURE[TUPLE[INTEGER, EZMQ_SOCKET]]]
      once
         create Result.set_item(default_disconnect_error_action)
      end

   disconnect_error_action: PROCEDURE[TUPLE[INTEGER, EZMQ_SOCKET]]
      do
         Result := disconnect_error_action_ref.item
      end

   default_disconnect_error_action: PROCEDURE[TUPLE[INTEGER, EZMQ_SOCKET]]
      once
         Result := agent default_error("Disconnect error: ", {INTEGER})
      end

   poll_error_action_ref: REFERENCE[PROCEDURE[TUPLE[INTEGER, EZMQ_HUB]]]
      once
         create Result.set_item(default_poll_error_action)
      end

   poll_error_action: PROCEDURE[TUPLE[INTEGER, EZMQ_HUB]]
      do
         Result := poll_error_action_ref.item
      end

   default_poll_error_action: PROCEDURE[TUPLE[INTEGER, EZMQ_HUB]]
      once
         Result := agent default_error("Poll error: ", {INTEGER})
      end

feature {ANY} -- ZMQ version
   version_major: INTEGER
      once
         init_version
         Result := version_major_ref.item
      end

   version_minor: INTEGER
      once
         init_version
         Result := version_minor_ref.item
      end

   version_patch: INTEGER
      once
         init_version
         Result := version_patch_ref.item
      end

feature {}
   version_major_ref: REFERENCE[INTEGER]
      once
         create Result.set_item(-1)
      end

   version_minor_ref: REFERENCE[INTEGER]
      once
         create Result.set_item(-1)
      end

   version_patch_ref: REFERENCE[INTEGER]
      once
         create Result.set_item(-1)
      end

   init_version
      local
         maj, min, pat: INTEGER
      once
         zmq_version($maj, $min, $pat)
         version_major_ref.item := maj
         version_minor_ref.item := min
         version_patch_ref.item := pat
      end

   zmq_version (maj, min, pat: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "zmq_version"
         }"
      end

feature {} -- Context
   context: POINTER
      do
         Result := context_ref.item
      end

   start_context
      require
         context.is_null
      do
         context_ref.item := zmq_ctx_new
      end

   term_context
      require
         context.is_not_null
      do
         zmq_ctx_term(context)
         context_ref.item := default_pointer
      ensure
         context.is_null
      end

   zmq_ctx_new: POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "zmq_ctx_new()"
         }"
      end

   zmq_ctx_term (a_context: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "zmq_ctx_term"
         }"
      end

   context_ref: REFERENCE[POINTER]
      once
         create Result
      end

feature {} -- Socket
   zmq_socket (a_context: POINTER; type: INTEGER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "zmq_socket"
         }"
      end

   zmq_bind (socket: POINTER; endpoint: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "zmq_bind"
         }"
      end

   zmq_connect (socket: POINTER; endpoint: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "zmq_connect"
         }"
      end

   zmq_close (socket: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "zmq_close"
         }"
      end

   zmq_disconnect (socket, endpoint: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "zmq_disconnect"
         }"
      end

   zmq_socket_fd (socket: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ezmq_socket_fd"
         }"
      end

   zmq_socket_events (socket: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ezmq_socket_events"
         }"
      end

feature {} -- Transmission
   zmq_send (socket, buf: POINTER; len, flags: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "zmq_send"
         }"
      end

   zmq_receive (socket, buf: POINTER; len, flags: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "zmq_recv"
         }"
      end

end -- class EZMQ_ZMQ
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
