class EDC_STRING_FIELD[R_ -> EDC_RECORD]

inherit
   EDC_BASIC_FIELD[R_, STRING]

create {EDC_DESCRIPTOR}
   make, with_options

feature {EDC_RECORD}
   item (r: R_): STRING is
      do
         Result := r.session.string_field.item(r, Current)
      end

   set (r: R_; i: like item) is
      do
         r.session.string_field.set(r, Current, i)
      end

feature {}
   make (a_table: like table; a_name: ABSTRACT_STRING; a_length: like length) is
      do
         with_options(a_table, a_name, a_length, Void)
      end

   with_options (a_table: like table; a_name: ABSTRACT_STRING; a_length: like length; a_options: like options) is
      require
         a_table /= Void
         not a_name.is_empty
         a_length > 0
      do
         table := a_table
         name := a_name.intern
         length := a_length
         options := a_options
      ensure
         table = a_table
         name = a_name.intern
         length = a_length
         options = a_options
      end

   length: INTEGER

invariant
   length > 0

end -- class EDC_STRING_FIELD
