class EDC_FETCH[D_ -> EDC_TYPED_DESCRIPTOR[R_, K_], R_ -> EDC_RECORD, K_]

inherit
   EDC_TYPED_QUERY[R_]

create {EDC_DESCRIPTOR}
   make

feature {ANY}
   list (session: EDC_SESSION): TRAVERSABLE[R_] is
      do
         create {FAST_ARRAY[R_]} Result.make(0) --| **** TODO
      end

feature {}
   make (a_options: like options) is
      require
         a_options /= Void
      do
         options := a_options
      ensure
         options = a_options
      end

end -- class EDC_FETCH
