deferred class EDC_FIELD_CRITERION[E_]

inherit
   EDC_CRITERION

feature {ANY}
   is_set: BOOLEAN
      deferred
      end

   value (e: E_): like Current
      require
         not is_set
      deferred
      ensure
         is_set
         Result = Current
      end

   field (f: EDC_FIELD[E_]): like Current
      require
         not is_set
      deferred
      ensure
         is_set
         Result = Current
      end

   argument: like Current
      require
         not is_set
      deferred
      ensure
         is_set
         Result = Current
      end

end -- class EDC_FIELD_CRITERION
