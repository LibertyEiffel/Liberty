class EDC_DUMMY_SESSION

inherit
   EDC_SESSION

create {ANY}
   default_create, open

feature {ANY}
   open is
      do
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

end -- EDC_DUMMY_SESSION
