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

feature {EDC_QUERY}
   select_data (table_name: FIXED_STRING; where, having: EDC_CRITERION; order_by: EDC_ORDERING): FAST_ARRAY[EDC_SESSION_DATA] is
      do
         if data_pool.is_empty then
            create Result.with_capacity(16)
         else
            Result := data_pool.last
            data_pool.remove_last
         end
         check
            Result.is_empty
         end
         select_data_in(Result, table_name, where, having, order_by)
      ensure
         Result /= Void
      end

   recycle_data (data: like select_data) is
      require
         data /= Void
      do
         data.clear_count
         data_pool.add_last(data)
      end

feature {}
   data_pool: FAST_ARRAY[FAST_ARRAY[EDC_SESSION_DATA]] is
      once
         create Result.with_capacity(16)
      end

   select_data_in (data: FAST_ARRAY[EDC_SESSION_DATA]; table_name: FIXED_STRING; where, having: EDC_CRITERION; order_by: EDC_ORDERING) is
      require
         data /= Void
         table_name /= Void
      deferred
      end

invariant
   string_field /= Void
   varstring_field /= Void
   int64_field /= Void

end
