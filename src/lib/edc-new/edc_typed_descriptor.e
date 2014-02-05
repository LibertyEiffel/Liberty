expanded class EDC_TYPED_DESCRIPTOR[R_ -> EDC_RECORD, K_]

insert
   EDC_DESCRIPTOR[K_]

feature {ANY}
   find (primary_key: K_; options: EDC_QUERY_OPTION): EDC_TYPED_QUERY[R_] is
      do
         create {EDC_FIND[R_, K_]} Result.make(primary_key, options)
      end

   fetch (options: EDC_QUERY_OPTION): EDC_TYPED_QUERY[R_] is
      do
         create {EDC_FETCH[R_]} Result.make(options)
      end

end -- class EDC_TYPED_DESCRIPTOR
