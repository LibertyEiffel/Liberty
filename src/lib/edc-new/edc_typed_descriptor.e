deferred class EDC_TYPED_DESCRIPTOR[R_ -> EDC_RECORD create default_create end, K_]
   -- this class is meant to be expanded.

insert
   EDC_DESCRIPTOR[K_]

feature {ANY}
   table: EDC_TABLE[R_] is
      deferred
      end

   find (primary_key: K_; options: EDC_QUERY_OPTION): EDC_TYPED_QUERY[R_] is
      do
         create {EDC_FIND[like Current, R_, K_]} Result.make(primary_key, options)
      end

   fetch (options: EDC_QUERY_OPTION): EDC_TYPED_QUERY[R_] is
      do
         create {EDC_FETCH[like Current, R_, K_]} Result.make(options)
      end

   delete (record: EDC_RECORD) is
      local
         r: R_
      do
         r ::= record
         not_yet_implemented --| **** TODO r.session.???
      end

feature {EDC_TYPED_QUERY}
   new_record: R_ is
      do
         create Result
      ensure
         Result /= Void
      end

feature {}
   is_expanded: BOOLEAN is
      local
         d: like Current
      do
         Result := d /= Void
      end

invariant
   table /= Void
   is_expanded

end -- class EDC_TYPED_DESCRIPTOR
