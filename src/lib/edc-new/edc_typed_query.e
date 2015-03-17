deferred class EDC_TYPED_QUERY[R_ -> EDC_RECORD]

inherit
   EDC_QUERY

feature {ANY}
   list (session: EDC_SESSION): TRAVERSABLE[R_]
      require
         session.is_open
         options.valid_session(session)
      deferred
      ensure
         Result.for_all(agent (record: R_; s: EDC_SESSION): BOOLEAN do Result := record.session = s end (?, session)) --| **** TODO closure
      end

   options: EDC_QUERY_OPTION

invariant
   options /= Void

end -- class EDC_TYPED_QUERY
