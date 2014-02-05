class EDC_VARSTRING_FIELD[R_ -> EDC_RECORD]

inherit
   EDC_TYPED_FIELD[R_, STRING]

create {EDC_DESCRIPTOR}
   make, with_options

feature {EDC_RECORD}
   item (r: R_): STRING is
      do
         not_yet_implemented
      end

   set (r: R_; i: like item) is
      do
         not_yet_implemented
      end

feature {}
   make (a_table: like table; a_name: ABSTRACT_STRING) is
      do
         with_options(a_table, a_name, Void)
      end

   with_options (a_table: like table; a_name: ABSTRACT_STRING; a_options: like options) is
      require
         a_table /= Void
         not a_name.is_empty
      do
         table := a_table
         name := a_name.intern
         options := a_options
      ensure
         table = a_table
         name = a_name.intern
         options = a_options
      end

end -- class EDC_VARSTRING_FIELD
