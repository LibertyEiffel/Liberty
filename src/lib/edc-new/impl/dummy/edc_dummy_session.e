class EDC_DUMMY_SESSION

inherit
   EDC_SESSION
      redefine
         default_create
      end

create {ANY}
   default_create, open

feature {ANY}
   open
      do
         default_create
         is_open := True
      end

   close
      do
         is_open := False
      end

   is_open: BOOLEAN

feature {ANY}
   begin
      do
         in_transaction := True
      end

   commit, rollback
      do
         in_transaction := False
      end

   in_transaction: BOOLEAN

   add (record: EDC_RECORD)
      local
         record_data: like session_data
      do
         record.set_session(Current)
         create record_data
         record.set_session_data(record_data)
      end

feature {}
   select_data_in (data: FAST_ARRAY[EDC_SESSION_DATA]; table_name: FIXED_STRING; where, having: EDC_CRITERION; order_by: EDC_ORDERING)
      do
      end

feature {}
   default_create
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
   session_data (record: EDC_RECORD): EDC_DUMMY_SESSION_DATA
      require
         added: record.session_data /= Void
      do
         Result ::= record.session_data
      ensure
         Result /= Void
      end

end -- EDC_DUMMY_SESSION
