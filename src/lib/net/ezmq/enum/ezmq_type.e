-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
expanded class EZMQ_TYPE

insert
   HASHABLE
      redefine
         default_create
      end

feature {ANY}
   value_of (a_type: INTEGER): EZMQ_TYPE
      do
         if map.has(a_type) then
            Result := map.at(type)
         end
      ensure
         Result.is_valid implies Result.type = a_type
      end

feature {ANY} -- The only valid values:
   Req: EZMQ_TYPE
         -- ZMQ_REQ
      once
         Result.make(Type_req, True, True)
      end

   Rep: EZMQ_TYPE
         -- ZMQ_REP
      once
         Result.make(Type_rep, True, True)
      end

   Dealer: EZMQ_TYPE
         -- ZMQ_DEALER
      once
         Result.make(Type_dealer, True, True)
      end

   Router: EZMQ_TYPE
         -- ZMQ_ROUTER
      once
         Result.make(Type_router, True, True)
      end

   Pub: EZMQ_TYPE
         -- ZMQ_PUB
      once
         Result.make(Type_pub, True, False)
      end

   Sub: EZMQ_TYPE
         -- ZMQ_SUB
      once
         Result.make(Type_sub, False, True)
      end

   Xpub: EZMQ_TYPE
         -- ZMQ_XPUB
      once
         Result.make(Type_xpub, True, True)
      end

   Xsub: EZMQ_TYPE
         -- ZMQ_XSUB
      once
         Result.make(Type_xsub, True, True)
      end

   Push: EZMQ_TYPE
         -- ZMQ_PUSH
      once
         Result.make(Type_push, True, False)
      end

   Pull: EZMQ_TYPE
         -- ZMQ_PULL
      once
         Result.make(Type_pull, False, True)
      end

   Pair: EZMQ_TYPE
         -- ZMQ_PAIR
      once
         Result.make(Type_pair, True, True)
      end

   Stream: EZMQ_TYPE
         -- ZMQ_STREAM
      require
         has_stream
      once
         Result.make(Type_stream, True, True)
      end

   has_stream: BOOLEAN
      local
         z: EZMQ_ZMQ
      once
         Result := z.version_major >= 4
      end

feature {ANY}
   peers: SET[EZMQ_TYPE]
      require
         is_valid
      attribute
      ensure
         Result /= Void
      end

   is_valid: BOOLEAN
      do
         Result := type /= 0
      end

   type: INTEGER
   can_send, can_receive: BOOLEAN

   hash_code: INTEGER
      do
         Result := type
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := type = other.type
      end

feature {EZMQ_TYPE}
   make (a_type: like type; cs, cr: BOOLEAN)
      require
         a_type /= 0
      do
         type := a_type
         can_send := cs
         can_receive := cr
         map.add(Current, type)
      ensure
         type = a_type
         can_send = cs
         can_receive = cr
         is_valid
      end

   set_peers (a_peers: SET[EZMQ_TYPE])
      do
         peers := a_peers
      end

feature {}
   default_create
      do
         init
      end

   init
      once
         Req.set_peers({HASHED_SET[EZMQ_TYPE] << Rep, Router >>})
         Rep.set_peers({HASHED_SET[EZMQ_TYPE] << Req, Dealer >>})
         Dealer.set_peers({HASHED_SET[EZMQ_TYPE] << Router, Rep, Dealer >>})
         Router.set_peers({HASHED_SET[EZMQ_TYPE] << Dealer, Req, Router >>})
         Pub.set_peers({HASHED_SET[EZMQ_TYPE] << Sub, Xsub >>})
         Sub.set_peers({HASHED_SET[EZMQ_TYPE] << Pub, Xpub >>})
         Xpub.set_peers({HASHED_SET[EZMQ_TYPE] << Sub, Xsub >>})
         Xsub.set_peers({HASHED_SET[EZMQ_TYPE] << Pub, Xpub >>})
         Push.set_peers({HASHED_SET[EZMQ_TYPE] << Pull >>})
         Pull.set_peers({HASHED_SET[EZMQ_TYPE] << Push >>})
         Pair.set_peers({HASHED_SET[EZMQ_TYPE] << Pair >>})
         Stream.set_peers(create {HASHED_SET[EZMQ_TYPE]}.with_capacity(0))
      end

   map: HASHED_DICTIONARY[EZMQ_TYPE, INTEGER]
      once
         create Result.make
      end

feature {}
   Type_req: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_REQ"
         }"
      end

   Type_rep: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_REP"
         }"
      end

   Type_dealer: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_DEALER"
         }"
      end

   Type_router: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_ROUTER"
         }"
      end

   Type_pub: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_PUB"
         }"
      end

   Type_sub: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_SUB"
         }"
      end

   Type_xpub: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_XPUB"
         }"
      end

   Type_xsub: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_XSUB"
         }"
      end

   Type_push: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_PUSH"
         }"
      end

   Type_pull: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_PULL"
         }"
      end

   Type_pair: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_PAIR"
         }"
      end

   Type_stream: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_STREAM"
         }"
      end

end -- class EZMQ_TYPE
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
