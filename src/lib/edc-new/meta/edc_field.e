deferred class EDC_FIELD[E_]

inherit
   EDC_ANY_FIELD
      rename
         default as field_default
      end

feature {ANY}
   default: E_
         -- Default value of the field
      do
      end

   is_null, is_not_null: EDC_FIELD_CRITERION[E_]
      require
         default = Void
      deferred
      ensure
         Result /= Void
      end

   ge, gt, le, lt, eq, ne: EDC_FIELD_CRITERION[E_]
      deferred
      ensure
         Result /= Void
      end

   infix "<=" (value: E_): EDC_FIELD_CRITERION[E_]
      require
         value /= Void
      do
         Result := ge.value(value)
      ensure
         Result /= Void
      end

   infix "<" (value: E_): EDC_FIELD_CRITERION[E_]
      require
         value /= Void
      do
         Result := gt.value(value)
      ensure
         Result /= Void
      end

   infix ">=" (value: E_): EDC_FIELD_CRITERION[E_]
      require
         value /= Void
      do
         Result := le.value(value)
      ensure
         Result /= Void
      end

   infix ">" (value: E_): EDC_FIELD_CRITERION[E_]
      require
         value /= Void
      do
         Result := lt.value(value)
      ensure
         Result /= Void
      end

   infix "==" (value: E_): EDC_FIELD_CRITERION[E_]
      require
         value /= Void
      do
         Result := eq.value(value)
      ensure
         Result /= Void
      end

   infix "=/=" (value: E_): EDC_FIELD_CRITERION[E_]
      require
         value /= Void
      do
         Result := ne.value(value)
      ensure
         Result /= Void
      end

feature {EDC_DESCRIPTOR}
   add_validator (a_validator: PREDICATE[TUPLE[E_]])
      do
         if validators = Void then
            create validators.with_capacity(2)
         end
         validators.add_last(a_validator)
      end

feature {}
   validators: FAST_ARRAY[PREDICATE[TUPLE[E_]]]

end -- class EDC_FIELD
