deferred class EDC_QUERY

feature {ANY}
   where (crit: EDC_CRITERION): like Current is
      deferred
      end

   having (crit: EDC_CRITERION): like Current is
      deferred
      end

   order_by (crit: EDC_ORDERING): like Current is
      deferred
      end

end -- class EDC_QUERY
