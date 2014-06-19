deferred class EDC_BASIC_FIELD[R_ -> EDC_RECORD, E_ -> COMPARABLE]

inherit
   EDC_TYPED_FIELD[R_, E_]

feature {ANY}
   is_null: EDC_FIELD_CRITERION[E_]
      do
         create {EDC_CRITERION_IS_NULL[R_, E_]} Result.make(Current, True)
      end

   is_not_null: EDC_FIELD_CRITERION[E_]
      do
         create {EDC_CRITERION_IS_NULL[R_, E_]} Result.make(Current, False)
      end

   ge: EDC_FIELD_CRITERION[E_]
      do
         create {EDC_CRITERION_GREATER_OR_EQUAL[R_, E_]} Result.make(Current)
      end

   gt: EDC_FIELD_CRITERION[E_]
      do
         create {EDC_CRITERION_GREATER_THAN[R_, E_]} Result.make(Current)
      end

   le: EDC_FIELD_CRITERION[E_]
      do
         create {EDC_CRITERION_LOWER_OR_EQUAL[R_, E_]} Result.make(Current)
      end

   lt: EDC_FIELD_CRITERION[E_]
      do
         create {EDC_CRITERION_LOWER_THAN[R_, E_]} Result.make(Current)
      end

   eq: EDC_FIELD_CRITERION[E_]
      do
         create {EDC_CRITERION_EQUAL[R_, E_]} Result.make(Current)
      end

   ne: EDC_FIELD_CRITERION[E_]
      do
         create {EDC_CRITERION_NOT_EQUAL[R_, E_]} Result.make(Current)
      end

feature {EDC_ANY_TABLE}
   pk_field (pk: TUPLE; index: INTEGER): E_
      require
         is_pk_compatible
         index.in_range(1, 4)
         pk.count >= index
      local
      do
      end

end -- class EDC_BASIC_FIELD
