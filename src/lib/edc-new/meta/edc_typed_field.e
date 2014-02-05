deferred class EDC_TYPED_FIELD[R_ -> EDC_RECORD, E_]

inherit
   EDC_FIELD[E_]

feature {EDC_RECORD}
   item (r: R_): E_ is
      require
         r /= Void
      deferred
      end

   set (r: R_; i: like item) is
      require
         r /= Void
      deferred
      ensure
         i = Void implies item(r) = Void
         i /= Void implies item(r).is_equal(i)
      end

feature {}
   table: EDC_TABLE[R_]
   name: FIXED_STRING

invariant
   table /= Void
   not name.is_empty

end -- class EDC_TYPED_FIELD
