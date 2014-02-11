deferred class EDC_SESSION

feature {ANY}
   open is
      require
         not is_open
      deferred
      end

   close is
      deferred
      ensure
         not is_open
      end

   is_open: BOOLEAN is
      deferred
      end

feature {ANY}
   begin is
      require
         is_open
      deferred
      ensure
         in_transaction
      end

   commit is
      require
         in_transaction
      deferred
      ensure
         not in_transaction
      end

   rollback is
      require
         in_transaction
      deferred
      ensure
         not in_transaction
      end

   in_transaction: BOOLEAN is
      deferred
      end

   add (record: EDC_RECORD) is
      require
         in_transaction
         record.session = Void
      deferred
      ensure
         record.session = Current
      end

feature {EDC_STRING_FIELD}
   string_field: EDC_SESSION_FETCH[STRING]

feature {EDC_VARSTRING_FIELD}
   varstring_field: EDC_SESSION_FETCH[STRING]

feature {EDC_INTEGER_64_FIELD}
   int64_field: EDC_SESSION_FETCH[INTEGER_64]

invariant
   string_field /= Void
   varstring_field /= Void
   int64_field /= Void

end
