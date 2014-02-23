class EDC_FETCH[R_ -> EDC_RECORD]

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
