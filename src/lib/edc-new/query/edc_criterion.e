deferred class EDC_CRITERION

feature {ANY}
   infix "and" (other: EDC_CRITERION): EDC_CRITERION
      require
         other /= Void
      do
         create {EDC_AND_CRITERION} Result.make(Current, other)
      end

   infix "or" (other: EDC_CRITERION): EDC_CRITERION
      require
         other /= Void
      do
         create {EDC_OR_CRITERION} Result.make(Current, other)
      end

   prefix "not": EDC_CRITERION
      do
         create {EDC_NOT_CRITERION} Result.make(Current)
      end

end -- class EDC_CRITERION
