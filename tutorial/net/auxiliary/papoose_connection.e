class PAPOOSE_CONNECTION
   --
   -- Handle one connection to the HTTP_SERVER. The method handlers are defined here.
   --

inherit
   HTTP_CONNECTION

create {ANY}
   make

feature {}
   method_handler_factory: FUNCTION[TUPLE[STRING, STRING, STRING, OUTPUT_STREAM], HTTP_METHOD_HANDLER]
      -- The first argument is the method, the second is the URI, the third is the version; the fourth
      -- the output stream to the client socket

   make (a_method_handler_factory: like method_handler_factory)
      do
         method_handler_factory := a_method_handler_factory
         create request_line.make_empty
      end

feature {} -- method handlers reuse
   method_handlers: DICTIONARY[FAST_ARRAY[HTTP_METHOD_HANDLER], STRING]
      once
         create {HASHED_DICTIONARY[FAST_ARRAY[HTTP_METHOD_HANDLER], STRING]} Result.make
      end

   no_method_handlers: FAST_ARRAY[HTTP_NO_METHOD_HANDLER]
      once
         create Result.make(0)
      end

   get_method_handler (method, uri, version: STRING): HTTP_METHOD_HANDLER
      local
         mh: FAST_ARRAY[HTTP_METHOD_HANDLER]; get: HTTP_GET_HANDLER; nop: HTTP_NO_METHOD_HANDLER
      do
         mh := method_handlers.reference_at(method)
         if mh /= Void and then not mh.is_empty then
            get ::= mh.last
            mh.remove_last
            get.make(method, uri, version)
            Result := get
         else
            if method_handler_factory /= Void then
               Result := method_handler_factory.item([method, uri, version, ios])
            end
            if Result = Void then
               inspect
                  method
               when "GET", "POST" then
                  create {HTTP_GET_HANDLER} Result.make(method, uri, version)
               when "~SHUTDOWN" then
                  server.log("Will SHUTDOWN!!")
                  create {PAPOOSE_ACTION_HANDLER} Result.make(method, agent
                     do
                        server.log("#### SHUTDOWN!!")
                        server.shutdown
                     end,
                     agent server.log(?))
               else
                  if no_method_handlers.is_empty then
                     create nop.make(uri, version)
                  else
                     nop := no_method_handlers.last
                     no_method_handlers.remove_last
                     nop.make(uri, version)
                  end
                  Result := nop
               end
            end
         end
      end

end -- class PAPOOSE_CONNECTION
