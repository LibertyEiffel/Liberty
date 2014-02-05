deferred class EDC_FIELD[E_]

feature {ANY}
   ge, gt, le, lt, eq, ne: EDC_FIELD_CRITERION[E_] is
      deferred
      end

feature {EDC_DESCRIPTOR}
   add_validator (a_validator: PREDICATE[TUPLE[E_]]) is
      do
         if validators = Void then
            create validators.with_capacity(2)
         end
         validators.add_last(a_validator)
      end

feature {}
   options: EDC_FIELD_OPTION
   validators: FAST_ARRAY[PREDICATE[TUPLE[E_]]]

end -- class EDC_FIELD
