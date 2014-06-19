class EDC_TABLE[R_ -> EDC_RECORD]

inherit
   EDC_ANY_TABLE

create {EDC_DESCRIPTOR}
   make

feature {}
   make (a_name: ABSTRACT_STRING)
      require
         not a_name.is_empty
      do
         name := a_name.intern
         create fields_.make(0)
         create pk_.make(0)
      ensure
         name = a_name.intern
      end

end -- class EDC_TABLE
