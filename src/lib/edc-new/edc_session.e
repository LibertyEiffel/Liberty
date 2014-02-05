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

end
