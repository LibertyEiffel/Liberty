deferred class EDC_TYPED_DESCRIPTOR[R_ -> EDC_RECORD create default_create end, K_ -> TUPLE]
   -- this class is meant to be expanded.

insert
   EDC_DESCRIPTOR[K_]

feature {ANY}
   table: EDC_TABLE[R_]
      deferred
      end

   find (options: EDC_QUERY_OPTION; primary_key: K_): EDC_TYPED_QUERY[R_]
      do
         create {EDC_FIND[like Current, R_, K_]} Result.make(primary_key, options)
      end

   fetch (options: EDC_QUERY_OPTION): EDC_TYPED_QUERY[R_]
      do
         create {EDC_FETCH[like Current, R_, K_]} Result.make(options)
      end

   delete (record: EDC_RECORD)
      local
         r: R_
      do
         r ::= record
         not_yet_implemented --| **** TODO r.session.???
      end

   criterion_primary_key (a_pk: K_): EDC_CRITERION
      require
         table.pk.count = a_pk.count
      local
         i: INTEGER
      do
         --| **** I need to think a lot! TUPLE is not iterable and even if
         --| **** it were, its content elements conform to nothing.
      end

feature {EDC_TYPED_QUERY}
   new_record: R_
      do
         create Result
      ensure
         Result /= Void
      end

feature {}
   is_expanded: BOOLEAN
      local
         d: like Current
      do
         Result := d /= Void
      end

invariant
   table /= Void
   is_expanded

end -- class EDC_TYPED_DESCRIPTOR
