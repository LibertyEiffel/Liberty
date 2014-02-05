deferred class EDC_TYPED_QUERY[R_ -> EDC_RECORD]

inherit
   EDC_QUERY

feature {ANY}
   list (session: EDC_SESSION): TRAVERSABLE[R_] is
      require
         session.is_open
         options.valid_session(session)
      deferred
      ensure
         Result /= Void
      end

   options: EDC_QUERY_OPTION

invariant
   options /= Void

end -- class EDC_TYPED_QUERY
