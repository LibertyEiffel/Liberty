class EDC_CRITERION_GREATER_THAN[R_ -> EDC_RECORD, E_ -> COMPARABLE]

inherit
   EDC_FIELD_CRITERION[R_, E_]

create {EDC_QUERY}
   make

feature {}
   field: EDC_FIELD[R_, E_]
   crit: E_

feature {}
   make (a_field: like field; a_crit: like crit) is
      require
         a_field /= Void
         a_crit /= Void
      do
         field := a_field
         crit := a_crit
      ensure
         field = a_field
         crit = a_crit
      end

end -- class EDC_CRITERION_GREATER_THAN
