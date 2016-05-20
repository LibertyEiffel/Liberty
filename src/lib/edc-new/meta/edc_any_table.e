deferred class EDC_ANY_TABLE

insert
   EDC_CONSTANTS

feature {ANY}
   name: FIXED_STRING

   fields: TRAVERSABLE[EDC_ANY_FIELD]
      do
         Result := fields_
      end

   pk: TRAVERSABLE[EDC_ANY_FIELD]
      do
         Result := pk_
      end

feature {EDC_ANY_FIELD}
   add_field (a_field: EDC_ANY_FIELD)
      require
         a_field.table = Current
      do
         fields_.add_last(a_field)
         if a_field.options = Edc_primary_key then
            if not a_field.is_pk_compatible then
               std_error.put_string(a_field.generating_type)
               std_error.put_line(once " is not PK compatible.")
               crash
            end
            pk_.add_last(a_field)
         end
      ensure
         (fields.count = old fields.count + 1) and then (fields.last = a_field)
         a_field.options = Edc_primary_key implies ((pk.count = old pk.count + 1) and then (pk.last = a_field))
      end

feature {}
   fields_: FAST_ARRAY[EDC_ANY_FIELD]
   pk_: FAST_ARRAY[EDC_ANY_FIELD]

invariant
   not name.is_empty
   fields /= Void
   pk /= Void

end -- class EDC_ANY_TABLE
