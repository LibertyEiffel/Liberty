class EDC_TABLE[R_ -> EDC_RECORD]

create {EDC_DESCRIPTOR}
   make

feature {ANY}
   name: FIXED_STRING

feature {}
   make (a_name: ABSTRACT_STRING) is
      require
         not a_name.is_empty
      do
         name := a_name.intern
      ensure
         name = a_name.intern
      end

invariant
   not name.is_empty

end -- class EDC_TABLE
