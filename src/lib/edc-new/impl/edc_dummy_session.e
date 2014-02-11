class EDC_DUMMY_SESSION

inherit
   EDC_SESSION
      redefine
         default_create
      end

create {ANY}
   default_create, open

feature {ANY}
   open is
      do
         default_create
         is_open := True
      end

   close is
      do
         is_open := False
      end

   is_open: BOOLEAN

feature {ANY}
   begin is
      do
         in_transaction := True
      end

   commit, rollback is
      do
         in_transaction := False
      end

   in_transaction: BOOLEAN

   add (record: EDC_RECORD) is
      local
         session_data: like data
      do
         record.set_session(Current)
         create session_data
         record.set_session_data(session_data)
      end

feature {}
   default_create is
      do
         if string_field = Void then
            check
               varstring_field = Void
               int64_field = Void
            end
            create {EDC_DUMMY_SESSION_FETCH[STRING]} string_field.make(Current)
            create {EDC_DUMMY_SESSION_FETCH[STRING]} varstring_field.make(Current)
            create {EDC_DUMMY_SESSION_FETCH[INTEGER_64]} int64_field.make(Current)
         end
      end

feature {EDC_DUMMY_SESSION_FETCH}
   data (record: EDC_RECORD): EDC_DUMMY_SESSION_DATA is
      require
         added: record.session_data /= Void
      do
         Result ::= record.session_data
      ensure
         Result /= Void
      end

end -- EDC_DUMMY_SESSION
