deferred class ZMQ_SOCKET
   -- A ØMQ socket

inherit
   WRAPPER
      redefine
         from_external_pointer
      end
   EIFFEL_OWNED
      redefine
         dispose
      end

insert
   ZMQ_EXTERNALS
   ZMQ_STATUS

feature {ANY}
   from_external_pointer (a_pointer: POINTER)
      do
         handle:=a_pointer
      end

   is_equal (another: like Current): BOOLEAN
      do
         Result:=handle=another.handle
      end

   copy (another: like Current)
      do
         not_yet_implemented
      end

feature {} -- Disposing
   dispose
      do
         handle_return_value (zmq_close (handle))
      end

feature {ANY} -- Binding
   bind (an_address: ABSTRACT_STRING)
      -- Bind Current socket to a particular transport.

--            The zmq_bind() function shall create an endpoint for accepting connections and bind it to the socket referenced by the socket
--       argument.
--
--       The endpoint argument is a string consisting of two parts as follows: transport://address. The transport part specifies the
--       underlying transport protocol to use. The meaning of the address part is specific to the underlying transport protocol
--       selected.
--
--       The following transports are defined:
--
--       inproc
--           local in-process (inter-thread) communication transport, see zmq_inproc(7)
--
--       ipc
--           local inter-process communication transport, see zmq_ipc(7)
--
--       tcp
--           unicast transport using TCP, see zmq_tcp(7)
--
--       pgm, epgm
--           reliable multicast transport using PGM, see zmq_pgm(7)
--
--       With the exception of ZMQ_PAIR sockets, a single socket may be connected to multiple endpoints using zmq_connect(), while
--       simultaneously accepting incoming connections from multiple endpoints bound to the socket using zmq_bind(). Refer to
--       zmq_socket(3) for a description of the exact semantics involved when connecting or binding a socket to multiple endpoints.
--
   require an_address/=Void
   do
      is_successful := zmq_bind(handle,an_address.to_external)=0
      if is_unsuccessful then throw(zmq_exception) end
   end

   connect (an_address: ABSTRACT_STRING)
      -- Connect Current socket to the endpoint specified by `an_address'.

      -- `an_address' consists of two parts as follows: transport://address.
      -- The transport part specifies the underlying transport protocol to
      -- use. The meaning of the address part is specific to the underlying
      -- transport protocolselected.

      -- The following transports are defined:
      --
      -- * inproc: local in-process (inter-thread) communication transport, see zmq_inproc(7) manpage
      --
      -- * ipc:    local inter-process communication transport, see zmq_ipc(7) manpage
      --
      -- * tcp:    unicast transport using TCP, see zmq_tcp(7) manpage.
      --
      -- * pgm, epgm: reliable multicast transport using PGM, see zmq_pgm(7)

      -- With the exception of ZMQ_PAIR sockets, a single socket may be
      -- connected to multiple endpoints using `connect', while
      -- simultaneously accepting incoming connections from multiple
      -- endpoints bound to the socket using `bind'. See each effective heirs
      -- of ZMQ_SOCKET and creation procedures in ZMQ_CONTEXT for a
      -- description of the exact semantics involved when connecting or
      -- binding a socket to multiple endpoints.

      -- Note: The connection will not be performed immediately but as needed
      -- by 0MQ. Thus a successful invocation of `connect' does not indicate
      -- that a physical connection was or can actually be established.
   require an_address/=Void
   do
      is_successful := zmq_connect(handle,an_address.to_external)=0
      if is_unsuccessful then throw(zmq_exception) end
   end

feature {ANY} -- Options
   type: INTEGER_32
      -- The type of Current socket. It is specified at creation time and cannot be modified afterwards.

      --       Option value type    int
      --       Option value unit    N/A
      --       Default value       N/A
      --       Applicable socket types    all

      local res, result_size: INTEGER
      do
         result_size := Result.object_size
         is_successful := zmq_getsockopt(handle, zmq_type, $Result, $result_size)=0
         if is_unsuccessful then throw(zmq_exception) end
      end

   --   ZMQ_RCVMORE: More message parts to follow
   --       The ZMQ_RCVMORE option shall return a boolean value indicating if the multi-part message currently being read from the
   --       specified socket has more message parts to follow. If there are no message parts to follow or if the message currently being
   --       read is not a multi-part message a value of zero shall be returned. Otherwise, a value of 1 shall be returned.
   --
   --       Refer to zmq_send(3) and zmq_recv(3) for a detailed description of sending/receiving multi-part messages.
   --       Option value type    int64_t
   --       Option value unit    boolean
   --       Default value       N/A
   --       Applicable socket types    all
   --
   --   ZMQ_HWM: Retrieve high water mark
   --       The ZMQ_HWM option shall retrieve the high water mark for the specified socket. The high water mark is a hard limit on the
   --       maximum number of outstanding messages 0MQ shall queue in memory for any single peer that the specified socket
   --       communicating with.
   --
   --       If this limit has been reached the socket shall enter an exceptional state and depending on the socket type, 0MQ shall take
   --       appropriate action such as blocking or dropping sent messages. Refer to the individual socket descriptions in zmq_socket(3)
   --       for details on the exact action taken for each socket type.
   --
   --       The default ZMQ_HWM value of zero means "no limit".
   --
   --       Option value type    uint64_t
   --
   --       Option value unit    messages
   --
   --       Default value       0
   --
   --       Applicable socket types    all
   --
   --   ZMQ_SWAP: Retrieve disk offload size
   --       The ZMQ_SWAP option shall retrieve the disk offload (swap) size for the specified socket. A socket which has ZMQ_SWAP set to a
   --       non-zero value may exceed its high water mark; in this case outstanding messages shall be offloaded to storage on disk rather
   --       than held in memory.
   --
   --       The value of ZMQ_SWAP defines the maximum size of the swap space in bytes.
   --       Option value type    int64_t
   --
   --       Option value unit    bytes
   --
   --       Default value       0
   --
   --       Applicable socket types    all
   --
   --   ZMQ_AFFINITY: Retrieve I/O thread affinity
   --       The ZMQ_AFFINITY option shall retrieve the I/O thread affinity for newly created connections on the specified socket.
   --
   --       Affinity determines which threads from the 0MQ I/O thread pool associated with the socket’s context shall handle newly created
   --       connections. A value of zero specifies no affinity, meaning that work shall be distributed fairly among all 0MQ I/O threads in
   --       the thread pool. For non-zero values, the lowest bit corresponds to thread 1, second lowest bit to thread 2 and so on. For
   --       example, a value of 3 specifies that subsequent connections on socket shall be handled exclusively by I/O threads 1 and 2.
   --
   --       See also zmq_init(3) for details on allocating the number of I/O threads for a specific context.
   --
   --       Option value type    uint64_t
   --
   --       Option value unit    N/A (bitmap)
   --
   --       Default value       0
   --
   --       Applicable socket types    N/A
   --
   --   ZMQ_IDENTITY: Retrieve socket identity
   --       The ZMQ_IDENTITY option shall retrieve the identity of the specified socket. Socket identity determines if existing 0MQ
   --       infrastructure (message queues, forwarding devices) shall be identified with a specific application and persist across
   --       multiple runs of the application.
   --
   --       If the socket has no identity, each run of an application is completely separate from other runs. However, with identity set
   --       the socket shall re-use any existing 0MQ infrastructure configured by the previous run(s). Thus the application may receive
   --       messages that were sent in the meantime, message queue limits shall be shared with previous run(s) and so on.
   --
   --       Identity can be at least one byte and at most 255 bytes long. Identities starting with binary zero are reserved for use by 0MQ
   --       infrastructure.
   --
   --       Option value type    binary data
   --
   --       Option value unit    N/A
   --
   --       Default value       NULL
   --
   --       Applicable socket types    all
   --
   --   ZMQ_RATE: Retrieve multicast data rate
   --       The ZMQ_RATE option shall retrieve the maximum send or receive data rate for multicast transports using the specified socket.
   --
   --       Option value type    int64_t
   --
   --       Option value unit    kilobits per second
   --
   --       Default value       100
   --
   --       Applicable socket types    all, when using multicast transports
   --
   --   ZMQ_RECOVERY_IVL: Get multicast recovery interval
   --       The ZMQ_RECOVERY_IVL option shall retrieve the recovery interval for multicast transports using the specified socket. The
   --       recovery interval determines the maximum time in seconds that a receiver can be absent from a multicast group before
   --       unrecoverable data loss will occur.
   --
   --       Option value type    int64_t
   --
   --       Option value unit    seconds
   --
   --       Default value       10
   --
   --       Applicable socket types    all, when using multicast transports
   --
   --
   --   ZMQ_RECOVERY_IVL_MSEC: Get multicast recovery interval in milliseconds
   --       The ZMQ_RECOVERY_IVL’_MSEC option shall retrieve the recovery interval, in milliseconds, for multicast transports using the
   --       specified 'socket. The recovery interval determines the maximum time in seconds that a receiver can be absent from a multicast
   --       group before unrecoverable data loss will occur.
   --
   --       For backward compatibility, the default value of ZMQ_RECOVERY_IVL_MSEC is -1 indicating that the recovery interval should be
   --       obtained from the ZMQ_RECOVERY_IVL option. However, if the ZMQ_RECOVERY_IVL_MSEC value is not zero, then it will take
   --       precedence, and be used.
   --
   --
   --       Option value type    int64_t
   --
   --       Option value unit    milliseconds
   --
   --       Default value       -1
   --
   --       Applicable socket types    all, when using multicast transports
   --
   --
   --   ZMQ_MCAST_LOOP: Control multicast loop-back
   --       The ZMQ_MCAST_LOOP option controls whether data sent via multicast transports can also be received by the sending host via
   --       loop-back. A value of zero indicates that the loop-back functionality is disabled, while the default value of 1 indicates that
   --       the loop-back functionality is enabled. Leaving multicast loop-back enabled when it is not required can have a negative impact
   --       on performance. Where possible, disable ZMQ_MCAST_LOOP in production environments.
   --
   --
   --       Option value type    int64_t
   --
   --       Option value unit    boolean
   --
   --       Default value       1
   --
   --       Applicable socket types    all, when using multicast transports
   --
   --
   --   ZMQ_SNDBUF: Retrieve kernel transmit buffer size
   --       The ZMQ_SNDBUF option shall retrieve the underlying kernel transmit buffer size for the specified socket. A value of zero
   --       means that the OS default is in effect. For details refer to your operating system documentation for the SO_SNDBUF socket
   --       option.
   --
   --
   --       Option value type    uint64_t
   --
   --
   --       Option value unit    bytes
   --
   --       Default value       0
   --
   --       Applicable socket types    all
   --
   --
   --   ZMQ_RCVBUF: Retrieve kernel receive buffer size
   --       The ZMQ_RCVBUF option shall retrieve the underlying kernel receive buffer size for the specified socket. A value of zero means
   --       that the OS default is in effect. For details refer to your operating system documentation for the SO_RCVBUF socket option.
   --
   --
   --       Option value type    uint64_t
   --
   --       Option value unit    bytes
   --
   --       Default value       0
   --
   --       Applicable socket types    all
   --
   --
   --   ZMQ_LINGER: Retrieve linger period for socket shutdown
   --       The ZMQ_LINGER option shall retrieve the linger period for the specified socket. The linger period determines how long pending
   --       messages which have yet to be sent to a peer shall linger in memory after a socket is closed with zmq_close(3), and further
   --       affects the termination of the socket’s context with zmq_term(3). The following outlines the different behaviours:
   --
   --       ·   The default value of -1 specifies an infinite linger period. Pending messages shall not be discarded after a call to
   --      zmq_close(); attempting to terminate the socket’s context with zmq_term() shall block until all pending messages have been
   --      sent to a peer.
   --
   --       ·   The value of 0 specifies no linger period. Pending messages shall be discarded immediately when the socket is closed with
   --      zmq_close().
   --
   --       ·   Positive values specify an upper bound for the linger period in milliseconds. Pending messages shall not be discarded
   --      after a call to zmq_close(); attempting to terminate the socket’s context with zmq_term() shall block until either all
   --      pending messages have been sent to a peer, or the linger period expires, after which any pending messages shall be
   --      discarded.
   --
   --      Option value type        int
   --      Option value unit        milliseconds
   --      Default value        -1 (infinite)
   --      Applicable socket types   all
   --
   --
   --   ZMQ_RECONNECT_IVL: Retrieve reconnection interval
   --       The ZMQ_RECONNECT_IVL option shall retrieve the initial reconnection interval for the specified socket. The reconnection
   --       interval is the period 0MQ shall wait between attempts to reconnect disconnected peers when using connection-oriented
   --       transports.
   --
   --      Note
   --      The reconnection interval may be randomized by 0MQ to prevent reconnection storms in topologies with a large number of
   --      peers per socket.
   --
   --
   --       Option value type    int
   --
   --       Option value unit    milliseconds
   --
   --       Default value       100
   --
   --       Applicable socket types    all, only for connection-oriented transports
   --
   --
   --   ZMQ_RECONNECT_IVL_MAX: Retrieve maximum reconnection interval
   --       The ZMQ_RECONNECT_IVL_MAX option shall retrieve the maximum reconnection interval for the specified socket. This is the
   --       maximum period 0MQ shall wait between attempts to reconnect. On each reconnect attempt, the previous interval shall be doubled
   --       untill ZMQ_RECONNECT_IVL_MAX is reached. This allows for exponential backoff strategy. Default value means no exponential
   --       backoff is performed and reconnect interval calculations are only based on ZMQ_RECONNECT_IVL.
   --
   --      Note
   --      Values less than ZMQ_RECONNECT_IVL will be ignored.
   --
   --
   --       Option value type    int
   --
   --       Option value unit    milliseconds
   --
   --       Default value       0 (only use ZMQ_RECONNECT_IVL)
   --
   --       Applicable socket types    all, only for connection-oriented transport
   --
   --
   --   ZMQ_BACKLOG: Retrieve maximum length of the queue of outstanding connections
   --       The ZMQ_BACKLOG option shall retrieve the maximum length of the queue of outstanding peer connections for the specified
   --       socket; this only applies to connection-oriented transports. For details refer to your operating system documentation for the
   --       listen function.
   --
   --
   --       Option value type    int
   --
   --       Option value unit    connections
   --
   --       Default value       100
   --
   --       Applicable socket types    all, only for connection-oriented transports
   --
   --
   --   ZMQ_FD: Retrieve file descriptor associated with the socket
   --       The ZMQ_FD option shall retrieve the file descriptor associated with the specified socket. The returned file descriptor can be
   --       used to integrate the socket into an existing event loop; the 0MQ library shall signal any pending events on the socket in an
   --       edge-triggered fashion by making the file descriptor become ready for reading.
   --
   --      Note
   --      The ability to read from the returned file descriptor does not necessarily indicate that messages are available to be read
   --      from, or can be written to, the underlying socket; applications must retrieve the actual event state with a subsequent
   --      retrieval of the ZMQ_EVENTS option.
   --
   --      Caution
   --      The returned file descriptor is intended for use with a poll or similar system call only. Applications must never attempt
   --      to read or write data to it directly, neither should they try to close it.
   --
   --
   --       Option value type    int on POSIX systems, SOCKET on Windows
   --
   --       Option value unit    N/A
   --
   --       Default value       N/A
   --
   --       Applicable socket types    all
   --
   --
   --   ZMQ_EVENTS: Retrieve socket event state
   --       The ZMQ_EVENTS option shall retrieve the event state for the specified socket. The returned value is a bit mask constructed by
   --       OR’ing a combination of the following event flags:
   --
   --       ZMQ_POLLIN
   --      Indicates that at least one message may be received from the specified socket without blocking.
   --
   --       ZMQ_POLLOUT
   --      Indicates that at least one message may be sent to the specified socket without blocking.
   --
   --       The combination of a file descriptor returned by the ZMQ_FD option being ready for reading but no actual events returned by a
   --       subsequent retrieval of the ZMQ_EVENTS option is valid; applications should simply ignore this case and restart their polling
   --       operation/event loop.
   --
   --
   --       Option value type    uint32_t
   --
   --       Option value unit    N/A (flags)
   --
   --       Default value       N/A
   --
   --       Applicable socket types    all
   --
   --
   --RETURN VALUE
   --       The zmq_getsockopt() function shall return zero if successful. Otherwise it shall return -1 and set errno to one of the values
   --       defined below.
   --
   --ERRORS
   --       EINVAL
   --      The requested option option_name is unknown, or the requested option_len or option_value is invalid, or the size of the
   --      buffer pointed to by option_value, as specified by option_len, is insufficient for storing the option value.
   --
   --       ETERM
   --      The 0MQ context associated with the specified socket was terminated.
   --
   --       ENOTSOCK
   --      The provided socket was invalid.
   --
   --       EINTR
   --      The operation was interrupted by delivery of a signal.
   --


feature {} -- Constants
   zmq_noblock: INTEGER_32
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ZMQ_NOBLOCK"
      }"
      end

   zmq_sndmore: INTEGER_32
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ZMQ_SNDMORE"
      }"
      end
   zmq_type: INTEGER_32
      external "plug_in"
      alias "{
         location: "externals/generated"
         module_name: "plugin"
         feature_name: "ZMQ_TYPE"
      }"
      end
      --   ZMQ_RCVMORE: More message parts to follow
      --   ZMQ_HWM: Retrieve high water mark
      --   ZMQ_SWAP: Retrieve disk offload size
      --   ZMQ_AFFINITY: Retrieve I/O thread affinity
      --   ZMQ_IDENTITY: Retrieve socket identity
      --   ZMQ_RATE: Retrieve multicast data rate
      --   ZMQ_RECOVERY_IVL: Get multicast recovery interval
      --   ZMQ_RECOVERY_IVL_MSEC: Get multicast recovery interval in milliseconds
      --   ZMQ_MCAST_LOOP: Control multicast loop-back
      --   ZMQ_SNDBUF: Retrieve kernel transmit buffer size
      --   ZMQ_RCVBUF: Retrieve kernel receive buffer size
      --   ZMQ_LINGER: Retrieve linger period for socket shutdown
      --   ZMQ_RECONNECT_IVL: Retrieve reconnection interval
      --   ZMQ_RECONNECT_IVL_MAX: Retrieve maximum reconnection interval
      --   ZMQ_BACKLOG: Retrieve maximum length of the queue of outstanding connections
      --   ZMQ_FD: Retrieve file descriptor associated with the socket
      --   ZMQ_EVENTS: Retrieve socket event state
      --       ZMQ_POLLIN
      --       ZMQ_POLLOUT

end -- class ZMQ_SOCKET

-- Zero MQ Liberty Wrappers

-- Copyright (C) 2010-2017: Paolo Redaelli

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
