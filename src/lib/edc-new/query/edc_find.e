class EDC_FIND[D_ -> EDC_TYPED_DESCRIPTOR[R_, K_], R_ -> EDC_RECORD, K_ -> TUPLE]

inherit
   EDC_FETCH[D_, R_, K_]
      rename
         make as make_fetch
      redefine
         list
      end

create {EDC_DESCRIPTOR}
   make

feature {ANY}
   list (session: EDC_SESSION): TRAVERSABLE[R_]
      do
         Result := Precursor(session)
      ensure then
         Result.count.in_range(0, 1)
      end

feature {}
   make (a_pk: K_; a_options: like options)
      require
         a_options /= Void
      do
         check
            actual_descriptor
         end
         make_fetch(a_options)
         crit_where := descriptor.criterion_primary_key(a_pk)
      ensure
         options = a_options
      end

end -- class EDC_FIND
