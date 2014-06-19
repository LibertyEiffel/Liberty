deferred class EDC_ANY_FIELD

feature {ANY}
   options: EDC_FIELD_OPTION
   name: FIXED_STRING

   table: EDC_ANY_TABLE
      deferred
      end

feature {EDC_ANY_TABLE}
   is_pk_compatible: BOOLEAN
      deferred
      end

invariant
   table /= Void
   not name.is_empty

end -- class EDC_ANY_FIELD
