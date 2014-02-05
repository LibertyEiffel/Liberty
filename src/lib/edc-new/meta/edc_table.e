class EDC_TABLE[R_ -> EDC_RECORD]

create {EDC_DESCRIPTOR}
   make

feature {ANY}
   name: FIXED_STRING

feature {}
   make (a_factory: like factory; a_name: ABSTRACT_STRING) is
      require
         a_factory /= Void
         not a_name.is_empty
      do
         factory := a_factory
         name := a_name.intern
      ensure
         factory = a_factory
         name = a_name.intern
      end

   factory: FUNCTION[TUPLE, R_]

invariant
   factory /= Void
   not name.is_empty

end -- class EDC_TABLE
