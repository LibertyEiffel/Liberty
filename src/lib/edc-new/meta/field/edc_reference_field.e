class EDC_REFERENCE_FIELD[R_ -> EDC_RECORD, REF_ -> EDC_RECORD]

inherit
   EDC_TYPED_FIELD[R_, REF_]

create {EDC_DESCRIPTOR}
   make, with_options

feature {ANY}
   is_null: EDC_FIELD_CRITERION[REF_]
      do
         not_yet_implemented
      end

   is_not_null: EDC_FIELD_CRITERION[REF_]
      do
         not_yet_implemented
      end

   ge: EDC_FIELD_CRITERION[REF_]
      do
         not_yet_implemented
      end

   gt: EDC_FIELD_CRITERION[REF_]
      do
         not_yet_implemented
      end

   le: EDC_FIELD_CRITERION[REF_]
      do
         not_yet_implemented
      end

   lt: EDC_FIELD_CRITERION[REF_]
      do
         not_yet_implemented
      end

   eq: EDC_FIELD_CRITERION[REF_]
      do
         not_yet_implemented
      end

   ne: EDC_FIELD_CRITERION[REF_]
      do
         not_yet_implemented
      end

feature {EDC_RECORD}
   item (r: R_): REF_
      do
         not_yet_implemented
      end

   set (r: R_; i: like item)
      do
         not_yet_implemented
      end

feature {}
   make (a_table: like table; a_ref_table: like ref_table; a_name: ABSTRACT_STRING)
      do
         with_options(a_table, a_ref_table, a_name, Void)
      end

   with_options (a_table: like table; a_ref_table: like ref_table; a_name: ABSTRACT_STRING; a_options: like options)
      require
         a_table /= Void
         a_ref_table /= Void
         not a_name.is_empty
      do
         table := a_table
         ref_table := a_ref_table
         name := a_name.intern
         options := a_options
         table.add_field(Current)
      ensure
         table = a_table
         ref_table = a_ref_table
         name = a_name.intern
         options = a_options
      end

   ref_table: EDC_TABLE[REF_]

end -- class EDC_REFERENCE_FIELD
