class PAPOOSE_ACTION_HANDLER

inherit
   HTTP_METHOD_HANDLER
      redefine
         answer
      end

create {PAPOOSE_CONNECTION}
   make

feature {HTTP_CONNECTION}
   method: STRING

   expect_body: BOOLEAN False

   prepare_answer
      do
         --| log.call([method + ": prepare"])
      end

   add_header (header: STRING)
      do
         --| log.call([method + ": header | " + header])
      end

   add_body (body: STRING)
      do
         crash
      end

   prepare_ok: BOOLEAN True

   answer (out_stream: OUTPUT_STREAM)
      do
         --| log.call([method + ": action"])
         Precursor(out_stream)
         action.call([])
      end

   expect (events: EVENTS_SET)
      local
         t: TIME_EVENTS
      do
         --| log.call([method + ": expect"])
         events.expect(t.timeout(0))
      end

   is_ready (events: EVENTS_SET): BOOLEAN
      do
         --| log.call([method + ": is_ready"])
      then True
      end

feature {}
   make (a_method: like method; a_action: like action; a_log: like log)
      require
         a_method /= Void
         a_action /= Void
      do
         method := a_method
         action := a_action
         log := a_log
         --| log.call([method + ": create"])
         create response_header.with_capacity(0)
         create response_body.with_capacity(0)
      ensure
         method = a_method
         action = a_action
         log = a_log
      end

   action: PROCEDURE[TUPLE]
   log: PROCEDURE[TUPLE[ABSTRACT_STRING]]

invariant
   action /= Void

end
