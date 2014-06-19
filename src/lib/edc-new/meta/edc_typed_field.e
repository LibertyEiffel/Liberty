deferred class EDC_TYPED_FIELD[R_ -> EDC_RECORD, E_]

inherit
   EDC_FIELD[E_]

feature {ANY}
   table: EDC_TABLE[R_]

feature {EDC_ANY_TABLE}
   is_pk_compatible: BOOLEAN False
         -- Do not redefine if you don't know what you are doing!

feature {EDC_RECORD}
   item (r: R_): E_
      require
         added: r.session /= Void
      deferred
      end

   set (r: R_; i: like item)
      require
         added: r.session /= Void
      deferred
      ensure
         i = Void implies item(r) = Void
         i /= Void implies item(r).is_equal(i)
      end

end -- class EDC_TYPED_FIELD
