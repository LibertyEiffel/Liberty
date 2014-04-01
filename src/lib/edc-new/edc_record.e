deferred class EDC_RECORD

feature {ANY}
   delete is
      require
         added: session /= Void
      deferred
      ensure
         removed: session = Void and then session_data = Void
      end

   session: EDC_SESSION

feature {EDC_SESSION, EDC_QUERY}
   session_data: EDC_SESSION_DATA

feature {EDC_SESSION}
   set_session (a_session: like session) is
      require
         (a_session = Void) /= (session = Void)
      do
         session := a_session
      ensure
         session = a_session
      end

feature {EDC_SESSION, EDC_QUERY}
   set_session_data (a_data: like session_data) is
      do
         session_data := a_data
      end

end
