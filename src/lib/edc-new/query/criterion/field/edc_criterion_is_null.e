class EDC_CRITERION_IS_NULL[R_ -> EDC_RECORD, E_ -> COMPARABLE]

inherit
   EDC_FIELD_CRITERION[E_]

create {EDC_FIELD}
   make

feature {ANY}
   is_set: BOOLEAN True

   value (e: E_): like Current
      do
         check
            non_sense: False
         end
      end

   field (f: EDC_FIELD[E_]): like Current
      do
         check
            non_sense: False
         end
      end

   argument: like Current
      do
         check
            non_sense: False
         end
      end

feature {}
   make (a_comp_field: like comp_field; a_yes: like yes)
      require
         a_comp_field /= Void
      do
         comp_field := a_comp_field
         yes := a_yes
      ensure
         comp_field = a_comp_field
      end

   comp_field: EDC_TYPED_FIELD[R_, E_]

   yes: BOOLEAN
         -- True for IS_NULL, False for IS_NOT_NULL

end -- class EDC_CRITERION_IS_NULL
