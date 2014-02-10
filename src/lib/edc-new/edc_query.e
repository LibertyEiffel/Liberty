deferred class EDC_QUERY

feature {ANY}
   where (crit: EDC_CRITERION): like Current is
      require
         not has_where
         crit /= Void
      do
         crit_where := crit
      ensure
         has_where
         crit_where = crit
      end

   having (crit: EDC_CRITERION): like Current is
      require
         not has_having
         crit /= Void
      do
         crit_having := crit
      ensure
         has_having
         crit_having = crit
      end

   order_by (crit: EDC_ORDERING): like Current is
      require
         not has_order_by
         crit /= Void
      do
         crit_order_by := crit
      ensure
         has_order_by
         crit_order_by = crit
      end

   has_where: BOOLEAN is
      do
         Result := crit_where /= Void
      ensure
         definition: Result = (crit_where /= Void)
      end

   has_having: BOOLEAN is
      do
         Result := crit_having /= Void
      ensure
         definition: Result = (crit_having /= Void)
      end

   has_order_by: BOOLEAN is
      do
         Result := crit_order_by /= Void
      ensure
         definition: Result = (crit_order_by /= Void)
      end

feature {}
   crit_where, crit_having: EDC_CRITERION
   crit_order_by: EDC_ORDERING

end -- class EDC_QUERY
