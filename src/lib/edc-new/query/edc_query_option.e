deferred class EDC_QUERY_OPTION

feature {ANY}
   valid_session (session: EDC_SESSION): BOOLEAN
         -- Check that the session has enough rights for what the query wants to do
         -- (e.g. session.in_transaction for updates, and so on)
      require
         session.is_open
      deferred
      end

end -- class EDC_QUERY_OPTION
