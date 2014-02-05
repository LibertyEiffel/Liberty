class EDC_FIND[R_ -> EDC_RECORD, K_]

inherit
   EDC_TYPED_QUERY[R_]

create {EDC_DESCRIPTOR}
   make

feature {ANY}
   list (session: EDC_SESSION): TRAVERSABLE[R_] is
      do
         create {FAST_ARRAY[R_]} Result.make(0)
      ensure
         Result.count.in_range(0, 1)
      end

feature {}
   make (a_pk: like pk; a_options: like options) is
      require
         a_options /= Void
      do
         pk := a_pk
         options := a_options
      ensure
         pk = a_pk
         options = a_options
      end

   pk: K_

end -- class EDC_FIND
