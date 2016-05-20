class EDC_INTEGER_64_FIELD[R_ -> EDC_RECORD]

inherit
   EDC_BASIC_FIELD[R_, INTEGER_64]
      redefine
         is_pk_compatible
      end

create {EDC_DESCRIPTOR}
   make, with_options

feature {EDC_RECORD}
   item (r: R_): INTEGER_64
      do
         Result := r.session.int64_field.item(r, Current)
      end

   set (r: R_; i: like item)
      do
         r.session.int64_field.set(r, Current, i)
      end

feature {EDC_ANY_TABLE}
   is_pk_compatible: BOOLEAN True

feature {}
   make (a_table: like table; a_name: ABSTRACT_STRING)
      do
         with_options(a_table, a_name, Void)
      end

   with_options (a_table: like table; a_name: ABSTRACT_STRING; a_options: like options)
      require
         a_table /= Void
         not a_name.is_empty
      do
         table := a_table
         name := a_name.intern
         options := a_options
         table.add_field(Current)
      ensure
         table = a_table
         name = a_name.intern
         options = a_options
      end

end -- class EDC_INTEGER_64_FIELD
