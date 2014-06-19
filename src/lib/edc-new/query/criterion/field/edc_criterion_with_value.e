class EDC_CRITERION_WITH_VALUE[R_ -> EDC_RECORD, E_ -> COMPARABLE]

inherit
   EDC_FIELD_CRITERION[E_]

create {EDC_FIELD}
   make

feature {ANY}
   is_set: BOOLEAN
      do
         Result := crit /= Crit_is_not_set
      end

   value (e: E_): like Current
      do
         crit_value := e
         crit := Crit_is_value
         Result := Current
      end

   field (f: EDC_FIELD[E_]): like Current
      do
         crit_field := f
         crit := Crit_is_field
         Result := Current
      end

   argument: like Current
      do
         crit := Crit_is_argument
         Result := Current
      end

feature {}
   comp_field: EDC_TYPED_FIELD[R_, E_]
   crit_value: E_
   crit_field: EDC_FIELD[E_]

   crit: INTEGER_8

   Crit_is_not_set: INTEGER_8 0
   Crit_is_value: INTEGER_8 1
   Crit_is_field: INTEGER_8 2
   Crit_is_argument: INTEGER_8 3

feature {}
   make (a_comp_field: like comp_field)
      require
         a_comp_field /= Void
      do
         comp_field := a_comp_field
      ensure
         comp_field = a_comp_field
         not is_set
      end

end -- class EDC_CRITERION_WITH_VALUE
