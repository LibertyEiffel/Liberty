class EDC_NOT_CRITERION

inherit
   EDC_CRITERION
      redefine
         prefix "not"
      end

create {EDC_CRITERION}
   make

feature {ANY}
   prefix "not": EDC_CRITERION
      do
         Result := crit
      end

feature {}
   make (one: EDC_CRITERION)
      require
         one /= Void
      do
         crit := one
      ensure
         crit = one
      end

   crit: EDC_CRITERION

invariant
   crit /= Void

end -- class EDC_NOT_CRITERION
